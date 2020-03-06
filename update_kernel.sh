#!/bin/bash

# Script containing the steps and dependencies required to build a kernel.

# The script will automatically download the latest kernel. But you can 
# downloaded a different kenel by setting the version below and
# commenting/uncommenting lines further below.
#
#VERSION=5.6-rc4

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
	git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
	cd linux
	#wget https://git.kernel.org/torvalds/t/linux-$(VERSION).tar.gz
	#cd linux-$(VERSION)

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
	sudo dpkg -i linux*.deb


# Reboot your computer. Check kernel version using
#
#	uname -r
