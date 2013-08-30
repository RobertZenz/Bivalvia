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
apt-get -y install mate-core mate-desktop-environment mdm

# Command line tools
apt-get -y install \
	curl espeak htop hwinfo moreutils mathomatic parallel tree

# Some basic stuff
apt-get -y install \
	conky-all \
	dclock \
	figlet \
	fortunes \
	gcolor2 \
	git \
	lxappearance \
	openjdk-7-jre \
	screenruler \
	seahorse \
	seahors-daemon \
	software-center \
	software-properties-gtk \
	suckless-tools \
	terminator \
	update-manager \
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


# Let's do some important stuff, shall we?

# SysRQ
echo "Set up the SysRq calls...change it to 1." | less
nano /etc/sysctl.d/10-magic-sysrq.conf

# umask
echo "/etc/profile (umask 0027?) is our next stop." | less
nano /etc/profile

# GRUB
echo "You will be shown the possible resolutions and the GRUB config file next.\n\
\n\
Most likely you want to remove the \"splash\" from the boot options and\n
add GRUB_GFXPAYLOAD_LINUX=keep." | less
hwinfo --framebuffer | less
nano /etc/default/grub
update-grub
