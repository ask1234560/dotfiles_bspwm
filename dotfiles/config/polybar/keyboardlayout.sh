#!/bin/bash

filename="/tmp/keyboardlayout"

if [[ -e $filename ]] 
then
    currentlayout=$(<$filename)
    echo "[$currentlayout]" 
else
    echo ""
fi
