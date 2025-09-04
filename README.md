# Stablecoin Project: Decentralized USD-Pegged Cryptocurrency Overview

This project implements a decentralized stablecoin pegged to $1.00 USD, utilizing an algorithmic minting mechanism with crypto collateral. The system maintains stability through over-collateralization and reliable price feeds, enabling users to mint stablecoins using wETH and wBTC as collateral.

## Key Features
- Stable Value: Maintains a $1.00 peg through algorithmic mechanisms
- Decentralized: Fully on-chain governance with no central authority
- Crypto-Backed: Collateralized by wETH and wBTC
- Oracle Integration: Uses Chainlink Price Feeds for reliable asset valuation
- Permissionless: Anyone can mint or redeem stablecoins with sufficient collateral

## How It Works
1. **Relative Stability Mechanism Peg Target:** 
    - ***$1.00 USD Price Verification:*** Chainlink Price Feeds provide real-time price data for ETH and BTC
    - ***Exchange Function:*** Built-in functionality to exchange ETH & BTC for stablecoins
2. **Stability Mechanism (Minting) Algorithmic Minting:**         
    - Decentralized smart contract system governs all minting operations
    - ***Collateral Requirements:*** Users must deposit sufficient collateral to mint stablecoins
    - ***Code-Enforced Rules:*** Smart contracts automatically enforce collateralization ratios and liquidation thresholds
3. **Collateral System Exogenous Collateral:** 
    - Crypto assets external to the stablecoin system

    - ***Supported Assets:***
        -   **wETH:** Wrapped Ether (ERC-20 representation of ETH)
        -   **wBTC:** Wrapped Bitcoin (ERC-20 representation of BTC)

