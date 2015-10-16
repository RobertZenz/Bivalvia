#/usr/bin/env sh

# This is a simple post installation script
# so that I don't need to remember it.
# Actually this has more of a note then of a script.

if [ $(id -u) -ne 0 ]; then
	echo "root dude!"
	exit 1
fi


# Make space
apt-get clean

# Install Mate
apt-get -y install \
	mate-desktop-environment-extras \
	mate-media-pulse mate-settings-daemon-pulse

# MDM
apt-get -y install \
	mdm

# Command line tools
apt-get -y install \
	gawk \
	curl \
	espeak \
	htop \
	hwinfo \
	moreutils \
	mathomatic \
	pass \
	tree \
	wcalc

# Some basic stuff
apt-get -y install \
	conky-all \
	cowsay \
	dclock \
	fortunes \
	gaiksaurus \
	galculator \
	gcolor2 \
	git \
	gpick \
	jhead \
	jq \
	lxappearance \
	redshift \
	screenruler \
	seahorse seahorse-daemon \
	smartmontools gsmartcontrol smart-notifier \
	software-center	software-properties-gtk \
	suckless-tools \
	subversion \
	terminator \
	tig \
	toilet toilet-fonts \
	update-manager \
	vim vim-gnome \
	xplanet

# Java
apt-get install -y \
	openjdk-7-jre

# Internet
apt-get -y install \
	firefox chromium-browser flush \
	flashplugin-installer \
	ttf-mscorefonts-installer # Unfortunately needed...

apt-get clean

# Office
apt-get -y install \
	libreoffice \
	ttf-dejavu

apt-get clean

# Graphical
apt-get -y install \
	blender \
	gimp gimp-data gimp-data-extras gimp-plugin-registry \
	gimp-texturize gimp-gmic \
	inkscape \
	ufraw darktable \
	imagemagick

apt-get clean

# Communications
apt-get -y install \
	pidgin xchat \
	claws-mail claws-mail-attach-warner \
	thunderbird

apt-get clean

# Media
apt-get -y install \
	geequie \
	streamtuner2 \
	vlc

# Neat suff to have
apt-get -y install \
	stellarium marble

# Don't need to set something up without these
apt-get -y install \
	bsdgames \
	sgt-puzzles

apt-get clean

# Now remove all the stuff I don't want
apt-get -y autoremove plymouth-theme-* overlay-scrollbar

# Now get some external packages.
wget "http://downloads.sourceforge.net/project/deadbeef/debian/0.5.6/deadbeef_0.5.6-1_i386.deb"
dpkg --install "deadbeef_0.5.6-1_i386.deb"
rm "deadbeef_0.5.6-1_i386.deb"

wget "http://mirror.informatik.uni-mannheim.de/pub/mirrors/getdeb/ubuntu/pool/games/t/the-powder-toy/the-powder-toy_88.1-1%7egetdeb1_i386.deb"
dpkg --install "the-powder-toy_88.1-1~getdeb1_i386.deb"
rm "the-powder-toy_88.1-1~getdeb1_i386.deb"

