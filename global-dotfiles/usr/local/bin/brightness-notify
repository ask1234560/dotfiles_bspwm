#!/bin/bash

# You can call this script like this:
# $./brightness.sh up
# $./brightness.sh down
# $./brightness.sh mute

function get_icon {
    brightness=$(cbacklight --get)
    if [ $brightness -gt 64 ]
    then
        icon=display-brightness-symbolic.symbolic
    elif [ $brightness -gt 31 ]
    then
        icon=display-brightness-symbolic.symbolic
    else
        icon=display-brightness-symbolic.symbolic
    fi
}

case $1 in
    up)
        cbacklight --inc 5
	    get_icon
	;;
    down)
        cbacklight --dec 5
	    get_icon
	;;
esac
dunstify -i $icon -t 2000 -r 2594 "Brightness: $brightness%"
