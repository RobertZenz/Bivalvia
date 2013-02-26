#!/bin/bash

# This is a script which sets a random wallpaper.
# Some ideas are coming from the xplanet-script located at: http://rbrusu.com/xplanet-desktop-wallpape.html

# Public Domain

# Directory of the wallpapers
wallpaperdir=~/Wallpapers

if [ ! -d "$wallpaperdir" ]; then
	echo "$wallpaperdir does not exist!"
fi

newWallpaper=$(ls "$wallpaperdir" | sort --random-sort | head -n 1)

gconftool -t str -s /desktop/gnome/background/picture_filename $newWallpaper
