#!/bin/bash

if [[ $# -ne 2 ]]; then
	echo "Usage: $0 directory number"
	exit 1
fi

if [[ ! -d $1 ]]; then
	echo "Usage: $0 directory number"
	exit 2
fi

numberRegex='^[0-9]+$'

if [[ ! $2 =~ $numberRegex ]]; then
   echo "Error! $2 must be number!"
	exit 3
fi

find $1 -type f -printf "%s\n" | awk -v sum=0 -v var=$2 '{if($1>var) sum += $1} END{print sum}'

