# ubuntu-openbox-setup
Install scripts and settings for current openbox on Thinkpad x220

[Ubuntu Minimal Install 17.10](http://archive.ubuntu.com/ubuntu/dists/artful/main/installer-amd64/current/images/netboot/mini.iso)

The install script will create the **autostart** file based on the programs being installed. It downloads the **.conkyrc** config file into the' home' directory to get started. It will also download and place the **rc.xml** and **menu.xml** files in **~/.configs/openbox** directory.

This script is mainly for the Thinkpad x220, including hardware optimization.

To run Part 1:
```
wget https://github.com/eabredder/ubuntu-openbox-setup/blob/master/installbash1.sh
chmod u+x installbash1.sh
sudo ./installbash1.sh
```
To run Part 2:
```
wget https://github.com/eabredder/ubuntu-openbox-setup/blob/master/installbash2.sh
chmod u+x installbash2.sh
sudo ./installbash2.sh
```
Get the repo:
```
git clone https://github.com/eabredder/ubuntu-openbox-setup
```

Resources:

[McDonnell Tech x220 Ubuntu Guide](http://x220.mcdonnelltech.com/ubuntu/)

[McDonnell Tech x220 Information](http://x220.mcdonnelltech.com/)

[McDonnell Tech T420s Information](http://mcdojf.wixsite.com/t420s)

Firmware for x220 and t420s updates are located in repository under 'BIOS'
