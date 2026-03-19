#!/bin/bash
source /opt/ros/humble/setup.bash
source /workspace/install/setup.bash
export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
export CYCLONEDDS_URI=file:///workspace/src/unitree_ros2/cyclonedds.xml
exec bash
