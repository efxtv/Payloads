#!/bin/bash
apt-get update && apt-get upgrade -y
apt-get install wget -y
apt-get install proot -y
apt-get install git -y
cd ~
git clone https://github.com/MFDGaming/ubuntu-in-termux.git ~./ubuntu-in-termux-efx
cd ~./ubuntu-in-termux-efx
rm README.md
chmod +x ubuntu.sh
./ubuntu.sh -y
./startubuntu.sh
