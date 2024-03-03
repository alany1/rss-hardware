#!/bin/bash

# Set up debug
mkdir -p $HOME/.log

sudo lsof -ti:5900 | xargs sudo kill -9
rm -rf /tmp/.X11-unix/X0
rm -rf /tmp/.X0-lock

vncserver :0 -SecurityTypes None

# Start NoVNC
exec /noVNC-1.4.0/utils/novnc_proxy --vnc 0.0.0.0:5900 --listen 0.0.0.0:6081 > $HOME/.log/NoVNC.log 2>&1 &

# Welcome message
printf "\n"
printf "~~~~~Welcome to the racecar docker image!~~~~~"
printf "\n\n"
printf "To interface via a local terminal, open a new"
printf "\n"  
printf "terminal, cd into the racecar_docker directory"
printf "\n"
printf "and run:"
printf "\n\n"
printf "  connect "
printf "\n\n"
printf "To use graphical programs like rviz, navigate"
printf "\n"
printf "to:"
printf "\n\n"
printf "  http://localhost:6081/vnc.html?resize=remote"
printf "\n"

# hang
tail -f
