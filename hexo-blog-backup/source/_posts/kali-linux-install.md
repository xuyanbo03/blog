---
title: kali linux 安装指南
date: 2017-04-20
tags: [kali,Linux]
categories: Linux
---

# kali linux 安装指南

>Kali Linux是基于Debian的Linux发行版， 设计用于数字取证和渗透测试。Kali Linux预装了许多渗透测试软件，包括nmap (端口扫描器)、Wireshark (数据包分析器)、John the Ripper (密码破解器),以及Aircrack-ng (一应用于对无线局域网进行渗透测试的软件).用户可通过硬盘、live CD或live USB运行Kali Linux。Metasploit的Metasploit Framework支持Kali Linux，Metasploit一套针对远程主机进行开发和执行Exploit代码的工具。
Kali Linux既有32位和64位的镜像。可用于x86 指令集。同时还有基于ARM架构的镜像，可用于树莓派和三星的ARM Chromebook. --[百度百科]

<!-- more-->



## 安装步骤

### 下载

[kali linux 官网](https://www.kali.org/downloads/)



### U盘刻录

镜像刻录U盘工具：Win32 Disk Imager

这个工具刻录的镜像比较完整，可直接用U盘启动，比软碟通要好。



### 安装

- 刻录U盘后重启电脑，不需要用EasyBCD。

- 重启电脑后进入bios，选择U盘启动

- 进入镜像，选择Graphical install选项，当然选择install也是一样的

- 安装语言、地区、键盘

- 无法挂载光盘解决：拔下U盘再插上，选择是继续

- 网络设备固件缺失：直接选择否继续

- 设置主机名和密码：默认用户名：root 密码：toor

- 磁盘分区（最重要一部分），这一部分是很重要的一步，一定要注意看清，选对，再操作。
  - 选择手动
  - 选择我们准备好要安装kali的那个分区
  - 分配分区:
    - /boot:启动分区
    - / :根分区
    - /home:用户目录
    - /tmp:临时文件
    - /usr:文件系统
    - /var:可变数据目录
    - /opt:附加应用程序
    - swap:交换分区

    一般分/boot、/、/home、swap

    分区方案关键点：

    大数据库一般要加大/usr挂载点

    多用户、下载类、多存储文件等要加大/home挂载点

    文件小，用户多要注意/tmp和/var挂载点大小
  - 选择“分区设定结束并将修改写入磁盘”继续
  
- 开始格式化并写入磁盘，这个过程可能有点长，请耐心等待

- 网络镜像

- 写入引导（很重要一步）:一定选是，是个坑

- 安装完成



## 安装之后

- 更新软件源

  修改sources.list文件：/etc/apt/sources.list

  然后选择添加适合自己较快的源（可自由选择）

  保存之后：

  apt-get update      #刷新系统

  apt-get dist-upgrade         #安装更新

- kali-linux安装中文输入法

  apt-get install fcitx-table-wbpy ttf-wqy-microhei ttf-wqy-zenhei         #拼音五笔

- 安装gnome管理软件

  apt-get install gnome-tweak-tool

- 安装新立德

  apt-get install synaptic

- 安装解压缩软件

  apt-get install file-roller

- 安装smplayer视频播放器

  apt-get install smplayer

- 安装多窗口终端

  apt-get install terminator

- 安装VMware和VirtualBox



## 使用及相关系统

渗透测试笔记：使用渗透工具进行测试

[BackBox]()：黑客工具箱

[Parrot Security os]()：本人用的最炫的一个系统，安装也简便，工具很强大，但是系统内部文件跟常规系统不太一样，适合对linux熟悉的人员使用

[Cyborg Hawk]()：工具最多的一个系统，但是全英文，不支持中文，对英语水平要求很高。

