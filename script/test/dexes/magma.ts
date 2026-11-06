// ============================================================================
// DEX Router Magma Test Script
// ============================================================================

import { Ed25519Keypair } from "@mysten/sui.js/keypairs/ed25519";
import { SuiClient } from "@mysten/sui.js/client";
import { TransactionBlock } from "@mysten/sui.js/transactions";
import { SUI_CLOCK_OBJECT_ID } from "@mysten/sui.js/utils";
import * as dotenv from "dotenv";

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
const DEX_ROUTER = config["DEX_EXTENDED"]!;

// Token configurations
const USDC_ID = config["USDC_NATIVE_ID"]!;
const USDC_DECIMAL = 6;
const USDC_TYPE = `${USDC_ID}::usdc::USDC`;
const SUI_ID = config["SUI_ID"]!;
const SUI_DECIMAL = 9;
const SUI_TYPE = `${SUI_ID}::sui::SUI`;

// ============================================================================
// Magma Specific Constants
// ============================================================================

const MAGMA_GLOBAL_CONFIG = "0x4c4e1402401f72c7d8533d0ed8d5f8949da363c7a3319ccef261ffe153d32f8a";
const MAGMA_POOL = "0xfbc6374ae9533fc9f24a4ca705edfb58021cab24870c024bd6d0caec1c64cf36";
// ============================================================================
// Main Magma Test Function
// ============================================================================

async function main(): Promise<void> {
    // Initialize provider and wallet
    const provider = new SuiClient({
        url: "https://sui-rpc.publicnode.com"
    });
    const keypair = Ed25519Keypair.fromSecretKey(PRIVATE_KEY);
    const walletAddress = keypair.getPublicKey().toSuiAddress();
    console.log("Wallet Address:", walletAddress);
    // Create transaction block
    const txb = new TransactionBlock();
    // Transaction parameters
    const gasBudget = 150000000;
    const swapAmount = 0.1 * 10 ** SUI_DECIMAL; // 0.01 SUI in mist
    const minAmountOut = 1;
    txb.setGasBudget(gasBudget);
    // Prepare input coin
    const inputCoin = txb.splitCoins(
        txb.gas,
        [txb.pure(swapAmount.toString())]
    );
    // ============================================================================
    // Magma Swap: USDC → SUI
    // ============================================================================
    const [outputCoin, outputAmount] = txb.moveCall({
        target: `${DEX_ROUTER}::router::magma_swap_token_y_with_return`,
        arguments: [
            txb.object(MAGMA_GLOBAL_CONFIG),    // global_config
            txb.object(MAGMA_POOL),             // pool
            inputCoin,                          // coin_in
            txb.pure(swapAmount),               // amount_in
            txb.pure(minAmountOut),             // min_out
            txb.object(SUI_CLOCK_OBJECT_ID),    // clock
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
            txb.pure(1),                   // min_amount
            txb.pure(0),                   // commission_rate
            txb.pure(walletAddress),       // referral_address
            txb.pure(walletAddress),       // receiver_address
            txb.pure(0),                   // order_id
            txb.pure(USDC_DECIMAL),         // decimal
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
    console.log("Magma Swap Result:", result);
}
// ============================================================================
// Execute Script
// ============================================================================
main().catch((error) => {
    console.error("Error executing Magma test:", error);
    process.exit(1);
});