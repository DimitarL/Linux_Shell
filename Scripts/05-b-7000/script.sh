#!/bin/bash

if [[ $# -ne 1 || -z $1 ]]; then
    echo "Usage: ./script.sh STRING"
    exit 1
fi

while read line; do
	if [[ ! -f $line ]]; then
		echo "You can input only files!"
	else
		echo $1
		echo "Number of lines containing the string: $(grep "${1}" "${line}" 2>/dev/null | wc -l)"
	fi
done
