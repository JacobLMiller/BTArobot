#!/bin/bash
echo "Getting PIDs"
pgrep -d , -f turtlebot3_slam

IFS=","
var="1234,5678,2222"
myArray=()
read -ra ADDR <<< "$var"
for i in "${ADDR[@]}"; do
  myArray+=("$i")
done
IFS=" "

#  end=(${!myArray[@]})
#  end=${end[@]: -1}
#  echo $end
#  echo ${myArray[${#myArray[@]} - 1]}
#  echo ${array[@]: -1}
printf "%s\n" "${myArray[@]}"
