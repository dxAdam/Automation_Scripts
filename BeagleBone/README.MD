## BeagleBone


### Setting up internet connectivity via usb (Linux)

1) Connect BeagleBoard Black to a computer running a Linux OS

2) ssh into BBB with  
		`ssh debian@192.168.7.2`
  
   the default password is `temppwd` 
  
3) open the file '/etc/network/interfaces' and add the two lines at end shown below  
  `iface usb0 inet static  
	address 192.168.7.2  
	netmask 255.255.255.252  
	network 192.168.7.0  
	gateway 192.168.7.1  
	post-up route add default gw 192.168.7.1  
	dns-nameservers 8.8.8.8  
`
