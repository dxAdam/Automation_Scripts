#!/bin/bash
#
# script: ubuntu_setup.sh
#    
#  Runs on a new Ubuntu installation to install and configure
#  desired software. Designed around Ubuntu Desktop 18.04 LTS but should
#  work with 18.10 and 19.04 as well. 
#
# author: Adam Grusky
#
# date: July 2019
#
# usage:  
#
#  ubuntu_setup.sh can be run as a script. You may need to make it executable 
#  with
#  
#       sudo chmod +x ubuntu_setup.sh
#
#  and then execute with
#
# 	sudo ./ubuntu_setup.sh
#
# notes:
#
#  This script installs applications, packages, and tools that I typically
#  use on a new Ubuntu Desktop installation. Some of the more system
#  specific installations (graphics drivers and gaming related apps/packages)
#  ask the user if they would like to install or not, but most will install 
#  by default.
#
#
#
#  This script can easily be modified by removing (comment out with "#") or
#  adding lines for desired configurations and installations
#
#  
#
#  Alternatively the commands of this script can be manually executed line by
#  line in a terminal allowing greater visibility to what each individual
#  command does and returns - useful for troubleshooting or learning purposes 
#
#
#
#  AMD/Nvidia GPU note: currently only the option to install Nvidia GPU drivers
#  exists in the script because it is the same across Ubuntu 18.04, 18.10, 
#  and 19.04. I do not have an AMD GPU to test with, but Ubuntu 18.04 LTS has
#  the AMD open source drivers installed by default. 
# 
#


# Checks if this script was ran as root
#
if [[ $EUID -ne 0 ]]; then
   echo -e "This script must be run as root!\nhint: use 'sudo !!' to run a previously entered command with root priveleges" 
   exit 1
fi

HOMEDIR=`echo ~/`
echo $HOMEDIR

SAVEDUSER=${HOMEDIR#"/home/"}
SAVEDUSER=${SAVEDUSER::-1}


#
# update currently installed packages
#
echo -e "\n\n--checking for updates\n\n"
apt update &&
apt upgrade &&



#
# Vim is a lightweight, configurable text editor 
#
echo -e "\n\n--installing vim\n\n"
apt install vim



#
# mdadm is a Linux utility used to manage and monitor software RAID devices (and allows them to be detected by file managers) 
#
echo -e "\n\n--installing mdadm\n\n"
apt install mdadm



#
# exfat-utils gives support for exFAT formatted storage (typical of flash drives over 32GB)
#
echo -e "\n\n--installing exfat-utils\n\n"
apt install exfat-utils



# GNOME Tweaks allows further customization of the Gnome environment (only
#  useful if using GNOME desktop environment)
#
echo -e "\n\n--installing gnome-tweaks\n\n"
apt install gnome-tweaks



#
# Caffeine prevents the system from sleeping and its displays from turning off
#  (useful if listening to music or monitoring a web page etc..) 
#
echo -e "\n\n--installing caffeine\n\n" 
apt-get install caffeine



#
# Psensor displays different hardware sensor readings
#
echo -e "\n\n--installing psensor\n\n"
apt-get install psensor



#
# net-tools allows the use of networking information commands like "ifconfig"
#
echo -e "\n\n--installing net-tools\n\n"
apt-get install net-tools



#
# htop shows system resources and processes in a terminal environment
#
echo -e "\n\n--installing htop\n\n"
apt-get install htop



#
# Discord is a popular voice/chat application
#
echo -e "\n\n--installing discord\n\n"
snap install discord



#
# grub-customizer allows customization of the GNU GRUB boot loader
#  (useful when multiple bootable partitions exist on a disk)
#
echo -e "\n\n--installing grub-customizer\n\n"
add-apt-repository ppa:danielrichter2007/grub-customizer
apt-get update
apt-get install grub-customizer



#
# Dropbox is a cloud storage platform
#
echo -e "\n\n"
read -p "--install Dropbox? (y/n): " choice 
case "$choice" in
 y|Y ) echo -e "\n\n--installing dropbox\n\n"
       cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - &&
       # we need to run     ~/dropbox-dist/dropboxd   in another terminal   -- will do in after_reboot.sh
       touch /etc/rc.local
       bash -c "echo "/home/$USER/.dropbox-dist/dropboxd" >> /etc/rc.local" # configures to start service on boot
       chmod +x /etc/rc.local;;
esac



#
# Nvidia GPU drivers are needed in systems that contain Nvidia discrete 
#  graphics hardware (AMD driver installation coming soon - more notes at top
#  of script)
#
echo -e "\n\n"
read -p "--install Nvidia GPU drivers? (y/n): " choice
case "$choice" in 
  y|Y ) add-apt-repository ppa:graphics-drivers/ppa &&
	apt purge --autoremove '*nvidia*' && 
	ubuntu-drivers autoinstall && # installs recommended nvidia drivers for detected hardware

	# detected hardware and recommended drivers can be displayed with 
        # the "ubuntu-drivers devices" command

	# to install a specific driver version run
	#   sudo apt install nvidia-driver-XXX
        # where XXX is the desired version number

	# example:
	#   sudo apt install nvidia-driver-430
        # (run this instead of "ubuntu-drivers autoinstall")

	# the lines below install a tool called "GreenWithEnvy" that allows
	# monitoring/overclocking of the GPU. Some features require Nvidia 
	# "coolbits" to be set which is done in the "after_reboot.sh" script

	# The Github repo includes a script named "gwe.sh" to launch 
	# GreenWithEnvy (remember to make executable with 
	#  sudo chmod +x gwe.sh
	# )	
        
	apt install flatpak && # flatpak is used to install GWE
	apt install gnome-software-plugin-flatpak &&
	flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo &&
        flatpak update &&
	flatpak install flathub com.leinardi.gwe;;
esac



#
# Steam is a video game distribution platform
#
echo -e "\n\n"
read -p "--install Steam? (y/n): " choice
case "$choice" in
 y|Y ) echo -e "\n\n--installing steam\n\n"
       dpkg --add-architecture i386
       apt update
       apt upgrade
       apt install wget gdebi-core libgl1-mesa-dri:i386 libgl1-mesa-glx:i386
       wget http://media.steampowered.com/client/installer/steam.deb
       gdebi steam.deb;;
esac



#
# WINE is a compatibility layer often used to run Windows applications
#
echo -e "\n\n"
read -p "--install Wine? (y/n): " choice
case "$choice" in
 y|Y ) echo -e "\n\ninstalling Wine\n\n"
       sudo support/install_wine.sh;;
esac



#
# Vulkan is a graphics API used by many different games
#
echo -e "\n\n"
read -p "--install Vulkan? (required for some games) (y/n): " choice
case "$choice" in
 y|Y ) echo -e "\n\ninstalling Vulkan\n\n"
       apt install vulkan-utils
       apt install libvulkan1 libvulkan1:i386                       # nvidia
       #apt install mesa-vulkan-drivers mesa-vulkan-drivers:i386    # amd/intel
       ;;
esac



#
# Lutris is used to install different games and gaming applications like Battle.net and Origin
#
echo -e "\n\n"
read -p "--install Lutris? (y/n): " choice
case "$choice" in
 y|Y ) echo -e "\n\ninstalling Lutris\n\n"
       add-apt-repository ppa:lutris-team/lutris
       apt-get update
       apt-get install lutris;;

       # start Lutris and search for and install games via the "Search Lutris.net" button
esac



#
# Retroarch is an is a manager for game system emulators and ROMs
#
echo -e "\n\n"
read -p "--install Retroarch? (y/n): " choice
case "$choice" in
 y|Y ) echo -e "\n\ninstalling Retroarch\n\n"
       apt install retroarch
       gnome-terminal -- retroarch
       sleep 1
       killall retroarch
       chown -R $SAVEDUSER ~/.config/retroarch
       unzip install/retroarch_bios_pack.zip -d ~/.config/retroarch/bios/
       sed -i 's,system_directory = "default",system_directory = ".config/retroarch/bios"', ~/.config/retroarch/retroarch.cfg
esac

apt update
apt upgrade
apt autoremove # removes dependencies no longer needed



exit 1
