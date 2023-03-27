#!/bin/bash


rocm-smi

while true; do
  read -p "请确认在上方能看到您的显卡信息，y确认，N退出？[y/n] " yn
  case $yn in
    [Yy]* ) break;;
    [Nn]* ) exit;;
    * ) echo "请输入 y 或 n.";;
  esac
done

#Pull the latest k7212519/stable-diffusion-webui Docker image, start the image and attach to the container
gnome-terminal -- docker run -it --network=host --device=/dev/kfd --device=/dev/dri --group-add=video --ipc=host --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --name=stable-diffusion -v $HOME/dockerx:/dockerx k7212519/stable-diffusion-webui

# 等待容器启动
until [ "$(docker inspect -f '{{.State.Status}}' stable-diffusion)" = "running" ]; do
    sleep 10
done

echo "docker is running..."

echo "正在释放文件，请稍等......"
# copy sd files from /sd_backup to /dockerx/
docker exec -it stable-diffusion bash -c "cp -a /sd_backup/. /dockerx/ && exit"


##########显卡型号选择##########

valid_choice=false

while [ "$valid_choice" == false ]
do
  echo "请选择您的显卡型号："
  echo "1. RX 6800系列"
  echo "2. RX 6700系列"
  echo "3. RX 6600系列"
  echo "4. RX 5000系列"

  read -p "请输入选项编号： " choice

  case $choice in
    1)
      echo "您选择了 RX 6800"
      sudo cp -f GPU/rx6800.sh  $HOME/dockerx/sh/sd.sh
      valid_choice=true
      ;;
    2)
      echo "您选择了 RX 6700"
      sudo cp -f GPU/rx6700.sh  $HOME/dockerx/sh/sd.sh
      valid_choice=true
      ;;
    3)
      echo "您选择了 RX 6600"
      sudo cp -f GPU/rx6600.sh  $HOME/dockerx/sh/sd.sh
      valid_choice=true
      ;;
    4)
      echo "您选择了 RX 5000"
      sudo cp -f GPU/rx5000.sh  $HOME/dockerx/sh/sd.sh
      valid_choice=true
      ;;
    *)
      echo "无效的选项编号，请重新输入。"
      ;;
  esac
done

# 创建目录和拷贝文件
sudo mkdir /usr/share/stable-diffusion
sudo cp $HOME/dockerx/sh/oneclick_start.sh /usr/share/stable-diffusion/
sudo cp $HOME/dockerx/sh/sd.png /usr/share/icons/
sudo cp $HOME/dockerx/sh/stable-diffusion.desktop $HOME/.local/share/applications/


echo "\n\n"
echo "恭喜你，安装完成！\n"
echo "重要提示！首次运行跑图需要预编译文件，需等待一段时间，后续访问即可正常。"
