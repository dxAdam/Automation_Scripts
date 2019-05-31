#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi



echo -e "\n\n--checking for updates\n\n"
apt update &&
apt upgrade &&



echo -e "\n\n--installing vim\n\n"
apt install vim



echo -e "\n\n--installing gnome-tweaks\n\n"
apt install gnome-tweaks



echo -e "\n\n--installing dropbox\n\n"
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - &&
gnome-terminal -e ~/.dropbox-dist/dropboxd
echo "~/.dropbox-dist/dropboxd" >> /etc/rc.local
chmod +x /etc/rc.local



echo -e "\n\n"
read -p "--install nvidia drivers? (y/n)? : " choice
case "$choice" in 
  y|Y ) add-apt-repository ppa:graphics-drivers/ppa &&
	apt install libnvidia-cfg1-430 &&
	ubuntu-drivers autoinstall &&
	apt install flatpak &&
	apt install gnome-software-plugin-flatpak &&
	flatpak install flathub com.leinardi.gwe &&
	flatpak update
  	apt install vulkan vulkan-utils
	apt autoremove;;
  * ) echo -e "\n\n--skipping graphic drivers";;
esac


echo -e "\n\n--installing cpufreq gnome extenstion\n\n"
./install_cpufreq.sh



echo -e "\n\n--installing steam\n\n"
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install wget gdebi-core libgl1-mesa-dri:i386 libgl1-mesa-glx:i386
wget http://media.steampowered.com/client/installer/steam.deb
sudo gdebi steam.deb



echo -e "\n\n--installing caffeine\n\n"
apt-get install caffeine



echo -e "\n\n--installing net-tools (ifconfig)\n\n"
apt-get install net-tools

