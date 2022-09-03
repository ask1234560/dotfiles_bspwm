#!/bin/bash
# This files uses subliminal for subtitles download

filename="$1"
lan='en'
server="$2"

case $server in 
    1)
        name="OPENSUBTITLES"
        username=$name\_username
        password=$name\_password
        ;;
    2)
        name="ADDIC7ED"
        username=$name\_username
        password=$name\_password
        ;;
    *)
        name="OPENSUBTITLES"
        username=$name\_username
        password=$name\_password
        ;;
esac

subliminal --${name,,} $(eval "echo \${$username}") $(eval "echo \${$password}") download -l $lan "$filename"
