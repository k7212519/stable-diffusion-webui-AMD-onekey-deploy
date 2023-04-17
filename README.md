![image](https://github.com/k7212519/stable-diffusion-webui-AMD-onekey-deploy/blob/main/screenshot/screenshot2.png)  

# stable-diffusion-webui-AMD-onekey-deploy 
（停用！已有新版本，请移步新仓库！）适用于AMD显卡用户在`Ubuntu`中，一键安装`stable-diffusion-webui`。软件基于`Docker`运行，不依赖外部环境。   
https://github.com/k7212519/ksd-launcher

## 介绍
1.该脚本适用于`AMD rx5000，rx6000`系列及其他专业显卡在`Ubuntu20`及以上版本系统中安装`stable-diffusion-webui`绘图软件。`rx500`及`rx400`系列暂未适配，请期待后续更新， `rx7000`系列好像不支持`ROCm`，暂时未知，等这一代专业卡发布，应该就会一起官方适配了。  
2.`AMD`显卡无法在`Windows`系统中使用`ROCm`深度学习环境，发挥全部性能。目前`Windows`中的转译效率低，在Linux中安装`ROCm`运行`stable-diffusion`，跑图能力将成倍提升！  
3.依次两个脚本：  
  `setup_docker.sh` :一键安装最新`Docker`脚本  
  `setup_sd.sh` :一键拉取个人封装的 `k7212519/stable-diffusion-webui` 镜像并安装  
4.运行时仅需打开终端`Terminal`，首先运行`setup_docker.sh`、完成后重启电脑，再运行`setup_sd.sh`即可，以下是运行命令：  
``` bash
./setup_docker.sh
./setup_sd.sh  
```
  
## 其他
1.运行脚本前，首先需要保证`ubuntu`系统中显卡驱动正确安装，并能在 设置-关于 中正确看到显卡型号，最好在终端输入`rocm-smi`能看到显卡相关信息。  
2.如安装完系统无法识别显卡型号，请访问以下网站正确安装显卡驱动，并根据型号正确下载相关驱动文件：  
`https://www.amd.com/zh-hans/support/linux-drivers`
下载`DEB`文件后，通过以下命令安装：  
``` bash
sudo apt install xxx.deb
amdgpu-install -y --usecase=graphics,hip,rocm --no-dkms
```
安装完成后，重新启动，在系统设置中看到显卡型号能正确识别后，再使用该脚本安装`stable-diffusion-webui`。  

# stable-diffusion-webui-AMD-onekey-deploy
(Deactivate! There is a new version, please move to the new repository! For AMD graphics card users, install 'stable-diffusion-webui' in 'Ubuntu' with one click. The software runs on 'Docker' and does not depend on the external environment.  
https://github.com/k7212519/ksd-launcher) 
For `AMD` graphics card users on `Ubuntu`, this script provides a one-click installation of the `stable-diffusion-webui` software. The software is based on Docker, which does not depend on external environments.
  
  
  
## Introduction
1.This script is suitable for AMD `rx5000`, `rx6000` series and other professional graphics cards to install `stable-diffusion-webui` graphics software on `Ubuntu 20` and above systems. The `rx500` and `rx400` series are currently not compatible, please stay tuned for future updates. The `rx7000` series seems to not support `ROCm`, it is currently unknown. When this generation of professional graphics cards is released, official adaptation should be available.  
2.AMD graphics cards cannot use ROCm deep learning environment in Windows system to fully utilize their performance. Currently, the translation efficiency in Windows is low. Installing ROCm in Linux to run stable-diffusion can greatly improve the charting capability!  
3.There are two scripts in order:  
`setup_docker.sh`: One-click installation of the latest Docker script.
`setup_sd.sh`: One-click pull of the personal packaging `k7212519/stable-diffusion-webui` image and installation.  
4.When running, only need to open the terminal, first run `setup_docker.sh`, complete it and restart the computer, then run `setup_sd.sh`. The following are the commands:
``` bash
./setup_docker.sh
./setup_sd.sh  
```
  
## Notes
1.Before running the script, make sure that the graphics card driver is correctly installed in the `Ubuntu` system and the graphics card model can be seen correctly in `Settings-About`. It is best to enter `rocm-smi` in the terminal to see the graphics card related information.   
2.If the graphics card model cannot be recognized by the system after installation, please visit the following website to correctly install the graphics card driver and download the related driver files according to the model:  
`https://www.amd.com/zh-hans/support/linux-drivers`
After downloading the DEB file, install it through the following command:  
``` bash
sudo apt install xxx.deb
amdgpu-install -y --usecase=graphics,hip,rocm --no-dkms
```
After the installation is completed, restart the system. After the graphics card model can be correctly recognized in the system settings, use this script to install `stable-diffusion-webui`.
