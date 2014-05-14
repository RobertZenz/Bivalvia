#!/usr/bin/env sh

# Downloads all MacHall comics.
# http://www.machall.com
#
# Public Domain or CC0
# Note that the comics this script downloads are under copyright.
#
# Usage: machall.sh
# Just execute it in the directory in which you want the images.


# We can use a fixed set of years as there are no more comics coming, sadly.
years="2000 2001 2002 2003 2004 2005 2006"

archiveUrl=http://www.machall.com/archive.php?year=
imageUrl=http://www.machall.com/comics/
imageUrlEnd=.jpg

for year in $years; do
	comics=$(curl --silent ${archiveUrl}${year} | egrep -o "[0-9]+-[0-9]+-[0-9]+" | tr -d "-")
	
	mkdir $year
	cd $year
	
	for comic in $comics; do
		wget ${imageUrl}${comic}${imageUrlEnd}
	done
	
	cd -
done

