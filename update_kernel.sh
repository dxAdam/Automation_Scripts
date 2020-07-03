#!/bin/bash

# Script containing the steps and dependencies required to build a kernel.

# The script will install the kernel version specified below. But the 
# script can easily be modified to download the most recent kernel by
# commenting/uncommenting lines below.
#

VERSION=5.6-rc4

# Install dependencies with
#
	sudo apt-get install git fakeroot build-essential ncurses-dev \
		xz-utils libssl-dev bc flex libelf-dev bison

# and make a build directory with
#
	mkdir kernel_build
	cd kernel_build


# Download kernel from https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 
# or use
#
	#AUTO
	#git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
	#cd linux
	
	#MANUAL
	wget https://git.kernel.org/torvalds/t/linux-$VERSION.tar.gz
	cd linux-$VERSION
	tar xvf linux-$VERSION.tar.gz


# Copy the current kernel's config
#
	sudo cp /boot/config-$(uname -r) .config


# Adapt old config to this kernel with
#
	yes '' | make oldconfig
#
# and optionally make changes with
#
#	make menuconfig

# Clean up directory with
#
	make clean


# Build the kernel with
#
	make -j `getconf _NPROCESSORS_ONLN` deb-pkg
#
# This will take a while.


# Finally install the kernel with
#
	cd ../

	#AUTO
	#sudo dpkg -i linux*.deb

	#MANUAL
	sudo dpkg -i linux-$VERSION.deb


# Reboot your computer. Check kernel version using
#
#	uname -r


# Notes:
#  If your gui won't boot due to graphics drivers issues or another reason
#  but you can still get to a terminal you can try a few different things
# 
#  1) Uninstall your graphics drivers. If using Nvidia this would be a command like
#
#	sudo apt uninstall nvidia-drivers*
#
#  2) Uninstall the kernel you just installed with
#
#	sudo apt remove linux-image*
#	sudo apt remove linux-headers*
