## BeagleBone


### Internet via USB (Linux)

1) Connect BeagleBoard Black to a computer running a Linux OS


2) Clone this repo and enter BeagleBoard directory with  

	`git clone https://github.com/dxadam/Automation_Scripts && cd Automation_Scripts/BeagleBone`  
  

3) Initialize local network forwarding and SSH into BBB with
  
	`sudo ./init_beag.sh`  
  
   (the default password is `temppwd`). 

4) Inside BBB open the file `/etc/network/interfaces` with a text editor and add the *default gateway* and *dns-nameserver* as shown below  
<pre>
    iface usb0 inet static  
        address 192.168.7.2  
        netmask 255.255.255.252  
        network 192.168.7.0  
        gateway 192.168.7.1  
        post-up route add default gw 192.168.7.1  
        dns-nameservers 8.8.8.8
</pre>

5) Restart network interfaces with  
  
	`sudo systemctl restart networking`  
  
6) Test Internet connectivity with  
  
	`ping www.google.com`  
  

