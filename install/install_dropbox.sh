#
# Dropbox is a cloud storage platform
#
echo -e "\n\n"
read -p "--install Dropbox? (y/n)? : " choice
case "$choice" in
 y|Y ) echo -e "\n\n--installing dropbox\n\n"
       cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - &&
       gnome-terminal -e ~/.dropbox-dist/dropboxd
       touch /etc/rc.local
       bash -c "echo "/home/$USER/.dropbox-dist/dropboxd" >> /etc/rc.local" # configures to start service on boot
       chmod +x /etc/rc.local;;
esac

