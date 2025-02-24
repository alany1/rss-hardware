# Move bash aliases
cp rss-hardware/.bash_aliases .

# Move run_rostorch
cp rss-hardware/run_rostorch.sh .
chmod +x run_rostorch.sh

# Move entry point
cp rss-hardware/entrypoint.sh .
chmod +x entrypoint.sh

cp -r rss-hardware/racecar_ws .

# install host installs
source rss-hardware/host_installs.sh

cd
