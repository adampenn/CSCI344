#!/bin/bash

# Lab 2 bash script

# Move to my home dir
cd ../../../

# Go threw each sub folder of the above mentioned dir and find the size
for i in $( ls )
do
  echo `du -s $i | awk '{printf $1}'` >> filesize
done

# Flag for seeing if the bigfile file needs to be removed
rmBig=false

# go threw bigfile and see if they are a certain size
while read f
do
  if [ $f -ge 5 ]
  then
    rmBig=true
    echo $f >> bigfile
  fi
done <filesize

# Print out the contents of bigfile
while read f
do
  echo $f
done <bigfile

# remove the files that I used to store things
if [ "$rmBig" ]
then
  rm bigfile
fi
rm filesize

