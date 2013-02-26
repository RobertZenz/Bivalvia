#!/bin/bash

# This is a script which sets a random wallpaper.
# Some ideas are coming from the xplanet-script located at: http://rbrusu.com/xplanet-desktop-wallpape.html

# Public Domain

function setGnome() {
	gconftool -t str -s /desktop/gnome/background/picture_filename $1
}

function setMate() {
	mateconftool-2 -t str -s /desktop/mate/background/picture_filename $1
}

# Directory of the wallpapers
wallpaperdir=~/Wallpapers

if [ ! -d "$wallpaperdir" ]; then
	echo "$wallpaperdir does not exist!"
fi

newWallpaper=$(ls "$wallpaperdir" | sort --random-sort | head -n 1)


setGnome "$newWallpaper"
