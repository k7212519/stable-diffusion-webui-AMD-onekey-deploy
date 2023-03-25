# stable-diffusion-webui-AMD-onekey-deploy
适用于AMD显卡用户在Ubuntu中，一键安装stable-diffusion-webui。软件基于Docker运行，不依赖外部环境。  

## 介绍
1.该脚本适用于AMD rx500，rx6000，rx7000系列及其他专业显卡在Ubuntu20及以上版本系统中安装stable-diffusion-webui绘图软件。  
2.AMD显卡无法在Windows系统中使用ROCm深度学习环境，发挥全部性能。目前Windows中的转译效率低，在Linux中安装ROCm运行stable-diffusion，跑图能力将成倍提升！  
3.仓库包含两个脚本：
  setup_docker.sh :一键安装最新Docker脚本  
  setup_sd.sh :一键拉取个人封装的 k7212519/stable-diffusion-webui 镜像并安装  
4.运行时仅需打开终端(Terminal)，依次输入以下命令，运行setup_docker.sh、setup_sd.sh即可：
  $ ./setup_docker.sh
  $ ./setup_sd.sh
  
## 其他
1.运行脚本前，首先需要保证ubuntu系统中显卡驱动正确安装，并能在 设置-关于 中正确看到显卡型号。  
2.如安装完系统无法识别显卡型号，请访问以下网站正确安装显卡驱动，并根据型号正确下载相关驱动文件：
https://www.amd.com/zh-hans/support/linux-drivers
下载DEB文件后，通过以下命令安装：
$ sudo apt install xxx.deb
$ amdgpu-install -y --usecase=graphics
安装完成后，重新启动，在系统设置中看到显卡型号能正确识别后，继续使用该脚本安装stable-diffusion-webui。
