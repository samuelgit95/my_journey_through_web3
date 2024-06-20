// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory{
    // type visibility name
    SimpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorageContract() public {
        // here we are deploying SimpleStorage contract from this contract
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        // To interact with the contract we need:
        // - An Address
        // - ABI (tecnically a lie, we just need the function selector - We'll learn that later)
        listOfSimpleStorageContracts[_simpleStorageIndex].store(_newSimpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        // With this function we can get the favorite number stored in an specific contract of the list
        return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
    }
}