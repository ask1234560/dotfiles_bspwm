#!/bin/bash


if [ "$#" -ne 0 ]; then

    # check if default wallpaper set in ~/.cache
    [ -f "$HOME/.cache/default_wall" ] && hsetroot -fill ~/.cache/default_wall -tint '#9ccfe6' && exit 1

    # else choose a random wallpaper
    targetDir="/home/ananthu/Pictures/wallpapers/szorenfein"
    bgfile="$( ls -A $targetDir | shuf -n 1 )"
    hsetroot -fill $targetDir/$bgfile  -tint '#9ccfe6'

else 

    find ~/Pictures/wallpapers -type f | shuf | sxiv - -ftbo 2> /dev/null | shuf -n 1 | xargs -ri sh -c "echo '{}' | grep -qE jpg\|jpeg\|png && hsetroot -fill '{}' -tint '#9ccfe6'"
 
fi

