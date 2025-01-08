#!/bin/bash
# 显卡直通脚本 - ubuntu
# 增加root权限运行以避免错误
set -e
# 准备驱动文件
sudo rm -rf /usr/lib/wsl && 
sudo mkdir -p /usr/lib/wsl/lib && 
sudo cp -r $HOME/temp_folder/* /usr/lib/wsl && 
sudo chmod 555 /usr/lib/wsl/lib/* && 
sudo chown -R root:root /usr/lib/wsl && 
echo "/usr/lib/wsl/lib" | sudo tee /etc/ld.so.conf.d/ld.wsl.conf && 
sudo ldconfig && 
echo "export PATH=$PATH:/usr/lib/wsl/lib" | sudo tee /etc/profile.d/wsl.sh && 
sudo chmod +x /etc/profile.d/wsl.sh

# 下载并安装 dxgrknl 内核
wget https://github.com/brokeDude2901/dxgkrnl_ubuntu/releases/download/main/linux-headers-5.10.102.1-dxgrknl_5.10.102.1-dxgrknl-10.00.Custom_amd64.deb && 
wget https://github.com/brokeDude2901/dxgkrnl_ubuntu/releases/download/main/linux-image-5.10.102.1-dxgrknl_5.10.102.1-dxgrknl-10.00.Custom_amd64.deb && 
sudo dpkg -i ./linux-headers-5.10.102.1-dxgrknl_5.10.102.1-dxgrknl-10.00.Custom_amd64.deb && 
sudo dpkg -i ./linux-image-5.10.102.1-dxgrknl_5.10.102.1-dxgrknl-10.00.Custom_amd64.deb

# 制作 GRUB 显示菜单，以便选择已安装的 dxgkrnl
sudo sed -i "s/GRUB_DEFAULT=0/GRUB_DEFAULT=saved/g" /etc/default/grub && 
sudo sed -i "s/GRUB_TIMEOUT_STYLE=hidden/GRUB_TIMEOUT_STYLE=menu/g" /etc/default/grub && 
sudo sed -i "s/GRUB_TIMEOUT=0/GRUB_TIMEOUT=30/g" /etc/default/grub && 
sudo grep -q -F "GRUB_SAVEDEFAULT=true" /etc/default/grub || echo "GRUB_SAVEDEFAULT=true" | sudo tee -a /etc/default/grub && 
sudo update-grub && cat /etc/default/grub

# 安装nvidia-docker以及一些其他工具包
sudo apt-get update && 
sudo apt-get install -y curl &&
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - &&
curl -s -L https://nvidia.github.io/nvidia-docker/ubuntu18.04/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list &&
sudo apt-get update && sudo apt install -y nvidia-docker2
# sudo docker run --rm --gpus all nvcr.io/nvidia/k8s/cuda-sample:nbody nbody -gpu -benchmark && 
# sudo docker run --rm -it -v /usr/lib/wsl/lib/nvidia-smi:/usr/local/bin/nvidia-smi --gpus all nvidia/cuda:11.8.0-base-ubuntu22.04 nvidia-smi

# 重启即可
reboot
