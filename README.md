# Util
#### This repo contains scripts for setting up a new installation of Ubuntu 18.04/18.10/19.04 with common applications and configurations I use, as well as scripts automating frequently performed actions. 

## Instructions
1. After installing Ubuntu install git with  
	`sudo apt install git`  
and clone repo with  
	`git clone https://github.com/dxadam/util`

2. Make scripts executable with  
	`sudo chmod +x ubuntu_setup.sh`
	`sudo chmod +x after_reboot.sh`

3. Run  
	`sudo ./ubuntu_setup.sh`

4. Reboot and run  
	`sudo ./after_reboot.sh`

### ubuntu_setup.sh
Sets up a new install of Ubuntu Desktop 18.04/18.10/19.04 with desired applications and configurations

### after_reboot.sh
Contains additional commands that must be run after a system reboot
