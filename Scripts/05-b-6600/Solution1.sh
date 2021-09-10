#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "There must be 1 argument!"
	exit 1
fi

if [[ ! -d $1 ]]; then
	echo "$1 must be directory!"
	exit 2
fi

while read file1; do
	while read file2; do
		if [[ ! -e $file1 || ! -e $file2 ]]; then
			continue
		fi
		if [[ $file1 != $file2 ]]; then
			if cmp $file1 $file2 &>/dev/null; then
				if [[ "$(basename "$file1")" < "$(basename "$file2")" ]]; then
					rm -v $file2
				else
					rm -v $file1
					break
				fi
			fi
		fi
	done< <(find $1 -type f 2>/dev/null)
done< <(find $1 -type f 2>/dev/null)

exit 0
