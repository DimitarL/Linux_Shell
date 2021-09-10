#!/bin/bash

if [[ $# -ne 2 ]]; then
	echo "Usage: $0 DIRECTORY NUMBER"
fi

find $1 -type f -printf "%f %s \n" | awk -v var="${2}" '{if($2 > var) print $1}'
