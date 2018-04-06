#!/bin/bash

#Ubuntu Minimal Install 17.10

echo "welcome to the ubuntu minimal install 17.10 openbox configuration guide for thinkpad x220"
sleep 1
echo "this is part 2 of the installation... make sure you have already executed the first portion"
sleep 1

echo "please enter your username"
read USERNAME

apt update

#Extras
apt install ubuntu-restricted-extras ttf-ubuntu-font-family ubuntu-docs -y

#Utilities
apt install gparted synaptic xarchiver network-manager net-tools network-manager-gnome etcher-electron deluge rar unrar p7zip-rar unace unzip sharutils ace p7zip-full xz-utils zip lzma tar gzip -y

#Hardware
apt install tlp tlp-rdw tp-smapi-dkms acpi-call-dkms acpilight lm-sensors conky-all -y

#Appreance
apt install feh git lxappearance lxappearance-obconf papirus-icon-theme -y

#Video/Audio
apt install guvcview vlc browser-plugin-vlc audacity obs-studio  -y

#Productivity
apt install ghostscript texlive-full vim -y

#Graphics
apt install openscad-nightly gimp gimp-data-extras gimp-help-en inkscape -y

#Python3
apt install python3 python3-dev python-pip python3-venv libssl-dev libffi-dev python-dev -y

mkdir ~/.config/openbox

#Printers
echo "would you like to install printer software...?"
PRINT1="yes no"
	select opt2 in $PRINT1; do
		if [ "$opt2" = "no"]; then
			echo "skipping printers"
		elif ["$opt2" = "yes"]; then
			apt install cups cups-bsd cups-client hplip  printer-driver-c2esp printer-driver-foo2zjs printer-driver-min12xxw printer-driver-ptouch printer-driver-pxljr printer-driver-sag-gdi printer-driver-splix -y
		else
			clear
			echo "not an option."
		fi
	done

#sensors
sensors-detect

#wallpaper set
mkdir ~/Pictures/Wallpapers
wget -P ~/Pictures/Wallpapers "https://www.walldevil.com/wallpapers/a23/dark-desktop-ubuntu-themes-tools-leonhartba-theme.jpg"
feh --bg-scale ~/Pictures/Wallpapers/dark-desktop-ubuntu-themes-tools-leonhartba-theme.jpg

#tlp
echo 40 > /sys/devices/platform/smapi/BAT0/start_charge_thresh
echo 60 > /sys/devices/platform/smapi/BAT0/stop_charge_thresh
echo -e "sleep 1\nsudo tlp start &" >> ~/.config/openbox/autostart

#autostart programs...
echo -e "sleep 1\ncompton -b &\nguake &\nsh ~/.fehbg &\nsleep 5\nconky -b &\nspacefm --desktop &" >> ~/.config/openbox/autostart

#acpilight rules
echo -e "SUBSYSTEM=="backlight", ACTION=="add",\nRUN+="/bin/chgrp video %S%p/brightness",\nRUN+="/bin/chmod g+w %S%p/brightness"" > /etc/udev/rules.d/90-backlight.rules
usermod -a -G video "$USERNAME"

#adding /dev/sdb1
echo -e "would you like to mount /dev/sdb1 and make it accessible? type mountsdb1 or skip to continue..."
SDBOPT="mountsdb1 skip"
select opt3 in $SDBOPT; do
	if ["$opt3" = "skip"]; then
		echo skip...
	elif ["$opt3" = "mountsdb1"]; then
		mkdir /media/sdb1
		mount /dev/sdb1 /media/sdb1 -t ext4
		#use sudo blkid to get UUID
		echo -e "/dev/sdb1 /media/sdb1 ext4 defaults 0 0" >> /etc/fstab
		mount -a
		chmod 777 /media/sdb1
		echo done.
	else
		clear
		echo not an option.
	fi
done

#thinkfan
apt install thinkfan
echo -e "options thinkpad_acpi fan_control=1" > /etc/modprobe.d/thinkfan.conf
modprobe thinkpad_acpi
echo -e "START = yes" >> /etc/default/thinkfan
echo -e "tp_fan /proc/acpi/ibm/fan\nhwmon /sys/class/thermal/thermal_zone0/temp\n(0, 0,  60)\n(1, 53, 65)\n(2, 55, 66)\n(3, 57, 68)\n(4, 61, 70)\n(5, 64, 71)\n(7, 68, 32767)" >> /etc/thinkfan.conf

#intel 3000hd screen tearing issues
mkdir /etc/X11/xorg.conf.d/
echo -e "Section "Device" \nIdentifier "Intel Graphics" \nDriver "Intel" \nOption "TearFree" "true" \nEndSection" | tee /etc/X11/xorg.conf.d/20-intel.conf

#synaptic touch pad
apt install xserver-xorg-input-synaptics
echo -e "xinput --set-prop "SynPS/2 Synaptics TouchPad" "Synaptics Noise Cancellation" 20 20 &" >> ~/.config/openbox/autostart

#install arc-darker theme
wget -P ~/Downloads/arc-dark-theme "https://github.com/dglava/arc-openbox/blob/master/arc-darker.obt"
obconf --install ~/Downloads/arc-dark-theme/arc-darker.obt

#openbox configs
wget -P ~/.configs/openbox "https://github.com/eabredder/ubuntu-openbox-setup/blob/master/openbox/rc.xml"
wget -P ~/.configs/openbox "https://github.com/eabredder/ubuntu-openbox-setup/blob/master/openbox/menu.xml"

openbox --reconfigure
openbox --restart

#conky setup
wget "https://github.com/eabredder/ubuntu-openbox-setup/blob/master/.conkyrc"

#end
clear
echo "installation complete"
sleep 5
echo "rebooting..."
echo 3
sleep 1
echo 2
sleep 1
echo 1
sleep 1
echo goodbye!
reboot

