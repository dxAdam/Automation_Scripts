#!/bin/bash
#
# run this after rebooting once ubuntu_startup.sh has run
#
# you may need to run "sudo chmod +x after_reboot.sh" to make executable 
#
# note: if running the Nvidia GPU overclocking program "Green With Envy" (GWE) and most features
# are grayed out it means the coolbits didn't set. It's possible the drivers overwrote the X11
# config once fully configured/installed from additonal updates. Try running this script again
# and checking GWE after reboot.


#
# Check script was ran as root
#

if [[ $EUID -ne 0 ]]; then
   echo -e "This script must be run as root!\nhint: use 'sudo !!' to run a previously entered command with root priveleges" 
   exit 1
fi


# enable overclocking / fan control of GPU ... additional reboot required to take effect
flatpak update &&
sudo nvidia-xconfig -a --cool-bits=28 --allow-empty-initial-configuration


/home/$USER/.dropbox-disk/dropboxd

exit 1
