#!/bin/sh

# A simple cleanup script that runs deborphan, let's you select all the packages
# you'd like to remove/purge and afterwards runs apt-get autoremove.

# Usage: ./orphanCleaner.sh [DEBORPHAN OPTIONS]

# Public Domain or CC0


if [ $(id -u) -ne 0 ]; then
	echo "This script should be run as root."
	exit 1
fi

if [ -z "$(which deborphan)" ]; then
	echo "deborphan needs to be installed."
	exit 1
fi

if [ -z "$(which dialog)" ]; then
	echo "dialog needs to be installed."
	exit 1
fi


orphans=$(deborphan $*)

# Build the list for dialog.
items=
for item in $orphans; do
	items="$items $item $item on"
done

toUninstall=$(dialog \
	--checklist "Please select the packages you'd like to remove." \
	25 80 25 \
	$items \
	3>&1 1>&2 2>&3)

# That redirecting is some magic I found on Stack Overflow:
# http://stackoverflow.com/questions/1970180/whiptail-how-to-redirect-output-to-environment-variable

if [ -z "$toUninstall" ]; then
	exit 0
fi

dpkg --purge $toUninstall

apt-get autoremove

