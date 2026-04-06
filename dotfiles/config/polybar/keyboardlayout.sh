#!/bin/bash

currentlayout="$(setxkbmap -query | grep layout | tr -s " " | cut -d " " -f2)"

echo "[$currentlayout]" 
