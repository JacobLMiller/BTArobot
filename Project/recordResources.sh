#!/bin/bash
echo "Process start at:"
date

#listOfPIDs=$(pgrep -d , -f turtlebot3_slam_gmapping)
listOfPIDs="12345, 33333, 44444"

IFS=","
read -ra ADDR <<< "$listOfPIDs"
for i in "${ADDR[@]}"; do
echo "$i"
done
IFS=" "

psrecord $listOfPIDs --interval 1 --duration 300 --plot plot1.png &
P1=$!
psrecord $(pgrep -n firefox) --interval 1 --duration 300 --plot plot2.png &
P2=$!
wait $P1 $P2
echo 'Done'
