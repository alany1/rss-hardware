#!/bin/bash

sudo docker run  -it --rm -p 6081:6081 --privileged --runtime nvidia --device=/dev/ttyACM0 --group-add dialout --group-add input -v ~/entrypoint.sh:/root/entrypoint.sh -v /dev:/dev -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/racecar_ws:/root/racecar_ws -v ~/zed_settings:/usr/local/zed/settings --entrypoint /root/entrypoint.sh --name racecar_hw -e DISPLAY=$DISPLAY sebagarc/hardwareros2-production
