#!/bin/bash

# You can call this script like this:
# $./volume.sh up
# $./volume.sh down
# $./volume.sh mute

function get_volume {
    pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '[0-9]+%' | head -n1 | cut -d'%' -f1
}

function is_mute {
    pactl get-sink-mute @DEFAULT_SINK@ | grep -q yes
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
        pactl set-sink-mute @DEFAULT_SINK@ false
        pactl set-sink-volume @DEFAULT_SINK@ +5%
	    get_icon
	;;
    down)
        pactl set-sink-mute @DEFAULT_SINK@ false
        pactl set-sink-volume @DEFAULT_SINK@ -5%
	    get_icon
	;;
    mute)
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        if is_mute
        then
            icon=audio-volume-muted-symbolic.symbolic
            volume=0
        else
            get_icon
        fi
esac
dunstify -i $icon -t 2000 -r 2593 "Volume: $volume%"
