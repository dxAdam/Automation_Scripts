#!/bin/bash


# 
# Before running this script insert the Guest Additions media.
#
# From the VB menu select Devices -> Insert Guest Additions CD Image...
#




VM=$(sudo lshw -c system | grep -c "VirtualBox")

if [ $VM -eq 1 ]
then
        echo -e "\n\ninstalling VirtualBox Guest Additions\n\n"

        # Mount cdrom
	sudo mkdir /media/cdrom
        sudo mount /dev/cdrom /media/cdrom
        cd /media/cdrom

        # Install dependencies
        sudo apt-get install -y dkms build-essential linux-headers-generic linux-headers-$(uname -r)

        sudo ./VBoxLinuxAdditions.run
        exit

else
	echo -e "\n Did you insert the Guest Additions media??\n  Devices->Insert Guest Additions CD Image...\n"
fi

echo -e "\nfinished normally"

