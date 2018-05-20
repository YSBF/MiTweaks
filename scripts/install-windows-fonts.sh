#!/bin/sh
#
# File:		install-windows-fonts.sh
# Version:	1.0.0
# Author:	Bartosz "Batoshu" Staniek <batoshu@pm.me>
#

if [[ $EUID != 0 ]]; then
	echo "This script must be run as root"
	exit 1
fi

if [[ $# -lt 1 ]]; then
	echo "Usage: install-windows-fonts <windows_drive>"
	echo "windows_drive may be folder or device"
	exit 2
fi

UNMOUNT=false

if [[ $1 == /dev/* ]]; then
	# Mount
	command mkdir -p /mnt/windrive
	command mount $1 /mnt/windrive
	WINPATH=/mnt/windrive
	UNMOUNT=true
else
	WINPATH=$1
fi

command mkdir /usr/share/fonts/WindowsFonts
command cp $WINPATH/Windows/Fonts/* /usr/share/fonts/WindowsFonts
command chmod 755 /usr/share/fonts/WindowsFonts/*

command fc-cache -f

if [[ UNMOUNT ]]; then
	command umount $1
fi
