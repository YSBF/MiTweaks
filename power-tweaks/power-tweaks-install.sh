#
# File:		power-tweaks-install.sh	
# Version:	1.0.0
# Author:	Bartosz "Batoshu" Staniek <batoshu@pm.me>
#

if [[ $EUID != 0 ]]; then
	echo 'This script must be run as root'
	exit 1
fi

# First install programs
echo "Installing required software"
command pacman -Sy --noconfirm powertop tlp thermald

# And do magic
echo "Enabling tlp and thermald deamons"
command systemctl enable tlp.service tlp-sleep.service thermald
echo "Masking systemd-rfkill"
command systemctl mask systemd-rfkill.service systemd-rfkill.socket

# SSD Trim
echo "Enabling SSD Trim"
command systemctl enable fstrim fstrim.timer

# Change TLP config
echo "Changing TLP config"
command rm -f /etc/defaults/tlp
command cp tlp /etc/defaults

echo "Done!"
