## Deploying GAPCOIN on Microsoft Azure ##

This Microsoft Azure template deploys GAPCOIN to use a CryptoCurrency.

Once your deployment is complete you will have a Gapcoin cryptocurrency node that operate in the Azure VM.<br>
Azure VM is independent from the system. It also provides a very strong security and reliability, durability.<br>

***By using Azure, you can have a complete system that can be used only cryptocurrency node.***

----------


# What is Gapcoin?
![Gapcoin](https://raw.githubusercontent.com/Azure/azure-blockchain-projects/master/baas-artifacts/linux-gapcoin/images/gap-logo.png)
Gapcoin is a new prime number based p2p cryptocurrency, which tries to eliminate the sticking points of other scientific currencies like Primecoin or Riecoin. 
It's a fork of Satoshi Nakamotos Bitcoin, a decentralized payment system which is independent of banks, governments and other centralized regulators. 
With Gapcoin, you will be able to anonymously send money around the globe in no time.
The big improvement in comparison to Bitcoin is that instead of burning electricity for its own sake, Gapcoins Proof of Work function actually does useful work by searching for large prime gaps.
# Template Parameters
Gapcoin does not need a parameter in the Azure DevTest labs.<br>
It must be the same Username and Admin User Account from the Artifact.

# Gapcoin Walkthrough
Before starting the Walkthrough, you will have to "Adding Blockchain Artifact Library to Azure DevTest Labs" first.<br>
https://github.com/Azure/azure-blockchain-projects/blob/master/baas-artifacts/README.md

If an error occurs when you run the `gapcoind` command, Just replace the `sudo gapcoind` instead of `gapcoind`

1. Get your node's IP
 1. Browse to https://portal.azure.com
 2. Then click the left menu bar Virtual Machines.
 3. Then expand your VM, and public ip address of your node.

2. Connect to your node (If you do not have SSH capabilities you can install a tool like Putty http://www.putty.org/ )
 1. SSH to the public ip of your node as the user you specified for `adminUsername`
 2. Enter your `adminPassword`

3. Wait until the update to the last processed block.
 1. Run the command `gapcoind getinfo` to check the block height which is currently being updated. : `blocks` <br>
     (It may take a few minutes to sync with the existing nodes. If you can not connect to a server message is displayed, try again in a few minutes.)
 2. Here you can see the last processed block height. : http://gap.coinia.net/gap/blockexplorer.php
 3. Wait until your block height up to date.

4. Check the configuration file. **It has already set up in the template. So, you can skip this part.**
 1. Before changing the setting, first stop the server `gapcoind stop`
 2. Run the command `gapcoind -?` to check The various commands for configuration.
 3. Run the command `nano ~/.gapcoin/gapcoin.conf` to check the your configuration. You can exit with `Ctrl + X`

# How to use Gapcoin Wallet
Gap Coin Wallets of useful commands are the following:<br>
 * `gapcoind getnewaddress` Create a new Wallets address.<br>
 * `gapcoind listreceivedbyaddress 0 true` You can check the Wallets address.<br>
 * `gapcoind sendtoaddress gapcoinaddress amount` Transfer the gap coin to that address.<br>
   For example if you enter the `gapcoin sendtoaddress GL2d2 200` 200 gapcoin will send to the address of GL2d2.<br>
 * `gapcoind dumpprivkey "gapcoinaddress"` Returns the private key corresponding to an address. (**Does not remove it from the wallet.**)<br>
 * `gapcoind listtransactions` Returns the most recent transactions that affect the wallet.<br>
 * `gapcoind getbalance` Gets the balance in decimal Gapcoins across all accounts or for a particular account.<br>
 * `gapcoind help` You can see more commands.

For more information, as well as an immediately useable.<br>
http://www.gapcoin.org/

# Gapcoin Specifications
 *PoW: custom, prime gaps<br>
 *Block target time 2.5 minutes<br>
 *Block reward proportional to the current difficulty<br>
 *Block reward halving every 420000 (about 2 years)<br>
 *Cap: about 10 - 30 million GAP<br>
 *Difficulty adjusts every block and increases logarithmically (it will probably take years to get to 50)<br>

# Licensing
Gapcoin is released under the terms of the MIT license. For more information http://opensource.org/licenses/MIT