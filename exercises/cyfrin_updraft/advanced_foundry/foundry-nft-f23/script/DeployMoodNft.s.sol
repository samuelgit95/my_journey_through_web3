// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {MoodNft} from "src/MoodNft.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployMoodNft is Script {
    function run() external returns (MoodNft) {
        string memory sadSvg = vm.readFile("./img/dynamicNft/sad.svg");
        string memory happySvg = vm.readFile("./img/dynamicNft/happy.svg");

        vm.startBroadcast();
        MoodNft moodNft = new MoodNft(
            svgToImageURI(sadSvg),
            svgToImageURI(happySvg)
        );
        vm.stopBroadcast();
        return moodNft;
    }

    function svgToImageURI(
        string memory svg
    ) public pure returns (string memory) {
        // example:
        // input: <svg viewBox="0 0 200 200" width="400" ....>
        // returns: data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAy.....
        string memory baseURL = "data:image/svg+xml;base64,";
        string memory svgBase64Encoded = Base64.encode(
            bytes(string(abi.encodePacked(svg)))
        );

        return string(bytes(abi.encodePacked(baseURL, svgBase64Encoded)));
    }
}
