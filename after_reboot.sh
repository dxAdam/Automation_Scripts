# run this after rebooting once ubuntu_startup.sh has run

# enable overclocking / fan control of GPU ... additional reboot required to take effect
flatpak update &&
nvidia-xconfig -a --cool-bits=28 --allow-empty-initial-configuration

exit 1
