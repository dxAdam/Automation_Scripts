#!/bin/bash

sudo apt install samba samba-common-bin

sudo mkdir /samba

echo -e '\nEnter Samba username: '
read username

sudo adduser $username

sudo smbpasswd -a $username

sudo bash -c "echo -e '[smb-shared]\npath=/samba\nbrowsable=yes\nwritable=yes\ncreate mask=0644\ndirectory mak=0755\nforce user=$username' >> /etc/samba/smb.conf"

sudo chown -R dxadam:dxadam /samba

sudo systemctl restart smbd.service
