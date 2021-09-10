#!/bin/bash

touch log.txt

for arg; do
	if [[ $arg =~ -r ]]; then
		continue
	elif [[ -f $arg ]]; then
		rm $arg
		echo "$(date +[%Y-%m-%d\ %T]) Removed file $arg" >> log.txt
		continue
	elif [[ -d $arg && $(find $arg -mindepth 1 | wc -l) -eq 0 ]]; then
		rm -r $arg
		echo "$(date +[%Y-%m-%d\ %T]) Removed directory $arg" >> log.txt
    	continue
	elif [[ -d $arg && $1 =~ -r ]]; then
        rm -r $arg
        echo "$(date +[%Y-%m-%d\ %T]) Removed directory recursively $arg" >> log.txt
	fi
done

