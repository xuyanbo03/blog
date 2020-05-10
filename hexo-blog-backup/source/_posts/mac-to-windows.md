---
title: Mac转Windows的拯救指南
tags:
  - Mac
  - Windons
categories:
  - 工具
copyright: ture
author: Awebone
abbrlink: 143a0a72
date: 2017-10-13 00:00:00
---

# Mac转Windows的拯救指南

>假期使用Mac开发，目前转Windows开发学习，体会了Mac上高效率的快捷键之后，感觉用鼠标点来点去很麻烦，将一些小工具使用，来提高效率。这只是给新手介绍，大神请绕过。



下面开始介绍一些工具来拯救Mac党

### 1.Chocolatey

[Chocolatey](https://chocolatey.org/)是一个Windows上的包管理器，类似于linux上的yum和 apt-get。 你可以在其官方网站上查看具体的使用说明。一般的安装步骤应该是下面这样：

**CMD**

```cmd
@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
```

**Powershell**

```powershell
Set-ExecutionPolicy Bypass; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

一般来说，使用Chocolatey来安装软件的时候，需要以管理员的身份来运行命令提示符窗口。chocolatey的网站可能在国内访问困难，导致上述安装命令无法正常完成。请使用科学上网。

<!-- more-->



### 2.Cmder or Powershell or Git

[Cmder](http://cmder.net/)是一个替代原机自带cmd的命令行，可以配置，有快捷键，常用的Tab补全，集成Git等。

[Powershell](https://docs.microsoft.com/en-us/powershell/)是微软公司开发的任务自动化和管理框架。功能强大，背后还有牛逼的老爹支持，命令与cmd有所不同，老司机可以玩玩。

[Git](https://git-scm.com/)是一个自由开源的版本控制工具，它在Windows下有相应的命令行工具，命令与linux命令相同，学习了linux，可以很快上手，对于前端来说，这个我觉得是比较方便的，但是，有时候也会抽风。



### 3.Listary or Wox

[Listary](http://www.listary.com/)是一个文件浏览增强工具。和Mac下的Alfred工具差不多，个人使用free版本即可，自定义快捷键，笔记本可以脱离鼠标，直接使用键盘和触摸板。


[Wox](http://www.getwox.com/)是一个有效的搜索工具。

- 可以文件和应用搜索
- 有插件支持
- 主题修改
- web快捷键快速查找，自定义搜索引擎



### 4.Total Commander

[Total Commander](https://www.ghisler.com/)是一款应用于 Windows 平台的文件管理器 ，它包含两个并排的窗口，这种设计可以让用户方便地对不同位置的“文件或文件夹”进行操作，例如复制、移动、删除、比较等，相对 Windows 资源管理器而言方便很多，极大地提高了文件操作的效率，被广大软件爱好者亲切地简称为：TC 。

它拥有文件快速预览、快速搜索、多标签、文件比较、批量重命名、FTP 客户端等诸多实用的功能，并可通过大量的插件进行个性化配置。

官网介绍不是很详细，可查看维基百科的介绍，[TC](https://zh.wikipedia.org/wiki/Total_Commander)。



### 5.FastStone Screen Capture or Snipaste

[FastStone Screen Capture](http://www.faststone.org/FSCaptureDetail.htm)是一个轻量的截屏工具，很老但是很强大。

[Snipaste](https://zh.snipaste.com/)，免费，免安装，可定制。



### 6.NotePad++

[NotePad++](https://notepad-plus-plus.org/download/)，替代记事本的轻量级记事本，原本的记事本会有很多弊病，编码格式不是UTF-8。NotePad++解决了这些麻烦，还可以自定义设置，完全变成编辑器，有提示。



### 7.Xshell

[Xshell]()是一个强大的安全终端模拟软件，它支持SSH1, SSH2, 以及Microsoft Windows 平台的TELNET 协议。Xshell 通过互联网到远程主机的安全连接以及它创新性的设计和特色帮助用户在复杂的网络环境中享受他们的工作。 Xshell可以在Windows界面下用来访问远端不同系统下的服务器，从而比较好的达到远程控制终端的目的。

