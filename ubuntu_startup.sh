apt update &&
apt upgrade &&

apt install vim
apt install gnome-tweaks



read -p "Install nvidia drivers? (y/n)?" choice
case "$choice" in 
  y|Y ) add-apt-repository ppa:graphics-drivers/ppa &&
	apt install libnvidia-cfg1-430 &&
	ubuntu-drivers autoinstall &&
        apt autoremove;;
  * ) echo "skipping nvidia drivers";;
esac

