#!/bin/bash

numberToGuess=$(( (RANDOM % 100) + 1 ))
tries=0

while read -p "Guess?" number; do
	tries=$(( tries += 1 ))

	if [[ $number -eq $numberToGuess ]]; then
		echo "RIGHT! Guessed $numberToGuess in $tries tries!"
		break
	elif [[ $number -lt $numberToGuess ]]; then
		echo "...bigger!"
	else
		echo "...smaller!"
	fi
done
