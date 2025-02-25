#!/bin/bash

# Set up debug
mkdir -p $HOME/.log

sudo lsof -ti:5910 | xargs sudo kill -9
rm -rf /tmp/.X11-unix/X10
rm -rf /tmp/.X10-lock

vncserver :10 -SecurityTypes None -xstartup startlxde

# Start NoVNC
exec ~/noVNC/utils/novnc_proxy --vnc 0.0.0.0:5910 --listen 0.0.0.0:6081 > $HOME/.log/NoVNC.log 2>&1 &

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
