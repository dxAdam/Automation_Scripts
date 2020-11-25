#
# Installs virtualbox guest additions
#
# !!! Insert guest additons cd  Devices->Insert Guest Additions CD image

sudo apt update
sudo apt install build-essential module-assistant
m-a prepare
cd /media/cdrom
sh ./VboxLinuxAdditions.run

echo "Guest additions installed - reboot now"
