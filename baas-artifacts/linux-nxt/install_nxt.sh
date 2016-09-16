#!/bin/bash

echo Configuration parameters: $1 $2 >> /var/log/nxt_deployment.stdout

apt-add-repository -y ppa:nxtcrypto/nxt >> /var/log/nxt_deployment.stdout 2>> /var/log/nxt_deployment.stderr
apt-get -y update >> /var/log/nxt_deployment.stdout 2>> /var/log/nxt_deployment.stderr
apt-get -y dist-upgrade >> /var/log/nxt_deployment.stdout 2>> /var/log/nxt_deployment.stderr
apt-get -y install nxt unattended-upgrades >> /var/log/nxt_deployment.stdout 2>> /var/log/nxt_deployment.stderr

if [ $1 == "false" ]
then
    echo "nxt.apiServerHost=0.0.0.0" >> /etc/nxt/nxt.properties
    echo "nxt.allowedBotHosts=*" >> /etc/nxt/nxt.properties
fi

if [ $2 == "true" ]
then
    echo "nxt.isTestnet=true" >> /etc/nxt/nxt.properties
else
    apt-get -y install nxt-bootstrap-blockchain >> /var/log/nxt_deployment.stdout 2>> /var/log/nxt_deployment.stderr
fi

systemctl restart nxt >> /var/log/nxt_deployment.stdout 2>> /var/log/nxt_deployment.stderr
exit 0

