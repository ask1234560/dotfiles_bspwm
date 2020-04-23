#!/bin/bash

# hsetroot -fill Arch-Linux-Wallpaper-04-1920x1080.jpg -tint '#9ccfe6' -write Arch-Linux-Wallpaper-04-1920x1080.jpg

if [ "$#" -ne 0 ]; then

targetDir="/home/ananthu/Pictures/.wallpaper"
bgfile="$( ls -A $targetDir | shuf -n 1 )"
# nitrogen --save --set-zoom-fill "$targetDir/$bgfile" 
hsetroot -fill $targetDir/$bgfile  -tint '#9ccfe6'


else 

find ~/Pictures/Wallpapers ~/Pictures/.wallpaper -type f | shuf | sxiv - -ftbo 2> /dev/null | shuf -n 1 | xargs -i  hsetroot -fill {}  -tint '#9ccfe6'

fi

