// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";
import {NftERC721} from "../src/nftERC721.sol";

contract NftERC721Test is Test {
    address owner;
    address newOwner;
    NftERC721 nft;

    function setUp() public {
        owner = vm.addr(1);
        nft = new NftERC721(owner);
    }

    function testOwner() public view {
        assertEq(address(nft.owner()), address(owner));
    }

    function testName() public view {
        assertEq(string(nft.name()), string("Nft Samuel"));
    }
}
