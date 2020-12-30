#!/bin/bash

#
# Move aliased scripts to ~/.alias_scripts
#

mkdir /home/$USER/.alias_scripts

cp check_raid.sh ~/.alias_scripts
cp cpubench.sh ~/.alias_scripts
cp gwe.sh ~/.alias_scripts
cp resetsound.sh ~/.alias_scripts
cp git_setup.sh ~/.alias_scripts
cp dpkg-sort.sh ~/.alias_scripts

echo "alias check-raid='/home/$USER/.alias_scripts/check_raid.sh'" >> /home/$USER/.bashrc
echo "alias cpubench='/home/$USER/.alias_scripts/cpubench.sh'" >> /home/$USER/.bashrc
#echo "alias gwe='/home/$USER/.alias_scripts/gwe.sh'" >> /home/$USER/.bashrc
echo "alias git-setup='/home/$USER/.alias_scripts/git_setup.sh'" >> /home/$USER/.bashrc
echo "alias reset-sound='/home/$USER/.alias_scripts/resetsound.sh'" >> /home/$USER/.bashrc
echo "alias dpkg-sort='/home/$USER/.alias_scripts/dpkg-sort.sh'" >> /home/$USER/.bashrc

echo "alias python='python3'" >> /home/$USER/.bashrc

source /home/$USER/.bashrc
