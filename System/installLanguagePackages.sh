#!/usr/bin/env sh

# Installs all the packages which are reported by check-language-support.

# Usage: ./installLanguagePackages.sh [CHECK-LANGUAGE-SUPPORT OPTIONS]

# Public Domain or CC0


if [ $(id -u) -ne 0 ]; then
	echo "This script should be run as root."
	exit 1
fi

if [ -z "$(which check-language-support)" ]; then
	echo "check-language-support needs to be installed."
	exit 1
fi


missingPackages=$(check-language-support)

if [ -z "$missingPackages" ]; then
	exit 0;
fi

apt-get install $missingPackages

