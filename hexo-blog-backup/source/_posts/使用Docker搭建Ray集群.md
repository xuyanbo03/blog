---
title: 使用Docker搭建Ray集群
tags:
  - Ray
categories:
  - 大数据
copyright: ture
author: Awebone
abbrlink: 101d1957
date: 2020-07-13 15:00:00
---

> 本文使用Docker中Ubuntu16.04镜像，搭建MiniConda环境，在conda之上搭建Ray集群环境



# Docker镜像构建

**编写Dockerfile文件，构建镜像，换源为阿里云：**

```dockerfile
FROM ubuntu:16.04

RUN mv /etc/apt/sources.list.d /etc/apt/sources.list.d.bak

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak && \
    echo "deb http://mirrors.aliyun.com/ubuntu/ xenial main restricted" >>/etc/apt/sources.list && \
    echo "deb-src http://mirrors.aliyun.com/ubuntu/ xenial main restricted multiverse universe" >>/etc/apt/sources.list && \
    echo "deb http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted" >>/etc/apt/sources.list && \
    echo "deb-src http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted multiverse universe" >>/etc/apt/sources.list && \
    echo "deb http://mirrors.aliyun.com/ubuntu/ xenial universe" >>/etc/apt/sources.list && \
    echo "deb http://mirrors.aliyun.com/ubuntu/ xenial-updates universe" >>/etc/apt/sources.list && \
    echo "deb http://mirrors.aliyun.com/ubuntu/ xenial multiverse" >>/etc/apt/sources.list && \
    echo "deb http://mirrors.aliyun.com/ubuntu/ xenial-updates multiverse" >>/etc/apt/sources.list && \
    echo "deb http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse" >>/etc/apt/sources.list && \
    echo "deb-src http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse" >>/etc/apt/sources.list && \
    echo "deb http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted" >>/etc/apt/sources.list && \
    echo "deb-src http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted multiverse universe" >>/etc/apt/sources.list && \
    echo "deb http://mirrors.aliyun.com/ubuntu/ xenial-security universe" >>/etc/apt/sources.list && \
    echo "deb http://mirrors.aliyun.com/ubuntu/ xenial-security multiverse" >>/etc/apt/sources.list

RUN apt update
```



**将Dockerfile文件放在用户目录下，运行下面命令构建镜像：**

```bash
docker build -t awebone/ubuntu16.04 .

docker image ls -a # 查看镜像
```

<!-- more -->

<br />



# 基本准备工作

**进入容器：**

```bash
docker run --name ray -itd awebone/ubuntu16.04 /bin/bash
docker exec -it ray /bin/bash
```



**安装基本软件包：**

```bash
apt install python-software-properties -y
apt install software-properties-common -y
```



**安装经常使用的包：**

```bash
apt install -y vim wget git
```

<br />



# MiniConda安装

**Conda安装：**

```bash
wget https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-py37_4.8.2-Linux-x86_64.sh

bash Miniconda3-py37_4.8.2-Linux-x86_64.sh

source ~/.bashrc

conda -V
```



**conda镜像设置**

通过修改用户目录下的 `.condarc` 文件。先执行 `conda config --set show_channel_urls yes` 生成该文件之后再修改

```bash
channels:
  - defaults
show_channel_urls: true
channel_alias: https://mirrors.tuna.tsinghua.edu.cn/anaconda
default_channels:
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/pro
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/msys2
custom_channels:
  conda-forge: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  msys2: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  bioconda: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  menpo: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  pytorch: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  simpleitk: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
```

运行 `conda clean -i` 清除索引缓存，保证用的是镜像站提供的索引。



**环境创建**

```bash
conda create -n ray python=3.6
conda activate ray #开启ray环境
conda deactivate #关闭环境
conda env list #显示所有的虚拟环境
conda info --envs #显示所有的虚拟环境
```

<br />



# Ray安装

**pip镜像设置**

激活conda环境，运行：

```bash
conda activate ray #开启ray环境
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
```



**ray安装**

```bash
pip install ray # ray安装
pip install ray[tune]  # ray组件安装
pip install ray[rllib] # ray组件安装
pip install tensorflow # tf cpu安装
pip install requests # requests安装
```

<br />



# 容器保存

**将修改好的容器保存为镜像**

```bash
docker commit (容器ID)[37639cc72d75] ubuntu-conda-ray
```

<br />



# Ray集群运行并使用

**容器启动**

```bash
docker run --shm-size 1000m --name ray1 -itd ubuntu-conda-ray /bin/bash
docker run --shm-size 1000m --name ray2 -itd ubuntu-conda-ray /bin/bash
```



**分两个终端进入容器**

```bash
docker exec -it ray1 /bin/bash
docker exec -it ray2 /bin/bash
```



**两个容器分别激活Conda环境**

```bash
conda activate ray #开启ray环境
```



**Ray启动**

```bash
Ray1上：ray start --head --port=6379 # 启动head节点
Ray1上：ray start --address 172.16.0.2:6379 # 向集群添加节点
Ray2上：ray start --address 172.16.0.3:6379 # 向集群添加节点
```



**Ray集群测试**

```python
# -*- coding: utf-8 -*-
import time
import ray
ray.init(address="auto")

def f1():
    time.sleep(1)

@ray.remote
def f2():
    time.sleep(1)

#以下需要十秒。
time1=time.time()
[ f1() for _ in range(50)]
print(time.time()-time1)

#以下需要一秒(假设系统至少有10个CPU)。
time2=time.time()
ray.get([ f2.remote() for _ in range(50)])
print(time.time()-time2)
```



**Ray RLLib使用**

```bash
rllib train \
--run=PG \
--env=CartPole-v0 \
--config='{"output": "/tmp/cartpole-out", "output_max_file_size": 5000000}' \
--stop='{"timesteps_total": 100000}'

ls -l /tmp/cartpole-out

rllib train \
--run=DQN \
--env=CartPole-v0 \
--config='{
  "input": "/tmp/cartpole-out",
  "input_evaluation": [],
  "explore": false}'
```



**强化学习PPO算法实践**

编写`ppo.py`算法文件

```python
import gym
from gym.spaces import Discrete, Box
from ray import tune

class SimpleCorridor(gym.Env):
    def __init__(self, config):
        self.end_pos = config["corridor_length"]
        self.cur_pos = 0
        self.action_space = Discrete(2)
        self.observation_space = Box(0.0, self.end_pos, shape=(1, ))

    def reset(self):
        self.cur_pos = 0
        return [self.cur_pos]

    def step(self, action):
        if action == 0 and self.cur_pos > 0:
            self.cur_pos -= 1
        elif action == 1:
            self.cur_pos += 1
        done = self.cur_pos >= self.end_pos
        return [self.cur_pos], 1 if done else 0, done, {}

tune.run(
    "PPO",
    config={
        "env": SimpleCorridor,
        "num_workers": 4,
        "env_config": {"corridor_length": 5}})
```

运行`ppo.py`，查看训练状态：

![ppo状态](/images/使用Docker搭建Ray集群/ppo状态.png)

![ppo-status](/images/使用Docker搭建Ray集群/ppo-status.png)

查看CPU状态：

![cpu-ray1-htop](/images/使用Docker搭建Ray集群/cpu-ray1-htop.png)

<br />



# 参考资料

https://docs.docker.com/engine/reference/run/

https://www.jianshu.com/p/2a5cd519e583

https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/

https://blog.csdn.net/u011552182/article/details/80054899

https://github.com/ray-project/rl-experiments

https://www.twblogs.net/a/5db5755fbd9eee310da07c50?lang=zh-cn

https://blog.csdn.net/luanpeng825485697/article/details/88242020

