#!/bin/bash

sleep 5s
export DISPLAY=:0
export XAUTHORITY="/home/ananthu/.Xauthority"
xset r rate 300 50 -b -dpms &
xmodmap "/home/ananthu/.config/X11/xmodmap"
