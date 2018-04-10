#!/bin/sh

#Ubuntu Minimal Install 17.10

#Installs: lightdm, openbox, xorg, compton, spacefm, guake, and more drivers...
apt install sudo apt install lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings openbox obconf obmenu ubuntu-drivers-common mesa-utils-extra compton compton-conf xorg xserver-xorg spacefm guake intel-microcode software-properties-common linux-headers-generic build-essential make -y

reboot
