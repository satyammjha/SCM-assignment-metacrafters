
# **dNotes Smart Contract**

## **Overview**
`dNotes` is a simple decentralized notes application built using Solidity. The smart contract enables users to increment a counter and manage a list of messages stored on the Ethereum blockchain. This repository contains the Solidity contract, its deployment, and an HTML frontend that interacts with the contract via Web3.



## **Features**

- Increment a counter by 1 or a specified amount.
- Store, retrieve, and remove messages on the blockchain.
- Emit events to log key actions.
  


## **Smart Contract Details**

The `dNotes` smart contract consists of two main functionalities:
- **Counter Management**: Tracks and updates a counter value.
- **Message Management**: Allows users to add, retrieve, and remove messages on the blockchain.

### **Contract Functions**
- `incrementCounter()`: Increases the counter by 1.
- `incrementCounterBy(uint256 _amount)`: Increases the counter by a specified amount.
- `getCounter()`: Returns the current counter value.
- `addMessage(string memory _message)`: Adds a new message to the contract.
- `getMessages()`: Retrieves all messages stored in the contract.
- `removeMessage(uint256 index)`: Removes a message by index.





## **Prerequisites**

To run this project, you'll need:

- **MetaMask**: A browser extension wallet to interact with Ethereum blockchain.
- **Node.js** and **npm** (if using scripts for contract deployment or interaction).
- **Web3.js** or **Ethers.js** for integrating the contract with the HTML frontend.



## **Deployment Instructions**

### 1. **Clone the Repository**

```bash
git clone https://github.com/satyammjha/dNotes
cd SCM-assignment-metacrafters
```

### 2. **Compile the Smart Contract**

If you're using **Remix IDE**:
- Open [Remix](https://remix.ethereum.org/).
- Paste the contract code below into a new file in Remix IDE.
- Compile the contract by selecting the appropriate Solidity version.

### **Smart Contract Code**

Copy and paste the following code into Remix IDE:

```solidity
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
```

### 3. **Deploy the Contract**

For **Remix**:
- Go to the **Deploy & Run Transactions** tab.
- Deploy the contract on an Ethereum test network like Rinkeby or Goerli using MetaMask.

For **Hardhat** or **Truffle**:
- Run the following command to deploy the contract (if using a deployment script):
```bash
npx hardhat run scripts/deploy.js --network rinkeby
```

### 4. **Get Contract Address**
After the contract is deployed, take note of the **contract address**. You'll need this to interact with the contract in the frontend.



## **Interacting with the Smart Contract**

### **Frontend (HTML + Web3 Integration)**

You can interact with the smart contract using the `index.html` file located in the `/frontend` folder. The frontend connects to the smart contract using the **contract address** and **ABI** (Application Binary Interface).

### **Adding Contract ABI and Address in HTML**

To connect the contract in your frontend:

1. **Find the Contract ABI**:
   - In Remix, after compiling the contract, go to the **Compiled Contracts** tab and scroll down to **ABI**.
   - Copy the entire ABI.

2. **Insert ABI and Contract Address in the HTML File**:
   - Open the `index.html` file and find the section where the contract is initialized.
   - Replace `YOUR_CONTRACT_ABI` with the ABI you copied and `YOUR_CONTRACT_ADDRESS` with the contract address from the deployment step.

```javascript
// Web3.js initialization in index.html

const contractABI = YOUR_CONTRACT_ABI;
const contractAddress = "YOUR_CONTRACT_ADDRESS";

const dNotesContract = new web3.eth.Contract(contractABI, contractAddress);
```

3. **Serve the HTML File**:
   You can open the `index.html` directly in your browser, or run a local server using a tool like `Live Server` in VS Code.



## **How to Use**

1. **Increment the Counter**:
   - The frontend has a button that allows you to increment the counter by 1 or by a specified amount.

2. **Add a Message**:
   - Use the input field to add a message to the blockchain. The message will be stored in the contract and retrieved in future requests.

3. **View Messages**:
   - Click the "Show Messages" button to display all messages stored in the contract.

4. **Remove a Message**:
   - Remove a message by specifying its index in the array.



## **Dependencies**

### For the Smart Contract:
- Solidity `^0.8.0`.

### For the Frontend:
- [Web3.js](https://web3js.readthedocs.io/): A JavaScript library to interact with the Ethereum blockchain.



## **License**

This project is licensed under the MIT License. See the `LICENSE` file for more details.



## **Contact**

For any queries or issues, please contact [satyammjha0@gmail.com](mailto:satyammjha0@gmail.com).