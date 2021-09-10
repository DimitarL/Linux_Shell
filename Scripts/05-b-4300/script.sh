#!/bin/bash

if [[ $# -ne 2 ]]; then
	echo "Arguments must be 2!"
	exit 1
fi

if [[ ! -f $1 ]]; then
	echo "$1 must be file!"
	exit 2
fi

write $(cat $1 | egrep "^$2" | cut -d' ' -f2)

exit 0
