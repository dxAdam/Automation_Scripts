# Adafruit_BBIO installation for Debian/Ubuntu
# https://learn.adafruit.com/setting-up-io-python-library-on-beaglebone-black/installation-on-ubuntu

# dependencies
sudo apt-get install build-essential python-dev python-setuptools python-pip python-smbus -y

# may need dtc depending on distro version - Didn't need to worry about it on Debian Buster 
# http://learn.adafruit.com/introduction-to-the-beaglebone-black-device-tree/compiling-an-overlay

sudo pip install Adafruit_BBIO

# test installation with
sudo python -c "import Adafruit_BBIO.GPIO as GPIO; print GPIO"

# if working something like this will print
#     <module 'Adafruit_BBIO.GPIO' from '/usr/local/lib/python2.7/dist-packages/Adafruit_BBIO/GPIO.so'>

# usage instructions
#     https://learn.adafruit.com/setting-up-io-python-library-on-beaglebone-black/gpio
