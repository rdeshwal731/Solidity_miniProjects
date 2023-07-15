// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MathOperations {
    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }

    function subtract(uint256 a, uint256 b) public pure returns (uint256) {
        require(b <= a, "Subtraction result cannot be negative");
        return a - b;
    }

    function multiply(uint256 a, uint256 b) public pure returns (uint256) {
        return a * b;
    }

    function divide(uint256 a, uint256 b) public pure returns (uint256) {
        require(b > 0, "Division by zero error");
        return a / b;
    }
}
/*
1. The add function takes two uint256 parameters, a and b, and returns their sum.

2. The subtract function takes two uint256 parameters, a and b, and returns the difference between a and b. 
    It includes a require statement to ensure that b is not greater than a, avoiding negative results.

3. The multiply function takes two uint256 parameters, a and b, and returns their product.

4. The divide function takes two uint256 parameters, a and b, and returns the result of dividing a by b. 
    It includes a require statement to prevent division by zero errors.

Please note that these functions are declared as pure because they don't modify the contract's state. 
This allows them to be executed without requiring any gas and is suitable for simple mathematical operations.
*/