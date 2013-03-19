#!/bin/bash

# Generates random passwords from /dev/urandom
# genPass.sh LENGTH FROM_SET COUNT

# Public Domain or CC0

length=8
fromSet="a-zA-Z0-9"
count=1

if [ ! -z "$1" ]; then
	length=$1
fi

if [ ! -z "$2" ]; then
	fromSet=$2
fi

if [ ! -z "$3" ]; then
	count=$3
fi

cat /dev/urandom| tr -dc "$fromSet" | fold -w $length| head -n $count
