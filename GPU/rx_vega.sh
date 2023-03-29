#!/bin/bash

# 执行 docker ps
docker ps

# 执行 docker restart
docker restart stable-diffusion

# 在容器内部执行命令
docker exec -it stable-diffusion bash -c "cd /dockerx/stable-diffusion-webui && source venv/bin/activate && REQS_FILE='requirements.txt' PYTORCH_ROCM_ARCH=gfx900 HCC_AMDGPU_TARGET=gfx900 python launch.py --release-memory-after-generation --release-memory-on-change"
