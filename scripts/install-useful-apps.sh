#!/bin/sh
#
# File:		install-useful-apps.sh
# Author:	Bartosz "Batoshu" Staniek <batoshu@pm.me>
#

command sudo pacman -Syu --noconfirm make automake aufoconf gcc patch binutils git wget curl expanc pyalpm python python-regex python-requests fakeroot

# Install aurman
command cd /tmp
command git clone https://aur.archlinux.org/packages/aurman.git
command cd aurman
command makepkg -si


