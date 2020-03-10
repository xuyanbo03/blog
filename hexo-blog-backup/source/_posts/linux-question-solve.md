---
title: 关于Linux问题的解决办法
tags:
  - Linux
categories: Linux
abbrlink: 13368
date: 2017-03-05 00:00:00
---

# 关于Linux问题的解决办法

>我安装win10和Debian系的linux双系统，以这个双系统为基础，解决linux问题。



## 关于win10更新之后，重新启动没有windows的引导的问题

**解决方法：**

- 进入Linux操作系统，打开命令行

- 输入 `su` 切换root用户

- 输入
  `apt-get update`
  `update-grub`

- 重启系统，出现windows的引导

<!-- more -->



## 关于当前使用用户不在sudoers文件中，无法使用sudo命令的问题

**解决方法：**

- 切换到超级用户root `su`

- 查看/etc/sudoers权限，可以看到当前权限为440
   `ls -all /etc/sudoers`
  出现下列：
   -r--r----- 1 root root 744  6月  8 10:29 /etc/sudoers

- 更改权限为777
   `chmod 777 /etc/sudoers`

- 编辑/etc/sudoers
   `vi /etc/sudoers`

- 在`root    ALL=(ALL:ALL) ALL` 下面添加一行
   `user    ALL=(ALL)ALL`
   然后保存退出。

   **解释：第一个ALL是指网络中的主机，我们后面把它改成了主机名，它指明user可以在此主机上执行后面的命令。第二个括号里的ALL是指目标用户，也就是以谁的身份去执行命令。最后一个ALL当然就是指命令名了。**
   
- 把/etc/sudoers权限改回440
   `chmod 440 /etc/sudoers`

- 操作完成,可以使用`sudo`命令



## Linux中GRUB引导故障的修复

**解决方法：**

- 需要用usb做个Debian的系统安装盘

- 从usb启动，进入debian的修复模式，进入终端

- `fdisk -l` 查看分区情况

- 需要识别出分区与原文件系统的挂接关系
    /dev/sda7               swp
    /dev/sda8               /
    /dev/sda9               /home
    /dev/sda10            /boot

- 把与目录/对应的分区/dev/sda8挂在/mnt上，把与目录home对应的分区/dev/sda9挂在/mnt/home上，
   把/dev挂在/mnt/dev上

- 输入命令`chroot /mnt`

- 输入命令`grub-install /dev/sda`

- 重启，出现引导

- 进入系统,
    `su`
    `update-grub`

- 重启，进入系统

