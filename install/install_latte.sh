#
# This script removes the default ubuntu dock and replaces it with Latte
#

sudo apt remove gnome-shell-extension-ubuntu-dock &&

sudo apt install latte-dock



# install hidetopbar gnome extension

cd ~/.local/share/gnome-shell/extensions/
git clone https://github.com/mlutfy/hidetopbar.git hidetopbar@mathieu.bidon.ca
cd hidetopbar@mathieu.bidon.ca
make schemas
cd ..
gnome-shell-extension-tool -e hidetopbar@mathieu.bidon.ca
gnome-shell --replace &
