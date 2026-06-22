#!/bin/bash
set -o pipefail

adapta_red=$(xrdb -query | grep color1: | awk '{print $2}')
adapta_yellow=$(xrdb -query | grep color3: | awk '{print $2}')
fg=$(xrdb -query | grep foreground: | awk '{print $2}')

date -Iseconds >/tmp/newsboat.log
newsboat -x reload >>/tmp/newsboat.log 2>&1

if [ $? -eq 0 ]
then
    unread="$(newsboat -x print-unread | cut -d" " -f1)"
    if [ $unread -gt 20 ]
    then
        echo "%{F$adapta_red}%{F-} $unread"
    elif [ $unread -gt 5 ]
    then
        echo "%{F$adapta_yellow}%{F-} $unread"
    else
        echo "%{F$fg}%{F-} $unread"
    fi
else
    echo "%{F$adapta_red}%{F-} -1"
fi

