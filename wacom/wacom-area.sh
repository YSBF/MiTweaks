#!/bin/sh
#
# File:		wacom-area
# Author:	Bartosz "Batoshu" Staniek <batoshu@pm.me>
#

if [ $# -lt 1 ]
then
	echo "Invalid use"
	echo "Using: wacom-area [full|osu|info]"
	exit 1
fi

# Some properties, in case if someone would want use this script
# ...or I would change tablet.
tablet="Wacom Intuos S 2 Pen stylus"
area_full="0 0 15200 9500"
area_osu="1900 1188 13300 8313"

# Function to change area to full
function change_to_full() {
	echo "Changing area to full"
	command xsetwacom --set "$tablet" Area $area_full
}

# Function to change area to osu-friendly
function change_to_osu() {
	echo "Changing area to osu-friendly"
	command xsetwacom --set "$tablet" Area $area_osu
}

# Parse arguments
if [ $1 == 'full' ]
then
	change_to_full
elif [ $1 == 'osu' ]
then
	change_to_osu
elif [ $1 == 'info' ]
then
	echo "Tablet:      $tablet"
	echo "Area full:   $area_full"
	echo "Area osu:    $area_osu"
fi

exit 0
