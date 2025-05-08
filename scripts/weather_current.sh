#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$DIR/weather_functions.sh"


API_URL=https://api.openweathermap.org/data/2.5/weather
FILE_CURRENT_JSON=cache/weather_current.json

download_weather $API_URL $FILE_CURRENT_JSON

FILTERED_WEATHER_DATA=$(jq '.weather[0].icon, .main.temp, .main.pressure, .wind.speed, .clouds.all, .weather[0].description, .name' $FILE_CURRENT_JSON)
readarray -t FILTERED_WEATHER_DATA_ARRAY <<< "$FILTERED_WEATHER_DATA"

ICON=$(map_icon ${FILTERED_WEATHER_DATA_ARRAY[0]:1:-1})
TEMP=$(echo ${FILTERED_WEATHER_DATA_ARRAY[1]} | awk '{print int($1+0.5)}')
PRESSURE=${FILTERED_WEATHER_DATA_ARRAY[2]}
WIND=${FILTERED_WEATHER_DATA_ARRAY[3]/./,}
CLOUDINESS=${FILTERED_WEATHER_DATA_ARRAY[4]}
DESCRIPTION=${FILTERED_WEATHER_DATA_ARRAY[5]:1:-1}
CITY_NAME=${FILTERED_WEATHER_DATA_ARRAY[6]:1:-1}

echo '${voffset 10}${color EAEAEA}${font WeatherGothamCity:pixelsize=80}'$ICON'${font}${voffset -65}${offset 10}${color1}${font Bariol Clock:pixelsize=28}'$TEMP'°C${voffset -7}${offset 5}${color EAEAEA}${font Bariol Clock:pixelsize=18}'$DESCRIPTION'${font}${voffset 20}${font Bariol Clock:pixelsize=38}${goto 95}'$CITY_NAME'${font}
${color1}${goto 96}Pressure ${offset 3}${color}'$PRESSURE'${color2}hPa${offset 20}${color1}Wind ${offset 3}${color}'$WIND'${color2}m/s${offset 20}${color1}Cldy ${offset 3}${color}'$CLOUDINESS'${color2}%'
