#!/usr/bin/env sh

# This is a script which sets a random wallpaper.
# Some ideas are coming from the xplanet-script located at: http://rbrusu.com/xplanet-desktop-wallpape.html

# Public Domain or CC0

setGnomeGConf() {
	gconftool -t str -s /desktop/gnome/background/picture_filename "$1"
}

setMateConf() {
	mateconftool-2 -t str -s /desktop/mate/background/picture_filename "$1"
}

setMateDConf() {
	dconf write /org/mate/desktop/background/picture-filename "'$1'"
}

# Directory of the wallpapers
wallpaperdir=~/Wallpapers

# Time between changes
sleep=3m


if [ ! -d "$wallpaperdir" ]; then
	echo "$wallpaperdir does not exist!"
	exit 1
fi

newWallpaper=$(ls "$wallpaperdir" | sort --random-sort | head -n 1)

setMateDConf "$wallpaperdir/$newWallpaper"

# Wait for some time and then start over.
# If you want a "one shot solution" remove the next two lines.
sleep $sleep
exec "$0"
