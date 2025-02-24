#!/bin/bash

sudo docker run -it --rm --runtime nvidia --gpus all -e DISPLAY=$DISPLAY -e NVIDIA_DRIVER_CAPABILITIES=all -v /tmp/.X11-unix:/tmp/.X11-unix --privileged -v /tmp/argus_socket:/tmp/argus_socket  -v /dev:/dev -v ~/racecar_ws:/root/racecar_ws --net=host  -e LD_LIBRARY_PATH=/usr/lib/aarch64-linux-gnu/tegra:$LD_LIBRARY_PATH -p 6901:6901 staffmitrss/racecar-real:latest --name racecar
