#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Wrong number of arguments!"
	exit 1
fi

if [[ ! $(cut -d':' -f1 /etc/passwd | egrep $1) ]]; then
	echo "There is no such user!"
	exit 2
fi

numOfProcesses=$(ps -e -u $1 | tail -n +2 | wc -l)

while read pid; do
	echo "Process is killed!"

#	kill -s SIGTERM ${cpid}
#   sleep 2
#   kill -s SIGKILL ${cpid}

done< <(ps -e -u $1 | tail -n +2 | tr -s ' ' | cut -d' ' -f2)

echo $numOfProcesses
