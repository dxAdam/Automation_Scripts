ifconfig

echo "Select your internet interface:"
cd /sys/class/net && select internet in *; do break; done

echo $internet selected

echo ""
echo "Select your BeagleBone interface:"
cd /sys/class/net && select beagle in *; do break; done

echo $beagle selected



sudo iptables --table nat --append POSTROUTING --out-interface $internet -j MASQUERADE
sudo iptables --append FORWARD --in-interface $beagle -j ACCEPT

sudo /sbin/sysctl -w net.ipv4.ip_forward=1
sudo /sbin/sysctl -w net.ipv6.conf.all.forwarding=1

ssh debian@192.168.7.2
