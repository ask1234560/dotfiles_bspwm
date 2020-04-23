#!/bin/bash

#id="$(xinput list | grep AT | awk -F ' ' '{print $7}' | awk -F '=' '{print $2}')"


#id="$(xinput list | awk -F  '[=]' ' /AT Translated/  { print $2 } ' | awk '{ print $1 }')"

#xinput float $id
#sleep 10

xset -dpms



