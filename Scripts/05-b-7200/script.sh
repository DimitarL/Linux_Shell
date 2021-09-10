#!/bin/bash

for arg; do
	if [[ -f "${arg}" && -r "${arg}" ]]; then
		echo ""${arg}" is readable file!"
	elif [[ -d "${arg}" ]]; then
		numOfFiles=$(find "${arg}" -type f | wc -l)
		find "${arg}" -type f -printf "%f %s\n" | awk -v var="${numOfFiles}" '{if($2<var) print $1}'	
	fi
done
