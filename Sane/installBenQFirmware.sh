#!/usr/bin/env sh

# Licensed under Public Domain or CC0

# Partly from here: http://askubuntu.com/questions/68806/how-do-i-get-an-acer-flatbed-scanner-22-working


if [ -z "$1" ]; then
	echo "Usage: installBenQFirmware.sh FIRMWARE_NAME"
	exit 1
fi

if [ $(id -u) -ne 0 ]; then
	echo "Needs to run as root..."
	exit 1
fi


firmware="$1"
target="/usr/share/sane/firmware"

if [ ! -f "$firmware" ]; then
	echo "Firmware not found."
	exit 1
fi


if [ ! -d "$target" ]; then
	mkdir -p "$target"
	chmod 755 "$target"
fi

cp "$firmware" "$target/$(basename $firmware)"
chmod 644 "$target/$(basename $firmware)"

echo "Now I'll open the snapscan configuration file, please add\n\
the now installed firmware to it.\n\
\n\
Should look like this:\n\
\n\
firmware $target/$(basename $firmware)" | less
nano /etc/sane.d/snapscan.conf

