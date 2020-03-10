---
title: 使用JavaScript实现焦点轮播图
tags:
  - JavaScript
categories: web前端
abbrlink: 43699
date: 2017-12-29 00:00:00
---

# 使用JavaScript实现焦点轮播图

## 原理

各大网站都使用焦点轮播图来展示自己的图片，如淘宝、京东等。

1. 焦点轮播图所用技能点：DOM操作、定时器、事件运用、JS动画、函数递归、无限滚动；
2. 无限滚动实现：包含图片的父级标签要有一个属性`overflow:hidden` 来隐藏超出自身尺寸的内容;有`style:left`通过控制left值来实现滚动; 图片列表中要在开始和结束位置添加两张相同的附属图，使图片实现无缝连接。

<!--more-->



## 使用html和css实现静态页面布局

1. 父容器要承载图片、圆点下标、左右切换箭头，要让超出部分隐藏`overflow：hidden`、定位为`position：relative`；
2. 图片的div要添加定位：`position：absolute`让它基于父容器relative，`z-index：1`使图片堆叠在第一层上；
3. 圆点下标和左右切换箭头设置`z-index：2`，`position：absolute`，让其覆盖在图片上；
4. 左右切换箭头在初始状态下设置为隐藏`display：none`，鼠标移上图片时使其显示`display：block`，鼠标移到箭头上时改变透明度RGBA，使箭头颜色加深；


**HTML代码**

```html
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>焦点轮播图</title>
	<link rel="stylesheet" type="text/css" href="css/焦点轮播图.css">
</head>
<body>
	<div id="container">
		<div id="list" style="left: -600px">
			<img src="images/5.jpg" alt="5"> <!-- 附属图实现无缝的滚动 -->
			<img src="images/1.jpg" alt="1">
			<img src="images/2.jpg" alt="2">
			<img src="images/3.jpg" alt="3">
			<img src="images/4.jpg" alt="4">
			<img src="images/5.jpg" alt="5">
			<img src="images/1.jpg" alt="5">
		</div>
		<div id="buttons">
			<span index="1" class="on"></span>
			<span index="2"></span>
			<span index="3"></span>
			<span index="4"></span>
			<span index="5"></span>
		</div>
		<a href="javascript:;" id="prev" class="arrow">&lt;</a>
		<a href="javascript:;" id="next" class="arrow">&gt;</a>
	</div>
	<script type="text/javascript" src="js/焦点轮播图.js"></script>
</body>
</html>
```



**CSS代码**

```css
*{
	margin: 0;
	padding: 0;
	text-decoration :none;
}
body{
	padding: 20px;
}
#container{
	width: 600px;
	height: 400px;
	position: relative;
	border: 3px solid #333;
	overflow: hidden;
}
#list{
	height: 400px;
	width: 4200px;
	position: absolute;
	z-index: 1;  /*设置元素的堆叠顺序*/
}
#list img{
	float: left;
}
#buttons{
	height: 10px;
	width: 100px;
	z-index: 2;
	bottom: 20px;
	left: 250px;
	position: absolute;
}
#buttons span {
	cursor: pointer; /*规定要显示的光标的类型（手指)*/
	float: left;
	border: 1px solid #fff;
	width: 10px;
	height: 10px;
	border-radius: 50%;
	background: #333;
	margin-right: 5px;
}
#buttons .on {  
	background: orangered;
}

.arrow {
	cursor: pointer;
	display: none; /*箭头隐藏*/
	line-height: 39px;
	text-align: center;
	font-size: 36px;
	font-weight: bold;
	width: 40px; height: 40px;  
	position: absolute;
	z-index: 2;
	top: 180px;
	background-color: RGBA(0,0,0,.3); /*透明度设置*/
	color: #fff;
}
.arrow:hover {
	background-color: RGBA(0,0,0,.7);
}
#container:hover .arrow {
	display: block; /*箭头显示*/
}
#prev {
	left: 20px;
}
#next {
	right: 20px;
}
```



## JS动画实现

**箭头切换 -> 无限滚动 -> 按钮切换 -> 延迟切换 -> 自动播放**

1. **箭头切换**
   
   - 整个页面加载`window.onload`，获取元素
   - 通过ID名获取页面中的元素（父容器、承载图片容器、圆点列表、箭头），赋值给一个变量
   - 添加一个时间绑定，点击箭头时实现图片的切换
   - 当点击右箭头时，改变left的值，向左移动，要减去一张图的宽度
   - 获取图片容器的值，`list.style.left` = 自身的值再减去一张图片的宽度
   **注意要把等号后面字符串使用`parseInt`函数转换为数字才可以进行减法，减去的图片宽度要加px单位**
   - 反方向同理，加上一张图片的宽度
   - 左右箭头的写法很相似，只是加减不一样，可以封装成一个函数，通过参数的正负值实现加减
   
   


2. **无限滚动**：弥补左右键切换的空白
   
   - 当前面的附属图比第一张大，最后一张附属图比最后一张小的时候，出现这两种情况时让它复位到真正的第一张或第五张图
   - 判断是否滚到了辅助图上，滚到了让它归位
   - 把常用的`list.style.left`，存到一个变量中，方便使用
   - 添加圆点的切换功能，创建一个变量来承载当前存储的第几张图片/显示第个圆点
   - 写一个函数，用来显示亮起小圆点的功能
	- 圆点是数组，所以创建的变量要减去1才能对应上要显示的圆点，让它亮起来添加class名
   `<span index="1" class="on">`
   - 再绑定事件中左箭头index要加一，右箭头要减一，调用圆点函数让它点击时显示，每次点击箭头的时候都要改变index的值，使它对应到正确的图片上，调用showButton亮起对应的圆点
   - 亮起自己的同时，让其他不亮，使用for循环，去掉所有的class，然后break退出循环，不再继续遍历元素节点
   - 箭头点击时，当圆点index大于5时，让它归位为1，小于1时，归位为5，不到5时加1
   
   


3. **圆点按钮切换**
   
   - 通过for循环遍历圆点，添加点击事件
   
   - 点击按钮时，取到index值，就可以知道当前点击的是第几个按钮，要显示第几张图片
   
   - 通过DOM2级方法`getAttribute()`获取到自定义（或自带）属性，为了计算再转换为数字`var myIndex = parseInt(this.getAttribute('index'));`
   
   - 通过新的值减去旧的值获取偏移量`var offset = -600 * (myIndex - index);`
   
   - 写一个判断，当这张图片是打开状态的，就什么都不做，用class=on来判断是否打开，return跳出，后面的代码不会再执行
   
     ```javascript
     if (animated) {
     	return;
     }
     if (this.className == 'on') {
          return;
     }
     ```
   
4. **动画函数**
   
   - 图片在一定时间内进行位移，要判断是否达到目标值，没有达到还要继续做位移
   - 声明一个变量用offset总共的偏移量除以次数（位移总时间time除以位移间隔时间inteval),求出每次移动多少`var speed = offset / (time / inteval);`
   - 判断speed小于0并且left值是否大于目标值newLeft或speed大于0并且left值小于目标值，这两种情况让它做位移`speed > 0 && parseInt(list.style.left) < left) || (speed < 0 && parseInt(list.style.left) > left`
   - 在判断中放入定时器setTimeout
   一个函数不停的在一定的条件之后调用自身这种做法叫做递归
- 优化：声明一个变量，作为动画是否在运行的依据，开始状态为false表示没有运行`var animated = false; //优化`
  
   
  
5. **自动播放**
   
   - 鼠标移开时自动播放，鼠标移上去时停止，通过定时器`setTimeout`和`clearTimeout`来实现的
   - 设置定时器，让它隔几秒切换一次，相当于3秒钟调一次`next.onclick`（右箭头）事件
   - 自动切换需要写两个函数来控制自动切换，声明一个变量来存放定时器不给任何值
   - 鼠标移开时定时器执行，移上时清除定时器执行，要给整个容器加一个鼠标移入移开事件
   - 鼠标不做任何事情时让它自动播放，调用函数



**代码如下**

```javascript
window.onload = function() {
    var container = document.getElementById('container');
    var list = document.getElementById('list');
    var buttons = document.getElementById('buttons').getElementsByTagName('span');
    var prev = document.getElementById('prev');
    var next = document.getElementById('next');
    var index = 1; //索引
    var len = 5;
    var animated = false; //优化
    var interval = 3000; //时间间隔
    var timer;

    function showButton() {
        for (var i = 0; i < buttons.length; i++) {
            if (buttons[i].className == 'on') {
                buttons[i].className = '';
                break;
            }
        }
        buttons[index - 1].className = 'on';
    } //按钮切换

    next.onclick = function() {
        if (animated) {
            return;
        }
        if (index == 5) {
            index = 1;
        } else {
            index += 1;
        }
        animate(-600);
        showButton();
    }//右切换
    prev.onclick = function() {
        if (animated) {
            return;
        }
        if (index == 1) {
            index = 5;
        } else {
            index -= 1;
        }
        animate(600);
        showButton();
    }//左切换

    function play() {
        timer = setTimeout(function() {
            next.onclick();
            play();
        }, interval);
    }

    function stop() {
        clearTimeout(timer);
    }

    for (var i = 0; i < buttons.length; i++) {
        buttons[i].onclick = function() {
            if (animated) {
                return;
            }
            if (this.className == 'on') {
                return;
            }
            var myIndex = parseInt(this.getAttribute('index'));
            var offset = -600 * (myIndex - index);
            animate(offset);
            index = myIndex;
            showButton();
        }
    }

    function animate(offset) {
        if (offset == 0) {
            return;
        }
        animated = true;
        var time = 300; //时间
        var inteval = 10; //时间间隔
        var speed = offset / (time / inteval); //速度
        var left = parseInt(list.style.left) + offset; //改变值来实现滚动

        var go = function() {
                if ((speed > 0 && parseInt(list.style.left) < left) || (speed < 0 && parseInt(list.style.left) > left)) {
                    list.style.left = parseInt(list.style.left) + speed + 'px';
                    setTimeout(go, inteval);
                } else {
                    list.style.left = left + 'px';
                    if (left > -200) {
                        list.style.left = -600 * len + 'px';
                    }
                    if (left < (-600 * len)) {
                        list.style.left = '-600px';
                    }
                    animated = false;
                }
            } //自动滚动
        go();
    }

    container.onmouseover = stop();
    container.onmouseout = play();

    play();
}
```



## 总结

焦点轮播图的实现需要耐心分析原理，掌握焦点轮播图所需的技能点，从而通过代码实现。

先写出静态页面html+css，注意属性值的设置。再用js一步一步写出箭头切换、按钮切换的函数，学会设置和清除定时器、递归调用函数，实现自动滚动播放。

