***Azure DevTest Lab Overview – Ethereum Homestead (1.4) Getting Started Part-2***

This lab will have you create your first SmartContract application.

Lab – Step by Step 
Participants in this lab will do the following:

- Install Meteor to build your application
- Write and Test your SmartContract
- Perform transactions with your SmartContract

**Lab – Dependencies**

This lab requires that certain ports be open on the Ethereum node accessible outside the private vnet in Azure.  To do this create a Network Security Group similar to this one that has ports: 3000 and 8080 open and apply it to the network interface the node is operating on.  In most cases this will be done for you ahead of time.

![AzureNetworkSecurityGroup](https://raw.githubusercontent.com/Azure/azure-blockchain-projects/master/baas-artifacts/linux-ethereum-homg/assets/netsecuritygroup.png)

![AzureNetworkSecurityGroup](https://raw.githubusercontent.com/Azure/azure-blockchain-projects/master/baas-artifacts/linux-ethereum-homg/assets/applytonic.png)

## Your first SmartContracts ##
Install Meteor and our Sample Template Dapps
```
$ curl https://install.meteor.com/ | sh

$ sudo apt-get install git

$ git clone http://github.com/SilentCicero/meteor-dapp-cosmo.git

```
Stop your Geth Miner and restart it with these options and unlock the miner account:
```
$ geth –rpc –rpcaddr “0.0.0.0" --rpcport "8080" --rpccorsdomain "*" --datadir "chains/devtest" --port "2402" --ipcapi "admin,db,eth,debug,miner,net,shh,txpool,personal,web3" --rpcapi "db,eth,net,web3" --networkid 1001201 –unlock=primary console
>personal.unlockAccount(eth.coinbase)
>miner.start(1)
```
Start Cosmo (Dapp tool) using Meteor
```
$ cd meteor-dapp-cosmo/app’
$ meteor 
```
Go to the Cosmo Dashboard and deploy the Coin SmartContract.  First you will need to get your DNS host address from the Azure portal:

![IPAddressMeteor](https://raw.githubusercontent.com/Azure/azure-blockchain-projects/master/baas-artifacts/linux-ethereum-homg/assets/ipmeteor.png)

Then open up a browser and go to your URL: the above would be 

http://test123.eastus.cloudapp.azure.com:3000

Next set your RPC Provider in the browser to the Web3 API on your node:

![IPAddressMeteor](https://raw.githubusercontent.com/Azure/azure-blockchain-projects/master/baas-artifacts/linux-ethereum-homg/assets/rpcprovider.png)

Select the Coin Tab on the Left Hand Side of the browser client:


![IPAddressMeteor](https://raw.githubusercontent.com/Azure/azure-blockchain-projects/master/baas-artifacts/linux-ethereum-homg/assets/coin.png)

Select Deploy

![IPAddressMeteor](https://raw.githubusercontent.com/Azure/azure-blockchain-projects/master/baas-artifacts/linux-ethereum-homg/assets/coindeploy.png)

Once the Coin is deployed go to your Geth terminal and create a new account to transact with:

``> personal.newAccount()``

Now to Mint some of your CryptoCurrency which back to the browser and select the Mint method:

Make sure the from address is the unlocked miner address (eth.coinbase) and to deposit it to that same address.  Select Call and Transact to place the transaction on the blockchain.
Now check your balance, by using the queryBalance method:

![IPAddressMeteor](https://raw.githubusercontent.com/Azure/azure-blockchain-projects/master/baas-artifacts/linux-ethereum-homg/assets/balance.png)

Note you now have 5 Coin.  Now select the send() method to send some coin to the other address on the blockchain.  

![IPAddressMeteor](https://raw.githubusercontent.com/Azure/azure-blockchain-projects/master/baas-artifacts/linux-ethereum-homg/assets/send.png)

Select Call and Transact.  Now re-check your balance…you should have 3 Coin now:

![IPAddressMeteor](https://raw.githubusercontent.com/Azure/azure-blockchain-projects/master/baas-artifacts/linux-ethereum-homg/assets/recheck.png)

**Complete!**

You have now successfully completed your first SmartContract on Ethereum.