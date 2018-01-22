---
title: 用GitHub和hexo搭建个人主站
date: 2017-02-24
tags: [github,hexo,npm]
categories: blog
---

# 用GitHub和hexo搭建个人主站

作为一个程序员，拥有一个自己的博客，平时记录一下，分享点技术文章，是很有必要的。建立博客的通常渠道包括：
1. 在博客平台上注册，比如 博客园、CSDN、新浪博客 等。
2. 利用博客框架搭建，如 WordPress、Jekyll、hexo 等。
3. 自己用代码写一个。

其中，第一种最简单，也最受限，说不定还会被删帖删号。第二种稍复杂，另外需要自己找部署的服务器，但可定制化较高，是很多程序员的选择。最后一种，是在重复造轮子，不过从另一个方面来看，倒是锻炼编程能力的好方式。


<!--more-->
---

**下面我们就来看下第二种搭建博客的方式。**

1. github＋hexo 建立你的第一个博客
2. 部署博客及更新博文
3. 安装自己喜欢的主题
4. 购买并绑定域名


### 前言
其实呢，建立博客是非常简单的（哈哈，不管什么东西，你会的就觉得简单，不会的怎样都难），我来给大家说说如何使用 GitHubPages 和 Hexo 建立自己的博客。

这个有一点难度，但是不要怕，我会一步一步的给大家完成指导的，如果有任何问题也可以随时联系我，我会尽力给大家解决的！



### 第一步：github＋hexo 建立你的第一个博客
下面先介绍为何选择 GitHubPages 和 Hexo 来搭建博客，然后介绍搭建博客的详细过程。

Why GitHub Pages and Hexo

因为 GitHub 的存在，我们得以简单快速地搭建个人博客。

**GitHub**，是一个代码托管网站和社交编程网站。这里聚集了世界上各路技术牛叉的大牛，和最优秀的代码库。

**GitHub Pages**，是用来托管 GitHub 上静态网页的免费站点，那 GitHub Pages具体有哪些功能呢：
- 有 300M 免费空间，资料自己管理，保存可靠；
- 享受 GitHub 的便利，上面有很多大牛，眼界会开阔很多；
- 可以使用很多现成的博客框架，搭建过程简单快速。

**Hexo** 是一个简单、快速、强大的静态博客框架,出自台湾大学生 tommy351 之手。我也试过使用 Jekyll搭建个人博客的过程，确实要繁琐许多。相比之下 Hexo 更轻便更快捷，下面是其官网强调的四大特点：
- 极速生成静态页面
- 一键部署博客
- 丰富的插件支持
- 支持 Markdown


大家对 GitHub Pages 和 Hexo 有了一定的了解，下面进入正题。

#### 使用 GitHub Pages 建立博客站点

##### 注册 GitHub
访问 GitHub，注册十分简单，一定要记住注册时使用的邮箱，因为 GitHub 上很多通知都是通过邮箱的。申请成功后，在 GitHub 官网上登录，并验证邮箱即可。

##### 在 GitHub 上建立仓库
与 GitHub 建立好连接之后，就可以方便的使用它提供的 Pages 服务，GitHub Pages 分两种，一种是用你的 GitHub 用户名建立的 username.github.io 这样的用户&组织站点，另一种是依附项目的 Pages。

想建立个人博客是用的第一种，形如 【username.github.io】 这样的可访问的站点，每个用户名下面只能建立一个。建立仓库的方法参照github官网的教程。

##### 搭建环境
安装软件

[Node.js](https://nodejs.org/en/)
下载完成后根据提示一步一步安装就好，这个没有什么需要特别说明的。

[GitHub for Windows](https://desktop.github.com/)
下载并安装这个软件，一直点击下一步即可

[git](https://www.baidu.com/link?url=o8u5B5T07ibHSwXJYNkBxlvwOsSFGGMXm-ABta1del8wif08riRADzUtuclP_th-&wd=&eqid=e80ce7320000c9800000000658b0248f)

##### 使用GitHub for Windows登录GitHub
配置 SSH

我们如何让本地 git 项目与远程的 GitHub 建立联系呢？方法是用 SSH。

打开命令行，输入以下命令：`ssh -T git@github.com`

如果是下面之类的反馈（或者显示 Hi xxx）：
`The authenticity of host 'github.com ' can't be established. RSA key fingerprint is 16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48. Are you sure you want to continue connecting (yes/no)?`
不用紧张，输入 yes 之后就配置成功了。

##### 使用 Hexo 创建博客框架
Hexo 安装

Node和Git都安装好后,首先创建一个文件夹,如blog,用户存放hexo的配置文件,然后进入blog里安装Hexo。

打开git bash命令行，输入命令：
`npm install -g hexo`

Hexo 部署

Hexo 的部署输入命令：
`hexo init`

部署成功之后，用hexo生成静态页面，输入命令：
`hexo generate`或者`hexo g`也可以

此时在本地进行预览（在刚才创建的blog文件夹里）,输入命令：
`hexo server`或者`hexo s`

此时打开浏览器，在浏览器地址栏输入 http://localhost:4000/ （默认端口为4000）, 便可以看到最原始的博客了。

以后发表博文想先预览，也可以通过 hexo server 在本地先跑起来，看看效果。

在 Git Shell 中按 `Ctrl+c` 可以停止该服务。


##### 配置Github

建立Repository

建立与你用户名对应的仓库，仓库名必须为【username.github.io】，这是固定写法

然后建立关系，找到之前建立的blog文件夹，之前建的东西也全在这里面，有：

    _config.yml    node_modules    public      source

    db.json        package.json    scaffolds  themes


现在我们需要修改_config.yml文件，来建立关联，使用notepad++打开_config.yml文件

翻到最下面，改成这样：


    deploy:

        type: git

        repo: https://github.com/username/username.github.io.git

        branch: master


注：username为你的用户名


然后执行命令：
`npm install hexo-deployer-git --save`

然后，执行配置命令：
`hexo deploy`

然后在浏览器中输入http://username.github.io/ 就行了。


##### 部署步骤

每次部署的步骤，可按以下三步来进行：

    `hexo clean`

    `hexo generate`

    `hexo deploy`



##### 报错总结

    ERROR Deployer not found: git 或者 ERROR Deployer not found: github

解决方法：
`npm install hexo-deployer-git --save`

    如发生报错： ERROR Process failed: layout/.DS_Store

那么进入主题里面layout和_partial目录下，使用删除命令：
`rm-rf.DS_Store`

    ERROR Plugin load failed: hexo-server

    原因：

    Besides,utilities are separated into a standalone module.hexo.util is not reachable anymore.

解决方法:
`npm install hexo-server`

    执行命令hexo server，提示：Usage: hexo ....

    原因：

    我认为是没有生成本地服务

解决方法:
`npm install hexo-server --save`

    提示：hexo-server@0.1.2 node_modules/hexo-server

    ....

    表示成功了参考

这个时候再执行：
`hexo-server`

    得到:

    INFOHexois running at http://0.0.0.0:4000/.PressCtrl+C to stop.

这个时候再点击http://0.0.0.0:4000, 正常情况下应该是最原始的画面。

这个时候再重新生成静态文件，命令：
`hexo generate`或`hexo g`

启动本地服务器：
`hexo server`或`hexo s`

本地已经简单的设置好了，但是现在域名和服务器都是基于自己的电脑，接下来需要跟github进行关联。


### 第二步：部署博客及更新博文

在blog文件夹下将博客放入public文件夹中

在blog文件夹下打开git bash，按以下三步进行：

    `hexo clean`

    `hexo g`

    `hexo d`


### 第三步：安装主题

我安装的是nexT主题，可参考主题作者在GitHub的README[nexT](https://github.com/iissnan/hexo-theme-next)

还有我比较喜欢的主题 [yilia](https://github.com/litten/hexo-theme-yilia)


### 第四步：购买并绑定域名

##### 购买域名

我是在万网上购买的域名，越出名的后缀越贵，看自己吧，比如.com .cn .net这些域名还需要备案，否则用不了。[万网](https://wanwang.aliyun.com/)

##### 绑定域名

创建CNAME。
1. 登陆访问github。
2. 进入github中需要关联域名的相应项目。
3. 在该项目下创建CNAME，其CNAME内容即是域名

前往你的DNS服务商

进入"新增解析"界面。

在万网首页点击【进入会员中心】→ 点击【产品管理】下的【域名解析】→ 进入【域名列表】界面 → 点击域名→ 进入【新增解析】界面。

设置域名解析记录。

点击【新增解析】；依次填写相应内容。

"记录类型"选择A；"主机记录"填写www；"解析线路"选择默认；

"记录值"填写github提供的IP地址，192.30.252.153或192.30.252.154；

"TTL"默认10分钟，自己可以另行设置也可；

最后点击【保存】。

验证域名与github关联是否成功。

先以github的链接方式访问一次，查看界面；再以域名的方式访问一次，查看界面；两者所查看到的界面是一致。

注：若域名不能立即访问，需等待一段时间再访问。当github成功关联到域名后，以github的链接方式进行访问，其会自动转化为域名访问。


### 参考博客：

[潘柏信的博客](http://leopardpan.github.io)

[百度](http://jingyan.baidu.com/article/dca1fa6fa1e403f1a5405262.html)
