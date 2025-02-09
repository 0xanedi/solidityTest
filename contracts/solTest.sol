// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage {
    // This gets initialized to zero!
    uint256 public favoriteNumber;

// new type (object) called "People" with two properties (array)
// this is not a function and is therefore not found in the 
    struct People {
        uint256 favoriteNumber;
        string name;
    }
People public person = People({favoriteNumber:2, name:"Patrick"});

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }


// view only allows to read data from the blockchain
// pure disallows even reading data. It's used to 
// run constant functions
    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }



// --- ARRAYS ---
    uint256[] public favoriteNumberList;
// since people is a public variable, it's given a blue button
// if it were a public function, it would get an orange button
//if it were a private variable or function, no button
//People is currently a dynamic array because its size is not defined
//if i input a number within brackets, it's a fixed array of n
    People[] public people;

//function to add people to our People array
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        People memory newPerson = People({favoriteNumber: _favoriteNumber, name: _name});
        people.push(newPerson);
    }
// a briefer way to do this is:
    function addPerson2(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
    }

}




// https://youtu.be/gyMwXuJrbJQ?si=ZPvnqEiDZ57VpYeM&t=9936