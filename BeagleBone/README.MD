## BeagleBone


### Internet via USB

#### Linux

1) Clone this repo and enter BeagleBoard directory with  

	`git clone https://github.com/dxadam/Automation_Scripts && cd Automation_Scripts/BeagleBone`  
  

2) Initialize local network forwarding and SSH into BBB with
  
	`./init_beag.sh`  
  
   (the default password is `temppwd`). 


#### Windows

1) Open Network Connections and locate Internet and BeagleBone Black adapters

2) Right click Internet adapter and select properties - enable Internet Connection Sharing under the Sharing tab

3) Right click BBB adapter and select properties - enter the following IPV4 manual settings:
<pre>  
  IP address: 192.168.7.1  
  Subnet mask: 255.255.255.0  
  Preferred DNS Server: 8.8.8.8  
</pre>

#### Beagle Bone

1) Inside BBB open the file `/etc/network/interfaces` with a text editor and add the *default gateway* and *dns-nameserver* as shown below  
<pre>
    iface usb0 inet static  
        address 192.168.7.2  
        netmask 255.255.255.252  
        network 192.168.7.0  
        gateway 192.168.7.1  
        post-up route add default gw 192.168.7.1  
        dns-nameservers 8.8.8.8
</pre>

2) Reboot BBB to reset interfaces or run  
  
	`sudo /opt/scripts/network/usb_linux_usb*`  
   
   to make the above changes to this session.
  
3) Test BBB Internet connectivity and address resolution with  
  
	`ping www.google.com`  
  

