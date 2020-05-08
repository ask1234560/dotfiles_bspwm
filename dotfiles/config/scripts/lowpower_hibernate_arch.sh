#!/bin/sh

eval "export $(egrep -z DBUS_SESSION_BUS_ADDRESS /proc/$(pgrep -u $LOGNAME bspwm)/environ)"
export DISPLAY=:0.0

read stat < /sys/class/power_supply/BAT1/status
read cap < /sys/class/power_supply/BAT1/capacity

if [ "$stat" == "Discharging" ]
then
		if [ "$cap" -lt 25 ]
		then
				dunstify -t 10000 'Critical battery threshold' 'Connect a power source.'  --icon="battery-level-10-symbolic.symbolic" -u low
				if [ "$cap" -lt 15  ]
				then
						logger "Critical battery threshold"
						betterlockscreen -l blur &
						sudo systemctl hibernate
				fi
		fi
fi



