#!/bin/bash

ps -ef > processes

tail -n +2 processes > processes.tmp && mv processes.tmp processes

IFS="
"

while read f
do
  tmp=$(echo $f | awk '{printf $7}')
  IFS=":"
  time=$(echo $tmp | awk '{printf $2}')
  IFS="
"
  if [ $time -ge 5 ]
  then
    tmp=$(echo $f | awk '{for(i=7;i<=NF;i++) if (i == 7) printf $i "\t"; else printf $i " "}')
    echo $tmp >> foo
  fi
done < processes

while read f
do
  echo $f
done < foo

rm foo
rm processes
