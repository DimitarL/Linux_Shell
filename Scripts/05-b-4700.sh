#!/bin/bash
  
if [[ $# -ne 1 && $# -ne 2 ]]; then
    echo "There must be 1 or 2 arguments!"
    exit 1
fi

var=$(echo $1 | rev | sed 's/\([0-9]\{3\}\)/\1,/g' | rev) 

if [[ $var =~ ^, ]]; then
	echo $var | cut -c 2-
else
	echo $var
fi

exit 0
