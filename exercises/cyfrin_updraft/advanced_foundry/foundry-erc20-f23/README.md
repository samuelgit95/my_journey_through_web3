# OurToken ERC20 Smart Contract

This project is a simple ERC20 token implementation using Solidity and Foundry. The token is named "OurToken" with the symbol "OT". The project includes the token contract, deployment script, and comprehensive tests.

## Getting Started

### Prerequisites

- [Foundry](https://getfoundry.sh/)

### Installing

1. Clone the repository:

2. Install dependencies:

```sh
make install
```

### Building

To build the project, run:

```sh
make build
```

### Running Tests

To run the tests, use:

```sh
make test
```

### Deploying

You can deploy the smart contract to a local Anvil instance or to the Sepolia testnet.

#### Deploy to Local Anvil

1. Start Anvil:

```sh
make anvil
```

2. Deploy the contract (In a different terminal tab):

```sh
make deploy
```

### Deploy to Sepolia Testnet

1. Set up your environment variables in a .env file:

```env
SEPOLIA_RPC_URL=<your_sepolia_rpc_url>
ACCOUNT=<your_account>
SENDER=<your_sender>
ETHERSCAN_API_KEY=<your_etherscan_api_key>
```

2. Deploy the contract:

```sh
make deploy-sepolia
```
