#!/bin/sh

#Ubuntu Minimal Install 17.10

echo "welcome to the ubuntu minimal install 17.10 openbox configuration guide for thinkpad x220"
sleep 1
echo "make sure to use this script first - wait for reboot and run the second script to finish..."
sleep 1

#Installs: lightdm, openbox, xorg, compton, spacefm, guake, and more drivers...
apt install sudo apt install lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings openbox obconf obmenu ubuntu-drivers-common mesa-utils-extra compton compton-conf xorg xserver-xorg spacefm guake intel-microcode software-properties-common linux-headers-generic build-essential make -y

clear
echo "run the second script after reboot to finish installing..."
sleep 10
reboot
