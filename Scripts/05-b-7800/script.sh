#!/bin/bash

cnt=0

while read line; do
	if [[ $(cd $line) -eq 0 ]]; then
		cnt=$(( $cnt + 1 ))
	fi

done< <(echo $PATH | tr ':' '\n' | tr -s ' ' | tr -d ' ')

echo $cnt
