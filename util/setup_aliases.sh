#!/bin/bash

#
# Move aliased scripts to ~/.bash_alias_scripts
#

#mkdir ~/.bash_alias_scripts

cp check_raid.sh ~/.bash_alias_scripts
cp cpubench.sh ~/.bash_alias_scripts
cp gwe.sh ~/.bash_alias_scripts
cp resetsound.sh ~/.bash_alias_scripts
cp git_setup.sh ~/.bash_alias_scripts


echo "alias check_raid='/home/$USER/.bash_alias_scripts/check_raid.sh'" >> /home/$USER/.bashrc
echo "alias cpubench='/home/$USER/.bash_alias_scripts/cpubench.sh'" >> /home/$USER/.bashrc
echo "alias gwe='/home/$USER/.bash_alias_scripts/gwe.sh'" >> /home/$USER/.bashrc
echo "alias git setup='/home/$USER/.bash_alias_scripts/git_setup.sh'" >> /home/$USER/.bashrc
echo "alias reset sound='/home/$USER/.bash_alias_scripts/resetsound.sh'" >> /home/$USER/.bashrc
