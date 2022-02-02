#!/bin/bash
# This files uses subliminal for subtitles download

username=$OPENSUBTITLES_username
password=$OPENSUBTITLES_password
filename="$1"
lan='en'

subliminal --opensubtitles $username $password download -l $lan "$filename"
