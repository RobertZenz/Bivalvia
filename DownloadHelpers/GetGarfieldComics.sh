#!/bin/bash

# This is a simple script to get all garfield comics.
# The comics will be loaded from ucomics.com, before you ask
# garfield.com is a Flash-Player interface which also refers
# back to ucomics.com...for some reason...

# Example Link: http://images.ucomics.com/comics/ga/1993/ga930502.gif

# Also, check out the Python Script for this from Squil at Softpedia:
# http://linux.softpedia.com/get/Desktop-Environment/Desktop-Widgets/Garfield-comics-3461.shtml

# Written by Robert 'Bobby' Zenz (Robert.Zenz@gmx.at or bobby@bonsaimind.org) (http://www.bonsamind.org)

# Public Domain

# Set the link
LINKSTART="http://images.ucomics.com/comics/ga/"
LINKEND=".gif"

# Some settings
APPENDTOWEEKS=0											# Set to 1 if you don't want weekly pages					
APPENDTOFORMAT=".gif"									# Format for the weekly pages
IMAGEMAGICKINSTALLED=`expr length "$(which convert)"`	# Check if ImageMagick is installed

# Set the beginning date
YEARSTART=1978
MONTHSTART=6
DAYSTART=19

# Set the end date
YEAREND=`date +%Y`
MONTHEND=`date +%m`
DAYEND=`date +%d`

# Temp variables
YEAR=$YEARSTART
MONTH=$MONTHSTART
DAY=$DAYSTART

# Main function
function main {
	if [[ $APPENDTOWEEKS -eq 0 && $IMAGEMAGICKINSTALLED -eq 0 ]]; then
		dialog --yesno "ImageMagick is not installed, but 'Weekly Pages' is enabled.\nWithout ImageMagick I can't append the strips to a weekly page.\n\nYou wanna continue anyway?" 10 55
		if [[ $? -eq 0 ]]; then
			doDownloads
		else
			clear
		fi
	else
		doDownloads
	fi
}

function doDownloads {
	#check for an existing config file
	checkForExisting
	
	# loop until we reach today
	while [[ $YEAR -le $YEAREND || $MONTH -le $MONTHEND || $DAY -le $DAYEND ]]; do
		# create the directory
		if [ ! -d $YEAR ]; then
			mkdir $YEAR
		fi

		# download the comic
		wget -c --directory-prefix=$YEAR $LINKSTART$YEAR/ga${YEAR:2:2}`printf "%02d" "$MONTH"``printf "%02d" "$DAY"`$LINKEND 

		# save the actual state
		echo $YEAR`printf "%02d" "$MONTH"``printf "%02d" "$DAY"` > .ga_dl_conf

		makeWeekly
		
		# check if we ran out of days
		if [ $DAY -eq 31 ]; then
			let DAY=0
			let MONTH=MONTH+1
		fi

		# check if we ran out of months
		if [ $MONTH -eq 13 ]; then
			makeWeekly
			
			let MONTH=1
			let YEAR=YEAR+1
		fi
		
		# increment the day
		let DAY=DAY+1
	done
}

# Function to make the weekly pages
function makeWeekly {
	# check if we should make weekly comics out of it
	if [[ $APPENDTOWEEKS -eq 0 && $IMAGEMAGICKINSTALLED -gt 0 ]]; then

		# check if we reached sunday
		if [ $(LANG=LANG_EN date --date="$YEAR-`printf "%02d" "$MONTH"`-`printf "%02d" "$DAY"`" +%u) -eq 7 ]; then

			# append every comic into a weekly comic-strip
			convert $YEAR/ga*.gif -append $YEAR/$YEAR-$(date --date="$YEAR-`printf "%02d" "$MONTH"`-`printf "%02d" "$DAY"`" +%W)$APPENDTOFORMAT

			# remove all other comics
			rm $YEAR/ga*.gif
		fi
	fi
}

# Function for checking if already something exists
function checkForExisting {
	echo "Checking for existing config-file..."
	
	if [ -e .ga_dl_conf ]; then
		echo "Found one :)"
		
		TEMP=`cat .ga_dl_conf`
		
		let YEAR=${TEMP:0:4}
		let MONTH=${TEMP:4:2}
		let DAY=${TEMP:6:2}
	fi
}

# Program
main
