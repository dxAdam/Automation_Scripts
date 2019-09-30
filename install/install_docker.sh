#
# This script installs docker. These steps follow those found at
#  https://docs.docker.com/install/linux/docker-ce/ubuntu/
#

# remove any old versions that may exist
sudo apt-get remove docker docker-engine docker.io containerd runc &&

sudo apt-get update &&

# install packages to allow apt to use a repo over HTTPS
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common &&

# add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&

# verify key with fingerprint
sudo apt-key fingerprint 0EBFCD88 &&

 add repo
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable" &&

# update apt-get again with new repo
sudo apt-get update &&

# install latest Docker Engine - Community
sudo apt-get install docker-ce docker-ce-cli containerd.io &&


echo -e "\n\nDocker installation complete. Run\n\n\tsudo docker run hello-world\n\nto test"

exit 0
