---
title: ElasticSearch安装避坑
tags:
  - ELK
categories:
  - 大数据
copyright: ture
author: Awebone
abbrlink: 62e0a87a
date: 2020-03-17 15:00:00
---

# ElasticSearch安装避坑

本文使用Centos7安装ElasticSearch6.5.2，记录避坑指南。



## 升级内核

通过命令查看内核：

```shell
uname -a
# 3.10.0-327.el7.x86_64
```

Centos7自带的内核为3.10，但是ElasticSearch6.5.2要求系统内核必须在3.5以上，故升级内核，root用户下执行：

```shell
# 导入key
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org  
# 安装elrepo的yum源
rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm
# 安装内核
yum --enablerepo=elrepo-kernel install  kernel-ml-devel kernel-ml
# 查看默认启动顺序
awk -F\' '$1=="menuentry " {print $2}' /etc/grub2.cfg
# 默认启动的顺序是从0开始，新内核是从头插入,选择0
grub2-set-default 0 
```

安装完毕后重启`reboot`生效

查看内核为5.5.9：`Linux awebone.com 5.5.9-1.el7.elrepo.x86_64 #1 SMP Wed Mar 11 19:01:01 EDT 2020 x86_64 x86_64 x86_64 GNU/Linux`

如果遇到`curl 不兼容或不支持的协议版本`的问题，通过以下方法解决：

```shell
yum update -y nss curl libcurl
```



<!-- more -->



## 关闭防火墙和SELinux

因为在本地虚拟机安装，关闭防火墙和SELinux，方便测试：

```shell
# 查看防火墙状态
systemctl status firewalld
# 关闭防火墙
systemctl stop firewalld
# 设置开机不启动
sudo systemctl disable firewalld.service

# 关闭SELinux
setenforce 1
# 查看SELinux状态
getenforce
```



## 安装JDK1.8和ElasticSearch

通过官网下载安装包`elasticsearch-6.5.2.tar.gz`和`jdk-8u73-linux-x64.tar.gz`

### 安装JDK

ES要求jdk需要为1.8版本以上，故删除自带的1.7：

```shell
rpm -qa |grep java
sudo yum -y remove java*
```

解压jdk到apps目录下：

```shell
tar -zxvf jdk-8u73-linux-x64.tar.gz -C ~/apps/
```

配置环境变量：

```shell
sudo vim /etc/profile

# 在最后添加以下内容，目录改为自己的：
JAVA_HOME=/home/xxx/apps/jdk1.8.0_73
JRE_HOME=$JAVA_HOME/jre
PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin
CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib
export JAVA_HOME JRE_HOME PATH CLASSPATH
```

最后加载环境变量：`source /etc/profile`

查看JDK版本：`java -version`

![es1](/images/es/es1.png)



### 安装ElasticSearch

注意：ES从2.X版本起，就不能再root用户下安装，故在普通用户下安装

解压到apps目录下：

```shell
tar -zxvf elasticsearch-6.5.2.tar.gz -C ~/apps/
```

配置环境变量：

```shell
vim ~/.bashrc 

# 在最后添加以下内容：
ELASTICSEARCH_HOME=/home/linuxprobe/apps/elasticsearch-6.5.2
export PATH=$PATH:$ELASTICSEARCH_HOME/bin
```

加载环境变量：`source ~/.bashrc `

进行ElasticSearch的配置，修改`$ELASTICSEARCH_HOME/conf/elasticsearch.yml`文件：

```shell
vim $ELASTICSEARCH_HOME/conf/elasticsearch.yml

# 填入以下内容，目录改为自己的
cluster.name: es
node.name: hadoop
path.data: /home/xxx/data/elastic（手动创建目录）
path.logs: /home/xxx/logs/elastic（手动创建目录）
network.host: 0.0.0.0
http.port: 9200
```

启动：

```shell
# es后台启动，不加-d为前台启动
elasticsearch -d
```

测试：

```shell
# 查看java进程状态
jps

# 查看服务状态
curl -XGET http://localhost:9200
```

![es2](/images/es/es2.png)

通过网页查看：

![es3](/images/es/es3.png)

