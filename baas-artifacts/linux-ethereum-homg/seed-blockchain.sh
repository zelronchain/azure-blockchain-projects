#!/bin/bash
geth  --rpc --rpcport "8080" --rpccorsdomain "*"  --port "2402" --ipcapi "admin,db,eth,debug,miner,net,shh,txpool,personal,web3" --rpcapi "db,eth,net,web3" --networkid 1001201 --datadir "chains/devtest" init lab-seed.json

geth --datadir chains/devtest

