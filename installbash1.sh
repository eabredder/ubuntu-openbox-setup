#!/bin/bash

#Ubuntu Minimal Install 17.10

echo "welcome to the ubuntu minimal install 17.10 openbox configuration guide for thinkpad x220"
sleep 1
echo "make sure to use this script first - wait for reboot and run the second script to finish..."
sleep 1

#GRUB
echo "video=SVIDEO-1:d" >> /etc/default/grub
update-grub $$ update-grub2

#Repos
add-apt-repository -y ppa:papirus/papirus 
add-apt-repository -y ppa:linrunner/tlp
add-apt-repository -y ppa:otto-kesselgulasch/gimp
add-apt-repository -y ppa:inkscape.dev/stable
add-apt-repository -y ppa:ubuntuhandbook1/audacity
add-apt-repository -y ppa:obsproject/obs-studio
add-apt-repository -y ppa:atareao/atareao
echo -e "deb http://download.opensuse.org/repositories/home:/stevenpusser/xUbuntu_17.10/ /" | tee -a /etc/apt/sources.list.d/home:stevenpusser.list
wget -nv https://download.opensuse.org/repositories/home:/stevenpusser/xUbuntu_17.10/Release.key -O Release.key | apt-key add - < Release.key
wget -qO - http://files.openscad.org/OBS-Repository-Key.pub | apt-key add -
echo -e "deb http://download.opensuse.org/repositories/home:/t-paul/xUbuntu_17.10/ ./" | tee -a /etc/apt/sources.list.d/openscad.list
echo -e "deb https://dl.bintray.com/resin-io/debian stable etcher" | tee -a /etc/apt/sources.list.d/etcher.list
apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 379CE192D401AB61

apt update

#Installs: lightdm, openbox, xorg, compton, spacefm, guake, and more drivers...
apt install sudo apt install lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings openbox obconf obmenu ubuntu-drivers-common mesa-utils-extra compton compton-conf xorg xserver-xorg spacefm guake intel-microcode software-properties-common linux-headers-generic build-essential make -y

openbox --reconfigure

clear
echo "run the second script after reboot to finish installing..."
sleep 10
reboot
