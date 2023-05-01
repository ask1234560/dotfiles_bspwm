#!/bin/bash

# script always set the browser to fullscreen when the browser gets the focus and is in tiled on 3rd desktop.

desktop='^3'

while true
do
    sleep 2s
    bspc query -T -d "$desktop" | grep -q '"userLayout":"monocle"' || continue
    focused_node_id=$(bspc query -N -d "$desktop" -n .focused)
    bspc query --node "$focused_node_id" -T | grep -qi "$BROWSER" && bspc node "$focused_node_id" --state fullscreen
done
