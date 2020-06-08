#!/bin/bash

MSG="Usage $0 <directory> <string>"
FILE="/tmp/output.txt"

if [ $# -ne 2 ]; then
    echo "script should contains 2 arguments"
    echo ${MSG}
    exit 1
fi

if [ -d "$1" ] && [ -n "$2" ]; then
    for i in $(grep -rl "$2" "$1"); 
    do
       echo $(basename $i) >> $FILE; 
    done
       awk '{printf("%s,",$0)} NR % 10 == 0 { print ""; }' $FILE | sed 's/,$//g'; 
else
    echo ${MSG}
fi

rm -f $FILE
