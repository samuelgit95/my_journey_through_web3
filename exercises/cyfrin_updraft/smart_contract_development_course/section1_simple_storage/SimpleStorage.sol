// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;  // solidity version, 0.8.19 and newer versions allowed
// version ranges >=0.8.18 <0.9.0

contract SimpleStorage {
    uint256 myFavoriteNumber;

     // uint256[] listOfFavoriteNumbers; // [0, 78, 90]
     struct Person {
        uint256 favoriteNumber;
        string name;
     }
    // dynamic array
    Person[] public listOfPeople;

    // static array
    // Person[3] public listOfPeople;

    // Person public myFriend = Person(7, "Sam");

    function store(uint256 _favoriteNumber) public{
        myFavoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns(uint256){
        return myFavoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
    }
}