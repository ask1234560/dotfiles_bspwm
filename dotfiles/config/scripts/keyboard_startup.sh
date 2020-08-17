#!/bin/bash

sleep 5s
export DISPLAY=:0
export XAUTHORITY="/home/ananthu/.Xauthority"
xset r rate 300 50 -b -dpms &
usermodmap="/home/ananthu/.Xmodmap"
[ -f "$usermodmap" ] && xmodmap "$usermodmap"
