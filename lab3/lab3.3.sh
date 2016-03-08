#!/bin/bash

ps -ef > processes

tail -n +2 processes > processes.tmp && mv processes.tmp processes

IFS="
"

while read f
do
  tmp=`echo $f | cut -d'	' -f7`
  time=`echo $tmp | cut -d':' -f2`
  echo $time
  if [ $time -ge 5 ]
  then
    tmp=`echo $f | cut -d'	' -f7-`
    echo $tmp >> foo
  fi
done < processes

#while read f
#do
  #echo $f
#done < foo

#rm foo
rm processes
