// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract dNotes {
    uint256 private counter;
    string[] private userMessages;

    event CounterIncremented(uint256 newCounter);
    event MessageAdded(string message);
    event MessageRemoved(uint256 index);

    constructor() {
        counter = 0;
    }

    function incrementCounter() public {
        counter += 1;
        emit CounterIncremented(counter);
    }

    function incrementCounterBy(uint256 _amount) public {
        counter += _amount;
        emit CounterIncremented(counter);
    }

    function getCounter() public view returns (uint256) {
        return counter;
    }

    function addMessage(string memory _message) public {
        userMessages.push(_message);
        emit MessageAdded(_message);
    }

    function getMessages() public view returns (string[] memory) {
        return userMessages;
    }

    function removeMessage(uint256 index) public {
        require(index < userMessages.length, "Index out of bounds.");
        if (index < userMessages.length - 1) {
            userMessages[index] = userMessages[userMessages.length - 1];
        }
        userMessages.pop();
        emit MessageRemoved(index);
    }
}