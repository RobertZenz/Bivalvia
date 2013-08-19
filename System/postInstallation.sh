#/usr/bin/env sh

# This is a simple post installation script
# so that I don't need to remember it.
# Actually this has more of a note then of a script.

if [ $(id -u) -ne 0 ]; then
	echo "root dude!"
	exit 1
fi


# TODO: Add MATE repository
# TODO: Add that other repository I just forgot about
# TODO: Install MATE


# Command line tools
apt-get -y install \
	curl espeak htop hwinfo mathomatic tree

# Some basic tools
apt-get -y install \
	dclock conky-all terminator git

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
nano /etc/sysctl.d/10-magic-sysrq.conf

# GRUB
echo "You will be shown the possible resolutions and the GRUB config file next.\n\
\n\
Most likely you want to remove the \"splash\" from the boot options and\n
add GRUB_GFXPAYLOAD_LINUX=keep." | less
hwinfo --framebuffer | less
nano /etc/default/grub
update-grub

