#!/usr/bin/env bash

# Generates random, XKCD-style passwords from Wikipedia
# genPassWiki.sh

# Usage: ./genPassWiki.sh WORDS SET COUNT

# Public Domain or CC0

words=4
fromSet="a-zA-Z0-9"
count=1
minLength=5

if [ ! -z "$1" ]; then
	words=$1
fi

if [ ! -z "$2" ]; then
	fromSet=$2
fi

if [ ! -z "$3" ]; then
	count=$3
fi

curl --silent --location http://en.wikipedia.org/wiki/Special:Random | \
	html2text | \
	egrep --only-matching "[$fromSet]{$minLength,}" | \
	sort | \
	uniq | \
	sort --random-sort | \
	head --lines=$(($words*$count)) | \
	sed "s/.*/\u&/" | \
	paste "--delimiters=" - - - -

