#!/bin/bash

if [[ $# -ne 2 ]]; then
    echo "There must be 2 arguments!"
    exit 1
fi

if [[ ! -f $1 ]]; then
    echo "$1 must be file!"
    exit 2
fi

if [[ ! -d $2 ]]; then
    echo "$2 must be directory!"
    exit 3
fi

numLines=$(cat $1 | wc -l)

while read line; do
	if [[ $(cat $line | wc -l) -eq $numLines ]]; then
		if [[ $(comm -12 $1 $line | wc -l) -eq $numLines ]]; then
			echo $line	
		fi
	fi
done< <(find $2 -type f 2>/dev/null)

exit 0
