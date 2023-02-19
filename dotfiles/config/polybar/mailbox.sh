#!/bin/bash

adapta_red=$(xrdb -query | grep color1: | awk '{print $2}')
adapta_yellow=$(xrdb -query | grep color3: | awk '{print $2}')
fg=$(xrdb -query | grep foreground: | awk '{print $2}')

# gpg --fingerprint --with-keygrip ask1234560@gmail.com
keygrip="3EF45C5C4F189FE3ED00D6105652C0C336D924AD"

is_key_cached(){
    [[ \
      $( \
        gpg-connect-agent 'keyinfo --list' /bye \
        | awk -v keygrip="$keygrip" '$0 ~ keygrip{print $7}'
      ) == 1 \
    ]]
}

if is_key_cached; then
    date -Iseconds >/tmp/mutt.log
    mailsync >/dev/null 2>>/tmp/mutt.log

    unread="$(find "${XDG_DATA_HOME:-$HOME/.local/share}"/mail/*/[Ii][Nn][Bb][Oo][Xx]/new -type f | wc -l 2>/dev/null)"

    if [ $unread -gt 20 ]
    then
        echo "%{F$adapta_red}󰇮%{F-} $unread"
    elif [ $unread -gt 5 ]
    then
        echo "%{F$adapta_yellow}󰇮%{F-} $unread"
    else
        echo "%{F$fg}󰇮%{F-} $unread"
    fi
else
    echo "%{F$adapta_red}󰇮%{F-} -1"
fi
