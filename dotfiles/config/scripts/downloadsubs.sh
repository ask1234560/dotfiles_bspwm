#!/bin/bash
# This files uses subliminal for subtitles download

lan='en'
provider="$1"
shift

case $provider in 
    opensubtitles)
        name="OPENSUBTITLES"
        username=$name\_username
        password=$name\_password
        ;;
    addic7ed)
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

subliminal --${name,,} $(eval "echo \${$username}") $(eval "echo \${$password}") download -l $lan "$@"
