// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

// Source of this excersise: https://gist.github.com/tinchoabbate/67b195b95fe77a5b9e3c6cc4bf80b3f7
contract Registry {
    error PaymentNotEnough(uint256 expected, uint256 actual);

    uint256 public constant PRICE = 1 ether;

    mapping(address account => bool registered) private registry;

    function register() external payable {
        if (msg.value < PRICE) {
            revert PaymentNotEnough(PRICE, msg.value);
        }

        registry[msg.sender] = true;
    }

    function isRegistered(address account) external view returns (bool) {
        return registry[account];
    }
}
