#!/usr/bin/env sh

# Check if I'm root
if [ $(id -u) -ne 0 ]; then
	echo "This script should be run as root."
	exit 1
fi

# Define our target
target=/usr/share/pixmaps/caja/thumbnail_frame.png

# Create a temporary file to work with
oldFrame=$(mktemp)

# Download the old frame from GitHub
wget --output-document "$oldFrame" "https://raw.github.com/mate-desktop/mate-file-manager/0e004c696b0e68b2cff37a4c3315b022a35eaf43/icons/thumbnail_frame.png"

# Copy the image
cp -fv "$oldFrame" "$target"

# Make sure the rights are correct
chown root:root "$target"
chmod 644 "$target"

echo "Don't forget to restart Caja!"

