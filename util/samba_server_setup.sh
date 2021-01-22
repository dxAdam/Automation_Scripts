#!/bin/bash

apt install samba samba-common-bin

mkdir /samba

echo -e '\nEnter Samba username: '
read username

adduser $username

smbpasswd -a $username

echo -e '\Enter shared drive name: '
read drivename

echo -e '\Enter shared drive mount path: '
read drivepath

bash -c "echo -e '[$drivename]\npath=$drivepath\nbrowsable=yes\nwritable=yes\ncreate mask=0644\ndirectory mask=0755\nforce user=$username' >> /etc/samba/smb.conf"

chown -R $username:$username $drivepath

systemctl restart smbd.service
