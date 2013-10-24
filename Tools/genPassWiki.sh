#!/usr/bin/env bash

# Generates random, XKCD-style passwords from Wikipedia
# genPassWiki.sh

# Public Domain or CC0

# TODO: paste should take an arbitrary amount of input

words=4
fromSet="a-zA-Z0-9"
count=1

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
	egrep --only-matching "[$fromSet]*" | \
	sort | \
	uniq | \
	sort --random-sort | \
	head --lines=$(($words*$count)) | \
	sed "s/.*/\u&/" | \
	paste "--delimiters=" - - - -

