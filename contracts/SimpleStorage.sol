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
    People public person = People({favoriteNumber: 2, name: "Patrick"});

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    //dictionary where every name is going to map to a specific number
    mapping(string => uint256) public nameToFavoriteNumber;

//---Function types:
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
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
        }
}

    // a briefer way to assing a variable is:
    /*
    function addPerson2(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
    }
    */
    //Information Storage Types in EVM:

//---Data Locations:
    //calldata, vairable cannot be modified
    //memory --> variable only exists during the tx, vairable can be modified
    //storage --> means variable exists even outside of the funcion("permanent")
    //function parameters cannot be stored as storage, since they only live within the function 
    //In the example above, memory is used to indicate that

    // Explanations
    //uin256 is already living in memory
    //string is an array of bytes. Since it is an array, it has to be in memory
    // string can only be array or calldata

    // https://youtu.be/gyMwXuJrbJQ?si=ZPvnqEiDZ57VpYeM&t=9936

    // MAPPING - data structure where a key is mapped to a single value
    // it is like a dictionary, where a key returns a certain associated value

//EVM: standard of how to deploy SCs to blockchains
//Polygon, Avalanche, Fantom

//Composability: ability of smart contracts to interact 
// with each other