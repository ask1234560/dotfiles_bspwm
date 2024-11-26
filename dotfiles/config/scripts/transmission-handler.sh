#!/bin/bash

percentage=$(transmission-remote -t $TR_TORRENT_ID -l | awk -v ID="$TR_TORRENT_ID" '$0 ~ ID{print $2}')

if [ $percentage != "100%" ]
then
     dunstify --icon="transmission-symbolic" "Transmission: started $TR_TORRENT_NAME"
else
     dunstify --icon="transmission-symbolic" "Transmission: downloaded $TR_TORRENT_NAME"
fi
