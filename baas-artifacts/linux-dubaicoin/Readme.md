# Dubaicoin Blockchain Node on Ubuntu VM

This template delivers the Dubaicoin network to your VM in about 15 minutes (PPA install).  Everything you need to get started using the Dubaicoin blockchain from the command line is included. 
You may select to build from source or install from the community provided Personal Package Archive (PPA).Once installed, 'dubaicoind' will begin syncing the public blockchain. 
You may then connect via SSH to the VM and launch 'dubaicoind' to interface with the dubaicoin blockchain.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-quickstart-templates%2Fmaster%2Fdubaicoin-on-ubuntu%2Fazuredeploy.json" target="_blank"><img src="http://azuredeploy.net/deploybutton.png"/></a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-quickstart-templates%2Fmaster%2Fdubaicoin-on-ubuntu%2Fazuredeploy.json" target="_blank"><img src="http://armviz.io/visualizebutton.png"/></a>

# What is Dubaicoin?

A new and exciting Open Source currency that will revolutionize Gold/Diamond purchases based on fair-play rules.

Dubaicoin using secure POS algorithm.

DubaiCoin - DBIC<br />

Ticker: DBIC<br />
Algorithm: SHA-256<br />
Supply: 10 500 000<br />
Premine: 1%<br />
Pos: 10% pa<br />
Number Of Blocks: 280 000<br />
60 Seconds Per Block<br />
10 Blocks to Confirm<br />
Min. Staking Age: 1 hour<br />

Block Rewards:<br />

1: ~ 1% Premine<br />
2-100: 0 (instamine protection)<br />
101-40,000: 100 (~ 1 month)<br />
40,001-80,000: 50 (~ 1 month)<br />
80,001-120,000: 25  (~ 1 month)<br />
120,001-160,000: 12.5  (~ 1 month)<br />
160,001-200,000: 6.25 (~ 1 month)<br />
200,001-240,000: 3.125 (~ 1 month)<br />
240,001-280,000: 1.5625 (~ 1 month)<br />

For more information, as well as an immediately useable, binary version of
the Dubaicoin client sofware, see https://dubaicoin.org/.


# Template Parameters

When you click the Deploy to Azure icon above, you need to specify the following template parameters:

* `adminUsername`: This is the account for connecting to your Dubaicoin host.
* `adminPassword`: This is your password for the host.  Azure requires passwords to have One upper case, one lower case, a special character, and a number.
* `dnsLabelPrefix`: This is used as both the VM name and DNS name of your public IP address.  Please ensure an unique name.
* `installMethod`: This tells Azure how to install the software.  The default is using the community provided PPA.  You may choose to install from source, but be advised this method takes substantially longer to complete.
* `vmSize`: This is the size of the VM to use.  Recommendations: Use the A series for PPA installs, and D series for installations from source.

# Getting Started Tutorial

* Click the `Deploy to Azure` icon above
* Complete the template parameters, choose your resource group, accept the terms and click Create
* Wait about 15 minutes for the VM to spin up and install the software
* Connect to the VM via SSH using the DNS name assigned to your Public IP
* If you wish to relaunch dubaicoind `sudo dubaicoind`
* dubaicoin will run automatically on restart

# Licensing

Dubaicoin is released under the terms of the MIT license. See `COPYING` for more information or see http://opensource.org/licenses/MIT.
