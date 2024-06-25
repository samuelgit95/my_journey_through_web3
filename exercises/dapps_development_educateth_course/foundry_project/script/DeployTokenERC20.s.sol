// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {TokenERC20} from "../src/tokenERC20.sol";

contract DeploySimpleStorage is Script {
    function run() external returns (TokenERC20) {
        vm.startBroadcast();
        TokenERC20 tokenERC20 = new TokenERC20();
        vm.stopBroadcast();
        return tokenERC20;
    }
}
