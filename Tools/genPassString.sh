#!/usr/bin/env sh

# Generates random passwords from /dev/urandom
# genPass.sh LENGTH COUNT

# Public Domain or CC0

length=8
count=3

if [ ! -z "$1" ]; then
	length=$1
fi

if [ ! -z "$2" ]; then
	count=$2
fi

cat /dev/urandom | strings --bytes=$length | head -$count
