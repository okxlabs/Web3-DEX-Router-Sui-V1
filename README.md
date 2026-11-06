# DEX-Router-Sui

## What is DEX Router Sui?

DEX-Router-Sui is a DEX aggregation and routing system built on Sui blockchain that enables optimal token swapping across multiple decentralized exchanges (DEXs) and protocols. It acts as a unified interface for executing complex multi-path swaps, providing users with the best possible rates by splitting orders across different liquidity sources within the Sui ecosystem.

## Architecture Overview

The DEX-Router-Sui follows a modular architecture designed for extensibility:

```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│   User/DApp     │───▶│   DexRouter      │───▶│  Swap Functions │
└─────────────────┘    └──────────────────┘    └─────────────────┘
                              │                         │
                              ▼                         ▼
                       ┌──────────────────┐    ┌─────────────────┐
                       │ Commission & SUI │    │ DeFi Protocols  │
                       │   Management     │    │                 │
                       └──────────────────┘    └─────────────────┘
```

## Core Features

### Smart Routing
- **Multi-path execution**: Split orders across multiple DEXs simultaneously
- **PTB integration**: Execute complex swaps in single Programmable Transaction Block
- **Slippage protection**: Configurable minimum return amounts

### Swap Types

#### Exact Input Swaps
- **Concept**: Specify exact amount of input tokens to swap
- **Use case**: "I want to swap exactly 1000 USDC for as much SUI as possible"
- **Protection**: Minimum output amount (slippage protection)
- **Implementation**: `router.move` and related contracts

#### Commission-based Swaps
- **Concept**: Swaps with built-in commission collection
- **Use case**: Platform integration with referral rewards
- **Protection**: Commission rate limits and validation

### Transaction Management
- **Order ID tracking**: Unique identifiers for swap operations
- **Event-driven architecture**: Comprehensive event emission for all operations
- **Commission integration**: Flexible fee collection system with up to 3% referral rewards
- **Error recovery**: Robust error handling with detailed error codes

### Advanced Features
- **Multi-hop swaps**: Complex routing through multiple protocols
- **Split swaps**: Divide orders across multiple paths for optimal execution
- **Commission system**: Built-in referral rewards with flexible rate configuration
- **Event system**: Comprehensive event emission for analytics and monitoring
- **Type safety**: Full Sui Move type system integration

## Contract Architecture

### PTB (Programmable Transaction Block) System
The DEX Router Sui leverages Sui's unique PTB architecture:

```
┌─────────────────────┐    ┌──────────────────────┐    ┌─────────────────────┐
│   User/DApp         │───▶│   Programmable       │───▶│   DEX Router        │
│                     │    │   Transaction Block  │    │   Contract          │
└─────────────────────┘    └──────────────────────┘    └─────────────────────┘
                                                                │
                                                                ▼
                                                        ┌─────────────────────┐
                                                        │  Swap Instructions  │
                                                        │  - Split Orders     │
                                                        │  - Multiple DEXs    │
                                                        │  - Commission       │
                                                        │  - Finalize         │
                                                        └─────────────────────┘
```

## Source Code Location

### Repository Structure
```
DEX-Router-Sui-V1/
├── dexrouter/                     # Router Contract (Production)
│   ├── Move.toml                  # Package configuration (v1.1.8)
│   ├── sources/
│   │   └── router.move            # Core routing logic
├── dexrouter-extended/            # Extended Router Contract (Production)
│   ├── Move.toml                  # Package configuration (v1.1.7)
│   ├── sources/
│   │   └── router.move            # Advanced routing logic
├── interfaces/                    # Protocol Interface Definitions (21 protocols)
│   ├── afsui/                     # AFSUI liquid staking
│   ├── aftermath/                 # Aftermath ecosystem
│   ├── alphafi/                   # AlphaFi liquid staking
│   ├── bluefin/                   # BlueFin CLMM
│   ├── bluemove/                  # BlueMove AMM
│   ├── deepbookV3/                # DeepBook V3
│   ├── flowx/                     # FlowX ecosystem
│   ├── haedal/                    # Haedal liquid staking
│   ├── kriya/                     # Kriya ecosystem
│   ├── magma/                     # Magma yield farming
│   ├── momentum/                  # Momentum CLMM
│   ├── movepump/                  # MovePump integration
│   ├── scallop/                   # Scallop lending
│   ├── steamm/                    # SteamM multi-protocol DEX
│   ├── suiswap/                   # SuiSwap AMM
│   ├── turbos/                    # Turbos CLMM
│   └── ...
└── script/                        # TypeScript Testing Framework
    ├── config/
    │   ├── configInfo.json        # Contract addresses
    └── test/
        ├── commission.ts          # Commission system tests
        ├── swap.ts                # Basic swap tests
        ├── split-order.ts         # Order splitting tests
        ├── multihop-*.ts          # Multihop routing tests
        ├── ...
        └── dexes/                 # Individual protocol tests (13 files)
```

### Key Files
- **Router Contract**: `dexrouter/sources/router.move`
- **Extended Router**: `dexrouter-extended/sources/router.move`
- **Configuration**: `script/config/configInfo.json`
- **Test Framework**: `script/test/` directory

## Integration Guide

### Prerequisites
- **Sui CLI**: Version 1.0.0 or later
- **Node.js**: Version 18.0.0 or later
- **TypeScript**: Version 5.0.0 or later
- **@mysten/sui.js**: Version 0.54.1 or later

### Development Setup

#### 1. Environment Preparation
Ensure you have installed the required development tools (see Prerequisites section above).

#### 2. Project Setup
```bash
# Clone the repository
git clone https://github.com/okxlabs/DEX-Router-Sui-V1.git
cd DEX-Router-Sui-V1

# Configure environment variables
# Edit .env file with your private key and configuration
```

#### 3. Contract Build and Deployment
```bash
# Build the core router contract
cd dexrouter
sui move build

# Deploy to testnet/mainnet
sui client publish --gas-budget []

# Build the extended router contract
cd ../dexrouter-extended
sui move build

# Deploy the extended contract
sui client publish --gas-budget []
```

#### 4. Testing Environment Setup
```bash
# Return to project root
cd ..

# Install dependencies
npm install

# Run basic functionality tests
npx ts-node script/test/swap.ts

# Run specific protocol tests
npx ts-node script/test/dexes/cetus.ts
```

## Security Features

- **Type Safety**: Full Sui Move type system integration prevents runtime errors
- **Error Handling**: Comprehensive error codes for debugging and user experience
- **Slippage Protection**: Configurable minimum return amounts on all trades
- **Commission Limits**: Maximum 3% commission rate to protect users
- **Event Tracking**: Complete audit trail through comprehensive event emission