#!/bin/bash
#
# This script is a work in progress of some common programming related
# applications and packages I often use.
#
# This script does not install software already
# installed from ubuntu_setup.sh
#

sudo apt update &&
sudo apt upgrade &&


# check that build-essential tools are installed (all required to compile .deb)
echo -e "\n\n--verifying build-essential installation\n\n"
sudo apt install build-essential &&


# valgrind is a common tool used to detected memory management errors
echo -e "\n\n--installing valgrind\n\n" &&
sudo apt install valgrind


# openmp is a multithreading library for C, C++, and Fortran
echo -e "\n\n--installing openMP\n\n" &&
sudo apt install libomp-dev &&


# install vscode
echo -e "\n\n--installing vscode\n\n"
sudo snap install --classic code &&


#
# MPI (Message Passing Interface) is a message passing library
#   used in high performance and distributed computing
#
echo -e "\n\n"
read -p "--install openmpi (MPI)? (y/n)? : " choice
case "$choice" in
 y|Y ) echo -e "\n\n--installing openmpi\n\n"
       sudo apt install openmpi-bin &&
esac


#
# Paraview is a visualizer application useful for viewing 
#   computed surfaces
#
echo -e "\n\n"
read -p "--install Paraview (~640Mb) (y/n)? : " choice
case "$choice" in
 y|Y ) echo -e "\n\n--installing Paraview\n\n"
       sudo apt install paraview &&
esac



#
# more to come
#
