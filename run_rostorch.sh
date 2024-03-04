#!/bin/bash

sudo docker run -it --rm -p 6081:6081 --privileged --runtime nvidia --device=/dev/ttyACM0 --group-add dialout --group-add input -v ~/entrypoint.sh:/root/entrypoint.sh -v /dev:/dev -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/student_ws:/root/ros2_ws/src/student_ws --entrypoint /root/entrypoint.sh --name racecar_hw -e DISPLAY=$DISPLAY sebagarc/hardwareros2-production
