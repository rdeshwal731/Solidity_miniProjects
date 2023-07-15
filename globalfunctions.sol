//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystem {
    mapping(string => uint256) private votes;

    event VoteCasted(address indexed voter, string option);

    function castVote(string memory option) public {
        require(bytes(option).length > 0, "Option cannot be empty.");
        
        votes[option] += 1;

        emit VoteCasted(msg.sender, option);
    }

    function getVoteCount(string memory option) public view returns (uint256) {
        require(bytes(option).length > 0, "Option cannot be empty.");

        return votes[option];
    }

    function getWinner() public view returns (string memory) {
        string memory winner;
        uint256 maxVotes;

        for (uint256 i = 0; i < globalMessageContext().numOptions; i++) {
            string memory option = globalMessageContext().getOption(i);
            uint256 voteCount = votes[option];
            if (voteCount > maxVotes) {
                maxVotes = voteCount;
                winner = option;
            }
        }

        return winner;
    }

    // Global message context functions
    function globalMessageContext() internal view returns (MessageContext storage) {
        bytes32 slot = keccak256("message.context");
        assembly {
            let data := sload(slot)
            if iszero(data) {
                data := newContext()
                sstore(slot, data)
            }
            return(data, 0x20)
        }
    }

    function newContext() private pure returns (MessageContext storage) {
        MessageContext storage context;
        assembly {
            context.slot := newSlot()
        }
    }

    function newSlot() private pure returns (bytes32 slot) {
        bytes32[1] memory slots;
        assembly {
            slot := slots.length.slot
        }
    }
}

struct MessageContext {
    uint256 numOptions;
    mapping(uint256 => string) options;
}

library MessageContextLib {
    function addOption(MessageContext storage context, string memory option) internal {
        context.options[context.numOptions] = option;
        context.numOptions++;
    }

    function getOption(MessageContext storage context, uint256 index) internal view returns (string memory) {
        require(index < context.numOptions, "Invalid option index.");
        return context.options[index];
    }
}

/*
The smart contract VotingSystem allows users to cast votes for different options.

The votes mapping stores the vote count for each option.

The castVote function allows users to cast their vote for a specific option by calling the function and passing the option as an argument.

The getVoteCount function returns the vote count for a given option.

The getWinner function calculates and returns the option with the highest number of votes.

The globalMessageContext function is used to access the message context storage, which is a custom storage structure defined as MessageContext.

The newContext function creates a new message context if it doesn't exist.

The newSlot function generates a new storage slot for the message context.

The MessageContext struct defines the structure of the message context, including the number of options and a mapping of options by index.

The MessageContextLib library provides helper functions to add options and retrieve options by index within the message context.

Please note that using global functions in the message context requires low-level assembly operations and is more advanced than typical smart contract development. Ensure that you thoroughly test and audit such code before deploying it to a production environment.




*/