#!/bin/bash

# update
sudo apt update

# install packages
sudo apt install python3-pip -y
sudo apt install python3-pyqtgraph python3-pyqt5 -y
sudo apt install python3-pyqt5.qtsvg

# clone the repo
sudo apt-get install git -y
cd ~/Desktop
git clone https://github.com/livingpatterns/squid_imaging.git
cd squid_imaging/software
mkdir cache

# install libraries 
pip3 install qtpy pyserial pandas imageio crc==1.3.0 lxml numpy tifffile scipy napari
pip3 install opencv-python-headless opencv-contrib-python-headless

# install camera drivers
cd ~/Desktop/squid_imaging/software/drivers\ and\ libraries/daheng\ camera/Galaxy_Linux-x86_Gige-U3_32bits-64bits_1.2.1911.9122
./Galaxy_camera.run
cd ~/Desktop/squid_imaging/software/drivers\ and\ libraries/daheng\ camera/Galaxy_Linux_Python_1.0.1905.9081/api
python3 setup.py build
sudo python3 setup.py install

# enable access to serial ports without sudo
sudo usermod -aG dialout $USER
