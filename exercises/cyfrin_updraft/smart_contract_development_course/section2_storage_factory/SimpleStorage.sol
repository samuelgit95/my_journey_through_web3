// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;  // solidity version, 0.8.19 and newer versions allowed
// version ranges >=0.8.18 <0.9.0

contract SimpleStorage {
    uint256 myFavoriteNumber;
    struct Person {
        uint256 favoriteNumber;
        string name;
     }
    // dynamic array
    Person[] public listOfPeople;

    // We override this function in AddFiveStorage contracts, thats why it has the 'virtual' keyword
    function store(uint256 _favoriteNumber) public virtual{
        myFavoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns(uint256){
        return myFavoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
    }
}

contract SimpleStorage2 {}
contract SimpleStorage3 {}