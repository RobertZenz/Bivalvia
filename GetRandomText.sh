#!/bin/bash

# Script for getting a random text.

# Written by Robert 'Bobby' Zenz (Robert.Zenz@gmx.at or bobby@bonsaimind.org) (http://www.bonsamind.org)
# Public Domain

# Config-Section
# --------------

source=~/Documents/Quotes/		# Set this to a folder, for picking random files, or set
								# set it to a file, to pick random lines
mixed=true						# Set the source to a directory and this to true,
								# that way you'll get a random line from a random file
								# post-fixed with the name of the file.
# -------------


# Global variable, please ignore this...
pickedFile=GlobalyDefined
pickedQuote=GlobalyDefined

function getRandomLine {
	pickedQuote=$(shuf -n 1 "$1")
}

function getRandomFile {
	cd $1

	set -- *
	length=$#
	random_num=$(( $RANDOM % ($length + 1) ))

	pickedFile=${!random_num}

	while [ ! -e "$pickedFile" ]; do
		pickedFile=${!random_num}
	done

	pickedFile=$(pwd)/$pickedFile
}

function main {
	if [ -e "$1" ]; then
		source=$1
	fi
	
	if [ -d "$source" ]; then
		getRandomFile "$source"
		if [ $mixed ]; then
			source=$pickedFile
		else
			pickedQuote=$(cat "$pickedFile")
		fi
	fi
	if [ -f "$source" ]; then
		getRandomLine "$source"
	fi
	
	if [ $mixed ]; then
		echo "$pickedQuote - $(basename "$pickedFile")"
	else
		echo $pickedQuote
	fi
}

main $source
