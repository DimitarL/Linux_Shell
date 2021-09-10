#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "There must be 1 argument!"
	exit 1
fi

if [[ ! -d $1 ]]; then
	echo "$1 must be directory!"
	exit 2
fi

sha_sums="$(mktemp)"
duplicated_sums="$(mktemp)"

find "${1}" -type f -exec sha256sum {} \+ 2>/dev/null | tr -s ' ' | sort > "${sha_sums}"
awk '{print $1}' "${sha_sums}" | uniq -c | awk '$1 > 1 { print $2 }' > "${duplicated_sums}"

for sum in $(cat "${duplicated_sums}"); do
	grep "^${sum} " "${sha_sums}" | cut -d ' ' -f 2- \
		| sed -r 's:^.*/([^/]*)$:\1 \0:g' | sort | cut -d ' ' -f 2 \
		| tail -n +2
done | xargs rm -v

rm "${sha_sums}" "${duplicated_sums}"
