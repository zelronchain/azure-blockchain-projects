# Shadow Public Blockchain Node

This lab will have you create a public node Shadow Blockchain in Azure.<br>

Before starting the tutorial, you will have to "Adding Blockchain Artifact Library to Azure DevTest Labs" first. https://github.com/HyperSpaceChain/azure-blockchain-projects/blob/master/baas-artifacts/README.md <br>

Follow these very simple steps:<br>
1. Locate DevTest labs. You may need to Browse> for it in the Azure portal left hand Nav <br>
![](assets/1.png)<br>
<br>
2. Simply click on the following: (To view a larger image, click and select RAW.)<br>
    2.1. Lab VM Name, Username, Password will do as you wish. <br>
    2.2. VM Size allows you to adjust the performance of the virtual machine. <br>
![](assets/2.png)<br>
<br>
![](assets/3.png)<br>
<br>
3. Time to generate a lab vm is about 15 minutes. <br>
![](assets/4.png)<br>
<br>
4. Copy the IP or DNS address so you can SSH into it <br>
*If you do not have SSH capabilities you can install a tool like Putty http://www.putty.org/ while you are waiting <br>
5. Open a SSH client like PuTTY and paste your node IP or DNS address in to connect. <br>
![](assets/5.png)<br>
<br>
6. Login using your admin account. <br>

7. shadow account command is as follows: : shadowcoind <br>
8. For example we will try to type the following: : shadowcoind getinfo <br>
![](assets/6.png)<br>
<br>
9. To view the command of 'shadowcoind', enter the following: <br>
shadowcoind help <br>
shadowcoind -?

<br>
<br>

This Microsoft Azure template deploys a single Shadow client which will connect to the public Shadow network.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-quickstart-templates%2Fmaster%2Fshadow-on-ubuntu%2Fazuredeploy.json" target="_blank"><img src="http://azuredeploy.net/deploybutton.png"/></a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-quickstart-templates%2Fmaster%2Fshadow-on-ubuntu%2Fazuredeploy.json" target="_blank"><img src="http://armviz.io/visualizebutton.png"/></a>

For more information, <br>
https://shadowproject.io <br>
https://bitcointalk.org/index.php?topic=745352 <br>
# Template Parameters

When you click the Deploy to Azure icon above, you need to specify the following template parameters:

* `adminUsername`: This is the account for connecting to your Shadow host.
* `adminPassword`: This is your password for the host.  Azure requires passwords to have One upper case, one lower case, a special character, and a number.
* `dnsLabelPrefix`: This is used as both the VM name and DNS name of your public IP address.  Please ensure an unique name.
* `installMethod`: This tells Azure how to install the software.  The default is using the Binaries.  You may choose to install from Source, but be advised this method takes substantially longer to complete.
* `vmSize`: This is the size of the VM to use.  Recommendations: Use the A series for Binaries installs, and D series for installations from Source.

# Getting Started Tutorial

* Click the `Deploy to Azure` icon above
* Complete the template parameters, choose your resource group, accept the terms and click Create
* Wait about 15 minutes for the VM to spin up and install the software
* Connect to the VM via SSH using the DNS name assigned to your Public IP
* If you wish to launch Shadow run 'shadowcoind'