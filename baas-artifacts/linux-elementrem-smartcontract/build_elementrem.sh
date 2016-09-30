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

# Downloads scripts
cd $HOMEDIR
wget https://raw.githubusercontent.com/Azure/azure-blockchain-projects/master/baas-artifacts/linux-elementrem-smartcontract/attach_private.sh
wget https://raw.githubusercontent.com/Azure/azure-blockchain-projects/master/baas-artifacts/linux-elementrem-smartcontract/attach_public.sh
wget https://raw.githubusercontent.com/Azure/azure-blockchain-projects/master/baas-artifacts/linux-elementrem-smartcontract/start_private.sh
wget https://raw.githubusercontent.com/Azure/azure-blockchain-projects/master/baas-artifacts/linux-elementrem-smartcontract/start_public.sh
wget https://raw.githubusercontent.com/Azure/azure-blockchain-projects/master/baas-artifacts/linux-elementrem-smartcontract/private_prerequisites.json
wget https://raw.githubusercontent.com/Azure/azure-blockchain-projects/master/baas-artifacts/linux-elementrem-smartcontract/meteor-wallet-setup.sh

# Initialize
cd $HOMEDIR
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
cd go-elementrem
git checkout Azure
make gele
cd

# gele path to usr/bin/
cd $HOMEDIR
cd go-elementrem/build/bin
sudo cp gele /usr/bin
cd $HOMEDIR
rm -rf go-elementrem

# Install Solidity Programming Language
cd $HOMEDIR
cd 
mkdir solidity
cd solidity
wget https://github.com/elementrem/solidity/releases/download/v0.3.6/linux-ubuntu-xenial-solc-0.3.6-compilier.tar.gz
wget https://github.com/elementrem/solidity/releases/download/v0.3.6/solc-0.3.6-dependency.tar.gz
tar -xvzf ./linux-ubuntu-xenial-solc-0.3.6-compilier.tar.gz
tar -xvzf ./solc-0.3.6-dependency.tar.gz
sudo dpkg -i libboost-program-options1.58.0_1.58.0+dfsg-5ubuntu3_amd64.deb
sudo dpkg -i libjsoncpp1_1.7.2-1_amd64.deb
sudo dpkg -i libboost-system1.58.0_1.58.0+dfsg-5ubuntu3_amd64.deb
sudo dpkg -i libboost-filesystem1.58.0_1.58.0+dfsg-5ubuntu3_amd64.deb
sudo apt-get -y install libboost-filesystem-dev
sudo apt-get -f -y install
sudo dpkg -i libboost-filesystem-dev_1.58.0.1ubuntu1_amd64.deb
sudo dpkg -i solc_0.3.6-0ubuntu1~xenial_amd64.deb
cd ..
rm -rf solidity

# Initialize private_genesis_Block
exdata=`echo "$2" | xxd -plain -c 250`

echo "{
  \"alloc\": {},
  \"nonce\": \"0x0000000000000000\",
  \"difficulty\": \"0x020000\",
  \"mixhash\": \"0x0000000000000000000000000000000000000000000000000000000000000000\",
  \"coinbase\": \"0x0000000000000000000000000000000000000000\",
  \"timestamp\": \"0x00\",
  \"parentHash\": \"0x0000000000000000000000000000000000000000000000000000000000000000\",
  \"extraData\": \"0x$exdata\",
  \"gasLimit\": \"0x2FEFD8\"
}" > private_prerequisites.json

# Initialize private network
cd $HOMEDIR
gele --datadir "$HOMEDIR/.private_elementrem" init private_prerequisites.json
echo "Elementrem CLI gele"