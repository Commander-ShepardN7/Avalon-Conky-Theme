#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$DIR/weather_access.sh"
function download_weather() {
	URL="$1?appid=$APP_ID&id=$CITY_ID&units=$UNITS&lang=$LANG"
	
	wget $URL -qO $2
}

function map_icon() {
	case $1 in
		01d) echo 'a' ;;
		01n) echo 'b' ;;
		02d) echo 'c' ;;
		02n) echo 'd' ;;
		03d | 03n | 04d | 04n) echo 'e' ;;
		09d | 09n) echo 'i' ;;
		10d) echo 'k' ;;
		10n) echo 'l' ;;
		11d | 11n) echo 'm' ;;
		13d | 13n) echo 'o' ;;
		50d | 50n) echo 'q'
	esac
}
