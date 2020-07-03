#!/bin/bash

#
# This script hides mounted drives from appearing on the dock. They still show up in file explorers as usual
#

gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
