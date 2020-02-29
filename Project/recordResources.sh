#!/bin/bash
echo "Process start at:"
date

#listOfPIDs=$(pgrep firefox)
listOfPIDs=$(pgrep -d , -f turtlebot3_slam_gmapping)
#listOfPIDs="12345, 33333, 44444"
otherList=$(pgrep -d , -f -n turtlebot3_gazebo)

var="2222222"

working=true
while($working) do
  sleep 15
  i=$((i+1))
  ((i=i+1))
  let "i=i+1"
  sleep 5
  
  working=false
done

psrecord $listOfPIDs --interval 1 --duration 20 --plot plot${var}1.png &
P1=$!
psrecord $otherList --interval 1 --duration 20 --plot plot2.png &
P2=$!
wait $P1 $P2

rosrun map_server map_saver -f ~/map${var}
echo 'Completed at: '
date
