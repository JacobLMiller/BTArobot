#!/bin/bash
echo "Process start at:"
date

#listOfPIDs=$(pgrep firefox)
listOfPIDs=$(pgrep -d , -f turtlebot3_slam_gmapping)
#listOfPIDs="12345, 33333, 44444"
otherList=$(pgrep -d , -f -n turtlebot3_gazebo)
#otherList=$(pgrep firefox)

i=0

working=true
while($working) do

  ((i=i+1))
  sleep 2

  psrecord $listOfPIDs --interval 1 --duration 120 --log dir_out/Alog${i}.txt --plot dir_out/Aplot${i}.png &
  P1=$!
  psrecord $otherList --interval 1 --duration 120 --log dir_out/Blog${i}.txt --plot dir_out/Bplot${i}.png &
  P2=$!
  wait $P1 $P2

  #rosrun map_server map_saver -f ~/map${i}

  if [ $i -ge 30 ]; then
    working=false
    echo "I'm gettting out of the loop."
  fi
done


echo 'Completed at: '
date
