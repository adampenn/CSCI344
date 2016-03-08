#!/bin/bash

echo "Enter the name of the file: "
read filename
echo "Do you want to allow read permission? "
read readperm
echo "Do you want to allow write permission? "
read writeperm
echo "Do you want to allow execute permission? "
read execperm

ownerperm=0

if [ $readperm="yes" ]
then
  ownerperm=4
fi

if [ "$writeperm" == "yes" ]
then
  ownerperm=$((ownerperm + 2))
fi

if [ $execperm == "yes" ]
then
  ownerperm=$((ownerperm + 1))
fi

ownerperm=$((ownerperm * 100))

chmod $ownerperm $filename
