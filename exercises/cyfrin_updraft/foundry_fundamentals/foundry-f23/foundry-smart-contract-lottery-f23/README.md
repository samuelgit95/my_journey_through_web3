# Decentralized Lottery Smart Contract Project

This project demonstrates the deployment and testing of a decentralized lottery smart contract using Foundry. The project was completed as part of the Foundry Fundamentals course by Cyfrin Updraft. For more information about the course, visit [Foundry Smart Contract Lottery CU](https://github.com/Cyfrin/foundry-smart-contract-lottery-cu).

## Overview

- **Contract:** Decentralized Lottery
- **VRF:** Utilizes Chainlink VRF for secure and random winner selection.
- **Automation:** Uses Chainlink Automation to automatically execute the winner selection function.
- **Libraries:**
  - chainlink-brownie-contracts
  - cyfrin/foundry-devops
  - transmissions11/solmate
- **Pattern:** Implements the Checks-Effects-Interactions (CEI) pattern in contract functions.
- **Networks:** Configured for both local and Ethereum Sepolia test networks.

## Features

1. **Decentralized Lottery Contract**

   - Implements a secure, random, and automated lottery system.

2. **Chainlink VRF Integration**

   - Ensures random and fair winner selection using Chainlink's Verifiable Random Function (VRF).

3. **Chainlink Automation**

   - Automates the execution of the winner selection function using Chainlink Automation.

4. **CEI Pattern**

   - Ensures best practices in contract function implementation with the Checks-Effects-Interactions pattern.

5. **Local and Testnet Deployment**

   - Configured for deployment and testing on both local environments and the Ethereum Sepolia testnet.

6. **Testing**
   - Multiple unit tests created.
   - Introduction to fuzzing testing.
   - Event emission testing.
   - Time manipulation for tests requiring time-based conditions.

## Notes

This project documents my progress in learning web3 concepts. To replicate this project, I recommend following the official repository of the Foundry Fundamentals course by Cyfrin Updraft.
