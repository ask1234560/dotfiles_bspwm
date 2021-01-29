#!/bin/bash

# You can call this script like this:
# $./volume.sh up
# $./volume.sh down
# $./volume.sh mute

function get_volume {
    amixer get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
}

function is_mute {
    amixer get Master | grep '%' | grep -oE '[^ ]+$' | grep off > /dev/null
}

function get_icon {
    volume=`get_volume`
    if [ $volume -gt 64 ]
    then
        icon=audio-volume-high-symbolic.symbolic
    elif [ $volume -gt 31 ]
    then
        icon=audio-volume-medium-symbolic.symbolic
    else
        icon=audio-volume-low-symbolic.symbolic
    fi
}

case $1 in
    up)
        amixer -D pulse set Master on > /dev/null
        amixer set Master 3%+ > /dev/null
	    get_icon
	;;
    down)
        amixer -D pulse set Master on > /dev/null
        amixer set Master 3%- > /dev/null
	    get_icon
	;;
    mute)
        amixer set Master toggle > /dev/null
        if is_mute
        then
            icon=audio-volume-muted-symbolic.symbolic
            bar=""
            volume=0
        else
            get_icon
        fi
esac
dunstify -i $icon -t 2000 -r 2593 "Volume: $volume%"
