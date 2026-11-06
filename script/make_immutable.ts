// ============================================================================
// Make Package Immutable (burn UpgradeCap)
// ----------------------------------------------------------------------------
// 通过 @mysten/sui.js SDK 直接构造并提交 0x2::package::make_immutable，
// 绕开本地 sui CLI 对系统框架包的大小误判（MovePackageTooBig）。
//
// ⚠️ 不可逆：执行成功后目标包将永远无法再升级，UpgradeCap 被销毁。
//
// 用法：
//   npx ts-node script/make_immutable.ts
//   默认只 dry-run；模拟无误后，手动取消下方 signAndExecuteTransactionBlock
//   注释块即可真正上链。
// ============================================================================

import { Ed25519Keypair } from "@mysten/sui.js/keypairs/ed25519";
import { SuiClient } from "@mysten/sui.js/client";
import { TransactionBlock } from "@mysten/sui.js/transactions";
import * as dotenv from "dotenv";

dotenv.config();

// ----------------------------------------------------------------------------
// Configuration
// ----------------------------------------------------------------------------

// 要冻结的包对应的 UpgradeCap 对象 ID
const UPGRADE_CAP_ID =
    "0xf51b9c25fe26be0b8ae4c1c46b3f9aa20941b72b4aecbed09e761731e0fb49ae";

const RPC_URL = "https://sui-rpc.publicnode.com";
const GAS_BUDGET = 30000000;

// Private key from env（与其它脚本一致：base64 解码后去掉首位 flag 字节）
const PRIVATE_KEY_STR = process.env.PRIVATE_KEY_STR;
if (!PRIVATE_KEY_STR) {
    throw new Error("PRIVATE_KEY_STR environment variable is required");
}
const PRIVATE_KEY = Buffer.from(PRIVATE_KEY_STR, "base64").subarray(1);

// ----------------------------------------------------------------------------
// Main
// ----------------------------------------------------------------------------

async function main(): Promise<void> {
    const provider = new SuiClient({ url: RPC_URL });
    const keypair = Ed25519Keypair.fromSecretKey(PRIVATE_KEY);
    const walletAddress = keypair.getPublicKey().toSuiAddress();
    console.log("Wallet Address :", walletAddress);
    console.log("UpgradeCap     :", UPGRADE_CAP_ID);

    // 先确认这个 UpgradeCap 归当前钱包所有、且管的是预期的包
    const capObj = await provider.getObject({
        id: UPGRADE_CAP_ID,
        options: { showContent: true, showOwner: true, showType: true },
    });
    console.log("UpgradeCap info:", JSON.stringify(capObj.data, null, 2));

    if (capObj.data?.type !== "0x2::package::UpgradeCap") {
        throw new Error(
            `对象类型不是 UpgradeCap: ${capObj.data?.type ?? "<not found>"}`
        );
    }

    // 构造交易：make_immutable(cap) —— 消费掉 UpgradeCap，包永久冻结
    const txb = new TransactionBlock();
    txb.setSender(walletAddress);
    txb.setGasBudget(GAS_BUDGET);
    txb.moveCall({
        target: "0x2::package::make_immutable",
        arguments: [txb.object(UPGRADE_CAP_ID)],
    });

    const builtTx = await txb.build({ client: provider });

    // Dry run
    const dry = await provider.dryRunTransactionBlock({
        transactionBlock: builtTx,
    });
    console.log("\n===== DRY RUN =====");
    console.log("status:", JSON.stringify(dry.effects.status));
    console.log("make_immutable dry-run result:", dry);

    // ⚠️ 不可逆：模拟无误后，取消下方注释即可真正上链冻结该包。
    // const executeResult = await provider.signAndExecuteTransactionBlock({
    //     transactionBlock: builtTx,
    //     signer: keypair,
    //     options: {
    //         showEffects: true,
    //         showObjectChanges: true,
    //     },
    // });
    // console.log("Execute Result:", executeResult);
}

main().catch((error) => {
    console.error("Error:", error);
    process.exit(1);
});
