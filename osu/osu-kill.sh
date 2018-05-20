#!/bin/sh
#
# File:		osu-kill.sh
# Version:	1.0.0
# Author:	Bartosz "Batoshu" Staniek <batoshu@pm.me>
#

export WINEARCH=win32
export WINEPREFIX=$HOME/Wine/osu

echo "Killing osu!..."
wineserver -k
