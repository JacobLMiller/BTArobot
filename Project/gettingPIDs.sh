#!/bin/bash
echo "Getting PIDs"
pgrep -d , -f turtlebot3_slam

IFS=","
var="1234,5678,2222"
read -ra ADDR <<< "$var"
for i in "${ADDR[@]}"; do
  echo "$i"
done
IFS=" "
#
