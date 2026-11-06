// ============================================================================
// DEX Router Commission Test Script
// ============================================================================

import { Ed25519Keypair } from "@mysten/sui.js/keypairs/ed25519";
import { SuiClient } from "@mysten/sui.js/client";
import { TransactionBlock } from "@mysten/sui.js/transactions";
import { SUI_CLOCK_OBJECT_ID } from "@mysten/sui.js/utils";
import * as dotenv from "dotenv";
import { CETUS_DEPLOYMENT, assertCetusGlobalConfig } from "../config/cetusDeployment";

// Load environment variables
dotenv.config();

// ============================================================================
// Configuration Constants
// ============================================================================

// Environment validation
const PRIVATE_KEY_STR = process.env.PRIVATE_KEY_STR;
if (!PRIVATE_KEY_STR) {
    throw new Error("PRIVATE_KEY_STR environment variable is required");
}

// Private key processing
const PRIVATE_KEY = Buffer.from(PRIVATE_KEY_STR, "base64").subarray(1);

// Load configuration
const config = require("../config/configInfo.json");
const DEX_ROUTER = config["DEX"]!;

// Token configurations
const USDC_ID = config["USDC_ID"]!;
const USDC_DECIMAL = 6;
const USDC_TYPE = `${USDC_ID}::coin::COIN`;

const SUI_ID = config["SUI_ID"]!;
const SUI_DECIMAL = 9;
const SUI_TYPE = `${SUI_ID}::sui::SUI`;

// ============================================================================
// Commission Test Constants
// ============================================================================

// Pool addresses
const CETUS_POOL = "0xcf994611fd4c48e277ce3ffd4d4364c914af2c3cbb05f7bf6facd371de688630"; // USDC/SUI
const TURBOS_POOL = "0x5eb2dfcdd1b15d2021328258f6d5ec081e9a0cdcfa9e13a0eaeb9b5f7505ca78"; // SUI/USDC

// Fee and version constants
const FEE_TYPE = "0x91bfbc386a41afcfd9b2533058d7e915a1d3829089cc268ff4333d54d6339ca1::fee3000bps::FEE3000BPS";
const TURBOS_VERSIONED = "0xf1cf0e81048df168ebeb1b8030fad24b3e0b53ae827c25053fff0779c1445b6f";

// ============================================================================
// Main Commission Test Function
// ============================================================================

async function main(): Promise<void> {
    // Initialize provider and wallet
    const provider = new SuiClient({
        url: "https://sui-rpc.publicnode.com"
    });

    const keypair = Ed25519Keypair.fromSecretKey(PRIVATE_KEY);
    const walletAddress = keypair.getPublicKey().toSuiAddress();

    console.log("Wallet Address:", walletAddress);

    // Fail fast if the Cetus deployment manifest has drifted from mainnet
    await assertCetusGlobalConfig(provider);

    // Create transaction block
    const txb = new TransactionBlock();

    // Transaction parameters
    const gasBudget = 10000000;
    const swapAmount = 0.1 * 10 ** SUI_DECIMAL; // 0.1 SUI in mist
    const commissionRate = 0; // 0% commission

    txb.setGasBudget(gasBudget);

    // Prepare input coin
    const inputCoin = txb.splitCoins(
        txb.gas,
        [txb.pure(swapAmount.toString())]
    );

    // ============================================================================
    // Step 1: Split with percentage for commission
    // ============================================================================

    const [remainingCoin, remainingCoinValue] = txb.moveCall({
        target: `${DEX_ROUTER}::router::split_with_percentage_for_commission`,
        arguments: [
            inputCoin,                          // input coin
            txb.pure(commissionRate),           // 0% commission
            txb.pure(walletAddress),        // commission recipient
        ],
        typeArguments: [SUI_TYPE]
    });

    // Transfer original input coin to recipient
    txb.transferObjects([inputCoin], txb.pure(walletAddress));

    // ============================================================================
    // Step 2: Split with percentage (50% split)
    // ============================================================================

    const [splitCoin, splitCoinValue, leftCoin, leftCoinValue] = txb.moveCall({
        target: `${DEX_ROUTER}::router::split_with_percentage`,
        arguments: [
            remainingCoin,                      // input coin
            txb.pure(5000)                      // 50% (5000/10000)
        ],
        typeArguments: [SUI_TYPE]
    });

    // Transfer remaining coin to recipient
    txb.transferObjects([remainingCoin], txb.pure(walletAddress));

    // ============================================================================
    // Step 3: Parallel SUI → USDC Swaps
    // ============================================================================

    // Cetus swap - SUI to USDC (50% of remaining)
    const [cetusOut, cetusAmount] = txb.moveCall({
        target: `${DEX_ROUTER}::router::cetus_swap_b2a_with_return`,
        arguments: [
            txb.object(CETUS_DEPLOYMENT.globalConfigId), // config
            txb.object(CETUS_POOL),             // pool
            txb.makeMoveVec({ objects: [splitCoin] }), // coins
            txb.pure(true),                     // by_amount_in
            splitCoinValue,                     // amount
            txb.pure(0),                        // amount_limit
            txb.pure(BigInt("79226673515401279992447579055")), // sqrt_price_limit
            txb.object(SUI_CLOCK_OBJECT_ID),    // clock
            txb.pure(0),                        // order_id
            txb.pure(USDC_DECIMAL),             // decimal
        ],
        typeArguments: [USDC_TYPE, SUI_TYPE]
    });

    // Turbos swap - SUI to USDC (50% of remaining)
    const [turbosOut, turbosAmount] = txb.moveCall({
        target: `${DEX_ROUTER}::router::turbos_swap_a_b_with_return`,
        arguments: [
            txb.object(TURBOS_POOL),            // pool
            txb.makeMoveVec({ objects: [leftCoin] }), // coins
            leftCoinValue,                      // amount
            txb.pure(0),                        // amount_limit
            txb.pure(4295048017),               // sqrt_price_limit
            txb.pure(true),                     // by_amount_in
            txb.pure(walletAddress),         // referral
            txb.pure(1816360958068),            // deadline
            txb.object(SUI_CLOCK_OBJECT_ID),    // clock
            txb.object(TURBOS_VERSIONED),       // versioned
            txb.pure(0),                        // order_id
            txb.pure(SUI_DECIMAL),              // decimal
        ],
        typeArguments: [SUI_TYPE, USDC_TYPE, FEE_TYPE]
    });

    // ============================================================================
    // Step 4: Merge and Finalize
    // ============================================================================

    // Set transaction sender
    txb.setSender(walletAddress);

    // Merge coins from both swaps
    txb.mergeCoins(cetusOut, [turbosOut]);

    // Standard finalize call
    txb.moveCall({
        target: `${DEX_ROUTER}::router::finalize`,
        arguments: [
            cetusOut,                           // input_coin
            txb.pure(1),                        // min_amount
            txb.pure(0),                        // commission_rate
            txb.pure(walletAddress),            // referral_address
            txb.pure(walletAddress),            // receiver_address
            txb.pure(0),                        // order_id
            txb.pure(USDC_DECIMAL),             // decimal
        ],
        typeArguments: [USDC_TYPE]
    });

    // Build and dry run transaction
    const builtTx = await txb.build({ client: provider });
    const result = await provider.dryRunTransactionBlock({
        transactionBlock: builtTx
    });

    // Uncomment to execute transaction
    // const executeResult = await provider.signAndExecuteTransactionBlock({
    //     transactionBlock: builtTx,
    //     signer: keypair,
    //     options: {
    //         showObjectChanges: true,
    //         showEvents: true,
    //         showBalanceChanges: true
    //     }
    // });

    console.log("Commission Test Result:", result);
}

// ============================================================================
// Execute Script
// ============================================================================

main().catch((error) => {
    console.error("Error executing commission test:", error);
    process.exit(1);
});