#!/bin/bash

# for multiple instances of bspwm
for id in $(pgrep -u $LOGNAME bspwm)
do
    eval "export $(egrep -z DBUS_SESSION_BUS_ADDRESS /proc/$id/environ)"
done
export DISPLAY=:0.0

stat=$(< /sys/class/power_supply/BAT1/status)
cap=$(< /sys/class/power_supply/BAT1/capacity)

if [ "$stat" == "Discharging" ]
then
        if [ "$cap" -lt 25 ]
        then
                dunstify -t 10000 'Critical battery threshold' 'Connect a power source.'  --icon="battery-level-10-symbolic.symbolic"
                if [ "$cap" -lt 15  ]
                then
                        logger "Critical battery threshold"
                        betterlockscreen -l blur &
                        sleep 10
                        sudo systemctl hibernate
                fi
        fi
fi
