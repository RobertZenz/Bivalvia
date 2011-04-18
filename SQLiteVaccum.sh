#!/bin/bash

# This is a simple script to clean up the
# Firefox SQL-Lite databases and write
# all actions to an endless log
# sqlite3 must be installed for this script.

# Original idea is here: http://www.gettingclever.com/2008/06/vacuum-your-firefox-3.html

# Written by Robert 'Bobby' Zenz (Robert.Zenz@gmx.at or bobby@bonsaimind.org) (http://www.bonsamind.org)
# Public Domain

# Set the log path
CONST_LOG=~/.SQLiteVaccum.log

CONST_SQLITE_INSTALLED=$(expr length "$(which sqlite3)")

function doClean {
	toLog "  --- Started cleaning in $1 ---  "

	for item in $1/*.sqlite; do
		let sizeBefore=$(stat -c%s $item)
				
		echo "VACUUM;" | sqlite3 $item
		toLog "Vaccum: $item, Size from $sizeBefore to $(stat -c%s $item)"
	done
}

function toLog {
	echo $1
	echo "["$(date)"] $1" >> $CONST_LOG
}

function main {
	if [ ! $CONST_SQLITE_INSTALLED -eq 0 ]; then
		doClean $1
	else
		toLog "sqlite3 is not installed..."
	fi
}

# Call the main function
main $1
