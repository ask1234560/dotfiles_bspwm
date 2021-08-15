#!/bin/bash

date -Iseconds >/tmp/mutt.log
mw -Y >/dev/null 2>>/tmp/mutt.log

unread="$(find "${XDG_DATA_HOME:-$HOME/.local/share}"/mail/*/[Ii][Nn][Bb][Oo][Xx]/new -type f | wc -l 2>/dev/null)"

adapta_red=$(xrdb -query | grep color1: | awk '{print $2}')
adapta_yellow=$(xrdb -query | grep color3: | awk '{print $2}')
fg=$(xrdb -query | grep foreground: | awk '{print $2}')

if [ $unread -gt 20 ]
then
    echo "%{F$adapta_red}󰇮%{F-} $unread"
elif [ $unread -gt 5 ]
then
    echo "%{F$adapta_yellow}󰇮%{F-} $unread"
else
    echo "%{F$fg}󰇮%{F-} $unread"
fi
