#!/bin/bash

#
# This script installs the Yuzu Nintendo Switch emulator in Ubuntu.
#


# install dependencies
sudo apt install libsdl2-dev
sudo apt install build-essential
sudo apt install cmake git
sudo apt install libqt5webenginewidgets5 libsndio-dev qtbase5-dev libqt5opengl5-dev

# This should already be installed
#sudo ln -T /usr/lib/x86_64-linux-gnu/libsndio.so.7.0 /usr/lib/x86_64-linux-gnu/libsndio.so.6.1


# get download link
KEYLINK=$(base64 -d yuzukeyhash)
wget $KEYLINK

# make keys directory and move keys there
mkdir /home/$USER/.local/share/yuzu
mkdir /home/$USER/.local/share/yuzu/keys/
mv keys*.txt /home/$USER/.local/share/yuzu/keys/prod.keys

# download Yuzu
echo -e "\nDownloading latest Yuzu version"
wget https://github.com/yuzu-emu/yuzu-mainline/releases/download/mainline-0-225/yuzu-linux-20200412-42d6eb332.tar.xz


# extract and move to home directory
tar -xf yuzu*.tar.xz
rm yuzu*.tar.xz
mv yuzu-linux-* /home/$USER/yuzu-linux


cd /home/$USER/yuzu-linux
echo -e 'alias yuzu="vblank_mode=0 mesa_glthread=true MESA_GL_VERSION_OVERRIDE=4.5COMPAT  home/$USER/yuzu-linux/yuzu"' >> /home/$USER/.bashrc
source /home/$USER/.bashrc


echo -e "\nInstallation complete - run 'yuzu' to launch.

