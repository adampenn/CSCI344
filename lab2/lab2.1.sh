#!/bin/bash

# Lab 2 bash program - Adam Penn

# Create array to hold diskspace usage
declare -a diskUsage
declare -a names
# Move to faculty folder
cd /user/faculty/

# Go threw list of each user
for i in $( ls )
do
  index=`id -u $i 2>/dev/null`
  diskUsage[$index]=`du -s $i 2>/dev/null | awk '{printf $1}'`
  names[$index]=$i
done

for i in "${diskUsage[@]}"
do
  if [ $i -ge 100 ]
  then
    echo $i
  fi
done
