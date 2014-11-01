#/usr/bin/env sh

# This is a simple post installation script
# so that I don't need to remember it.
# Actually this has more of a note then of a script.

if [ $(id -u) -ne 0 ]; then
	echo "root dude!"
	exit 1
fi


apt-get -y install software-properties-common

# Needed for MDM
add-apt-repository ppa:nilarimogard/webupd8

# MATE
apt-add-repository ppa:ubuntu-mate-dev/ppa
apt-add-repository ppa:ubuntu-mate-dev/trusty-mate

# Wine
add-apt-repository ppa:ubuntu-wine/ppa

apt-get update

