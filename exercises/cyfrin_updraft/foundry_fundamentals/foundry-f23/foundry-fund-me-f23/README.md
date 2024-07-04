# Foundry Fundamentals Course Project

This project is part of the Foundry Fundamentals course. The original course code can be found [here](https://github.com/Cyfrin/foundry-fund-me-cu).

## What I Learned and Implemented

- **Mocks for Chainlink Contract Testing:** Practiced using mocks to facilitate testing of Chainlink contracts.
- **New Remappings:** Added new remappings to simplify file imports.
- **Best Practices:**
  - Naming custom errors.
  - Naming storage variables.
  - Avoiding "magic numbers".
- **Test Coverage:** Learned how to achieve high test coverage.
- **Deploy Script Usage:** Utilized deploy script within test files to reuse existing deployments.
- **Helper File:** Created a helper file to store logic for testing, deploying, and forking other chains.
- **Cheatcodes in Tests:**
  - `vm.expectRevert()`
  - `vm.prank()`
  - `vm.deal()`
  - `hoax()`
- **Modifiers in Tests:** Learned to use modifiers effectively in tests.
- **Chisel:** Gained proficiency with Chisel.
- **Gas Snapshot:** Created snapshots of gas usage during test execution.
- **Gas Cost Simulation:** Used `vm.txGasPrice()` cheatcode to simulate gas costs.
- **Gas Optimization:** Optimized gas costs by minimizing multiple calls to state variables.
- **Integration Tests:** Conducted comprehensive integration tests.
- **Makefile:** Created a Makefile for custom commands.

## Requirements

- Git
- Foundry

## How to Run This Repository

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/samuelgit95/my_journey_through_web3/tree/main/exercises/cyfrin_updraft/foundry_fundamentals/foundry-f23/foundry-fund-me-f23
   ```

2. **Deploy:**

   ```bash
   forge script script/DeployFundMe.s.sol
   ```

3. **Test:**

   ```bash
   forge test
   ```

4. **Test Coverage:**
   ```bash
   forge coverage
   ```

Feel free to reach out if you have any questions or need further assistance!
