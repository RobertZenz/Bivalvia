#/usr/bin/env sh

# This is a simple post installation script
# so that I don't need to remember it.
# Actually this has more of a note then of a script.

if [ $(id -u) -ne 0 ]; then
	echo "root dude!"
	exit 1
fi


# Let's do some important stuff, shall we?

# SysRQ
echo "Set up the SysRq calls...change it to 1." | less
nano /etc/sysctl.d/10-magic-sysrq.conf

# umask
echo "/etc/profile (umask 0027?) is our next stop." | less
nano /etc/profile

# visudo
echo "Configure sudo, f.e. add insults." | less
visudo

# GRUB
echo "You will be shown the possible resolutions and the GRUB config file next.\n\
\n\
Most likely you want to remove the \"splash\" from the boot options and\n
add GRUB_GFXPAYLOAD_LINUX=keep." | less
hwinfo --framebuffer | less
nano /etc/default/grub
update-grub


echo "Don't forget to change the DNS servers if necessary!" | less

