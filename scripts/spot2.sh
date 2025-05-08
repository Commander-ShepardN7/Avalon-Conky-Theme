#!/bin/bash
case "$1" in
    perc)
        # Get current position and total length in seconds
        curr=$(playerctl --player=spotify metadata --format {{position}})
        len=$(playerctl --player=spotify metadata mpris:length)
        
        # Convert microseconds to seconds
        len_sec=$(echo "$len / 1000000" | bc -l)
        curr_sec=$(echo "$curr / 1000000" | bc -l)
        
        # Calculate progress as a percentage
        perc=$(echo "scale=2; 100 * $curr_sec / $len_sec" | bc -l)
        
        # Output percentage (rounded to nearest integer)
        echo "${perc%.*}"
        ;;
    *)
        echo "case not found: \"$1\"" >&2
        exit 1
        ;;
esac

