#!/bin/bash
#
# loads gnome terminal settings to file name passed in argument 1.
# If no argument is given a default name is used.
#
if [ $# -eq 0 ]; then
	dconf load /org/gnome/terminal/ < gnome_terminal_settings.conf
else
	dconf dump /org/gnome/terminal/ < $1
fi

exit 0
