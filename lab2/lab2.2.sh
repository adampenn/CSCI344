#!/bin/bash

# Lab 2 bash program - Adam Penn

# Create array to hold diskspace usage
declare -a diskUsage
declare -a names

# Have user input what dir to look at
echo "Please enter the dir you want to inspect"
read dir

# Move to specified folder
cd $dir


# Go threw list of each user
for i in $( ls -a )
do
  index=`id -u $i 2>/dev/null`
  diskUsage[$index]=`du -s $i 2>/dev/null | awk '{printf $1}'`
  names[$index]=$i
done

# Have user deside what not to display
echo "Please enter the minimum disk usage you want to display"
read size

# remove all items that do not meet the size requirment
for i in "${!diskUsage[@]}"
do
  if [ ${diskUsage[$i]} -lt $size ]
  then
    unset diskUsage[$i]
    unset names[$i]
  fi
done

index=1
for i in "${!diskUsage[@]}"
do
  echo $index " " ${diskUsage[$i]} " " ${names[$i]}
  index=$[index+1]
done

# ask if they would like to remove a dir
echo "Would you like to remove a dir? Y/N"
read yn

# Check to see if they said yes
if [ $yn == "y" ] || [ $yn == "Y" ]
then

  # ask to select and relist items
  echo "Which one?"
  index=1
  for i in "${!diskUsage[@]}"
  do
    echo $index " " ${diskUsage[$i]} " " ${names[$i]}
    index=$[index+1]
  done
  read dirToRm

  # remove slected dir
  index=1
  for i in "${diskUsage[@]}"
  do
    if [ $index -eq $dirToRm ]
    then
      `rm -rf $i`
    fi
    index=$[index+1]
  done  
  
fi

echo "Have a great day"


