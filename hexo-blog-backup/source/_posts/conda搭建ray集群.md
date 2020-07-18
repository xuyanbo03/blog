---
title: Conda搭建Ray集群
tags:
  - Ray
categories:
  - 大数据
copyright: ture
author: Awebone
abbrlink: 1fad2db9
date: 2020-07-10 15:00:00
---

> 本文使用MiniConda搭建Ray集群环境



# conda环境创建

## conda镜像设置

通过修改用户目录下的 `.condarc` 文件。Windows 用户无法直接创建名为 `.condarc` 的文件，可先执行 `conda config --set show_channel_urls yes` 生成该文件之后再修改

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

即可添加 Anaconda Python 免费仓库。

运行 `conda clean -i` 清除索引缓存，保证用的是镜像站提供的索引。



## 环境创建

```bash
conda create -n ray python=3.6
conda activate ray #开启ray环境
conda deactivate #关闭环境
conda env list #显示所有的虚拟环境
conda info --envs #显示所有的虚拟环境
```

<!-- more -->

<br />



# Ray安装

## pip镜像设置

### 临时使用

```bash
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple some-package
```

注意，`simple` 不能少, 是 `https` 而不是 `http`



### 设为默认

升级 pip 到最新的版本 (>=10.0.0) 后进行配置：

```bash
pip install pip -U
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
```

如果您到 pip 默认源的网络连接较差，临时使用本镜像站来升级 pip：

```bash
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pip -U
```



## ray安装

```bash
pip install ray # ray安装
pip install ray[tune] ray[rllib] # ray组件安装
pip install tensorflow # tf cpu安装
conda install pytorch torchvision cudatoolkit=10.2 -c pytorch # pytorch gpu安装
```

<br />



# 多kernel安装

```bash
pip install ipykernel
python -m ipykernel install --name ray
```

<br />



# jupyter lab启动

```bash
jupyter lab
```

<br />



# Ray启动

```bash
ray start --head --port=6379 # 启动head节点
ray start --address 192.168.xxx.xxx:6379 # 向集群添加节点
python xxx.py # 运行
```

