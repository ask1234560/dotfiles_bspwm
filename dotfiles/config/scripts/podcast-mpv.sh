#!/bin/bash

cut -d' ' -f1 /home/ananthu/.local/share/newsboat/queue | tac | mpv --playlist=- --force-window=no --no-audio-display
