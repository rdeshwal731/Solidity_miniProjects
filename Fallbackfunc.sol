// SPDX-License-Identifier: MIT
pragma solidity ^0.5.12;

// contract with fallback function
contract fall {
  uint n;
  function set(uint value) external {
    n = value;
  }

  function() external payable {
    n = 0;
  }
}