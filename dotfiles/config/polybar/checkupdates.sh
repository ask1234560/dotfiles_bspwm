#!/bin/bash

if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
    updates_arch=0
fi
if ! updates_aur=$(yay -Qum 2> /dev/null | wc -l); then
    updates_aur=0
fi

updates=$(("$updates_arch" + "$updates_aur"))
adapta_red=$(xrdb -query | grep color1: | awk '{print $2}')
adapta_yellow=$(xrdb -query | grep color3: | awk '{print $2}')
fg=$(xrdb -query | grep foreground: | awk '{print $2}')

if [ $updates -gt 50 ]
then
    echo "%{F$adapta_red}󰊠%{F-} $updates"
elif [ $updates -gt 15 ]
then
    echo "%{F$adapta_yellow}󰊠%{F-} $updates"
else
    echo "%{F$fg}󰊠%{F-} $updates"
fi
