#!/bin/bash
#Commander-ShepardN7
#This script truncates YT video title so it doesn't go past the background image. You might need to adjust the cutoff point based on display resolution
#I do this instead of using fold -s -w because I don't know how to add offset to newlines
file="~/.config/conky/Avalon/scripts/data/youtube_info.txt"
cutoff=46

# Safely read first line and remove problematic characters
line=$(head -n 1 "$file" | tr -d '\r')  # Remove carriage returns if any

# Truncate safely
if [ "${#line}" -gt "$cutoff" ]; then
    printf "%s...\n" "${line:0:$((cutoff - 3))}"
else
    echo "$line"
fi

