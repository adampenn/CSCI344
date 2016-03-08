#!/bin/bash

declare -a time

ps -ef > processes

tail -n +2 processes > processes.tmp && mv processes.tmp processes

IFS="
"

while read f
do
  index=$(echo $f | awk '{printf $3}') 
  #echo $index
  #echo $f
  time[$index]=$(echo $f | awk '{printf $7 "\t" $8}')
done < processes

  #index=`$i | awk '{printf $2}'` 
  #time[$index]=`$i | awk '{printf $7}'`
  #name[$index]=`$i | awk '{printf $8}'`

for i in "${!time[@]}"
do
  echo ${time[$i]}
done

#rm processes
