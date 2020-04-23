#!/bin/bash

white='\033[1;37m'
red='\033[1;31m'
nc='\033[0m'
#echo -e "${white}Starting ${red}update${nc}"
#apt update
echo -e "${white}Starting ${red}update & upgrade${nc}"
pacman -Syyu
echo -e "${white}Finished ${red}upgrade"
opt="n"
echo -e "${white}Press y to ${red}reboot "
read -t 60 opt
if [ "$opt" = "y" ] ; then
echo -e "${white}Going to ${red}reboot!!!"
reboot
else
echo -e "${white}Not ${red}rebooting"
fi
