xhost +local:docker
sudo apt install dkms -y
sudo apt install tmux screen
sudo git clone https://github.com/paroj/xpad.git /usr/src/xpad-0.4
cd /usr/src
cd xpad-0.4
sudo git config --global --ad safe.directory /usr/src/xpad-0.4
sudo git fetch
sudo git checkout origin/master
sudo dkms remove -m xpad -v 0.4 --all
sudo dkms install -m xpad -v 0.4
