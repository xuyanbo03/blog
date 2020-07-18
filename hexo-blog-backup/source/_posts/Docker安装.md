---
title: Centos7上Docker安装
tags:
  - Linux
  - Docker
categories:
  - Linux
copyright: ture
author: Awebone
abbrlink: 6eadcfba
date: 2020-07-11 15:00:00
---

> 本文在Centos7.8上安装Docker，并且加载国内镜像



# 虚拟机安装

**下载镜像：**https://mirrors.tuna.tsinghua.edu.cn/centos/7.8.2003/isos/x86_64/



**虚拟机VMware安装Centos7**：步骤略



**固定ip地址：**图形化设置



**设置DNS：**

```bash
sudo vim /etc/resolv.conf

# Generatedby NetworkManager
nameserver 8.8.8.8
nameserver 8.8.4.4
nameserver 114.114.114.114
```



**Centos镜像设置：**

建议先备份 CentOS-Base.repo

```bash
sudo cp /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak
```

然后编辑 /etc/yum.repos.d/CentOS-Base.repo 文件，在 `mirrorlist=` 开头行前面加 `#` 注释掉；并将 `baseurl=` 开头行取消注释（如果被注释的话），把该行内的域名（例如`mirror.centos.org`）替换为 `mirrors.tuna.tsinghua.edu.cn`。

最后，更新软件包缓存

```bash
sudo yum makecache
```

<!-- more -->

<br />



# Docker安装

Docker 目前支持 CentOS 7 及以后的版本，内核要求至少为 3.10。

Docker 官网有安装步骤，本文只是记录一下，您也可以参考 [Get Docker CE for CentOS](https://docs.docker.com/install/linux/docker-ce/centos/)



## 环境查看

```bash
cat /etc/redhat-release 
uname -a
```



## 卸载旧版本

旧版本的 Docker 被叫做 `docker` 或 `docker-engine`，如果您安装了旧版本的 Docker ，您需要卸载掉它。

```
sudo yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine
```

旧版本的内容在 `/var/lib/docker` 下，目录中的镜像(images), 容器(containers), 存储卷(volumes), 和 网络配置（networks）都可以保留。

Docker CE 包，目前的包名为 `docker-ce`。



## 安装软件源

为了方便添加软件源，支持 devicemapper 存储类型，安装如下软件包

```bash
sudo yum update
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
```



添加 Docker 稳定版本的 yum 软件源

```bash
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
```



## 安装 Docker

把软件仓库地址替换为 TUNA:

```bash
wget -O /etc/yum.repos.d/docker-ce.repo https://download.docker.com/linux/centos/docker-ce.repo
sudo sed -i 's+download.docker.com+mirrors.tuna.tsinghua.edu.cn/docker-ce+' /etc/yum.repos.d/docker-ce.repo
```

更新一下 yum 软件源的缓存，并安装 Docker。

```bash
sudo yum update
sudo yum install docker-ce
```

如果弹出 GPG key 的接收提示，请确认是否为 `060a 61c5 1b55 8a7f 742b 77aa c52f eb6b 621e 9f35`，如果是，可以接受并继续安装。

至此，Docker 已经安装完成了，Docker 服务是没有启动的，操作系统里的 docker 组被创建，但是没有用户在这个组里。



## 将当前用户加入 docker 组

```bash
sudo usermod -aG docker $USER
```

退出当前终端并重新登录



## 启动 Docker

如果想添加到开机启动

```bash
sudo systemctl enable docker
```

启动 docker 服务

```bash
sudo systemctl start docker
```



## 验证安装

验证 Docker CE 安装是否正确，可以运行 `hello-world` 镜像

```bash
docker version
docker run hello-world
```



## 更新 Docker CE

```bash
sudo yum update docker-ce
```



## 卸载 Docker CE

```bash
sudo yum remove docker-ce
```



## 删除本地文件

注意，docker 的本地文件，包括镜像(images), 容器(containers), 存储卷(volumes)等，都需要手工删除。默认目录存储在 `/var/lib/docker`。

```bash
sudo rm -rf /var/lib/docker
```

</br>



# 镜像加速

在 `/etc/docker/daemon.json` 中写入如下内容（如果文件不存在请新建该文件）

```bash
{
  "registry-mirrors": [
  	"https://docker.mirrors.ustc.edu.cn",
  	"http://f1361db2.m.daocloud.io",
  	"https://mirror.ccs.tencentyun.com",
  	"https://reg-mirror.qiniu.com",
    "https://registry.docker-cn.com"
  ]
}
```

重新启动服务

```bash
sudo systemctl daemon-reload
sudo systemctl restart docker
docker info
```

<br />



# Docker简单使用

```bash
docker pull python:3.6 # 拉取python镜像
docker image ls # 查看所有镜像
docker container ls -a # 查看所有容器
docker rm $(docker container ls -aq) # 删除所有容器
docker ps --all # 查看运行的容器
docker run -d --name ray01 python /bin/sh -c "while true; do sleep 3600; done" # 后台运行一个容器
docker exec -it ray01 /bin/bash # 进入ray01，交互式运行
docker cp test1.py ray01:/ray/ # 拷贝本地文件到容器中
```

<br />



# 参考资料

https://qizhanming.com/blog/2019/01/25/how-to-install-docker-ce-on-centos-7

https://juejin.im/post/5cd2cf01f265da0374189441

https://juejin.im/post/5dc241ce6fb9a04aa333c1bd#heading-7

https://mirrors.tuna.tsinghua.edu.cn/help/pypi/

https://mirrors.tuna.tsinghua.edu.cn/help/docker-ce/

https://hub.docker.com/_/python