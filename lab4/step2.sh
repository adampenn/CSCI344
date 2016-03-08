#!/bin/bash

ownerperm=0

filename=$1
#for i in `seq 2 $#` 
#do
#  x=$"$i"
#  y=$"$x"
#  echo $2
#  echo $x
#  echo $y
  #if [ $(($i))="write" ]
#done

if [ $# -ge 2 ]
then
  if [ "$2" == "write" ]
  then
    ownerperm=$((ownerperm + 2))
  elif [ "$2" = "read" ]
  then
    ownerperm=$((ownerperm + 4))
  elif [ "$2" == "execute" ]
  then
    ownerperm=$((ownerperm + 1))
  fi
fi

if [ $# -ge 3 ]
then
  if [ "$3" == "write" ]
  then
    ownerperm=$((ownerperm + 2))
  elif [ "$3" == "read" ]
  then
    ownerperm=$((ownerperm + 4))
  elif [ "$3" == "execute" ]
  then
    ownerperm=$((ownerperm + 1))
  fi
fi

if [ $# -ge 4 ]
then
  if [ "$4" == "write" ]
  then
    ownerperm=$((ownerperm + 2))
  elif [ "$4" == "read" ]
  then
    ownerperm=$((ownerperm + 4))
  elif [ "$4" == "execute" ]
  then
    ownerperm=$((ownerperm + 1))
  fi
fi

ownerperm=$((ownerperm * 100))

chmod $ownerperm $filename

ls -l
