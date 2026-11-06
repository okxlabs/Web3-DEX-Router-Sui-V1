// ============================================================================
// DEX Router Multihop Sequential Split Test Script
// ============================================================================

/**
 * Multihop2: "Sequential Split" Strategy
 *
 * Flow Diagram:
 * 100% SUI
 * ├── 40% → Cetus (SUI → USDT) ──────────────────────────┐
 * ├── 60% → FlowX V3 (SUI → USDC) ──┐                    │
 * │                                  ├─→ 20% KriyaAMM (USDC → USDT) ──┤
 * │                                  └─→ 80% SuiSwap (USDC → USDT) ───┤
 * │                                    │                    │
 * │                                    └────────────────────┘
 * │                                                            │
 * └───────────────────────────────────────────────────────────┘
 *                                                          100% USDT
 *
 * Strategy: Sequential execution with proportional splitting
 * - 2 main parallel paths (40% + 60%)
 * - One path further split into 2 sub-paths (20% + 80%)
 * - 3 final merge points
 *
 * DAG Analysis:
 * - Fan-out degree: 2 (SUI splits into 2 main paths)
 * - Fan-in degree: 3 (3 USDT paths merge at the end)
 * - Depth: 3 levels (SUI → USDC/USDT → USDT)
 * - Parallelism: Medium (2 parallel at level 1, 2 parallel at level 2)
 */

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

const USDT_ID = config["USDT_ID"]!;
const USDT_DECIMAL = 6;
const USDT_TYPE = `${USDT_ID}::coin::COIN`;

// ============================================================================
// Multihop Sequential Split Constants
// ============================================================================

// Pool addresses
const CETUS_POOL = "0x4eed0ec3402f2e728eec4d7f6c6649084f2aa243e13d585ac67e3bf81c34039b"; // SUI/USDT

// FlowX V3 constants
const FLOWX_V3_VERSIONED = "0x67624a1533b5aff5d0dfcf5e598684350efd38134d2d245f475524c03a64e656";
const FLOWX_V3_POOL_REGISTRY = "0x27565d24a4cd51127ac90e4074a841bbe356cca7bf5759ddc14a975be1632abc";

// USDC/USDT pools
const KRIYA_STABLE_POOL = "0xd0086b7713e0487bbf5bb4a1e30a000794e570590a6041155cdbebee3cb1cb77"; // USDC/USDT
const SUISWAP_USDC_USDT_POOL = "0x08948c60f307c52f8f9dc5b2a6a832feef159318998e375560d3187c1c25fbce"; // USDC/USDT

// ============================================================================
// Main Multihop Sequential Split Function
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
    const gasBudget = 20000000;
    const totalAmount = 0.1 * 10 ** SUI_DECIMAL; // 0.1 SUI in mist

    // Calculate amounts for each path
    const amount40 = Math.floor(totalAmount * 0.4); // 40% for Cetus
    const amount60 = Math.floor(totalAmount * 0.6); // 60% for FlowX

    txb.setGasBudget(gasBudget);

    console.log(`Total Amount: ${totalAmount} mist`);
    console.log(`Cetus Amount (40%): ${amount40} mist`);
    console.log(`FlowX Amount (60%): ${amount60} mist`);

    // Split coins from gas for different paths
    const amountCoin40 = txb.splitCoins(
        txb.gas,
        [txb.pure(amount40.toString())]
    );
    const amountCoin60 = txb.splitCoins(
        txb.gas,
        [txb.pure(amount60.toString())]
    );

    // ============================================================================
    // Step 1: Two Main Parallel SUI Swaps
    // ============================================================================

    // 1. Cetus: SUI → USDT (40%)
    const [cetusOut, cetusAmount] = txb.moveCall({
        target: `${DEX_ROUTER}::router::cetus_swap_b2a_with_return`,
        arguments: [
            txb.object(CETUS_DEPLOYMENT.globalConfigId),   // config
            txb.object(CETUS_POOL),                        // pool
            txb.makeMoveVec({ objects: [amountCoin40] }), // coins
            txb.pure(true),                               // by_amount_in
            txb.pure(amount40),                           // amount
            txb.pure(0),                                  // min_amount_out
            txb.pure(BigInt("79226673515401279992447579055")), // sqrt_price_limit
            txb.object(SUI_CLOCK_OBJECT_ID),              // clock
            txb.pure(0),                                  // order_id
            txb.pure(USDT_DECIMAL),                       // decimal
        ],
        typeArguments: [USDT_TYPE, SUI_TYPE]
    });

    // 2. FlowX V3: SUI → USDC (60%)
    const [flowxOut, flowxAmount] = txb.moveCall({
        target: `${DEX_ROUTER}::router::flowxv3_swap_a2b_with_return`,
        arguments: [
            txb.object(SUI_CLOCK_OBJECT_ID),              // clock
            txb.object(FLOWX_V3_VERSIONED),               // versioned
            txb.object(FLOWX_V3_POOL_REGISTRY),           // pool_registry
            txb.pure(100),                                // fee_rate
            amountCoin60,                                 // coin_in
            txb.pure(true),                               // by_amount_in
            txb.pure(BigInt("4295048017")),              // sqrt_price_limit
            txb.pure(0),                                  // order_id
            txb.pure(USDC_DECIMAL),                       // decimal
        ],
        typeArguments: [SUI_TYPE, USDC_TYPE]
    });

    // ============================================================================
    // Step 2: Split FlowX USDC into Two Parts (20% + 80%)
    // ============================================================================

    const flowxUsdcForKriya = txb.splitCoins(flowxOut, [txb.pure("10000")]);
    const flowxUsdcForKriyaUsdcValue = txb.moveCall({
        target: "0x2::coin::value",
        arguments: [flowxUsdcForKriya],
        typeArguments: [USDC_TYPE]
    });

    const flowxUsdcForSuiSwap = flowxOut;
    const flowxUsdcForSuiSwapUsdcValue = txb.moveCall({
        target: "0x2::coin::value",
        arguments: [flowxUsdcForSuiSwap],
        typeArguments: [USDC_TYPE]
    });

    // ============================================================================
    // Step 3: Parallel USDC → USDT Conversions
    // ============================================================================

    // KriyaAMM: USDC → USDT (20% of FlowX output)
    const [kriyaOut, kriyaAmount] = txb.moveCall({
        target: `${DEX_ROUTER}::router::kriya_amm_swap_token_x_with_return`,
        arguments: [
            txb.object(KRIYA_STABLE_POOL),               // USDC-USDT stable pool
            flowxUsdcForKriya,                           // coin_in
            flowxUsdcForKriyaUsdcValue,                  // amount
            txb.pure(0),                                 // min_return
            txb.pure(0),                                 // order_id
            txb.pure(USDC_DECIMAL),                      // decimal
        ],
        typeArguments: [USDC_TYPE, USDT_TYPE]
    });

    // SuiSwap: USDC → USDT (80% of FlowX output)
    const [suiswapOut, suiswapAmount] = txb.moveCall({
        target: `${DEX_ROUTER}::router::suiswap_x_2_y_with_return`,
        arguments: [
            txb.object(SUISWAP_USDC_USDT_POOL),          // pool
            txb.makeMoveVec({ objects: [flowxUsdcForSuiSwap] }), // coins
            flowxUsdcForSuiSwapUsdcValue,                // amount
            txb.pure(0),                                 // min_amount_out
            txb.object(SUI_CLOCK_OBJECT_ID),             // clock
            txb.pure(0),                                 // order_id
            txb.pure(USDC_DECIMAL),                      // decimal
        ],
        typeArguments: [USDC_TYPE, USDT_TYPE]
    });

    // ============================================================================
    // Step 4: Merge and Finalize All Transactions
    // ============================================================================

    // Merge all USDT outputs into one coin
    txb.mergeCoins(cetusOut, [kriyaOut, suiswapOut]);

    // Set transaction sender
    txb.setSender(walletAddress);

    // Standard finalize call
    txb.moveCall({
        target: `${DEX_ROUTER}::router::finalize`,
        arguments: [
            cetusOut,                                     // input_coin
            txb.pure(1),                                  // min_amount
            txb.pure(0),                                  // commission_rate
            txb.pure(walletAddress),                      // referral_address
            txb.pure(walletAddress),                      // receiver_address
            txb.pure(0),                                  // order_id
            txb.pure(USDT_DECIMAL),                       // decimal
        ],
        typeArguments: [USDT_TYPE]
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

    console.log("Multihop Sequential Split Result:", result);
}

// ============================================================================
// Execute Script
// ============================================================================

main().catch((error) => {
    console.error("Error executing multihop sequential split:", error);
    process.exit(1);
});
