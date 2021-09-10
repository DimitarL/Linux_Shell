#!/bin/bash

if [[ $# -ne 1 && $# -ne 2 ]]; then
	echo "Wrong number of arguments!"
	exit 1
fi

if [[ $# -eq 1 && $1 =~ -l ]]; then
	while read line; do
		echo $line | cut -d'/' -f2 | cut -d '.' -f 1 | tr '-' '/' | sed -r 's/_(....\/..\/..)\/(..)\/(..)\/(..)/ (\1 \2:\3:\4)/'

	done< <(find BACKUP_DIR -mindepth 1)
fi

if [[ $# -eq 1 && ! $1 =~ -l ]]; then
	mv BACKUP_DIR/$(find BACKUP_DIR | cut -d '/' -f2 | egrep "^$1_") .
	mv $(echo $(find * -maxdepth 0 | egrep "^$1_")) $(echo $(find * -maxdepth 0 | egrep -o "^$1_" | egrep -o "^$1"))
#	if [[ -f $1 ]]; then
#		gzip -d $1
#	else
#       tar -xzf $1
#	fi
elif [[ $# -eq 2 && -d $2 ]]; then
    mv BACKUP_DIR/$(find BACKUP_DIR | cut -d '/' -f2 | egrep "^$1_") .
    mv $(echo $(find * -maxdepth 0 | egrep "^$1_")) $(echo $(find * -maxdepth 0 | egrep -o "^$1_" | egrep -o "^$1"))
	mv $1 $2/
fi

