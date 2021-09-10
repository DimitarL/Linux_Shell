#!/bin/bash

if [[ $# -ne 2 ]]; then
	echo "There must be 2 arguments!"
	exit 1
fi

if [[ ! -f $1 ]]; then
	echo "$1 must be file!"
	exit 2
fi

if [[ $(egrep "$2" $1) ]]; then
	echo "YES"
else
	echo "NO"
fi

echo $?

exit 0

