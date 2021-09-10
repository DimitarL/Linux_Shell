#!/bin/bash

if [[ $# -ne 3 ]]; then
	echo "Arguments must be 3!"
	exit 1
fi

if [[ ! -f $1 ]]; then
	echo "$1 must be file!"
	exit 2
fi

fn=$(egrep $2 /etc/passwd | cut -d':' -f1)

echo "$3 $fn" >> $1

exit 0
