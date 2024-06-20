// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {SimpleStorage} from "./SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage {
    // Now AddFiveStorage inherit everything from SimpleStorage
    // Since we are going to override the store function from SimpleStorage
    // We need to use 'virtual' and 'override' keywords
    function store(uint256 _newNumber) public override{
        myFavoriteNumber = _newNumber + 5;
    }
}