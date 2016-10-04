#!/bin/bash

set -e 

date
ps axjf


if [ $1 = 'From_Source' ]; then
#################################################################
# Update Ubuntu and install prerequisites for running Stratis   #
#################################################################
sudo apt-get update
#################################################################
# Build Stratis from source                                     #
#################################################################
NPROC=$(nproc)
echo "nproc: $NPROC"
#################################################################
# Install all necessary packages for building Stratis           #
#################################################################
sudo apt-get -y install git unzip wget build-essential libtool autotools-dev autoconf pkg-config libssl-dev libevent-dev bsdmainutils libboost-all-dev libminiupnpc-dev libzmq3-dev
sudo add-apt-repository -y ppa:bitcoin/bitcoin
sudo apt-get update
sudo apt-get install -y libdb4.8-dev libdb4.8++-dev

cd /usr/local
file=/usr/local/stratisX
if [ ! -e "$file" ]
then
	sudo git clone https://github.com/stratisproject/stratisX.git
fi

cd /usr/local/stratisX/src
file=/usr/local/stratisX/src/stratisd
if [ ! -e "$file" ]
then
	sudo make -f makefile.unix -j $NPROC
fi

sudo cp /usr/local/stratisX/src/stratisd /usr/bin/stratisd

else    

cd /usr/local/src/
DOWNLOADFILE=$(curl -s https://api.github.com/repos/stratisproject/stratisX/releases | grep browser_download_url | grep linux64 | head -n 1 | cut -d '"' -f 4)
DOWNLOADNAME=$(curl -s https://api.github.com/repos/stratisproject/stratisX/releases | grep name | grep linux64 | head -n 1 | cut -d '"' -f 4)
sudo wget $DOWNLOADFILE
sudo unzip $DOWNLOADNAME
sudo cp stratisd /usr/bin/stratisd

fi

################################################################
# Configure to auto start at boot					           #
################################################################
file=$HOME/.stratis 
if [ ! -e "$file" ]
then
	sudo mkdir $HOME/.stratis
fi
printf '%s\n%s\n%s\n%s\n' 'daemon=1' 'server=1' 'rpcuser=u' 'rpcpassword=p' | sudo tee $HOME/.stratis/stratis.conf
file=/etc/init.d/stratis
if [ ! -e "$file" ]
then
	printf '%s\n%s\n' '#!/bin/sh' 'sudo stratisd' | sudo tee /etc/init.d/stratis
	sudo chmod +x /etc/init.d/stratis
	sudo update-rc.d stratis defaults	
fi

/usr/bin/stratisd & exit 0

echo "Stratis Blockchain has been setup successfully and is running... Have Fun ..."
exit 0
