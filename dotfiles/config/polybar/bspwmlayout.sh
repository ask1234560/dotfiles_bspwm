#!/bin/bash

if bspc query -T -d | grep -q '"userLayout":"monocle"'
then
    nodes=$(bspc query -d -N -n .tiled | wc -l)
    echo "[$nodes]"
else
    echo ""
fi
