#!/bin/bash

# update
sudo apt update

# install packages
sudo apt install python3-pip -y
sudo apt install python3-pyqtgraph python3-pyqt5 -y

# clone the repo
sudo apt-get install git -y
cd ~/Desktop
git clone https://github.com/livingpatterns/squid_tracking.git
cd squid_tracking/software
mkdir cache

# install libraries 
pip3 install qtpy pyserial pandas imageio crc==1.3.0 lxml numpy tifffile scipy
pip3 install opencv-python-headless opencv-contrib-python-headless
pip3 install imutils
pip3 install polanalyser

# install camera drivers
cd ~/Desktop/squid_tracking/software/drivers\ and\ libraries/daheng\ camera/Galaxy_Linux-x86_Gige-U3_32bits-64bits_1.2.1911.9122
./Galaxy_camera.run
cd ~/Desktop/squid_tracking/software/drivers\ and\ libraries/daheng\ camera/Galaxy_Linux_Python_1.0.1905.9081/api
python3 setup.py build
sudo python3 setup.py install

# install CUDA
cd ~/Downloads
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get update
sudo apt-get -y install cuda
pip install cuda-python
pip install cupy-cuda12x
pip3 install torch torchvision torchaudio

# enable access to serial ports without sudo
sudo usermod -aG dialout $USER
