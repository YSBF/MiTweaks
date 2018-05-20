#!/bin/sh
#
# File:		osu.sh
# Version:	1.0.0
# Author:	Bartosz "Batoshu" Staniek <batoshu@pm.me>
#

export vblank_mode=0
export WINEARCH=win32
export WINEPREFIX=$HOME/Wine/osu

osu_directory="$WINEPREFIX/drive_c/users/$USER/Local Settings/Application Data/osu!"
use_optirun=false
run_command=wine "$osu_directory/osu!.exe" "$@"

if [[ use_optirun -eq true ]]; then
	echo "Running osu! with optirun"
	command optirun $run_command
else
	echo "Running osu!"
	command $run_command
fi
