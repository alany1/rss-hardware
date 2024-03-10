# Setting up ZED

First, update `run_rostorch.sh` to the following:

```bash
#!/bin/bash

sudo docker run  -it --rm -p 6081:6081 --privileged --runtime nvidia \
 --device=/dev/ttyACM0 --group-add dialout --group-add input \
  -v ~/entrypoint.sh:/root/entrypoint.sh -v /dev:/dev \ 
  -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/racecar_ws:/root/racecar_ws \ 
  -v ~/zed_settings:/usr/local/zed/settings \
  --entrypoint /root/entrypoint.sh --name racecar_hw -e DISPLAY=$DISPLAY \
  sebagarc/hardwareros2-production

```

The only change is that `~/zed_settings` is a volume for `/usr/local/zed/settings` in the container.

Next, identify which ZED camera you have. If it is silver, it is a ZED. If it is black, it is a ZED2.

Enter the container:

```bash
# on the car

./run_rostorch.sh

# in another terminal

connect

unset DISPLAY # this is important for camera!

# for ZED:
ros2 launch zed_wrapper zed_camera.launch.py camera_model:=zed

# for ZED2:
ros2 launch zed_wrapper zed_camera.launch.py camera_model:=zed2

```

Let this run to completion.

If your router has internet, then it will be able to download the calibration file. Then you are all set and can use the
ZED.

### If Your Router Doesn't Have Internet

Our goal is to read the serial number of the ZED. The launch should hang with something like this:

```bash
Depth mode: ULTRA
Camera successfully opened.
Camera FW version: 1142
A new firmware is available. You can update to the latest firmware by using ZED Explorer
Video mode: HD720@15
Serial Number: S/N 12369
No calibration file found for SN 12369. Downloading...
```

As expected, it can't download because there's no internet. Go into `zed_settings/` outside of the container,
and `rsync`/`scp` over the zed configuration file corresponding to your ZED version from your local machine. Then,
change the name so that it matches the
serial number from the launch output.

For example, if the serial number was 12369, and I had a ZED2, I would do:

```bash
# on the car

> cd $HOME/zed_settings
> ls
zed.conf
zed2.conf
> mv zed2.conf SN12369.conf
```

If I instead had a regular ZED, I would do the same but use `zed.conf` instead.

After this, restart the old docker container. You should be able to launch again and start getting camera outputs. Note
that it will take some time (at most a minute or two) for the node to open the camera. To
verify that the camera is working, you can try echoing the topic

```bash
ros2 topic echo /zed/zed_node/rgb/image_rect_color
```

Please let an instructor know if you face any problems.



