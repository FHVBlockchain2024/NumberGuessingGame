// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract NumberGuessingGame {
    uint private secretNumber;
    address public owner;
    uint public gameFee = 0.01 ether;

    event GameResult(address player, bool won, uint guess);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    constructor() {
        owner = msg.sender;
        secretNumber = uint(keccak256(abi.encodePacked(block.timestamp))) % 100; // Random number from timestamp
    }

    function guess(uint _guess) public payable {
        require(msg.value == gameFee, "Incorrect fee");

        bool won = (_guess == secretNumber);
        emit GameResult(msg.sender, won, _guess);

        if (won) {
            payable(msg.sender).transfer(2 * gameFee); // Reward for winning
        }
    }

    // Owner function to change the game fee
    function setGameFee(uint _fee) public onlyOwner {
        gameFee = _fee;
    }

    // Owner function to change the secret number
    function resetGame() public onlyOwner {
        secretNumber = uint(keccak256(abi.encodePacked(block.timestamp))) % 100;
    }
}
