#!/usr/bin/env sh

# This is a script which prints random quotes (gathered from files) on to
# a defined wallpaper.
# Some ideas are coming from the xplanet-script located at: http://rbrusu.com/xplanet-desktop-wallpape.html

# Written by Robert 'Bobby' Zenz (Robert.Zenz@gmx.at or bobby@bonsaimind.org) (http://www.bonsamind.org)
# Written for UK at Superuser.com (http://superuser.com/questions/97737/software-for-random-wallpaper-but-with-custom-text)

# Public Domain


# Config-Section
# --------------
quote=~/quotes.txt				# Set this to a folder, for picking random files, or set
								# set it to a file, to pick random lines
wallpaper=~/wallpapers/			# Set it to a fixed wallpaper, or to a folder to pick
								# a random one inside that
tempPic=tempWall.png			# The name of the temporary file

textSize=33						# The size of the text
textColor="#555555"				# The color of the text (watch the quotation marks!)

sleep=3m						# Set how long the script will pause before
								# picking a new wallpaper/quote
#---------------


# Global variable, please ignore this...
pickedFile=GlobalyDefined
pickedQuote=GlobalyDefined
pickedWallpaper=GlobalyDefined

function getRandomLine {
	pickedQuote=$(shuf -n 1 $1)
}

function getRandomFile {
	cd $1

	set -- *
	length=$#
	random_num=$(( $RANDOM % ($length + 1) ))

	pickedFile=${!random_num}

	while [ ! -e $pickedFile ]; do
		pickedFile=${!random_num}
	done

	pickedFile=$(pwd)/$pickedFile

	cd -
}

function main {
	if [ -d $quote ]; then
		getRandomFile $quote
		pickedQuote=$(cat $pickedFile)
	fi
	if [ -f $quote ]; then
		getRandomLine $quote
	fi

	if [ -d $wallpaper ]; then
		getRandomFile $wallpaper
		pickedWallpaper=$pickedFile
	fi
	if [ -f $wallpaper ]; then
		pickedWallpaper=$wallpaper
	fi

	convert -fill "$textColor" -pointsize $textSize -gravity "Center" -draw "text 1,0 '$pickedQuote'" $pickedWallpaper $tempPic
	gconftool -t str -s /desktop/gnome/background/picture_filename $tempPic

	sleep $sleep
	exec $0
}

main
