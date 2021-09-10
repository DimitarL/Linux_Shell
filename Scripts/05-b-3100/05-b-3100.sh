#!/bin/bash

read -p "Enter your username: " username

who | awk -v un=${username} '$1 == un' | wc -l

exit 0
