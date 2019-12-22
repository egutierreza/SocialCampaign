
The Youtube View dApp

The idea was to create a platform for content creators and advertisers or marketing
specialist to enter into agreements with each other without the need for a third 
party.

Simply put, a content creator deploys a contract with a specific video id, and a 
view target and deadline, with an attached bounty.  Marketers can choose take the
contract and if the contract video reaches the target views by the deadline, the
bounty held in escrow by the contract is released to the marketer, otherwise it is
returned to the user.


********************************************************************************
 
1. Installation and Setup

********************************************************************************
First its necessary to install the dependencies
install nodejs, and npm, instructions can be found here

https://nodejs.org/en/download/package-manager/

Next install the truffle library using npm

$ npm install -g truffle

To run the application we will need a locally running blockchain
for this we will install Ganache, instructions can be found here:

https://www.trufflesuite.com/ganache

Once installed run the application
Create a new workspace
Select add project
Navigate to and select truffle-config.js in the root directory.

Note that Ganache has created 10 addresses, each with 100 Ether

In order to interact with the smart contract we need browesr add on
here we will use MetaMask.

https://metamask.io/

MetaMask will prompt for login information, instead, choose:

"restore account using seed phrase"

The add on includes a drop down menu that allows us to choose
which blockchain we're using.  Including test networks and the 
main ethereum network.  Since we are using a local blockchain
we will choose "custom rpc" 

For the url we will use the following url:

HTTP://127.0.0.1:7545

The account balance should reflect the first wallet address balance
from ganache, and it allows us to choose between the all 10
addresses in the locally running blockchain

*******************************************************************************

2. Compiling and Deploying the Contract

*******************************************************************************
At the root of the directory compile the contract, '$' meaning a command
in the shell.

$ truffle compile

Then deploy the compiled bytecode to the blockchain, still at the
root directory of the project folder:

$ truffle migrate

Notice that ganache used the first address to deploy the contract.
Ganache should show the first address as having spend ~0.02 Ether
to deploy the contract.

*******************************************************************************

3. Interacting with the Smart Contract

*******************************************************************************

Now launch the local web server to display contract data:

$ npm run dev

This will run the client side application, navigate to the local
url that appears on the terminal, it should be localhost:3000

This will show us some information about our deployed contract
   
   Contract Address - The deployed contracts location
   Video id - in this case for a cal poly stream of the future dining center
   Target Views - the contract necessary views.
   Current Views - The views our "oracle" has read from the Youtube API

In the lower left hand side we can se the current user address

Navigating back to the root directory, we can view the contract creation
by moving to the "migrations folder"

Next we can open "2_deploy_contracts.js"

Notice that the values here match the values in the webview.
We can change the values here, save and return to the root directory.

Next we remove the build folder in the project directory.

Re run the following commands

$ truffle compile
$ truffle migrate

We should notice that the new contract has been deployed as shown in Ganache
where the first wallet address should have paid the gas cost.

Next we can view the outcome in the webview by rerunning the local server
if it has been exited.

$ npm run dev

The changes should be reflected in the web view.

*****************************************************************************

Further Reading

*****************************************************************************

Truffle Documentation | Node Ethereum Web Framework
https://www.trufflesuite.com/docs/truffle/overview

Web3 Documentation | Javascript Ethereum Library
https://web3js.readthedocs.io/en/v1.2.0/web3-eth.html

Solidity Documenation | Smart Contract Programming Language
https://solidity.readthedocs.io/en/v0.5.3/contracts.html

Ethereum Project | Ethereum Blockchain Information
https://ethereum.org/


*****************************************************************************
Unfortnately the complete functionality has not been implemented
TODO:
   - Bind the button on the contract view to verify the contract
   - Replace the single campaign contract with a campaign contract
     creator that can store and create multiple instances of the
     campaign contract.
   - Update the oracle to a more secure oracle service.
   - Implement the reliability features outlined in the report
   - Updat UI
   - Implement deadline feature to call the oracle when specified
     by contract creator.
   - Add a function for users to create contracts from website

