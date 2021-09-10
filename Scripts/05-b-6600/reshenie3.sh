#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "There must be 1 argument!"
	exit 1
fi

if [[ ! -d $1 ]]; then
	echo "$1 must be directory!"
	exit 2
fi

comm -13 \
	<(find "$1" -type f -exec bash -c \
		'sha256sum "{}" | tr -d "\n" ; echo " $(basename "{}")"' \; | tr -s ' ' | \
		sort -k3 -k1 | uniq -w 64 -c | sed 's/^\s*//g' | cut -d ' ' -f 3 | sort) \
	<(find "$1" -type f | sort) \
	| xargs rm -v
