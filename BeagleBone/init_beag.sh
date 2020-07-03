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
sudo iptables --table nat --append POSTROUTING --out-interface $internet -j MASQUERADE
sudo iptables --append FORWARD --in-interface $beagle -j ACCEPT

# enable forwarding
sudo sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward"

# connect to Beagle
ssh debian@192.168.7.2
