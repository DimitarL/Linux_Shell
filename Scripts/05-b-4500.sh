#!/bin/bash
  
if [[ $# -ne 1 ]]; then
    echo "There must be one argument!"
    exit 1
fi

while [[ $(who | egrep $1 | wc -l) -eq 0 ]]; do
	echo "User $1 is not logged!"
	sleep 1
done

echo "User $1 IS logged!"

exit 0
