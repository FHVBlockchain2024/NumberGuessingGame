
## Documentation: Deployment of a Number Guessing Game Smart Contract on Ethereum Sepolia Testnet

### Introduction

This document describes the steps taken to develop, deploy, and troubleshoot the deployment of a **Number Guessing Game** smart contract on the Ethereum Sepolia testnet using **Hardhat**. The smart contract was written in Solidity, and the deployment was carried out using **Infura** as the Ethereum provider. A key aspect of the game is that players guess a number and send an Ether transaction; if they guess correctly, they win the prize.

### Development Process

1. **Smart Contract Creation**:
    - We started by writing a smart contract called `NumberGuessingGame` in Solidity. This contract allows players to guess a predetermined number (in this case, the number 42) and win Ether if they are correct. The contract also allows the owner to change the correct number.
    - The contract consists of several components:
        - **State Variables**: 
            - `correctNumber`: The number that players must guess correctly to win.
            - `winner`: The address of the last player who guessed correctly.
            - `prizeAmount`: The amount of Ether a player must send to participate in the game.
            - `owner`: The address that deployed the contract (who can change the correct number).
        - **Functions**:
            - `guess(uint256 _number)`: Allows players to guess the number. If correct, the player wins the prize amount.
            - `changeCorrectNumber(uint256 _newNumber)`: Allows the owner to change the correct number.
        - **Events**:
            - `GuessMade(address indexed player, bool success)`: Emitted when a player makes a guess.

2. **Setting Up the Hardhat Development Environment**:
    - We used **Hardhat**, a popular Ethereum development framework, to compile, deploy, and test the contract. We installed the necessary packages, including `@nomicfoundation/hardhat-toolbox`, to set up the development environment.
    - The `hardhat.config.js` file was configured to use the **Sepolia test network** through Infura. This required adding an Infura API key and a private key for the account we used to deploy the contract.

3. **Deployment Script**:
    - A deployment script (`deploy.js`) was created to deploy the smart contract to the Sepolia testnet. The script:
        - Gets the deployer's account using `ethers.getSigners()`.
        - Deploys the contract using `getContractFactory()` and `deploy()`.
        - Logs the contract address once deployed and waits for the transaction to be mined.
    - We encountered several challenges in ensuring the deployment was successful, including debugging issues related to waiting for the transaction receipt and obtaining the correct contract address after deployment.

4. **Troubleshooting Deployment Issues**:
    - During the deployment process, we faced issues such as the `undefined` contract address and the inability to find the deployment transaction. After extensive debugging, the core issue was identified as the way the contract object was being handled and ensuring that the deployment transaction was correctly awaited.
    - Through various iterations of the deploy script, including adding logs to examine the contract object and ensuring that the `deployTransaction.wait()` was properly invoked, we were able to trace the deployment transaction and successfully deploy the contract to Sepolia.

5. **Verification of Deployment**:
    - After successfully deploying the contract, we used Etherscan to confirm the contract's deployment on the Sepolia testnet. The contract address was logged, and the transaction was visible in the Sepolia explorer.

### Conclusion

In conclusion, we successfully created, deployed, and verified a Solidity-based **Number Guessing Game** smart contract on the **Sepolia testnet** using **Hardhat**. The process involved several stages, from writing the smart contract to configuring the Hardhat environment, and finally deploying the contract with debugging along the way. The deployment was successful, and the contract can now be interacted with on the Sepolia network.

The challenges faced were mainly related to the deployment transaction and ensuring the correct handling of the contract object. Through persistent debugging and testing, the process was completed, allowing the smart contract to function as intended.

