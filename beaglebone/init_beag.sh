# run
#
#	sudo chmod +x init_beag.sh
#
# to make executable.

ifconfig

# prompt user to select Internet interface
echo "Select your Internet interface:"
cd /sys/class/net && select internet in *; do break; done
echo $internet selected

# promp user to select BeagleBone interfac
echo -e "\nSelect your BeagleBone interface:"
cd /sys/class/net && select beagle in *; do break; done
echo $beagle selected

# set up forwarding in iptables
sudo iptables --table nat -I POSTROUTING --out-interface $internet -j MASQUERADE
sudo iptables -I FORWARD --in-interface $beagle -j ACCEPT

# enable forwarding
sudo sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward"

# connect to Beagle
ssh debian@192.168.7.2



#
# Once logged into the BB set up the internet-over-usb settings
#  sudo -i
#  route add default gw 192.168.7.1
#  echo "nameserver 8.8.8.8" >> /etc/resolv.conf
