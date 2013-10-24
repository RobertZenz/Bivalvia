#!/usr/bin/env sh

# This is a simple script to run the VACUUM command on all
# SQLite-Databases found in the specified directory.

# Original idea is here: http://www.gettingclever.com/2008/06/vacuum-your-firefox-3.html

# Public Domain or CC0

if [ $(expr length "$(which sqlite3)") -eq 0 ]; then
	echo "Please install sqlite."
	exit 1
fi

for directory in "$@"; do
	for database in $directory/*.sqlite; do
		before=$(stat -c%s "$database")
		echo -n "$database: From $before "
		
		$(echo "VACUUM;" | sqlite3 "$database")
		
		after=$(stat -c%s "$database")
		echo "$after; $(echo "scale=2;$after*100/$before" | bc)%"
	done
done
