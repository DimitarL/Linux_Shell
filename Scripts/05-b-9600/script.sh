#!/bin/bash

mkdir -p BACKUP_DIR

for arg; do
	fileName=$(echo ${arg})_$(date +%Y-%m-%d-%H-%M-%S)

	if [[ $arg =~ -r ]]; then
		continue
	elif [[ -f $arg ]]; then
		mv $arg BACKUP_DIR/$fileName
		gzip BACKUP_DIR/$fileName
		echo "Removed file $arg"
		continue
	elif [[ -d $arg && $(find $arg -mindepth 1 | wc -l) -eq 0 ]]; then
		tar -czf BACKUP_DIR/$fileName.tar.gz $arg --remove-files
		echo "Removed directory $arg"
		continue
    elif [[ -d $arg && $1 =~ -r ]]; then
        tar -czf BACKUP_DIR/$fileName.tar.gz $arg --remove-files
		echo "Removed directory recursively $arg"
	fi
done

