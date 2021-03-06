#!/bin/bash
#
# Checks if this script was ran as root
#

if [[ $EUID -ne 0 ]]; then
   echo -e "This script must be run as root!\nhint: use 'sudo !!' to run a previously entered command with root priveleges" 
   exit 1
fi
dpkg --add-architecture i386 
wget -nc https://dl.winehq.org/wine-builds/winehq.key
apt-key add winehq.key

#get codename (ex: disco, cosmic, etc)
CODENAME=`lsb_release --codename | cut -f2`

#get release (18.10, 19.04, etc)
RELEASE=`lsb_release --release | cut -f2`

#install libfaudio0 if >=19.04
if [ $RELEASE == "19.04" -o $RELEASE == "19.10" ]; then
        dpkg -i --force-depends libfaudio0_19.11-0~disco_i386.deb;
fi

apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ '$CODENAME' main'

wget -O- -q https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_$RELEASE/Release.key | sudo apt-key add -

apt update
apt install --install-recommends winehq-staging
apt install libgnutls30:i386 libldap-2.4-2:i386 libgpg-error0:i386 libxml2:i386 libasound2-plugins:i386 libsdl2-2.0-0:i386 libfreetype6:i386 libdbus-1-3:i386 libsqlite3-0:i386

