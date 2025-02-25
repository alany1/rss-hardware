# Racecar Setup Guide

### 0. Host Installations

* Clone this repo into $HOME.
* Connect to wifi (Ethernet preferred), and pull the latest docker image:

```
[sudo] docker pull staffmitrss/racecar-real:latest
```
* Alternatively, use the flash drive and do:

```python
docker load -i /path/to/external/drive/image.tar
```

* Run install script from outside the repo.

```bash
mv install.sh $HOME
chmod +x install.sh
./install.sh
```


### 1. Vesc Configuration

* Upload default firmware
* Upload motor config [Link](https://github.com/RacecarJ/vesc-firmware/blob/master/VESC-Configuration/vesc6_upenn_foc.xml)
* REMEMBER TO HIT SAVE MOTOR CONFIG
* FOC > Senseless > Set hysteresis and time to 0.01
* REMEMBER TO HIT SAVE MOTOR CONFIG
* App Settings > General:
    * Enable servo output
    * REMEMBER TO HIT SAVE APP CONFIG
* Motor Settings > PID Controller
    * Allow braking = True
    * SAVE APP CONFIG!
* Calibration:
    * FOC > General > go through all the steps
* Verification:
    * Spin the motors in the bottom left
    * App Settings > General > Controls
        * Try moving the servo

### 2. Networking

* Connect to racecar router
* Open Network Connections
* Edit ethernet network settings:
    * Rename to HOKUYO
    * Go to ipv4 settings
        * Method: Manual
        * Address: 192.168.0.15
        * Netmask : 24
        * Gateway: 192.168.0.10
    * Save
* Configure static IP on router
* Delete all WIFI connections besides the designated router
  * Set up the router if you need (using reserved IP DHCP table)
* Open Terminal
* sudo vim /etc/hosts
* Add the following hosts:
    * 192.168.1.[car number]   racecar
    * 192.168.0.10 hokuyo


### 3. Docker

* Run the container
```bash
./run_rostorch.sh
```

* Inside the container, build and test if teleop works. You'll need to start another terminal:

```bash
connect

# now you are inside the docker
teleop
```

* On your local machine you can connect to the VNC server by running:

```bash
ssh -L 6081:localhost:6081 racecar@[IP] # where [IP] depends on your racecar number
```

Then, open your browser and navigate to:
http://localhost:6081/vnc.html?resize=remote.

Verify that you can visualize the LiDAR (frame laser, topic `/scan`) and camera.

* Optional: verify that the starter wall follower package works.
```bash
# inside the docker
cd /root/racecar_ws
colcon build
source install/setup.bash

ros2 run wall_follower example
```

If you hit the right bumper, it should go in a circle.
