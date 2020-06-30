#!/bin/bash

if [ "$#" -eq 0 ]; then

    rankmirrors /etc/pacman.d/mirrorlist.bak | sudo tee /etc/pacman.d/mirrorlist 

else

    rankmirrors -n $1 /etc/pacman.d/mirrorlist.bak | sudo tee /etc/pacman.d/mirrorlist 

fi
