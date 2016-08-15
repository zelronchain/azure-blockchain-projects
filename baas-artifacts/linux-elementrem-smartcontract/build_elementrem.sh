#!/bin/bash

# print commands and arguments as they are executed
set -x

echo "initializing Elementrem installation"
date
ps axjf

# Parameters

AZUREUSER=$1
HOMEDIR="/home/$AZUREUSER"
VMNAME=`hostname`
echo "User: $AZUREUSER"
echo "User home dir: $HOMEDIR"
echo "vmname: $VMNAME"

# Initialize
cd $HOME
sudo apt -y update
sudo apt -y upgrade
sudo apt-get install -y git curl wget


# Install go-lang
sudo apt-get install -y build-essential libgmp3-dev golang git curl
curl -O https://storage.googleapis.com/golang/go1.6.2.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.6.2.linux-amd64.tar.gz
mkdir -p ~/go; echo "export GOPATH=$HOME/go" >> ~/.bashrc
echo "export PATH=$PATH:$HOME/go/bin:/usr/local/go/bin" >> ~/.bashrc
source ~/.bashrc
rm go1.6.2.linux-amd64.tar.gz

# Downloads git source 
git clone https://github.com/elementrem/go-elementrem/

# Build elementrem
cd  go-elementrem
make gele
cd 

# gele path to usr/bin/
cd go-elementrem/build/bin
sudo cp gele /usr/bin

# Install Solidity Programming Language
cd 
mkdir solidity
cd solidity
wget https://github.com/elementrem/solidity/releases/download/v0.3.6/linux-ubuntu-xenial-solc-0.3.6-compilier.tar.gz
tar -xvzf ./linux-ubuntu-xenial-solc-0.3.6-compilier.tar.gz
sudo dpkg -i libboost-program-options1.58.0_1.58.0+dfsg-5ubuntu3_amd64.deb
sudo dpkg -i libjsoncpp1_1.7.2-1_amd64.deb
sudo dpkg -i solc_0.3.6-0ubuntu1~xenial_amd64.deb
cd ..
rm -rf solidity

# Downloads scripts
cd $HOME
wget https://raw.githubusercontent.com/elementrem/azure-blockchain-projects/master/baas-artifacts/linux-elementrem-smartcontract/attach_private.sh
wget https://raw.githubusercontent.com/elementrem/azure-blockchain-projects/master/baas-artifacts/linux-elementrem-smartcontract/attach_public.sh
wget https://raw.githubusercontent.com/elementrem/azure-blockchain-projects/master/baas-artifacts/linux-elementrem-smartcontract/start_private.sh
wget https://raw.githubusercontent.com/elementrem/azure-blockchain-projects/master/baas-artifacts/linux-elementrem-smartcontract/start_public.sh
wget https://raw.githubusercontent.com/elementrem/azure-blockchain-projects/master/baas-artifacts/linux-elementrem-smartcontract/private_prerequisites.json