# solidityTest

# Storage Factory - Solidity Smart Contract

## Overview

This repository contains a Solidity smart contract, `StorageFactory`, which demonstrates key Solidity programming concepts such as contract deployment, storage, function calls, and interaction between contracts. The contract allows for the creation of multiple instances of another contract (`SimpleStorage`) and provides functions to store and retrieve data from those instances.

## Concepts Learned

### 1. **Smart Contract Deployment**

- The contract includes a function (`createSimpleStorageContract`) that deploys new instances of the `SimpleStorage` contract dynamically.
- This demonstrates how new contracts can be created from within another contract using the `new` keyword.

### 2. **Contract Interaction**

- The deployed contracts are stored in an array (`simpleStorageArray`), allowing interaction with each individual contract instance.
- The functions `sfStore` and `sfGet` allow for storing and retrieving values from the created contracts.
- This showcases how to interact with multiple instances of a contract.

### 3. **Solidity Data Structures (Arrays & Mappings)**

- The contract utilizes a **dynamic array** to keep track of deployed `SimpleStorage` contracts.
- This allows for scalable and organized management of contract instances.

### 4. **Function Visibility and Modifiers**

- Functions use appropriate visibility specifiers:
  - `public`: Functions that need to be accessed externally (`createSimpleStorageContract`, `sfStore`, `sfGet`).
  - `view`: The `sfGet` function does not modify the state and is marked as `view`.

### 5. **Address & ABI Handling**

- Interacting with external contracts usually requires their **address** and **ABI** (Application Binary Interface), though in this case, Solidity allows direct interaction via an array of contract instances.

## Functions Explained

### 1. ``

- Deploys a new instance of the `SimpleStorage` contract.
- Pushes the deployed contract into the `simpleStorageArray`.

```solidity
function createSimpleStorageContract() public {
    SimpleStorage simpleStorage = new SimpleStorage();
    simpleStorageArray.push(simpleStorage);
}
```

### 2. ``

- Stores a number in a specific `SimpleStorage` contract instance.
- Takes two arguments:
  - `_simpleStorageIndex`: The index of the contract in the array.
  - `_simpleStorageNumber`: The number to store.

```solidity
function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
    simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
}
```

### 3. ``

- Retrieves the stored value from a specific `SimpleStorage` contract instance.
- Uses the `view` keyword since it does not modify the blockchain state.

```solidity
function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
    return simpleStorageArray[_simpleStorageIndex].retrieve();
}
```

## Summary

- This project covers fundamental Solidity concepts like contract deployment, contract interactions, function visibility, and data storage.
- The `StorageFactory` contract acts as a **factory contract**, dynamically deploying and managing multiple `SimpleStorage` contracts.
- By studying this contract, one can learn how to **create, store, and retrieve data** from dynamically deployed smart contracts on Ethereum.

### Future Improvements

- Implement **event logging** for better tracking of deployed contracts.
- Add **authentication mechanisms** to restrict function execution.
- Enhance with a **frontend interface** for user interaction.

## License

This project is licensed under the **MIT License**.

