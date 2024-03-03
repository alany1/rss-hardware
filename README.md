# Setting up Vesc:

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

# Setting up the Cars:

* copy run_rostorch.sh into home directory

## Setting up Network Settings
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
    * 192.168.0.10   hokuyo
