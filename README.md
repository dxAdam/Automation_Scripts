# Util
#### This repo contains scripts for setting up a new install of Ubuntu 18.04/18.10/19.04 with common applications and configurations I use, as well as scripts automating frquently performed actions. 

## Instructions
After installing Ubuntu install git with  
	`sudo apt install git`  
and clone repo with  
	`git clone https://github.com/dxadam/util`

Run  
	`sudo ./ubuntu_setup.sh`

Reboot the system and then run  
	`sudo ./after_install.sh`

### ubuntu_setup.sh
Sets up a new install of Ubuntu Desktop 18.04/18.10/19.04 with desired applications and configurations

### after_reboot.sh
Contains additional commands that must be run after a system reboot
