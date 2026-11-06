// ============================================================================
// Cetus CLMM Mainnet Deployment Manifest
// ============================================================================
//
// Single source of truth for the Cetus CLMM identifiers used when building
// PTBs against `router::cetus_swap_a2b_with_return` / `cetus_swap_b2a_with_return`.
// Do not hardcode these values separately in individual test scripts — Cetus
// bumps `globalConfigId`'s on-chain package_version on every protocol upgrade,
// and `cetusclmm::config::checked_package_version` aborts (code 10) if the
// package/config pairing here has drifted from Cetus's current deployment.
//
// Move type tags (GlobalConfig, Pool, events) are always keyed to the
// *original* package ID, even after Cetus upgrades — only the entry-function
// call target moves to `latestPackageId`. See:
// https://www.moveregistry.com/package/@cetuspackages/clmm (version 14, mainnet-v0.14.0)

import { SuiClient } from "@mysten/sui.js/client";

export const CETUS_DEPLOYMENT = {
    originalPackageId: "0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb",
    latestPackageId: "0x25ebb9a7c50eb17b3fa9c5a30fb8b5ad8f97caaf4928943acbcff7153dfee5e3",
    globalConfigId: "0xdaa46292632c3c4d8f31f23ea0f9b36a28ff3677e9684980e4438403a67a3d8f",
    mvrVersion: 14,
} as const;

/**
 * Pre-flight check: confirms the on-chain GlobalConfig object's Move type still
 * resolves under `originalPackageId` before a PTB is built against it. Surfaces
 * a clear manifest-drift error instead of letting the transaction reach
 * on-chain and fail with `checked_package_version abort 10`.
 */
export async function assertCetusGlobalConfig(client: SuiClient): Promise<void> {
    const obj = await client.getObject({
        id: CETUS_DEPLOYMENT.globalConfigId,
        options: { showType: true },
    });

    const type = obj.data?.type;
    const expectedPrefix = `${CETUS_DEPLOYMENT.originalPackageId}::config::GlobalConfig`;
    if (!type || !type.startsWith(expectedPrefix)) {
        throw new Error(
            `Cetus GlobalConfig type mismatch: expected object type starting with "${expectedPrefix}", got "${type}". ` +
            `Update CETUS_DEPLOYMENT in script/config/cetusDeployment.ts before proceeding.`
        );
    }
}
