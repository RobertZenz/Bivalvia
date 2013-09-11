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

# Install Mate and MDM
apt-get -y install mate-core mate-desktop-environment mate-desktop-environment-extra mdm

# Command line tools
apt-get -y install \
	curl espeak htop hwinfo moreutils mathomatic parallel tree

# Some basic stuff
apt-get -y install \
	conky-all \
	dclock \
	fortunes \
	gcolor2 \
	git \
	lxappearance \
	openjdk-7-jre \
	screenruler \
	seahorse \
	seahors-daemon \
	smartmontools gsmartcontrol smart-notifier \
	software-center \
	software-properties-gtk \
	suckless-tools \
	subversion \
	terminator \
	toilet toilet-fonts \
	update-manager \
	vim-gnome \
	xplanet

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
	gimp gimp-data gimp-data-extras \
	gimp-texturize gimp-gmic \
	inkscape \
	ufraw darktable \
	imagemagick
apt-get clean

# Communications
apt-get -y install \
	pidgin xchat \
	claws-mail claws-mail-attach-warner
apt-get clean

# Media
apt-get -y install \
	vlc streamtuner2

# Neat suff to have
apt-get -y install \
	stellarium marble

# Don't need to set something up without these
apt-get -y install \
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

