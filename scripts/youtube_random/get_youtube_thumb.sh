#!/bin/bash
#Commander-ShepardN7
base_path="$(dirname "$(realpath "$0")")"
channel_list="$base_path/channels.txt"
data_dir="$base_path/../data"
thumb_img="$data_dir/youtube_thumb.jpg"
fallback_img="$base_path/../data/fallback.jpg"
line=2
info_file="$data_dir/youtube_info.txt"
last_url_file="/tmp/last_youtube_url.txt"

# Ensure yt-dlp is installed
if ! command -v yt-dlp >/dev/null; then
    echo "yt-dlp not found!"
    exit 1
fi

# Pick a random channel
if [ ! -f "$channel_list" ]; then
    echo "Missing channels.txt"
    exit 1
fi

channel=$(shuf -n1 "$channel_list")

# Get latest video ID and title
video_info=$(yt-dlp --flat-playlist --print "%(id)s|%(title)s" --playlist-end 1 "$channel")
video_id=$(echo "$video_info" | cut -d'|' -f1)
video_title=$(echo "$video_info" | cut -d'|' -f2)
thumb_url="https://i.ytimg.com/vi/$video_id/maxresdefault.jpg"

# Make data directory if missing
mkdir -p "$data_dir"

# Try downloading the thumbnail
curl -s "$thumb_url" -o "$thumb_img"

# If download fails, use fallback
if [ ! -s "$thumb_img" ]; then
    cp "$fallback_img" "$thumb_img"
fi

# Save video info
channel_name=$(~/.config/conky/Avalon/scripts/youtube_random/channel-name.sh)
video_url="https://www.youtube.com/watch?v=$video_id"
echo -e "$video_title\n$video_url" > "$info_file"

# Wait a little bit for data to "settle", for some reason there's a mismatch with the video title and the thumbnail if this isn't present
sleep 0.5

# Now fetch the channel name (AFTER url is ready and saved)
channel_name=$(~/.config/conky/Avalon/scripts/youtube_random/channel-name.sh)

# --- Notification when URL changes, this was tested on GNOME 42.9, but as long as the notify-send daemon is working, this shouldn't cause any trouble
if [ ! -f "$last_url_file" ] || [ "$video_url" != "$(cat "$last_url_file")" ]; then
    echo "$video_url" > "$last_url_file"
    notify-send -u normal -a "YouTube Video" -i "youtube" "$channel_name" "$video_title\n$video_url"
fi


