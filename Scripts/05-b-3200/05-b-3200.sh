#!/bin/bash

read -p "Input directory: " path

echo "Files: $(find $path -type f 2>/dev/null| wc -l)"
echo "Directories: $(find $path -mindepth 1 -type d 2>/dev/null | wc -l)"

exit 0
