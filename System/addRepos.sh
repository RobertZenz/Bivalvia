#/usr/bin/env sh

# This is a simple post installation script
# so that I don't need to remember it.
# Actually this has more of a note then of a script.

if [ $(id -u) -ne 0 ]; then
	echo "root dude!"
	exit 1
fi


apt-get -y install software-properties-common
add-apt-repository ppa:nilarimogard/webupd8
add-apt-repository "deb http://packages.mate-desktop.org/repo/ubuntu $(lsb_release -sc) main"
apt-get update

