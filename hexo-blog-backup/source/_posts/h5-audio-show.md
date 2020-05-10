---
title: HTML5音频解析与可视化
tags:
  - HTML5
categories:
  - web前端
copyright: ture
author: Awebone
abbrlink: fd5cbc55
date: 2017-10-25 00:00:00
---

# HTML5音频解析与可视化

## 基本结构

使用express 框架搭建后台基本结构

<!-- more-->



## 加载音乐并用ajax请求资源

**加载音乐文件：**

```js
var lis = $("#list li");

for (var i = 0; i < list.length; i++) {
    lis[i].onclick = function() {
        for (var j = 0; j < lis.length; j++) {
            lis[j].className = "";
        }
        this.className = "selected";
        load("/media/" + this.title);
    }
}
```



**ajax加载资源**

```js
var xhr = new XMLHttpRequest()；
xhr.abort();
xhr.open("GET", url);
xhr.responseType = "arraybuffer";
xhr.onload = function() {}；
xhr.send();
```



## Web Audio Api 关系图

![1.webAudio-API](/images/h5-audio/1.webAudio-API.jpg)



## 使用AudioContext解码

![2.AudioContext](/images/h5-audio/2.AudioContext.jpg)



**实现：**

```js
var ac = new(window.AudioContext || window.webkitAudioContext)();
ac.decodeAudioData(xhr.response, function(buffer) {
    if (n != count) return;
    var bufferSource = ac.createBufferSource();
    bufferSource.buffer = buffer;
    bufferSource.connect(gainNode);
    //bufferSource.connect(ac.destination);
    bufferSource[bufferSource.start ? "start" : "noteOn"](0);
    suurce = bufferSource;
}
```



## 使用gainNode调节音量

![3.GainNode](/images/h5-audio/3.GainNode.jpg)



**实现：**

```js
var gainNode = ac[ac.createGain ? "createGain" : "createGainNode"]();
gainNode.connect(ac.destination);
```



## bufferSource连接gainNode

![4.AudioBufferSourceNode](/images/h5-audio/4.AudioBufferSourceNode.jpg)



**实现：**

```js
bufferSource.connect(gainNode);

function changeVolume(percent) {
    gainNode.gain.value = percent * percent;
}

$("#volume")[0].onchange = function() {
    changeVolume(this.value / this.max);
}
```



## 音乐播放逻辑问题

**实现：**

```js
//音乐资源加载
var source = null;

//计数器
var count = 0;

var n = ++count;

source && source[source.stop ? "stop" : "noteOff"](); //默认为0

if (n != count) return;
```



## 分析音频资源

> [参考链接](https://www.imooc.com/video/6028)

![5.AnalyserNode](/images/h5-audio/5.AnalyserNode.jpg)



**实现：**

```js
var analyser=ac.createAnalyser();
analyser.fftSize=512;
analyser.connect(gainNode);

//bufferSource连接analyser
bufferSource.connect(analyser);
```



**时时分析**

```js
function visualizer(){
	var arr=new Uint8Array(analyser.frequencyBinCount);
    requestAnimationFrame=window.requestAnimationFrame||window.webkitRequestAnimationFrame||window.mozRequestAnimationFrame;
    
    function v(){
	    analyser.getByteFrequencyData(arr);
    }
    requestAnimationFrame(v);
}

visualizer();
```



## 音乐数据可视化

**使用canvas画图进行可视化**

```js
//canvas画图（柱状）
var box = $("#box")[0];
var height, width;
var canvas = document.createElement("canvas");
var ctx = canvas.getContext("2d");
box.appendChild(canvas);

function resize() {
    height = box.clientHeight;
    width = box.clientWidth;
    canvas.height = height;
    canvas.width = width;
    var line = ctx.createLinearGradient(0, 0, 0, height);
    line.addColorStop(0, "red");
    line.addColorStop(0.5, "yello");
    line.addColorStop(1, "green");
    ctx.fillstyle = line;
}
resize();
window.onresize = resize;

function draw(arr) {
	ctx.clearRect(0,0,width,height);
    var w = width / size;
    for (var i = 0; i < size; i++) {
        var h = arr[i] / 256 * height;
        ctx.fillRect(w * i, height - h, w * 0.6, h);
    }
}
```

