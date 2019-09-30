#
# PGI does not allow wget of their community edition due to licensing issues
#
# 1. Download from:
#
#       https://www.pgroup.com/products/community.htm
#
#
# 2. Set version and download path
#
     VERSION=19.4
     DLPATH=/home/$USER/Downloads
#
# 3. Execute:
#
#    ./install_PGI.sh
#

cd $DLPATH
mkdir pgilinux &&
mv pgilinux*.tar.gz pgilinux &&
cd pgilinux

tar xpfz pgilinux*.tar.gz &&

sudo ./install


echo 'export PGI=/opt/pgi' >> /home/$USER/.bashrc
echo 'export PATH=/opt/pgi/linux86-64/'$VERSION'/bin:$PATH' >> /home/$USER/.bashrc

# source ~/.bashrc must be ran outside of this shell session to work
echo -e "\n\nPGI installed\n\nRun\n\tsource /home/$USER/.bashrc\n\nto load PATH."
echo -e "\n\nTest by checking compiler version with\n\tpgcc --version\n"
