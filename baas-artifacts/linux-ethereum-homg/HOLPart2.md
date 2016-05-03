***Azure DevTest Lab Overview – Ethereum Homestead (1.4) Getting Started Part-2***

This lab will have you create your first SmartContract application.Lab – Step by Step Participants in this lab will do the following:

- Install Meteor to build your application- Write and Test your SmartContract- Perform transactions with your SmartContract**Lab – Dependencies**
This lab requires that certain ports be open on the Ethereum node accessible outside the private vnet in Azure.  To do this create a Network Security Group similar to this one that has ports: 3000 and 8080 open and apply it to the network interface the node is operating on.  In most cases this will be done for you ahead of time.

![AzureNetworkSecurityGroup](https://raw.githubusercontent.com/Azure/azure-blockchain-projects/master/baas-artifacts/linux-ethereum-homg/assets/netsecuritygroup.png)

![AzureNetworkSecurityGroup](https://raw.githubusercontent.com/Azure/azure-blockchain-projects/master/baas-artifacts/linux-ethereum-homg/assets/applytonic.png)