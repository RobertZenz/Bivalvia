#!/bin/sh

# Removes configuration files from not installed packages.

# Usage: ./configCleaner.sh

# Public Domain or CC0


if [ $(id -u) -ne 0 ]; then
	echo "This script should be run as root."
	exit 1
fi

toPurge=$(dpkg --get-selections | grep deinstall | cut --fields=1)

if [ -z "$toPurge" ]; then
	exit 0
fi


dpkg --purge $toPurge

