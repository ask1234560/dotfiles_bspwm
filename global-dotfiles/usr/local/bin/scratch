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

create_terminal(){
    $TERMINAL --class="$name","$name" -e $1 &
}

if ! ps -ef | grep -q "[c]lass=$name"
then
    bspc rule -a "$name" --one-shot state=floating sticky=on hidden=on
    case "$name" in
        "dictionary")
            create_terminal dict-search
            ;;
        "htop")
            create_terminal htop
            ;;
        "neomutt")
            create_terminal neomutt
            ;;
        "newsboat")
            create_terminal newsboat
            ;;
        "ranger")
            create_terminal ranger
            ;;
        "terminal")
            create_terminal $SHELL
            ;;
        *)
            exit 1
    esac
    dunstify "Scratch: starting $name"
    sleep 3s
    bspc_write_nodeid
    toggle_hidden
else
    toggle_hidden
fi
