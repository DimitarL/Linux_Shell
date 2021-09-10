#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "There must be 1 argument!"
	exit 1
fi

red=0
green=0
blue=0

if [[ $1 =~ -r ]]; then
	red=1
elif [[ $1 =~ -g ]]; then
	green=1
elif [[ $1 =~ -b ]]; then
	blue=1
fi

while read line; do
	if [[ $red -eq 0 && $green -eq 0 && blue -eq 0 ]]; then
		echo "$line"
	elif [[ $red -eq 1 ]]; then
		echo -e "\033[0;31m $line"
		echo -e "\033[0m"
		red=0
		green=1
	elif [[ $green -eq 1 ]]; then
	    echo -e "\033[0;32m $line"
		echo -e "\033[0m"
	    green=0
	    blue=1
	elif [[ $blue -eq 1 ]]; then
	    echo -e "\033[0;34m $line"
		echo -e "\033[0m"
	    blue=0
	    red=1
	fi
done

echo -e "\033[0m"

