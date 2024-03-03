# Racecar Setup Guide

### Vesc Configuration

* Upload default firmware
* Upload motor config
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

### Development

* Clone this repo into `$HOME`.
* Connect to wifi, and pull the latest docker image:

```
[sudo] docker pull sebagarc/hardwareros2-production
cd $HOME
./run_rostorch
```

Inside the container, build and test if teleop works:

```bash
cd ros2_ws
colcon build # this might take a while
source install/setup.bash
teleop
```

The container will launch a hanging VNC server. You can enter the docker container by opening another terminal window
and running:

```bash
connect
```

On your local machine you can connect to the VNC server by running:

```bash
ssh -L 6081:localhost:6081 racecar@[IP] # where [IP] depends on your racecar number
```

Then, open your browser and navigate to:
http://localhost:6081/vnc.html?resize=remote.

### Networking

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
* Open Terminal
* sudo vim /etc/hosts
* Add the following hosts:
    * 192.168.1.[car number]   racecar
    * 192.168.0.10 hokuyo
