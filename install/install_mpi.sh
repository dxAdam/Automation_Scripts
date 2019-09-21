VERSION=4.0.1

wget https://download.open-mpi.org/release/open-mpi/v4.0/openmpi-$VERSION.tar.gz &&
tar -xf openmpi* &&
cd openmpi-$VERSION &&


./configure --prefix="/home/$USER/.openmpi" &&
make &&
sudo make install


echo export PATH="$PATH:/home/$USER/.openmpi/bin" >> /home/$USER/.bashrc &&
echo export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/home/$USER/.openmpi/lib/">> /home/$USER/.bashrc &&
source /home/$USER/.bashrc


if test -f "openmpi-$VERSION.tar.gz"; then
	rm openmpi-$VERSION.tar.gz
fi


echo -e 'testing ...\n\n'
mpirun --version &&
echo -e '' &&
mpicc --showme:version &&
echo -e '\n\n... openmpi successfully installed'
