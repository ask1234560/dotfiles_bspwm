#!/bin/bash

name="$1"

bspc_return_nodeid() {
    # $1 - query item, $2 - location; All windows should be floating
    for i in $(bspc query -N -n .floating)
    do
        bspc query  --node $i -T | grep -q $1 && echo $i > $2 && break
    done
}

toggle_hidden() {
    [ -e "/tmp/$name" ] || exit 1
    id=$(cat /tmp/"$name")
    bspc node $id --flag hidden
    bspc node -f $id
}

if ! ps -x | grep -q "[c]lass=$name"
then
    bspc rule -a "$name" --one-shot state=floating sticky=on hidden=on center=on
    case "$name" in
        "dictionary")
            $TERMINAL --class="$name","$name"  --position 19 72 -e dict-search &
            ;;
        "htop")
            $TERMINAL --class="$name","$name"  --position 19 72 -e htop &
            ;;
        "neomutt")
            $TERMINAL --class="$name","$name"  --position 19 72 -e neomutt &
            ;;
        "newsboat")
            $TERMINAL --class="$name","$name"  --position 19 72 -e newsboat &
            ;;
        "ranger")
            $TERMINAL --class="$name","$name"  --position 19 72 -e ranger &
            ;;
        "terminal")
            $TERMINAL --class="$name","$name"  --position 19 72 -e $SHELL &
            ;;
        *)
            exit 1
    esac
    notify-send "Scratch: starting $name"
    sleep 3
    bspc_return_nodeid "$name" /tmp/"$name"
    toggle_hidden
else
    toggle_hidden
fi
