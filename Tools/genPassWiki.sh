#!/usr/bin/env bash

# Generates random, XKCD-style passwords from Wikipedia
# Public Domain or CC0

# Dependencies: curl html2text

# Usage: ./genPassWiki.sh WORDS_MINIMUM_LENGTH COUNT SET


words=4
fromSet="a-zA-Z0-9"
count=1
minLength=5
language=en

if [ ! -z "$1" ]; then
	minLength=$1
fi

if [ ! -z "$2" ]; then
	count=$2
fi

if [ ! -z "$3" ]; then
	fromSet=$3
fi

curl --silent --location https://${language}.m.wikipedia.org/wiki/Special:Random | \
	html2text | \
	egrep --only-matching "[$fromSet]{$minLength,}" | \
	sort | \
	uniq | \
	sort --random-sort | \
	head --lines=$(($words*$count)) | \
	sed "s/.*/\u&/" | \
	paste "--delimiters=" - - - -

