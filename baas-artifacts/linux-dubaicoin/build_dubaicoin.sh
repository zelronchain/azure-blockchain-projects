#!/bin/bash

set -e 

date
ps axjf


if [ $1 = 'From_Source' ]; then
#################################################################
# Update Ubuntu and install prerequisites for running DubaiCoin   #
#################################################################
sudo apt-get update
#################################################################
# Build DubaiCoin from source                                     #
#################################################################
NPROC=$(nproc)
echo "nproc: $NPROC"
#################################################################
# Install all necessary packages for building DubaiCoin           #
#################################################################
sudo apt-get -y install git unzip wget build-essential libtool autotools-dev autoconf pkg-config libssl-dev libevent-dev bsdmainutils libboost-all-dev libminiupnpc-dev libzmq3-dev
sudo add-apt-repository -y ppa:bitcoin/bitcoin
sudo apt-get update
sudo apt-get install -y libdb4.8-dev libdb4.8++-dev

cd /usr/local
file=/usr/local/DubaiCoin
if [ ! -e "$file" ]
then
	sudo git clone https://github.com/DubaiCoinDev/DubaiCoin.git
fi

cd /usr/local/DubaiCoin
file=/usr/local/DubaiCoin/src/DubaiCoind
if [ ! -e "$file" ]
then
	sudo make -f makefile.unix -j $NPROC
fi

sudo cp /usr/local/DubaiCoin/src/DubaiCoind /usr/bin/DubaiCoind

else    
#################################################################
# Install DubaiCoin from PPA                                  #
#################################################################
#sudo add-apt-repository -y ppa:DubaiCoin/DubaiCoin
#sudo apt-get update
#sudo apt-get install -y DubaiCoin
cd /usr/local/src/
DOWNLOADFILE=$(curl -s https://api.github.com/repos/DubaiCoinDev/DubaiCoin/releases | grep browser_download_url | grep linux64 | head -n 1 | cut -d '"' -f 4)
DOWNLOADNAME=$(curl -s https://api.github.com/repos/DubaiCoinDev/DubaiCoin/releases | grep name | grep linux64 | head -n 1 | cut -d '"' -f 4)
sudo wget $DOWNLOADFILE
sudo unzip $DOWNLOADNAME
sudo cp DubaiCoind /usr/bin/DubaiCoind

fi

################################################################
# Configure to auto start at boot					    #
################################################################
file=$HOME/.DubaiCoin 
if [ ! -e "$file" ]
then
	sudo mkdir $HOME/.DubaiCoin
fi
printf '%s\n%s\n%s\n%s\n' 'daemon=1' 'server=1' 'rpcuser=u' 'rpcpassword=p' | sudo tee $HOME/.DubaiCoin/DubaiCoin.conf
file=/etc/init.d/DubaiCoin
if [ ! -e "$file" ]
then
	printf '%s\n%s\n' '#!/bin/sh' 'sudo DubaiCoind' | sudo tee /etc/init.d/DubaiCoin
	sudo chmod +x /etc/init.d/DubaiCoin
	sudo update-rc.d DubaiCoin defaults	
fi

/usr/bin/DubaiCoind & exit 0

echo "DubaiCoin Blockchain has been setup successfully and is running... Have Fun ..."
exit 0
