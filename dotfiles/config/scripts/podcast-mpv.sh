#!/bin/bash

cut -d' ' -f1 "$XDG_DATA_HOME"/newsboat/queue | tac | mpv --playlist=- --force-window=no --no-audio-display
