# Move run_rostorch
cp rss-hardware/run_rostorch.sh .
chmod +x run_rostorch.sh

# Move entry point
cp rss-hardware/racecar_ws/entrypoint.sh .
chmod +x entrypoint.sh

# install host installs
source rss-hardware/host_installs.sh

# pull docker and run rostorch
source run_rostorch.sh
