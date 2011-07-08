#!/bin/bash


# Script for getting a random text (2nd version).

# Written by Robert 'Bobby' Zenz (Robert.Zenz@gmx.at or bobby@bonsaimind.org) (http://www.bonsamind.org)
# Public Domain

# This script utilizes rl from the randomize-lines package.


# Configuration
	source=~/Documents/Quotes		# You can specify a directory or a file.

# Global variables
	index=$source/.randomIndex		# Index file in case the source is a directory.


function rebuildIndex {	
	if [ -d $source ]; then
		if [ -f $index ]; then
			rm $index
		fi

		for file in $source/*; do
			$(cat "$file" | sed "s/$/ - $(basename "$file")/" >> $index)
		done
	fi
}

# Source is a directory
if [ -d $source ]; then
	if [ "$1" == "update" ]; then
		rm $index
	fi
	
	if [ ! -e $index ]; then
		rebuildIndex;
	fi
	
	echo $(rl --count=1 $index);
fi

# Source if a file
if [ -f $source ]; then
	echo $(rl --count=1 $source);
fi
