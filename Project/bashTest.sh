#!/bin/bash

working=true
while($working)
do
  #sleep 15
  i=$((i+1))
  ((i=i+1))
  let "i=i+1"
  sleep 5

  if [ $i -ge 1 ]; then
    working=false
    echo "I have successfully counted to 5."
  fi
done
