---
title: CSS3实现3D魔方
tags:
  - CSS
categories: web前端
abbrlink: 27135
date: 2017-04-22 00:00:00
---

# CSS3实现3D魔方

**实现思路**

- 写出基础HTML框架

- 基本CSS样式，初始化

- CSS实现魔方的各个面：外轮廓和内盒子

- CSS3实现魔方表面的3D位置

- CSS3实现旋转

<!-- more-->



## 第一步：HTML结构

**六个面类似如下结构**

```html
<h1>3D魔方</h1>
<div class="view">
    <div class="box">
        <div class="red-surfaces">
            <div id="one"></div>
            <div id="two"></div>
            <div id="three"></div>
            <div id="four"></div>
            <div id="five"></div>
            <div id="six"></div>
            <div id="seven"></div>
            <div id="eight"></div>
            <div id="nine"></div>
        </div>
    </div>
</div>
```



## 第二步：CSS初始化

```css
* {
    margin: 0px;
    padding: 0px;
}

body {
    min-height: 600px;
    height: 100%
}

body h1 {
    margin-top: 50px;
    text-align: center;
}

.view {
    margin: -60px auto;
    width: 800px;
    height: 800px;
    position: relative;
    border-radius: 20px;
    -webkit-transform: scale(0.7);
}
```



## 第三步：CSS实现魔方的各个面-外轮廓和内盒子

**外轮廓样式**

```css
.red-surfaces,
.blue-surfaces,
.green-surfaces,
.white-surfaces,
.orange-surfaces,
.yellow-surfaces {
    height: 330px;
    width: 330px;
    position: absolute;
    border-radius: 5px;
    top: 235px;
    left: 235px;
}
```

**内盒子样式**

```css
.red-surfaces>div,
.blue-surfaces>div,
.green-surfaces>div,
.white-surfaces>div,
.orange-surfaces>div,
.yellow-surfaces>div {
    height: 100px;
    width: 100px;
    display: inline-block;
    border: 5px solid rgba(170, 170, 170, 0.9);
    position: absolute;
}
```

**内盒子颜色 : 六面**

```css
.red-surfaces>div {
    background-color: rgba(255, 0, 0, 0.8);
}
```

**内盒子定位 ：九个小块**

```css
#one {
    left: 0px;
    top: 0px;
}
```



## 第四步：CSS3实现魔方表面的3D位置

**六个表面不同角度设置**

```css
.red-surfaces {
    -webkit-transform: rotateX(-90deg) translateZ(165px);
}
```



## 第五步：CSS3实现旋转

**keyframe定义 ：animation**

- name规定需要绑定到选择器的keyframe名称
- duration规定完成动画所花费的时间，以秒或毫秒计
- timing-function规定动画的速度曲线
- delay规定在动画开始之前的延迟
- iteration-count规定动画应该播放的次数
- direction规定是否应该轮流反向播放动画

```css
.box{
  -webkit-animation:BoxRotate 3s ease-in-out infinite;
}
```



**动画旋转基准 : transform-origin**

```css
.box{
  -webkit-transform-origin: 400px 400px 200px;
}
```



**3D实现：transform-style**

```css
.box{
  -webkit-transform-style: preserve-3d;
}
```



**keyframe定义旋转**

```css
@-webkit-keyframes BoxRotate {
    16% {
        -webkit-transform: rotateY(-90deg) rotateZ(135deg);
    }
    33% {
        -webkit-transform: rotateY(-90deg) rotateX(135deg);
    }
    50% {
        -webkit-transform: rotateY(225deg) rotateZ(135deg);
    }
    66% {
        -webkit-transform: rotateY(135deg) rotateX(135deg);
    }
    83% {
        -webkit-transform: rotateX(135deg);
    }
}
```



## 总结

CSS3也可以实现js实现的动画，而且还减少资源消耗，要熟练掌握新特性。
