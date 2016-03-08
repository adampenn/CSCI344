#!/bin/bash

declare -a time
declare -a name

for i in [ `ps -ef | awk '{printf $2 "\t" $7 "\t" $8 "\n"}'` ]
do
   echo $i
   index=$(echo $i | awk '{printf $1}')
   #echo $index
   #time[$index]=$(echo $i | awk '{printf $2 "\t" $3}')
done

#ps -ef > processes

#while read f
#do
#  echo $f
#  index=`$f | awk '{printf $2}'` 
  #echo $index
  #time[$index]=`$f | awk '{printf $7}'`
#done < processes

  #index=`$i | awk '{printf $2}'` 
  #time[$index]=`$i | awk '{printf $7}'`
  #name[$index]=`$i | awk '{printf $8}'`

for i in "${!time[@]}"
do
  echo ${time[$i]}
done

#rm processes
