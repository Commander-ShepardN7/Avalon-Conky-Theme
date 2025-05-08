#!/bin/bash
#Commander-ShepardN7
#I made this script to use with Gnome Pie Extension, but you can add it to a custom launcher
# Path to file
FILE="~/.config/conky/Avalon/scripts/data/youtube_info.txt"

# Get the second line
URL=$(sed -n '2p' "$FILE")

# Open in Firefox if the line is not empty
if [[ -n "$URL" ]]; then
    firefox "$URL"
else
    echo "Second line is empty or file doesn't exist."
fi

