#!/bin/bash
echo "Process start at:"
date

listOfPIDs=$(pgrep firefox)
#listOfPIDs=$(pgrep -d , -f turtlebot3_slam_gmapping)
#listOfPIDs="12345, 33333, 44444"
#otherList=$(pgrep -d , -f -n turtlebot3_gazebo)
otherList=$(pgrep firefox)

working=true
while($working) do

  i=$((i+1))
  ((i=i+1))
  let "i=i+1"
  sleep 5

  psrecord $listOfPIDs --interval 1 --duration 20 --plot Aplot${i}1.png &
  P1=$!
  psrecord $otherList --interval 1 --duration 20 --plot Bplot${i}2.png &
  P2=$!
  wait $P1 $P2

  #rosrun map_server map_saver -f ~/map${i}

  if [ $i -ge 5 ]; then
    working=false
    echo "I have successfully counted to 5."
  fi
done


echo 'Completed at: '
date
