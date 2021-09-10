#!/bin/bash

if [[ $# -ne 1 && $# -ne 2 ]]; then
	echo "Wrong number of arguments!"
	exit 1
fi

if [[ ! -d $1 ]]; then
	echo "$1 must be directory!"
	exit 2
fi

all="$(mktemp)"

if [[ $# -eq 2 && $2 =~ -a ]]; then
	find $1 -mindepth 1 1>$all 2>/dev/null
else
	find $1 -mindepth 1 ! -name ".*" 1>$all 2>/dev/null
fi

while read line; do
	if [[ -f $line ]]; then
		find $(dirname $line) -name $(basename $line) -printf "%f (%s bytes)\n" 2>/dev/null
	else
		echo "$(basename $line) ($(find $line -mindepth 1 2>/dev/null | wc -l) entries)"
	fi
done < $all

rm "${all}"
