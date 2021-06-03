# install docker-ce
sudo apt update && sudo apt install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update && sudo apt install -y docker-ce

# nvidia-docker
curl -sL https://nvidia.github.io/nvidia-docker/gpgkey | \
    sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -sL https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
    sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt update && sudo apt install -y --no-install-recommends nvidia-docker2
sudo pkill -SIGHUP dockerd

# add docker user group
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# test docker 
docker run hello-world

# test nvidia-docker
# docker pull nvidia/cuda and then
# sudo nvidia-docker run nvidia/cuda nvidia-smi
