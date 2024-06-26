// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {NftERC721} from "../src/nftERC721.sol";

contract DeployNFT is Script {
    function run() external returns (NftERC721) {
        address owner = vm.envAddress("OWNER");
        //address owner = address(0x123);
        vm.startBroadcast();
        NftERC721 nft = new NftERC721(owner);
        console.log("tokenERC20 deployed at: ", address(nft));
        vm.stopBroadcast();
        return nft;
    }
}
