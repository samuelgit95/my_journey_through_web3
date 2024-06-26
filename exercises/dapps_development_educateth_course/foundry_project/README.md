# NFT ERC721 Smart Contract Project

This project demonstrates the deployment and testing of an ERC721 standard NFT smart contract using Foundry. The contract has been deployed and verified on the Arbitrum Sepolia testnet.

## Overview

- **Contract:** ERC721 standard NFT
- **Tools:** Foundry for compilation, testing, and deployment
- **Networks:** Local environment and Arbitrum Sepolia testnet
- **Verification:** Contract verified on Arbitrum Sepolia Block Explorer

## Steps Completed

1. **Contract Creation**

   - Created an NFT smart contract implementing the ERC721 standard.

2. **Compilation**

   - Compiled the smart contract using Foundry.

3. **Testing**

   - Created and executed two tests to validate the contract functionality and to reinforce learnings from the development course.

4. **Local Deployment**

   - Deployed the smart contract locally to ensure correct functionality before deploying to a public testnet.

5. **Testnet Deployment**
   - Deployed the smart contract to the Arbitrum Sepolia testnet.
   - Verified the smart contract on the Arbitrum Sepolia Block Explorer.

## Contract Verification

The deployed contract can be verified on the Arbitrum Sepolia Block Explorer using the following link: [Arbitrum Sepolia Contract Verification](https://sepolia.arbiscan.io/address/0x0148143a06e08825a3d0f6507b6b093688ede2ca).

## Purpose

This project was completed as part of the steps required to achieve certification in the EDUCATETH DApp Development Course.

## How to Use

1. **Clone the Repository**

   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. **Install Dependencies**

   ```bash
   forge install
   ```

3. **Compile the Contract**

   ```bash
   forge build
   ```

4. **Run Tests**

   ```bash
   forge test
   ```

5. **Deploy Locally**

   ```bash
   forge script DeployScript --rpc-url http://localhost:8545 --private-key <your-private-key>
   ```

6. **Deploy to Arbitrum Sepolia Testnet**
   ```bash
   forge script DeployScript --rpc-url https://sepolia.arbitrum.io/rpc --private-key <your-private-key>
   ```

## Contributing

Feel free to submit issues or pull requests if you have suggestions or improvements.
