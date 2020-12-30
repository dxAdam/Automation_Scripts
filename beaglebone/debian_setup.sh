#
# Configures a new installation of Debian Buster running on a BeagleBone.
#

# set up wifi
read -p "Connect to wireless network? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then

    echo -e "\nEnter wireless network name:"
    read network_name

    echo -e "\nEnter passphrase:"
    read -s passphrase

    touch NAME.config
    echo "[service_$network_name]" >> NAME.config
    echo "Type = wifi" >> NAME.config
    echo "Name = $network_name" >> NAME.config
    echo "Passphrase = $passphrase" >> NAME.config

    sudo mv NAME.config /var/lib/connman/NAME.config
    
    # should automatically connect if a wireless adapter is installed
fi


