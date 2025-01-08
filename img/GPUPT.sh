# 显卡直通脚本 - ubuntu
#!/bin/bash
# 增加root权限运行以避免错误

set -x

# 下载并安装 dxgrknl 内核
wget https://github.com/brokeDude2901/dxgkrnl_ubuntu/releases/download/main/linux-headers-5.10.102.1-dxgrknl_5.10.102.1-dxgrknl-10.00.Custom_amd64.deb && 
wget https://github.com/brokeDude2901/dxgkrnl_ubuntu/releases/download/main/linux-image-5.10.102.1-dxgrknl_5.10.102.1-dxgrknl-10.00.Custom_amd64.deb && 
sudo dpkg -i ./linux-headers-5.10.102.1-dxgrknl_5.10.102.1-dxgrknl-10.00.Custom_amd64.deb && 
sudo dpkg -i ./linux-image-5.10.102.1-dxgrknl_5.10.102.1-dxgrknl-10.00.Custom_amd64.deb

# 制作 GRUB 显示菜单，以便选择已安装的 dxgkrnl。
sudo sed -i "s/GRUB_DEFAULT=0/GRUB_DEFAULT=saved/g" /etc/default/grub && 
sudo sed -i "s/GRUB_TIMEOUT_STYLE=hidden/GRUB_TIMEOUT_STYLE=menu/g" /etc/default/grub && 
sudo sed -i "s/GRUB_TIMEOUT=0/GRUB_TIMEOUT=30/g" /etc/default/grub && 
sudo grep -q -F "GRUB_SAVEDEFAULT=true" /etc/default/grub || echo "GRUB_SAVEDEFAULT=true" | sudo tee -a /etc/default/grub && 
sudo update-grub && cat /etc/default/grub

# 安装一些工具包
sudo apt update && apt install -y build-essential nvidia-container-toolkit

# 重启即可
reboot