#!/usr/bin/env sh

# This is a simple script to download all of the
# ElfQuest comics directly into a directory hirarchy
# created on the fly...

# Written by Robert 'Bobby' Zenz (Robert.Zenz@gmx.at or bobby@bonsaimind.org) (http://www.bonsamind.org)
# Public Domain

# Some sample Links:
#	http://www.elfquest.com/gallery/OnlineComics/OQ/OQ01/oq01-0.jpg
#	http://www.elfquest.com/gallery/OnlineComics/SABM/SABM01/sabm01-0.jpg


# Array of all known Comics
comics[0]=OQ
comics[1]=SABM
comics[2]=KOBW
comics[3]=ESS
comics[4]=HY
comics[5]=SH
comics[6]=NB
comics[7]=TC
comics[8]=KA
comics[9]=TS
comics[10]=JK
comics[11]=RB
comics[12]=MET
comics[13]=EQ2
comics[14]=WD

# This are some variables which we'll need along the way
COUNTER_ISSUE=1
COUNTER_PAGE=0
END_ISSUE=0
STILL_PAGES=0

# loop through all the comics
for comic in "${comics[@]}"; do

	# reset the issue counter
	let COUNTER_ISSUE=1

	# now get all the issues
	while [ $END_ISSUE -eq 0 ]; do
	
		# if the directory does not exist, create it	
		if [ ! -d $comic`printf "%02d" "$COUNTER_ISSUE"` ]; then
			mkdir $comic`printf "%02d" "$COUNTER_ISSUE"`
		fi
		
		# reset the counter
		let COUNTER_PAGE=0
		let STILL_PAGES=0
		
		# get the pages
		while [ $STILL_PAGES -eq 0 ]; do
			
			# check if the file aready exists...
			if [ ! -e $comic`printf "%02d" "$COUNTER_ISSUE"`/`echo $comic | tr '[A-Z]' '[a-z]'``printf "%02d" "$COUNTER_ISSUE"`-$COUNTER_PAGE.jpg ]; then
				# Actual Loading
				wget -c --tries=1 --directory-prefix=$comic`printf "%02d" "$COUNTER_ISSUE"` http://www.elfquest.com/gallery/OnlineComics/$comic/$comic`printf "%02d" "$COUNTER_ISSUE"`/`echo $comic | tr '[A-Z]' '[a-z]'``printf "%02d" "$COUNTER_ISSUE"`-$COUNTER_PAGE.jpg 
			
				# save the exit code
				let STILL_PAGES=$?
			else
				# set the exit code
				let STILL_PAGES=0				
			fi
			
			# increment the page counter if we found something
			if [ $STILL_PAGES -eq 0 ]; then
				let COUNTER_PAGE=COUNTER_PAGE+1
			fi
		done
	
		# if there were no pages
		if [ $COUNTER_PAGE -eq 0 ]; then
			# we can guess that there are no more issues...
			let END_ISSUE=1
			# ...and remove the directory we just created
			rm -rf $comic`printf "0%u" "$COUNTER_ISSUE"`
		else
			# increment the issue counter...
			let COUNTER_ISSUE=COUNTER_ISSUE+1
		fi
	done
	
	# reset the trigger
	let END_ISSUE=0
done
