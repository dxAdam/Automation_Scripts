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


echo -e "\n\n--installing mdadm\n\n" #for RAID1
apt install mdadm


echo -e "\n\n--installing gnome-tweaks\n\n"
apt install gnome-tweaks


echo -e "\n\n--installing caffeine\n\n"
apt-get install caffeine


echo -e "\n\n--installing net-tools (ifconfig)\n\n"
apt-get install net-tools


echo -e "\n\n--installing discord\n\n"
snap install discord


echo -e "\n\n--installing cpufreq gnome extenstion\n\n"
support/install_cpufreq.sh



echo -e "\n\n"
read -p "--install Dropbox? (y/n)? : " choice
case "$choice" in
 y|Y ) echo -e "\n\n--installing dropbox\n\n"
       cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - &&
       gnome-terminal -e ~/.dropbox-dist/dropboxd
       touch /etc/rc.local
       bash -c "echo "~/.dropbox-dist/dropboxd" >> /etc/rc.local"
       chmod +x /etc/rc.local;;
esac



echo -e "\n\n"
read -p "--install Nvidia drivers? (y/n)? : " choice
case "$choice" in 
  y|Y ) add-apt-repository ppa:graphics-drivers/ppa &&
	apt install libnvidia-cfg1-430 &&
	ubuntu-drivers autoinstall &&
	apt install flatpak &&
	apt install gnome-software-plugin-flatpak &&
	flatpak install flathub com.leinardi.gwe &&
	flatpak update
  	apt install vulkan vulkan-utils;;
esac



echo -e "\n\n"
read -p "--install Steam? (y/n)? : " choice
case "$choice" in
 y|Y ) echo -e "\n\n--installing steam\n\n"
       dpkg --add-architecture i386
       apt update
       apt install wget gdebi-core libgl1-mesa-dri:i386 libgl1-mesa-glx:i386
       wget http://media.steampowered.com/client/installer/steam.deb
       gdebi steam.deb;;
esac



echo -e "\n\n"
read -p "--install Wine? (y/n)? : " choice
case "$choice" in
 y|Y ) echo -e "\n\ninstalling Wine\n\n"
       support/install_wine.sh;;
esac



echo -e "\n\n"
read -p "--install Vulkan? (y/n)? : " choice
case "$choice" in
 y|Y ) echo -e "\n\ninstalling Vulkan\n\n"
       apt install libvulkan1 libvulkan1:i386;;                     # nvidia
       #apt install mesa-vulkan-drivers mesa-vulkan-drivers:i386    # amd/intel
esac



echo -e "\n\n"
read -p "--install Lutris? (y/n)? : " choice
case "$choice" in
 y|Y ) echo -e "\n\ninstalling Lutris\n\n"
       add-apt-repository ppa:lutris-team/lutris
       apt-get update
       apt-get install lutris;;

       # start Lutris and search for and install games via the "Search Lutris.net" button
esac




apt autoremove

