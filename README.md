# Automation Scripts
#### This repo contains scripts for setting up a new installation of Ubuntu 18.04/18.10/19.04 with common applications and configurations I use, as well as scripts automating frequently performed actions. 

## Instructions
1. After installing Ubuntu install git with  
	`sudo apt install git`  
and clone repo with  
	`git clone https://github.com/dxadam/Automation_Scripts`

2. Run  
	`sudo ./ubuntu_setup.sh`

3. Reboot and run  
	`sudo ./after_reboot.sh`

### ubuntu_setup.sh
Runs on Ubuntu Desktop 18.04/18.10/19.04 to install desired applications and configurations

### after_reboot.sh
Contains additional commands that must be run after a system reboot
