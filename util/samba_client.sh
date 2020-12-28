sudo apt install smbclient
sudo apt install cifs-utils
sudo mkdir /media/samba
sudo touch /root/.smbcredentials

echo "enter samba username: "
read username

echo "enter samba password: "
read password

echo "enter samba server IP"
read smbip

sudo echo -e "username= $username" >> /root/.smbcredentials
sudo echo -e "password= $password" >> /root/.smbcredentials

sudo mount -t cifs -o rw,vers=3.0,credentials=/root/.smbcredentials //$smbip/smb-share /media/samba 

sudo echo "//$smbip/share /media/share cifs vers=3.0,credentials=/.smbcredentials" >> /etc/fstab
