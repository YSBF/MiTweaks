#!/bin/sh
#
# File:		osu.sh
# Author:	Bartosz "Batoshu" Staniek <batoshu@pm.me>
#

# Disable VSync
export vblank_mode=0
# Change WINE Architecture
export WINEARCH=win32
# Wine prefix
export WINEPREFIX=$HOME/Wine/osu

# osu! directory
osu_directory="$WINEPREFIX/drive_c/users/$USER/Local Settings/Application Data/osu!"
# Command to run before osu! starts
run_before_osu="$HOME/MiTweaks/wacom/wacom-area.sh osu"
# Command to run after osu! exists
run_after_osu="$HOME/MiTweaks/wacom/wacom-area.sh full"

# And finally, start osu! :D
command $run_before_osu
command wine "$osu_directory/osu!.exe" "$@"
command $run_after_osu
