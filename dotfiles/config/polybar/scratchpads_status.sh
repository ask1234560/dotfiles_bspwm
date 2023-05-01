#!/bin/bash

names="
dictionary D
htop H
neomutt M
newsboat N
ranger R
terminal T
"
status=""
cmd=$(ps -ef)

check_scratchpad() {
    grep -q "[c]lass=$1" <<< "$cmd"
}

IFS=$'\n'
for name in $names
do
    status+=$(check_scratchpad ${name% *} && echo ${name#* })
done

if [ -n "$status" ]
then
    echo "[$status]"
else
    echo ""
fi
