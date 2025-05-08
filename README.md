# Avalon-Conky-Theme
New original theme for Conky

I named it Avalon because of King Arthur's myths. Credit to igorw765 (https://github.com/igorw765) for the Spotify scripts. Credit to Closebox73 for weather scripts and a general inspiration of mine. This theme displays system information, current weather and forecast, Gmail inbox, Spotify information and has CalCurse support.

# Requirements
- Conky (obviously)
- yt-dlp
- Cairo
- Playerctl
- Jq
- ffmpeg
- Sed (formatting)
- Sensors (CPU temperature)
- CalCurse (calendar)
- Git (for cloning this repo)
- I *really* reccommend installing Conky Manager → ```sudo add-apt-repository ppa:teejee2008/foss``` ```sudo apt update sudo apt install conky-manager2```

# Installation
1. Install the required dependencies if they aren't already installed

```sudo apt-get install conky calcurse jq lm-sensors yt-dlp ansiweather cairo ffmpeg playerctl sed git```

2. Go to your Conky directory and clone the repo

```cd ~/.config/Conky/```
```git clone https://github.com/Commander-ShepardN7/Avalon-Conky-Theme.git```

3. Play with the ```offset```, ```voffset``` variables.

4. Start the themes using Conky Manager

# Setting preferences and widgets

You'll need to manually set some stuff

- Avalon (Main theme)
1. Weather and forecast: grab your OpenWeather CityID and API Key and paste them in the ```weather_access.sh``` and ```weather-v2.o.sh``` files
2. Storage: in the .conf file, I detailed how to add a secondary storage to the display. Just replace the ```/path/to/secondary/storage/``` with your actual path
3. Local music thumbnail: if you have local music, then paste each of your saved albums' album cover and rename them accordingly ```Name_of_the_Album```. It is case sensitive, and blanks must be separated by underscores.
4. Spotify Flatpak: if you're using a flatpak version of Spotify, be sure to use Flatseal to enable D-bus session and system buses, or else it will lag the theme atrociously
5. Network: Run ```ip link``` on terminal and paste the third output value on the theme (it usually is the third one)

- Avalon YT and Mail
1. Gmail:Go to https://support.google.com/accounts/answer/185833?hl=en and follow instructions (you'll ned to enable 2-step verification on your Google account). Copy the 16-digit password (delete blank spaces), go to the ```gmail.sh``` file and replace with your credentials
2. YouTube: on the ```youtube_random``` directory inside the scripts folder, you'll find instructions on how to set this one up. 

- Avalon Cal
1. You need calcurse, as metioned above, to use this. There are also two additional files, ```todo.txt``` and ```deadline.sh```, that allow for enhanced management of your tasks. You can ignore them if you want.

# Tested Enviroment
This theme was made on Pop!_OS 22.04 using GNOME 42.9. 

# Screenshot
![preview](https://github.com/user-attachments/assets/9dad9ed3-00ec-4792-8bf1-d8b2ce94a661)



# License 
This project is licensed under the GPL-3.0 License. See the License file for details.


