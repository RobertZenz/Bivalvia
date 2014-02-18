#!/usr/bin/env sh

# Creates a new wine prefix in the current directory
# and some helper scripts. It also directly starts winecfg and
# winetricks.
# Public Domain or CC0

# Usage: newPrefix.sh
# Just execute it in the directory in which you want the prefix.


scriptStart="#!/usr/bin/env sh

. \"\$(dirname \"\$0\")/base.sh\"
"

createScript() {
	echo "$2" > "$1"
	chmod u+x "$1"
}


createScript base.sh "#!/usr/bin/env sh

export WINEPREFIX=\"$(pwd)\"
"

createScript cfg.sh "$scriptStart
winecfg
"

createScript run.sh "$scriptStart
wine \"\$*\"
"

createScript tricks.sh "$scriptStart
winetricks \"\$*\"
"

./cfg.sh
./tricks.sh

