#!/bin/bash

sudo docker run -it --rm --runtime nvidia --gpus all \
  --name racecar \
  --entrypoint /root/entrypoint.sh \
  -e DISPLAY=$DISPLAY \
  -e NVIDIA_DRIVER_CAPABILITIES=all \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  --privileged \
  -v /tmp/argus_socket:/tmp/argus_socket \
  -v /dev:/dev \
  -v ~/racecar_ws:/root/racecar_ws \
  --net=host \
  -e LD_LIBRARY_PATH=/usr/lib/aarch64-linux-gnu/tegra:$LD_LIBRARY_PATH \
  -p 6081:6081 \
  -v ~/entrypoint.sh:/root/entrypoint.sh \
  staffmitrss/racecar-real:latest
