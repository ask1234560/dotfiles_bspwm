#!/bin/bash

# script always set the browser to fullscreen when the browser gets the focus and is in tiled.

# bspc subscribe node_focus | while read event
# do
#     if ps -e | grep -qi "$BROWSER"
#     then
#         current_node_id=${event##* }
#         for id in $(bspc query -N -d '^3' -n .tiled)
#         do
#             browser_id=$(bspc query --node $id -T | grep -qi $BROWSER && echo $id)
#         done
#         [ -z "$browser_id" ] || [ "$current_node_id" = "$browser_id" ] && bspc node "$browser_id" --state fullscreen
#         unset browser_id
#     fi
# done &

while true
do
    sleep 1s
    for id in $(bspc query -N -d '^3' -n .tiled)
    do
        browser_id=$(bspc query --node $id -T | grep -qi $BROWSER && echo $id)
    done
    focused_node_id=$(bspc query -N -d '^3' -n .focused)
    [ -n "$browser_id" ] && [ "$browser_id" = "$focused_node_id" ] && bspc node "$browser_id" --state fullscreen
    unset browser_id
done
