#!/bin/bash


# Script for getting a random text (2nd version).

# Written by Robert 'Bobby' Zenz (Robert.Zenz@gmx.at or bobby@bonsaimind.org) (http://www.bonsamind.org)
# Public Domain

# This script utilizes rl from the randomize-lines package.


# Configuration
	source=~/Documents/Quotes		# You can specify a folder or a file.

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

if [ "$1" == "update" ]; then
	rm $index
fi

if [ -d $source ]; then
	if [ ! -e $index ]; then
		rebuildIndex;
	fi
	echo $(rl --count=1 $index);
fi
if [ -f $source ]; then
	echo $(rl --count=1 $source);
fi
