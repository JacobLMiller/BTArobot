#!/bin/bash
#roslaunch turtlebot3_gazebo turtlebot3_house.launch &
roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=gmapping &

wait 15
roslaunch turtlebot3_gazebo turtlebot3_simulation.launch &
