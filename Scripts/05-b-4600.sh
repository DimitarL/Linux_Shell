#!/bin/bash

if [[ $# -ne 3 ]]; then
    echo "There must be 3 arguments!"
    exit 4
fi

if [[ $1 =~ '^[0-9]+$' ]]; then
    echo "$1 must be number!"
    exit 3
elif [[ $2 =~ '^[0-9]+$' ]]; then
    echo "$2 must be number!"
    exit 3
elif [[ $3 =~ '^[0-9]+$' ]]; then
    echo "$3 must be number!"
    exit 3
elif [[ $1 -lt $2 && $1 -gt $3 ]]; then
    exit 2
elif [[ $1 -lt $2 || $1 -gt $2 ]]; then
    exit 1
elif [[ $1 -gt $2 && $1 -lt $3 ]]; then
    exit 0
fi

