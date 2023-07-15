// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StorageAndMemoryContract {
    uint256 public storageVariable;  // Storage variable
    address[] public memoryArray;    // Memory variable

    function setStorageVariable(uint256 _value) public {
        storageVariable = _value;
    }

    function getStorageVariable() public view returns (uint256) {
        return storageVariable;
    }

    function addToMemoryArray(address _address) public {
        memoryArray.push(_address);
    }

    function getMemoryArray() public view returns (address[] memory) {
        return memoryArray;
    }
}
