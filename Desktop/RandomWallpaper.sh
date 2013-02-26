#!/bin/bash

# This is a script which sets a random wallpaper.
# Some ideas are coming from the xplanet-script located at: http://rbrusu.com/xplanet-desktop-wallpape.html

# Written by Robert 'Bobby' Zenz (Robert.Zenz@gmx.at or bobby@bonsaimind.org) (http://www.bonsamind.org)
# Written for UK at Superuser.com (http://superuser.com/questions/97737/software-for-random-wallpaper-but-with-custom-text)

# Public Domain

# This is a stripped down version of RandomQuotedWallpaper.sh

# Config-Section
# --------------
wallpaper=~/wallpapers/			# Set it to a fixed wallpaper, or to a folder to pick
								# a random one inside that
#---------------


# Global variable, please ignore this...
pickedWallpaper=GlobalyDefined

function getRandomFile {
	cd $1

	set -- *
	length=$#
	random_num=$(( $RANDOM % ($length + 1) ))

	pickedWallpaper=${!random_num}

	while [[ ! -e $pickedWallpaper ]]; do
		pickedWallpaper=${!random_num}
	done

	pickedWallpaper=$(pwd)/$pickedWallpaper

	cd -
}

function main {
	getRandomFile $wallpaper
	gconftool -t str -s /desktop/gnome/background/picture_filename $pickedWallpaper
}

main
