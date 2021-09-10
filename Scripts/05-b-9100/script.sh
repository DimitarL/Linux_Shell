#!/bin/bash

if [[ $# -ne 2 ]]; then
	echo "Usage: $0 SOURCE DESTINATION"
	exit 1
elif [[ ! -d $1 || ! -d $2 ]]; then
	echo "Usage: $0 SOURCE DESTINATION"	
	echo "SOURCE & DESTINATION must be directories!"
	exit 2
fi

while read extension; do
	newDirName=$(echo $extension | cut -c 2-)

	mkdir -p $2/$newDirName
	cp $(find $1 -type f -printf "%p\n" | grep $extension) $2/$newDirName
done< <(find $1 -type f -printf "%f\n" | grep -o "\.[[:alnum:]]*" | sort | uniq)

