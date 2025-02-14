// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

// importing contracts from the directory to this contract
import "./SimpleStorage.sol"; 

contract StorageFactory {
    
    SimpleStorage[] public simpleStorageArray;
    
    function createSimpleStorageContract() public {
        // new means it's a gonna deploy a new contract
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }
    
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // Address 
        // ABI 
        // SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).store(_simpleStorageNumber);
        simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
    }
    
    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        // return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).retrieve();
        return simpleStorageArray[_simpleStorageIndex].retrieve();
    }
}