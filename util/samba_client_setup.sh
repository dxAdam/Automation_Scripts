sudo apt install smbclient
sudo apt install cifs-utils

echo -e '\nEnter Samba server IP address: '
read smbip

echo -e '\nEnter Samba username: '
read username

echo -e '\nEnter Samba password: '
read -s password

echo -e '\nEnter shared drive name: '
read drivename

echo -e '\nEnter shared drive mount path: '
read drivepath

sudo mkdir /media/$drivename
sudo touch /root/.smbcredentials

sudo bash -c "echo 'username=$username' >> /root/.smbcredentials"
sudo bash -c "echo 'password=$password' >> /root/.smbcredentials"

# mount shared disk
sudo mount.cifs -v //$smbip/$drivename $drivepath --verbose -o user=$username,password=$password,domain=WORKGROUP

# auto-mount on boot by adding entry to /etc/fstab
sudo bash -c "echo '//$smbip/$drivename $drivepath cifs uid=$username,credentials=/root/.smbcredentials,vers=3.0' >> /etc/fstab"

sudo umount $drivepath
sudo mount $drivepath
