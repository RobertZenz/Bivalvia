#!/bin/sh

# Informs you when a task has finished.
# Usage: task; whenFinished

# Public Domain or CC0

task="The task you've been waiting for"

if [ ! -z "$1" ]; then
	task=$1
fi

notify-send --urgency=normal --app-name=Finished-Notifier "$task has finished."
