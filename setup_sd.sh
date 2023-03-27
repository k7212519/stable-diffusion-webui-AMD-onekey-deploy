#!/bin/bash

#Pull the latest k7212519/stable-diffusion-webui Docker image, start the image and attach to the container
gnome-terminal -- docker run -it --network=host --device=/dev/kfd --device=/dev/dri --group-add=video --ipc=host --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --name=stable-diffusion -v $HOME/dockerx:/dockerx k7212519/stable-diffusion-webui

# 等待容器启动
until [ "$(docker inspect -f '{{.State.Status}}' stable-diffusion)" = "running" ]; do
    sleep 100
done

echo "docker is running..."

# copy sd files from /sd_backup to /dockerx/
docker exec -it stable-diffusion bash -c "cp -a /sd_backup/. /dockerx/ && exit"

# 创建目录和拷贝文件
sudo mkdir /usr/share/stable-diffusion
sudo cp $HOME/dockerx/sh/oneclick_start.sh /usr/share/stable-diffusion/
sudo cp $HOME/dockerx/sh/sd.png /usr/share/icons/
sudo cp $HOME/dockerx/sh/stable-diffusion.desktop $HOME/.local/share/applications/
