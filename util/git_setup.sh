#!/bin/bash

#
# This script configures git with user.name, user.email, and the credential storer - which allows you to push without entering your username and password after doing it at least once during the session.
#

echo "Enter git username"
read GITUSER
#git config --global user.name $GITUSER

echo "Enter git email"
read GITEMAIL
git config --global user.email $GITEMAIL

git config --global credential.helper store
