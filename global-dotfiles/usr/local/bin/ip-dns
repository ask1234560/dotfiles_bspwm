#!/bin/bash


RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'

echo -e "${BLUE}ip ${RED}==>"
echo -e "${GREEN}$(curl --no-progress-meter ipinfo.io)\n"

echo -e "${BLUE}dns ${RED}==>"
echo -e "${GREEN}$(ping whoami.akamai.net -c 1 | awk  -F " " '{ split($5,arr,"[()]"); if(NR == 2) print $4 " => " arr[2]}')\n"

echo -e "${BLUE}resolv.conf ${RED}==>"
echo -e "${GREEN}$(cat /etc/resolv.conf)\n"
