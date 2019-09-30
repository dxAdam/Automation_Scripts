#!/bin/bash
#
# Saves all gnome settings to file name passed in argument 1.
# If no argument is given a default name is used.
#
if [ $# -eq 0 ]; then
	dconf dump / > gnome_settings.conf
else
	dconf dump / > $1
fi

exit 0
