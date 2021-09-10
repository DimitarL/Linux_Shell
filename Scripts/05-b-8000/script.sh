#!/bin/bash

while read line; do
	echo $line
	
	rss=$(echo $line | cut -d ' ' -f 1)
	vsz=$(echo $line | cut -d ' ' -f 2)

	echo "scale=2; $rss / $vsz " | bc

done< <(ps -u $1 -o rss,vsz | tr -s ' ' | tail -n +2 | sort -rn -k2)

