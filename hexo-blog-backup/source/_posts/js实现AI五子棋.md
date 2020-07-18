---
title: 使用JavaScript实现AI五子棋
tags:
  - JavaScript
categories: 
  - web前端
abbrlink: d24e8921
copyright: ture
author: Awebone
date: 2017-04-27 00:00:00
---

# 实现步骤

1. 搭建HTML、CSS、JS框架

2. canvas画图
3. js实现棋盘
4. js实现棋子
5. 棋盘落子

<!-- more -->

<br />



# canvas画图

```javascript
<canvas id="chess" width="450px" height="450px"></canvas>

canvas {
    display: block;
    margin: 50px auto;
    box-shadow: -2px -2px 2px #efefef, 5px 5px 5px #b9b9b9;
}

var chess = document.getElementById('chess');
var context = chess.getContext('2d');
```

<br />



# js实现棋盘

```javascript
var drawChessBoard = function() {
    for (var i = 0; i < 15; i++) {
        context.moveTo(15 + i * 30, 15);
        context.lineTo(15 + i * 30, 435);
        context.stroke();
        context.moveTo(15, 15 + i * 30);
        context.lineTo(435, 15 + i * 30);
        context.stroke();
    }
}
```

<br />



# js实现棋子

```javascript
var oneStep = function(i, j, me) {
	//画圆
    context.beginPath();
    context.arc(15 + i * 30, 15 + j * 30, 13, 0, 2 * Math.PI);
    context.closePath();

    //渐变
    var gradient = context.createRadialGradient(15 + i * 30 + 2, 15 + j * 30 - 2, 13, 15 + i * 30 + 2, 15 + j * 30 - 2, 0);
    if (me) {
    	gradient.addColorStop(0, "#0a0a0a");
    	gradient.addColorStop(1, "#636766");
    }else{
    	gradient.addColorStop(0, "#d1d1d1");
    	gradient.addColorStop(1, "#f9f9f9");
    }

    context.fillStyle = gradient;
    context.fill();
}
```

<br />



# 落子

```javascript
chess.onclick = function(e) {
    var x = e.offsetX;
    var y = e.offsetY;

    //向下取整算出索引
    var i = Math.floor(x / 30);
    var j = Math.floor(y / 30);
    if (chessBoard[i][j]==0) {
    	oneStep(i, j, me);
    	if (me) {
    		chessBoard[i][j]==1;
    	}else{
    		chessBoard[i][j]==2;
    	}

    	//me轮流取反
    	me = !me;
    }
}

//默认黑子
var me = true;

//存储棋盘落子情况
var chessBoard=[];
for (var i = 0; i < 15; i++) {
	chessBoard[i]=[];
	for (var j = 0; i < 15; j++) {
		chessBoard[i][j]=0;
	}
}
```

