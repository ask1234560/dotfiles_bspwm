#!/bin/bash

# for multiple instances of bspwm
for id in $(pgrep -u $LOGNAME -x bspwm)
do
    eval "export $(grep -Ez DBUS_SESSION_BUS_ADDRESS /proc/$id/environ | tr '\0' '\n')"
done
export DISPLAY=:0

stat=$(</sys/class/power_supply/BAT0/status)
cap=$(</sys/class/power_supply/BAT0/capacity)

if [ "$stat" == "Discharging" ]
then
        if [ "$cap" -lt 25 ]
        then
                dunstify -t 10000 'Critical battery threshold' 'Connect a power source.'  --icon="battery-level-10-symbolic"
                if [ "$cap" -lt 15  ]
                then
                        logger "Critical battery threshold"
                        sudo systemctl hibernate
                fi
        fi
fi
