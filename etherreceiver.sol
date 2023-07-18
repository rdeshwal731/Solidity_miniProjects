// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EtherReceiver {
    receive() external payable {
        // Receive Ether
    }

    fallback() external payable {
        // Handle unrecognized calls
    }
}
//