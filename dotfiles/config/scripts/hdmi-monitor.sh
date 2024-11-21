#!/bin/bash

if [[ $(xrandr -q | grep "HDMI-A-0") ]];
then
    xrandr --output HDMI-A-0 --primary --mode '1280x1024'  --pos 0x0 --rotate normal
fi
