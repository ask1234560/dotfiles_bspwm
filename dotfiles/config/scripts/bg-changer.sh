#!/bin/bash


if [ "$#" -ne 0 ]; then

    # check if default wallpaper set in ~/.cache
    # [ -f "$HOME/.cache/default_wall" ] && hsetroot -fill ~/.cache/default_wall -tint '#9ccfe6' && exit 0
    [ -f "$HOME/.cache/default_wall" ] && hsetroot -fill ~/.cache/default_wall && exit 0

    # else choose a random wallpaper
    # targetDir="/home/ananthu/Pictures/wallpapers/szorenfein"
    # bgfile="$( ls -A $targetDir | shuf -n 1 )"
    find ~/Pictures/wallpapers -not -path "*.git*" -type f | shuf -n 1 | xargs -ri sh -c "echo '{}' | grep -qE jpg\|jpeg\|png && hsetroot -fill '{}'"
    # hsetroot -fill $targetDir/$bgfile  -tint '#9ccfe6'

else 

    bspc rule -a Sxiv desktop=\^5 follow=on --one-shot
    # find ~/Pictures/wallpapers -not -path "*.git*" -type f | shuf | sxiv - -ftbo 2> /dev/null | shuf -n 1 | xargs -ri sh -c "echo '{}' | grep -qE jpg\|jpeg\|png && hsetroot -fill '{}' -tint '#9ccfe6'"
    find ~/Pictures/wallpapers -not -path "*.git*" -type f | shuf | sxiv - -ftbo 2> /dev/null | shuf -n 1 | xargs -ri sh -c "echo '{}' | grep -qE jpg\|jpeg\|png && hsetroot -fill '{}'"
    bspc desktop -f last
 
fi
