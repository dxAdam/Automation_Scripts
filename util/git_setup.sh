#!/bin/bash

#
# This script configures git with user.name, user.email, and the credential storer - which allows you to push without entering your username and password after doing it at least once during the session.
#



if [ "$#" -ne 2 ]; then
    echo "This script needs your git user.name and user.email as arguments!"
fi

git config --global user.name $1

git config --global user.email $2

git config --global credential.helper store
