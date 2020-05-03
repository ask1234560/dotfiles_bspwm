#!/bin/bash


if [ "$#" -ne 0 ]; then

targetDir="/home/ananthu/Pictures/.wallpaper"
bgfile="$( ls -A $targetDir | shuf -n 1 )"
hsetroot -fill $targetDir/$bgfile  -tint '#9ccfe6'

else 

find ~/Pictures/Wallpapers ~/Pictures/.wallpaper -type f | shuf | sxiv - -ftbo 2> /dev/null | shuf -n 1 | xargs -i  hsetroot -fill {}  -tint '#9ccfe6'

fi

