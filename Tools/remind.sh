#!/bin/sh

# Schedules reminder via notify-send and at.
# The original idea is, I think, from somewhere around /r/unixporn.

# Public Domain or CC0

# Check if we have a terminal, if not launch xterm
if [ ! -t 0 ]; then
	exec xterm $0 $@
fi

# Assign the given parameters
urgency=$1
message=$2
minutes=$3

if [ -z "$urgency" ]; then
	read -p "Urgency [critical|normal|low] (normal): " urgency < /dev/tty
	case "$urgency" in
		c|C|1)
			urgency=critical;;
		n|N|2)
			urgency=normal;;
		l|L|3)
			urgency=low;;
	esac
	if [ -z "$urgency" ]; then
		urgency=normal
	fi
fi

if [ -z "$message" ]; then
	read -p "Message: " message < /dev/tty
	if [ -z "$message" ]; then
		$message=n/t
	fi
fi

if [ -z "$minutes" ]; then
	read -p "Minutes (5): " minutes < /dev/tty
	if [ -z "$minutes" ]; then
		minutes=5
	fi
fi

echo notify-send --urgency=$urgency --app-name=Reminder $message | at now+${minutes}minutes
notify-send --urgency=low --expire-time=5000 --app-name=Reminder "Scheduled ($urgency):\n$message\n\nin $minutes minutes"
