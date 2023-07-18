// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

abstract contract MyAbstractContract {
    function myAbstractFunction() external virtual;
}

interface MyInterface {
    function myInterfaceFunction() external;
}

contract MyContract is MyAbstractContract, MyInterface {
    function myAbstractFunction() external override {
        // Implement the abstract function
        // Add your custom logic here
    }

    function myInterfaceFunction() external override {
        // Implement the interface function
        // Add your custom logic here
    }
}
