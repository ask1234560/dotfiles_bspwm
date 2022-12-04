#!/bin/bash

name="$1"
filename=/tmp/"$1"

bspc_write_nodeid() {
    for id in $(bspc query -d focused -N -n .floating.sticky)
    do
        bspc query --node $id -T | grep -q $name && echo $id > $filename && break
    done
}

hide_all_except_current(){
    for id in $(bspc query -d focused -N -n .floating.sticky)
    do
        bspc query --node $id -T | grep -qv $name && bspc node $id --flag hidden=on
    done
}

toggle_hidden() {
    [ -e "$filename" ] || exit 1
    hide_all_except_current
    id=$(<$filename)
    bspc node $id --flag hidden -f
}

if ! ps -ef | grep -q "[c]lass=$name"
then
    bspc rule -a "$name" --one-shot state=floating sticky=on hidden=on
    case "$name" in
        "dictionary")
            $TERMINAL --class="$name","$name" -e dict-search &
            ;;
        "htop")
            $TERMINAL --class="$name","$name" -e htop &
            ;;
        "neomutt")
            $TERMINAL --class="$name","$name" -e neomutt &
            ;;
        "newsboat")
            $TERMINAL --class="$name","$name" -e newsboat &
            ;;
        "ranger")
            $TERMINAL --class="$name","$name" -e ranger &
            ;;
        "terminal")
            $TERMINAL --class="$name","$name" -e $SHELL &
            ;;
        *)
            exit 1
    esac
    notify-send "Scratch: starting $name"
    sleep 3
    bspc_write_nodeid
    toggle_hidden
else
    toggle_hidden
fi
