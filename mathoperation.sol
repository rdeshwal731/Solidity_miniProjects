// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MathOperations {
    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }

    function multiply(uint256 a, uint256 b) public pure returns (uint256) {
        return a * b;
    }

    function isEven(uint256 number) public view returns (bool) {
        return number % 2 == 0;
    }
}
//