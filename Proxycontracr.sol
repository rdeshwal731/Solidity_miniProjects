// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Upgradeable {
    uint256 public value;

    function setValue(uint256 _newValue) external {
        value = _newValue;
    }
}

contract UpgradeableProxy {
    address private upgradeableContract;
    address private owner;

    constructor(address _upgradeableContract) {
        upgradeableContract = _upgradeableContract;
        owner = msg.sender;
    }

    fallback() external payable {
        address target = upgradeableContract;
        assembly {
            let free_ptr := mload(0x40)
            calldatacopy(free_ptr, 0, calldatasize())

            let result := delegatecall(gas(), target, free_ptr, calldatasize(), 0, 0)
            let size := returndatasize()
            returndatacopy(free_ptr, 0, size)

            switch result
            case 0 { revert(free_ptr, size) }
            default { return(free_ptr, size) }
        }
    }

    function changeUpgradeableContract(address _newUpgradeableContract) external {
        require(msg.sender == owner, "Only the owner can change the upgradeable contract");
        upgradeableContract = _newUpgradeableContract;
    }
}
