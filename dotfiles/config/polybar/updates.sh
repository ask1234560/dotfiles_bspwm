#!/bin/bash

# echo
# echo 'updates.sh: "pacman -Syu"'
# echo
# sudo pacman -Syu

echo
echo 'updates.sh: "yay -Syu"'
echo
read -p "Press A for aur... " stat

if [ "$stat" == "A" ]
then
		yay -Syu
else
		yay -Syu --repo
fi

echo
read -p "Press enter to close this window..."
