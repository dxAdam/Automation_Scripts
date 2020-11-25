#!/bin/bash

#
# Use this format for timing programs execution
#


T="$(date +%s%N)"

#./script.sh args
#sleep 5 

T="$(($(date +%s%N)-T))"
T=$((T/1000000))

echo "time: ${T} milliseconds"
