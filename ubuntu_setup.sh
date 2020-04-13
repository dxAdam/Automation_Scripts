#!/bin/bash
#
# script: ubuntu_setup.sh
#    
#  Runs on a new Ubuntu installation to install and configure
#  desired software. Tested on Ubuntu 18.04 through 20.04
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
#  pre 20.04 graphics drivers note:
#  Currently only the option to install Nvidia GPU drivers
#  exists in the script because it is the same across Ubuntu 18.04, 18.10, 
#  and 19.04. I do not have an AMD GPU to test with, but Ubuntu 18.04 LTS has
#  the AMD open source drivers installed by default. 
# 
#



#
# Checks if this script was ran as root, which it should NOT be. This is so creating/modifying directories (as one example)
#  do not appear under /root/...
#
if [[ $EUID -ne 0 ]]; then
  echo -e "\nRunning ubuntu_setup.sh\n"
else
  echo "This script should not be ran as sudo"
  exit 1
fi



#
# update currently installed packages
#
echo -e "\n\n--checking for updates\n\n"
sudo apt update &&
sudo apt upgrade &&



#
# Vim is a lightweight, configurable text editor 
#
echo -e "\n\n--installing vim\n\n"
sudo apt install vim



#
# mdadm is a Linux utility used to manage and monitor software RAID devices (and allows them to be detected by file managers) 
#
echo -e "\n\n--installing mdadm\n\n"
sudo apt install mdadm



#
# exfat-utils gives support for exFAT formatted storage (typical of flash drives over 32GB)
#
echo -e "\n\n--installing exfat-utils\n\n"
sudo apt install exfat-utils



# GNOME Tweaks allows further customization of the Gnome environment (only
#  useful if using GNOME desktop environment)
#
echo -e "\n\n--installing gnome-tweaks\n\n"
sudo apt install gnome-tweaks



#
# Caffeine prevents the system from sleeping and its displays from turning off
#  (useful if listening to music or monitoring a web page etc..) 
#
echo -e "\n\n--installing caffeine\n\n" 
sudo apt-get install caffeine



#
# Psensor displays different hardware sensor readings
#
echo -e "\n\n--installing psensor\n\n"
sudo apt-get install psensor



#
# net-tools allows the use of networking information commands like "ifconfig"
#
echo -e "\n\n--installing net-tools\n\n"
sudo apt-get install net-tools



#
# htop shows system resources and processes in a terminal environment
#
echo -e "\n\n--installing htop\n\n"
sudo apt-get install htop



#
# Discord is a popular voice/chat application
#
echo -e "\n\n--installing discord\n\n"
sudo snap install discord



#
# grub-customizer allows customization of the GNU GRUB boot loader
#  (useful when multiple bootable partitions exist on a disk)
#
echo -e "\n\n--installing grub-customizer\n\n"
sudo add-apt-repository ppa:danielrichter2007/grub-customizer
sudo apt-get update
sudo apt-get install grub-customizer



#
# Python is a programming language.
#
echo -e "\n\n--installing python2"
sudo apt-get install python2
sudo apt-get install python-pip
sudo apt-get install python-apt



#
# Visual Studio Code is a light weight coding IDE / text editor
#
echo -e "\n\n--installing visual studio code"
sudo apt update
sudo apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code



#
# Dropbox is a cloud storage platform
#
echo -e "\n\n"
read -p "--install Dropbox? (y/n): " choice 
case "$choice" in
 y|Y ) echo -e "\n\n--installing dropbox\n\n"
       cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - &&
       # we need to run     ~/dropbox-dist/dropboxd   in another terminal   -- will do in after_reboot.sh
       sudo touch /etc/rc.local
       bash -c "echo "/home/$USER/.dropbox-dist/dropboxd" >> /etc/rc.local" # configures to start service on boot
       sudo chmod +x /etc/rc.local;;
esac



# 
# Flatpak is a package manager that supports Ubuntu
#

sudo apt install flatpak && # flatpak is used to install GWE
sudo apt install gnome-software-plugin-flatpak &&



#
# Nvidia GPU drivers are needed in systems that contain Nvidia discrete 
#  graphics hardware (AMD driver installation coming soon - more notes at top
#  of script) Note: 20.04 comes with drivers pre-installed.
#
echo -e "\n\n"
read -p "--install Nvidia GPU drivers? (y/n): " choice
case "$choice" in 
  y|Y ) sudo add-apt-repository ppa:graphics-drivers/ppa &&
	sudo apt purge --autoremove '*nvidia*' && 
	sudo ubuntu-drivers autoinstall && # installs recommended nvidia drivers for detected hardware

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
        
	sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo &&
        sudo flatpak update &&
	sudo flatpak install flathub com.leinardi.gwe;;
esac



#
# Steam is a video game distribution platform
#
echo -e "\n\n"
read -p "--install Steam? (y/n): " choice
case "$choice" in
 y|Y ) echo -e "\n\n--installing steam\n\n"
       sudo dpkg --add-architecture i386
       sudo apt update
       sudo apt upgrade
       #apt install wget gdebi-core libgl1-mesa-dri:i386 libgl1-mesa-glx:i386
       #wget -E http://media.steampowered.com/client/installer/steam.deb 
       #gdebi steam.deb
       sudo apt install steam;
esac



#
# WINE is a compatibility layer often used to run Windows applications
#
echo -e "\n\n"
read -p "--install Wine? (y/n): " choice
case "$choice" in
 y|Y ) echo -e "\n\ninstalling Wine\n\n"
       sudo install/install_wine.sh;;
esac



#
# Vulkan is a graphics API used by many different games
#
echo -e "\n\n"
read -p "--install Vulkan? (required for some games) (y/n): " choice
case "$choice" in
 y|Y ) echo -e "\n\ninstalling Vulkan\n\n"
       sudo apt install vulkan-utils
       sudo apt install libvulkan1 libvulkan1:i386                       # nvidia
       apt install mesa-vulkan-drivers mesa-vulkan-drivers:i386         # amd/intel
       ;;
esac



#
# Lutris is used to install different games and gaming applications like Battle.net and Origin
#
echo -e "\n\n"
read -p "--install Lutris? (y/n): " choice
case "$choice" in
 y|Y ) echo -e "\n\ninstalling Lutris\n\n"
       sudo add-apt-repository ppa:lutris-team/lutris
       sudo apt-get update
       sudo apt-get install lutris;;

       # start Lutris and search for and install games via the "Search Lutris.net" button
esac


echo -e "\n\n --installing sound input/output device, gsconnect, and hidetopbar extensions - requires gnome restart to become active"

cp -r install/gsconnect@andyholmes.github.io ~/.local/share/gnome-shell/extensions/

cp -r install/gsconnect@andyholmes.github.io ~/.local/share/gnome-shell/extensio
ns/

cp -r install/gsconnect@andyholmes.github.io ~/.local/share/gnome-shell/extensio
ns/

sudo apt update
sudo apt upgrade
sudo apt autoremove # removes dependencies no longer needed



exit 1
