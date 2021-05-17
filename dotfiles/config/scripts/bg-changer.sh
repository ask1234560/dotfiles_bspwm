#!/bin/bash


if [ "$#" -ne 0 ]; then

    # check if default wallpaper set in $XDG_CACHE_HOME
    # [ -f "$XDG_CACHE_HOME/default_wall" ] && hsetroot -fill "$XDG_CACHE_HOME/default_wall" -tint '#9ccfe6' && exit 0
    [ -f "$XDG_CACHE_HOME/default_wall" ] && hsetroot -fill "$XDG_CACHE_HOME/default_wall" && exit 0

    # else choose a random wallpaper
    # targetDir="$HOME/Pictures/wallpapers/szorenfein"
    # bgfile="$( ls -A $targetDir | shuf -n 1 )"
    # find "$HOME"/Pictures/wallpapers -not -path "*.git*" -type f | shuf -n 1 | xargs -ri sh -c "echo '{}' | grep -qE jpg\|jpeg\|png && hsetroot -fill '{}'"
    find "$HOME"/Pictures/wallpapers -path "*.git*" -prune -o \( -type f \) | shuf -n 1 | xargs -ri sh -c "echo '{}' | grep -qE jpg\|jpeg\|png && hsetroot -fill '{}'"
    # hsetroot -fill $targetDir/$bgfile  -tint '#9ccfe6'

else

    bspc rule -a Sxiv desktop=\^5 follow=on --one-shot
    # find "$HOME"/Pictures/wallpapers -not -path "*.git*" -type f | shuf | sxiv - -ftbo 2> /dev/null | shuf -n 1 | xargs -ri sh -c "echo '{}' | grep -qE jpg\|jpeg\|png && hsetroot -fill '{}' -tint '#9ccfe6'"
    find "$HOME"/Pictures/wallpapers -path "*.git*" -prune -o \( -type f \) | shuf | sxiv - -ftbo 2> /dev/null | shuf -n 1 | xargs -ri sh -c "echo '{}' | grep -qE jpg\|jpeg\|png && hsetroot -fill '{}'"
    bspc desktop -f last

fi
