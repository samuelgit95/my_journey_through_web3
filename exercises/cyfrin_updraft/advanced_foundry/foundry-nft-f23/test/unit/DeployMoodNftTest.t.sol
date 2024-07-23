// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;
import {Test, console} from "forge-std/Test.sol";
import {DeployMoodNft} from "script/DeployMoodNft.s.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft public deployer;
    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testConvertSvgToUri() public {
        string
            memory expectedUri = "data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjMwIiB3aWR0aD0iMjAwIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPjx0ZXh0IHg9IjUiIHk9IjE1IiBmaWxsPSJyZWQiPkkgbG92ZSBTVkchPC90ZXh0PlNvcnJ5LCB5b3VyIGJyb3dzZXIgZG9lcyBub3Qgc3VwcG9ydCBpbmxpbmUgU1ZHLjwvc3ZnPg==";
        string
            memory svg = '<svg height="30" width="200" xmlns="http://www.w3.org/2000/svg"><text x="5" y="15" fill="red">I love SVG!</text>Sorry, your browser does not support inline SVG.</svg>';
        string memory actualUri = deployer.svgToImageURI(svg);
        console.log(actualUri);
        assert(
            keccak256(abi.encodePacked(actualUri)) ==
                keccak256(abi.encodePacked(expectedUri))
        );
    }
}
