sudo apt update && sudo apt install -y htop \
    iotop

# install nvtop
# apt-install fails
sudo apt update && sudo apt install -y cmake \
    libncurses5-dev \
    libncursesw5-dev
git clone https://github.com/Syllo/nvtop
cd nvtop
mkdir build && cd build
cmake ..
sudo make install
cd ../..
rm -rf nvtop