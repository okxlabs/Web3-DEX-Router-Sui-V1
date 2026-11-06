// ============================================================================
// DEX Router Cetus Test Script
// ============================================================================

import { Ed25519Keypair } from "@mysten/sui.js/keypairs/ed25519";
import { SuiClient } from "@mysten/sui.js/client";
import { TransactionBlock } from "@mysten/sui.js/transactions";
import { SUI_CLOCK_OBJECT_ID } from "@mysten/sui.js/utils";
import * as dotenv from "dotenv";
import { CETUS_DEPLOYMENT, assertCetusGlobalConfig } from "../../config/cetusDeployment";

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
const config = require("../../config/configInfo.json");
const DEX_ROUTER = config["DEX"]!;

// Token configurations
const USDC_ID = config["USDC_ID"]!;
const USDC_DECIMAL = 6;
const USDC_TYPE = `${USDC_ID}::coin::COIN`;

const SUI_ID = config["SUI_ID"]!;
const SUI_DECIMAL = 9;
const SUI_TYPE = `${SUI_ID}::sui::SUI`;
// ============================================================================
// Cetus Specific Constants
// ============================================================================

const CETUS_POOL = "0xcf994611fd4c48e277ce3ffd4d4364c914af2c3cbb05f7bf6facd371de688630";

// ============================================================================
// Main Cetus Test Function
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
    const gasBudget = 4051120;
    const swapAmount = 10000;

    txb.setGasBudget(gasBudget);

    // Prepare input coin
    const inputCoin = txb.splitCoins(
        txb.gas,
        [txb.pure(swapAmount.toString())]
    );

    // ============================================================================
    // Cetus Swap: USDC → SUI
    // ============================================================================

    const [outputCoin, outputAmount] = txb.moveCall({
        target: `${DEX_ROUTER}::router::cetus_swap_b2a_with_return`,
        arguments: [
            txb.object(CETUS_DEPLOYMENT.globalConfigId), // global_config
            txb.object(CETUS_POOL),                      // pool
            txb.makeMoveVec({ objects: [inputCoin] }),   // coins
            txb.pure(true),                              // by_amount_in
            txb.pure(swapAmount),                        // amount
            txb.pure(0),                                 // amount_limit
            txb.pure(BigInt("79226673515401279992447579055")), // sqrt_price_limit
            txb.object(SUI_CLOCK_OBJECT_ID),             // clock
            txb.pure(0),                                 // order_id
            txb.pure(USDC_DECIMAL),                      // decimal
        ],
        typeArguments: [USDC_TYPE, SUI_TYPE]
    });

    // ============================================================================
    // Finalize Transaction
    // ============================================================================

    // Set transaction sender
    txb.setSender(walletAddress);

    txb.moveCall({
        target: `${DEX_ROUTER}::router::finalize`,
        arguments: [
            outputCoin,                    // input_coin
            txb.pure(0),                   // min_amount
            txb.pure(0),                   // commission_rate
            txb.pure(walletAddress),       // referral_address
            txb.pure(walletAddress),       // receiver_address
            txb.pure(0),                   // order_id
            txb.pure(USDC_DECIMAL),        // decimal
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

    console.log("Cetus Swap Result:", result);
}

// ============================================================================
// Execute Script
// ============================================================================

main().catch((error) => {
    console.error("Error executing Cetus test:", error);
    process.exit(1);
});