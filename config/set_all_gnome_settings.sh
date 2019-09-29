#!/bin/bash
#
# loads gnome terminal settings to file name passed in argument 1.
# If no argument is given a default name is used.
#
if [ $# -eq 0 ]; then
	dconf load / < gnome_terminal_settings.conf
else
	dconf load / < $1
fi

exit 0
