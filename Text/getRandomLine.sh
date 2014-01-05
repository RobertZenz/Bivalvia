#!/usr/bin/env sh

# Script for getting a random line from a random (or defined) file.

# Public Domain or CC0

# Default source of comments
source=~/Documents/Quotes

# Check if we got a new source
if [ ! -z "$1" ]; then
	source=$1
fi

if [ ! -e "$source" ]; then
	echo "$source not found."
	exit 1
fi

file=$source
if [ -d "$source" ]; then
	file=$(find "$source" -maxdepth 1 -type f | sort --random-sort | head -1)
fi

line=$(cat "$file" | sort --random-sort | head -1)

echo $line - $(basename "$file")
