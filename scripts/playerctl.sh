#!/bin/bash

# Credits to Closebox73
# Simple script to get playerctl status

PCTL=$(playerctl status)

if [[ -z "$PCTL" ]]; then
    echo "-"
else
    title=$(playerctl metadata xesam:title)
    if (( ${#title} > 39 )); then
        echo "${title:0:39}..."
    else
        echo "$title"
    fi
fi

exit

