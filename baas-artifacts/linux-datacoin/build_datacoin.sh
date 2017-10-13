#!/bin/bash

set -x

clear
#################################################################
echo "This script will setup a Datacoin node."
#################################################################

#################################################################
echo "Performing a general system update..."
sudo apt-get update
#################################################################

#################################################################
echo "Installing dependencies"
sudo apt-get install -y build-essential m4 libssl-dev libdb++-dev libboost-all-dev libminiupnpc-dev git
#################################################################
echo "Updating GMP..."
cd
rm -rf gmp-5.1.3.tar.bz2 gmp-5.1.3
wget http://mirrors.kernel.org/gnu/gmp/gmp-5.1.3.tar.bz2


tar xjvf gmp-5.1.3.tar.bz2
cd gmp-5.1.3
./configure --enable-cxx
make
sudo make install


cd
sudo dd if=/dev/zero of=/swapfile bs=64M count=16
sudo mkswap /swapfile
sudo swapon /swapfile



echo "Installing Datacoin"...
cd
git clone https://github.com/foo1inge/datacoin-hp
cd datacoin-hp/src
make -f makefile.unix
sudo cp -f datacoind /usr/local/bin/

echo "creating config file..."
cd
mkdir -p .datacoin
echo 'server=1
gen=1
rpcallowip=127.0.0.1
addnode=148.251.2.141
addnode=144.76.64.49
addnode=95.188.90.31
addnode=139.59.84.79
addnode=169.1.159.87
addnode=143.159.57.97
addnode=13.92.139.20
addnode=82.36.172.103
addnode=76.16.12.81
addnode=169.0.115.16
addnode=105.233.47.142
addnode=95.22.70.212
rpcuser=DatacoinUser
rpcpassword=[PASSWORD_CHANGE_ME]' > .datacoin/datacoin.conf

echo "Starting ..."
datacoind --daemon
echo "All done!"
exit 0











