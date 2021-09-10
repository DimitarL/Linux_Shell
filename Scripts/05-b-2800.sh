#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "There must be 1 parameter!"
	exit 1
fi

if [[ $1 =~ ^[[:alnum:]]+$ ]]; then
	echo "YES"
else
	echo "NO"
fi

exit 0
