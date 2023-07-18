// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract ViewPure {
    uint public x = 1;

    // Promise not to modify the state.
    function sumX(uint y) public view returns (uint) {
        return x + y;
    }

    // Promise not to modify or read from the state.
    function sumI(uint i, uint j) public pure returns (uint) {
        return i + j;
    }
}
//