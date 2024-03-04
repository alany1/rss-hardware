#!/bin/bash

sudo docker run --entrypoint /root/racecar_ws/entrypoint.sh -it --rm -p 6081:6081 --privileged --runtime nvidia --device=/dev/ttyACM0 --group-add dialout --group-add input -v /dev:/dev -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/racecar_ws:/root//racecar_ws --name racecar_hw -e DISPLAY=$DISPLAY sebagarc/hardwareros2-production
