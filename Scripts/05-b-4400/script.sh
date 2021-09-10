#!/bin/bash

if [[ $# -ne 1 && $# -ne 2 ]]; then
	echo "There must be 1 or 2 arguments!"
	exit 1
fi

if [[ ! -d $1 ]]; then
	echo "$1 must be directory!"
	exit 2
fi

if [[ $# -eq 2 && ! -d $2 ]]; then
	echo "$2 must be directory!"
	exit 3
fi

if [[ $# -eq 1 ]]; then
	newdir=$(date | cut -d' ' -f2,3 | tr -d ' ')
	mkdir $newdir
	cp $(find $1 -type f -cmin -45 2>/dev/null) $(echo $newdir)
else
	cp $(find $1 -type f -cmin -45 2>/dev/null) $2
fi

read -p "Do you want to add the new file to archive? [yes/no] " answer
if [[ $answer =~ yes ]]; then
	tar -cf $(echo $newdir).tar $(echo $newdir)
fi

exit 0
