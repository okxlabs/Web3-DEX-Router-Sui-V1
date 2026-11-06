// ============================================================================
// DEX Router Multihop Parallel Fan-Out Test Script
// ============================================================================

/**
 * Multihop1: "Parallel Fan-Out" Strategy
 *
 * Flow Diagram:
 * 100% SUI
 * ├── 40% → Cetus (SUI → USDT) ──────────────────────────┐
 * ├── 30% → FlowX V3 (SUI → USDC) ──┐                    │
 * └── 30% → SuiSwap (SUI → USDC) ───┼─→ KriyaAMM (USDC → USDT) ──┤
 *                                    │                    │
 *                                    └────────────────────┘
 *                                                            │
 *                                                            ▼
 *                                                         100% USDT
 *
 * Strategy: Parallel execution with intermediate aggregation
 * - 3 parallel SUI swaps (40% + 30% + 30%)
 * - 2 USDC outputs merged before final conversion
 * - Single final merge point
 *
 * DAG Analysis:
 * - Fan-out degree: 3 (SUI splits into 3 paths)
 * - Fan-in degree: 2 (2 USDC paths merge, then final merge)
 * - Depth: 3 levels (SUI → USDC/USDT → USDT)
 * - Parallelism: High (3 parallel swaps at level 1)
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
// Multihop Parallel Fan-Out Constants
// ============================================================================

// Pool addresses
const CETUS_POOL = "0x4eed0ec3402f2e728eec4d7f6c6649084f2aa243e13d585ac67e3bf81c34039b"; // SUI/USDT

// FlowX V3 constants
const FLOWX_V3_VERSIONED = "0x67624a1533b5aff5d0dfcf5e598684350efd38134d2d245f475524c03a64e656";
const FLOWX_V3_POOL_REGISTRY = "0x27565d24a4cd51127ac90e4074a841bbe356cca7bf5759ddc14a975be1632abc";

// Other pools
const SUISWAP_POOL = "0xddb2164a724d13690e347e9078d4234c9205b396633dfc6b859b09b61bbcd257"; // SUI/USDC
const KRIYA_STABLE_POOL = "0xd0086b7713e0487bbf5bb4a1e30a000794e570590a6041155cdbebee3cb1cb77"; // USDC/USDT

// ============================================================================
// Main Multihop Parallel Fan-Out Function
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
    const amount30 = Math.floor(totalAmount * 0.3); // 30% for each FlowX and SuiSwap

    txb.setGasBudget(gasBudget);

    console.log(`Total Amount: ${totalAmount} mist`);
    console.log(`Cetus Amount (40%): ${amount40} mist`);
    console.log(`FlowX Amount (30%): ${amount30} mist`);
    console.log(`SuiSwap Amount (30%): ${amount30} mist`);

    // Split coins from gas for different paths
    const amountCoin40 = txb.splitCoins(
        txb.gas,
        [txb.pure(amount40.toString())]
    );
    const amountCoin30_1 = txb.splitCoins(
        txb.gas,
        [txb.pure(amount30.toString())]
    );
    const amountCoin30_2 = txb.splitCoins(
        txb.gas,
        [txb.pure(amount30.toString())]
    );

    // ============================================================================
    // Step 1: Parallel Execution of Three SUI Swaps
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

    // 2. FlowX V3: SUI → USDC (30%)
    const [flowxOut, flowxAmount] = txb.moveCall({
        target: `${DEX_ROUTER}::router::flowxv3_swap_a2b_with_return`,
        arguments: [
            txb.object(SUI_CLOCK_OBJECT_ID),              // clock
            txb.object(FLOWX_V3_VERSIONED),               // versioned
            txb.object(FLOWX_V3_POOL_REGISTRY),           // pool_registry
            txb.pure(100),                                // fee_rate
            amountCoin30_1,                               // coin_in
            txb.pure(true),                               // by_amount_in
            txb.pure(BigInt("4295048017")),              // sqrt_price_limit
            txb.pure(0),                                  // order_id
            txb.pure(USDC_DECIMAL),                       // decimal
        ],
        typeArguments: [SUI_TYPE, USDC_TYPE]
    });

    // 3. SuiSwap: SUI → USDC (30%)
    const [suiswapOut, suiswapAmount] = txb.moveCall({
        target: `${DEX_ROUTER}::router::suiswap_x_2_y_with_return`,
        arguments: [
            txb.object(SUISWAP_POOL),                     // pool
            txb.makeMoveVec({ objects: [amountCoin30_2] }), // coins
            txb.pure(amount30),                           // amount
            txb.pure(0),                                  // min_amount_out
            txb.object(SUI_CLOCK_OBJECT_ID),              // clock
            txb.pure(0),                                  // order_id
            txb.pure(SUI_DECIMAL),                        // decimal
        ],
        typeArguments: [SUI_TYPE, USDC_TYPE]
    });

    // ============================================================================
    // Step 2: Merge USDC and Convert to USDT
    // ============================================================================

    // Merge FlowX and SuiSwap USDC outputs
    txb.mergeCoins(flowxOut, [suiswapOut]);

    // Get the merged USDC value
    const mergedUsdcValue = txb.moveCall({
        target: "0x2::coin::value",
        arguments: [flowxOut],
        typeArguments: [USDC_TYPE]
    });

    // KriyaAMM: USDC → USDT (merged 60% USDC)
    const [kriyaOut, kriyaAmount] = txb.moveCall({
        target: `${DEX_ROUTER}::router::kriya_amm_swap_token_x_with_return`,
        arguments: [
            txb.object(KRIYA_STABLE_POOL),               // USDC-USDT stable pool
            flowxOut,                                    // coin_in (merged USDC)
            mergedUsdcValue,                             // amount
            txb.pure(0),                                 // min_return
            txb.pure(0),                                 // order_id
            txb.pure(USDC_DECIMAL),                      // decimal
        ],
        typeArguments: [USDC_TYPE, USDT_TYPE]
    });

    // ============================================================================
    // Step 3: Finalize All Transactions
    // ============================================================================

    // Set transaction sender
    txb.setSender(walletAddress);

    // Merge all USDT outputs
    txb.mergeCoins(cetusOut, [kriyaOut]);

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

    console.log("Multihop Parallel Fan-Out Result:", result);
}

// ============================================================================
// Execute Script
// ============================================================================

main().catch((error) => {
    console.error("Error executing multihop parallel fan-out:", error);
    process.exit(1);
}); 
