#!/bin/bash

level=0
maxLevel=0

while read line; do
	if [[ $line = '{' ]]; then
		level=$(( $level + 1 ))
	fi

	if [[ $line = '}' ]]; then
		if [[ $level -gt $maxLevel ]]; then
			maxLevel=$level
		fi
		level=$(( $level - 1 ))
	fi
done < <(cat $1 | grep -o . | grep '[{}]')

echo "${maxLevel}"
