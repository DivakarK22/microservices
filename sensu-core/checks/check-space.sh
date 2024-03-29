#!/bin/bash
#Test commit
Path=$1
value=$2
percentage=$(df -Th $Path | head -n 2 | tail -n 1 | cut -c 49-50)

if [ "$percentage" -ge $value ]; then
    echo "Disk Space in $Path is Higher than 17"
    exit 2
else
    echo "Disk Space is Normal"
    exit 0
fi