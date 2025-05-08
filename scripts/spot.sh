#!/bin/bash
#Commander-ShepardN7
# Extract metadata
ARTIST=$(playerctl --player=spotify metadata artist | fold -s -w 30)
ALBUM=$(playerctl --player=spotify metadata album | fold -s -w 25)

# Get the current player status
STATUS=$(playerctl --player=spotify status 2>/dev/null)

# Display song information based on player status
if [ "$STATUS" == "Playing" ]; then
  echo "by $ARTIST"
elif [ "$STATUS" == "Paused" ]; then
  echo "by $ARTIST"
else
  echo ""
fi

