---
title: PHP编辑器整理
date: 2017-01-24
tags: [php]
categories: 工具
---

# PHP编辑器整理

### 第一：Eclipse

Eclipse 是一个开放源代码的、基于Java的可扩展开发平台。就其本身而言，它只是一个框架和一组服务，用于通过插件组件构建开发环境。幸运的是，Eclipse 附带了一个标准的插件集，包括Java开发工具。虽然大多数用户很乐于将Eclipse 当作Java 集成开发环境（IDE）来使用，但Eclipse 的目标却不仅限于此。

<!--more-->

Eclipse 还包括插件开发环境（Plug-in Development Environment，PDE），这个组件主要针对希望扩展Eclipse 的软件开发人员，因为它允许他们构建与Eclipse 环境无缝集成的工具。由于Eclipse 中的每样东西都是插件，对于给Eclipse 提供插件，以及给用户提供一致和统一的集成开发环境而言，所有工具开发人员都具有同等的发挥场所。

*P.S：程序员用Eclipse的话，有代码自动缩进、补全功能，有方法跳转，相同变量提醒。另外其实phpstorm、sublime 都还不错。看个人喜好。*


### 第二：PHPstorm

PhpStorm是一个轻量级且便捷的PHP IDE，其旨在提供用户效率，可深刻理解用户的编码，提供智能代码补全，快速导航以及即时错误检查。
PHPstorm优点：
1. 跨平台。
2. 对PHP支持refactor功能。
3. 自动生成phpdoc的注释，非常方便进行大型编程。
4. 内置支持Zencode。
5. 生成类的继承关系图，如果有一个类，多次继承之后，可以通过这个功能查看他所有的父级关系。
6. 支持代码重构，方便修改代码。
7. 拥有本地历史记录功能（local history功能）。
8. 方便的部署，可以直接将代码直接upload到服务器。

补充：phpstrom下的vim模式。大家一般都用vim，用的精通了都感觉效率高。但用了之后插件装了一大堆。而且框架目录层太深，用vim导航，找文件就很尴尬，于是尝试了phpstorm，但是，习惯了vim的跳转，光标移动等等，偶然发现phpstorm还有vim模式，基本可以兼容vim的常用编辑操作，同时也可以享受到phpstrom其他强大的功能，如函数跳转（个人认为最强大的地方）、文件搜索等等。

*PS：搞PHP，必用PHPStorm，这可以说是神器！它的不足之处，内存太大。有的时候公司电脑不行，电脑配置是跟不上的，还有就是PHPstorm，功能全，该有的都有，比较适合偷懒程序员用。*


### 第三：sublime Text

Sublime Text 不仅是一个代码编辑器（Sublime Text 2是收费软件，但可以无限期试用），也是HTML和散文先进的文本编辑器。它最初被设计为一个具有丰富扩展功能的Vim。
Sublime Text具有漂亮的用户界面和强大的功能，例如代码缩略图，Python的插件，代码段等。还可自定义键绑定，菜单和工具栏。Sublime Text 的主要功能包括：拼写检查，书签，完整的Python API，Goto 功能，即时项目切换，多选择，多窗口等等。Sublime Text 是一个跨平台的编辑器，同时支持Windows、Linux、Mac OS X等操作系统。

Sublime Text优点：
1. 主流前端开发编辑器
2. 体积较小，运行速度快
3. 文本功能强大
4. 支持编译功能且可在控制台看到输出
5. 内嵌python解释器支持插件开发以达到可扩展目的
6. Package Control：ST支持的大量插件可通过其进行管理[3]



### 第四：EditPlus

EditPlus是一款由韩国Sangil Kim （ES-Computing）出品的小巧但是功能强大的可处理文本、HTML和程序语言的Windows编辑器，你甚至可以通过设置用户工具将其作为C,Java,Php等等语言的一个简单的IDE。

EditPlus（文字编辑器）汉化版是一套功能强大，可取代记事本的文字编辑器，拥有无限制的撤消与重做、英文拼字检查、自动换行、列数标记、搜寻取代、同时编辑多文件、全屏幕浏览功能。而它还有一个好用的功能，就是它有监视剪贴板的功能，同步于剪贴板可自动粘贴进EditPlus 的窗口中省去粘贴的步骤。另外它也是一个非常好用的HTML编辑器，它除了支持颜色标记、HTML 标记，同时支持C、C++、Perl、Java，另外，它还内建完整的HTML & CSS1 指令功能，对于习惯用记事本编辑网页的朋友，它可帮你节省一半以上的网页制作时间，若你有安装IE3.0 以上版本，它还会结合IE浏览器于EditPlus 窗口中，让你可以直接预览编辑好的网页（若没安装IE，也可指定浏览器路径）。因此，它是一个相当棒又多用途多状态的编辑软件。

*P.S：经常用到EditPlus里面的ftp功能，在线编辑代码，很合适！用Editplus编辑器感觉有点异类。*


### 第五：notepad++

Notepad++是Windows操作系统下的一套文本编辑器(软件版权许可证: GPL)，有完整的中文化接口及支持多国语言编写的功能(UTF8技术)。Notepad++功能比Windows 中的Notepad(记事本)强大，除了可以用来制作一般的纯文字说明文件，也十分适合编写计算机程序代码。Notepad++ 不仅有语法高亮度显示，也有语法折叠功能，并且支持宏以及扩充基本功能的外挂模组。Notepad++是免费软件，可以免费使用，自带中文，支持众多计算机程序语言:C,C++,Java,pascal,C#,XML,SQL,Ada,HTML,PHP,ASP, AutoIt,汇编, DOS批处理, Caml, COBOL, Cmake, CSS,D, Diff,Action, Fortran,Gui4Cli, HTML, Haskell,INNO, JSP,KIXtart, LISP, Lua, Make处理(Makefile), Matlab, INI文件, MS-DOSStyle, NSIS, Normal text, Objective-C, Pascal,Python, Java,Verilog,Haskell,InnoSetup,CMake,VHDL,AutoIt,Matlab
notepad++的优点：比windows自带的记事本强一点，因为能显示括号跟颜色，用这个写代码速度最快，因为与复杂的编辑器相比，打开跟关闭还有电脑卡的效率已经远远低于编辑器能提供的辅助的效率。

*P．S：Notepad++ 快速而且简单，还在用NetBeans的话有个缺点就是html的模板，如果有thinkphp的模板标签html标记的起始结束符高亮就失效了，只能等待更新之前用的netbeans 后来netbeans开大项目有点卡换成了Notepad++。*

### 总结：

PHP 编辑工具其实挺多的，以至于很多php程序员无从下手。很多同事常用的编辑器phpstorm，Notepad++，PhpStorm，editplus;等等，工欲善其事，必先利其器，用熟用精一款编辑器就行，自己顺手才是最舒服的。一开始初学的时候用editplus;后来又用editplus;最后用vim ，其实用eclipse次数比较多，喜欢自己装插件，插件很多，大项目常用。平时自己开发小项目，学习用notepad++,editplus，公司电脑内存小，可以用Sublime。
