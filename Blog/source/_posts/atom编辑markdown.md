---
title: 用Atom编辑markdown笔记
date: 2017-02-22
tags: [atom,markdown]
categories: blog
---

# 用Atom编辑markdown笔记

## 简述

Atom是github开发的开源跨平台的编辑器，Atom的强大可以与大名鼎鼎的Sublime Text相媲美。因为使用过Sublime Text，所以用Atom上手很快。这篇文章主要介绍使用Atom写markdown。

之前在项目开发中都是使用.doc文件作为接口文档的载体，但是在使用中并不能很好的对比接口修改，如果使用.txt文件，又没有醒目的格式。所以，选择语法简单，方便对比的markdown来作为接口文档的载体。主要介绍下书写和解析markdown的编辑器。

<!--more-->

## 编辑器的选择

任何文本编辑器都可以书写markdown，但我们更期望能够在书写的时候能够即时的看到解析效果，方便对格式进行调整。

### mac os

在mac os 下，我推荐Mou，界面简洁优雅，解析流畅，也许没有更好的了。

### windows os

-  Sublime Text：有markdown preview插件支持，能够在浏览器里查看编译效果，但是并不是实时的，需要在修改后进行刷新或者，并不方便。
-  mardown pad：能够很好的书写，并支持预览，但收费。
-  Atom：推荐使用。内置对markdown的支持，能够方便的进行解析预览。


## 使用Atom预览markdown

1. 打开任意.md文件(markdown源文件)
2. `windows : ctrl + shift + p`

    `mac : command + shift + p`

    这条命令跟Sublime Text是一样的，打开命令输入框
3. 输入 markdown preview toggle(可以只输入mdpt，跟Sublime Text一样支持模糊匹配)
4. 按enter键即可看到预览，左边编辑，右边实时预览。
5. 也可以直接用快捷键`ctrl + shift + m`

## 使用Atom编写markdown的特性

##### 以下几个特性是我选择Atom的主要原因：

- Markdown实时预览

- 使用Crtl+Shift+M开启

- Markdown代码高亮

- 比Mou的代码高亮效果好多了

- 多文件管理

- Atom提供了文件树列表的功能（IDE中常见）

- Github紧密结合

- 多平台支持

- Mou只支持Mac OS

- Atom插件管理工具：使用apm install 插件名称， 可以很方便的安装插件。

## 常用快捷键

**以下是Mac OS平台的常用快捷键：**

`Command+Shift+P` 打开命令窗口，可以运行各种菜单功能

`Command + T` 快速多文件切换

`Command + G` 文件内跳转到指定行

`Command + F` 文件内查找和替换

`Command + Shift + F` 多文件查找和替换

`Command + [` 对选中内容向左缩进

`Command + ]` 对选中内容向右缩进

## Markdown网上编辑

推荐：[马克飞象](https://maxiang.io/)

## Atom下载

[Atom下载](https://atom.io/)
