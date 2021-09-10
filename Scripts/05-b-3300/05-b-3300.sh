#!/bin/bash

if [[ $# -ne 3 ]]; then
	echo "Wrong number of arguments!"
	exit 1
fi

if [[ ! -f $1 ]]; then
	echo "$1 must be file!"
	exit 2
fi 

if [[ ! -f $2 ]]; then
    echo "$2 must be file!"
    exit 3
fi

if [[ ! -f $3 ]]; then
    echo "$3 must be file!"
    exit 4
fi

cat "${1}" "${2}" | sort > "${3}"

exit 0
