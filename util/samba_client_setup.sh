sudo apt install smbclient
sudo apt install cifs-utils
sudo mkdir /media/samba
sudo touch /root/.smbcredentials

echo -e '\nEnter Samba server IP address: '
read smbip

echo -e '\nEnter Samba username: '
read username

echo -e '\nEnter Samba password: '
read -s password

sudo bash -c "echo 'username=$username' >> /root/.smbcredentials"
sudo bash -c "echo 'password=$password' >> /root/.smbcredentials"

# mount shared disk
sudo mount.cifs -v //192.168.1.102/smb-shared /media/samba --verbose -o user=$username,password=$password,domain=WORKGROUP

# auto-mount on boot by adding entry to /etc/fstab
sudo bash -c "echo '//$smbip/smb-shared /media/samba cifs uid=$username,credentials=/root/.smbcredentials,vers=3.0' >> /etc/fstab"
