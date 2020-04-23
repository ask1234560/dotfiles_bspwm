#!/bin/sh


eval "export $(egrep -z DBUS_SESSION_BUS_ADDRESS /proc/$(pgrep -u $LOGNAME gnome-session)/environ)"
acpi -b | awk -F'[,:%]' '{print $2, $3}' | {
	read -r status capacity

	if [ "$status" = Discharging -a "$capacity" -lt 25 ]; then
		notify-send -t 10000 'Critical battery threshold' 'Connect a power source.'  --icon=battery-caution-symbolic.symbolic

		if [ "$capacity" -lt 15 ]; then
			logger "Critical battery threshold"
			systemctl hibernate
		fi
	fi

}
