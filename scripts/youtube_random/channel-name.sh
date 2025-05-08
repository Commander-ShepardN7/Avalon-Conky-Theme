#!/bin/bash
#Commander-ShepardN7
line=2
file="~/.config/conky/Avalon/scripts/data/youtube_info.txt"
url=$(sed -n "${line}p" "$file" | cut -d'&' -f1)

if [[ "$url" == https://www.youtube.com/watch* ]]; then
    channel=$(curl -s "$url" | grep -oP '"ownerChannelName":"\K[^"]+')
    echo "$channel"
else
    echo "No valid YouTube URL on line $line"
fi

