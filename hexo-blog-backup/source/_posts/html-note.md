---
title: HTML学习笔记
date: 2017-03-21
tags: [HTML]
categories: web前端
---

# HTML学习笔记

## HTML结构及常用元素

```html
<!DOCTYPE html>
<html>
<head>
<title>文档标题</title>
</head>
<body>
可见文本...
</body>
</html>
```

<!--more-->

```html
<h1>最大的标题</h1>
<h2> . . . </h2>
<h3> . . . </h3>
<h4> . . . </h4>
<h5> . . . </h5>
<h6>最小的标题</h6>
```


```html
<p>这是一个段落。</p>
<br> （换行）
<hr> （水平线）
<!-- 这是注释 -->
<b>粗体文本</b>
<code>计算机代码</code>
<em>强调文本</em>
<i>斜体文本</i>
<kbd>键盘输入</kbd>
<pre>预格式化文本</pre>
<small>更小的文本</small>
<strong>重要的文本</strong>
<abbr> （缩写）
<address> （联系信息）
<bdo> （文字方向）
<blockquote> （从另一个源引用的部分）
<cite> （工作的名称）
<del> （删除的文本）
<ins> （插入的文本）
<sub> （下标文本）
<sup> （上标文本）

普通的链接：<a href="http://www.example.com/">链接文本</a>
图像链接： <a href="http://www.example.com/"><img src="URL" alt="替换文本"></a>
邮件链接： <a href="mailto:webmaster@example.com">发送e-mail</a>

书签：
<a id="tips">提示部分</a>
<a href="#tips">跳到提示部分</a>
<img src="URL" alt="替换文本" height="42" width="42">
```



## HTML实例代码

```html
<div>文档中的块级元素</div>
<span>文档中的内联元素</span>
```

```html
<ul>
    <li>项目</li>
    <li>项目</li>
</ul>
```

```html
<ol>
    <li>第一项</li>
    <li>第二项</li>
</ol>
```

```html
<table border="1">
  <tr>
    <th>表格标题</th>
    <th>表格标题</th>
  </tr>
  <tr>
    <td>表格数据</td>
    <td>表格数据</td>
  </tr>
</table>
```

```html
<iframe src="demo_iframe.htm"></iframe>
```

```html
<form action="demo_form.php" method="post/get">
<input type="text" name="email" size="40" maxlength="50">
<input type="password">
<input type="checkbox" checked="checked">
<input type="radio" checked="checked">
<input type="submit" value="Send">
<input type="reset">
<input type="hidden">
<select>
<option>苹果</option>
<option selected="selected">香蕉</option>
<option>樱桃</option>
</select>
<textarea name="comment" rows="60" cols="20"></textarea>
</form>
```



## HTML5 中的一些有趣的新特性

用于绘画的 `canvas` 元素

用于媒介回放的 `video` 和 `audio` 元素

对本地离线存储的更好的支持

新的特殊内容元素，比如 `article、footer、header、nav、section`

新的表单控件，比如 `calendar、date、time、email、url、search`

IE9 以下版本浏览器兼容HTML5的方法：使用菜鸟教程的静态资源的html5shiv包
```html
<!--[if lt IE9]>
<script src="http://cdn.static.runoob.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
<![endif]-->
```

载入后，初始化新标签的CSS：
```css
article,aside,dialog,footer,header,section,footer,nav,figure,menu{
  display:block
}
```
html5shiv.js 引用代码必须放在` <head> `元素中，因为 IE 浏览器在解析 HTML5 新元素时需要先加载该文件。



## 字符实体

HTML 中的预留字符必须被替换为字符实体。

一些在键盘上找不到的字符也可以使用字符实体来替换。

HTML 中的常用字符实体是：
- 不间断空格 `&nbsp;`
- 大于 `&rt`
- 小于 `&lt;`
- 引号 `&quot;`
- 版权 &copy;`	`&#169;`
- 注册商标 `&reg;`	`&#174;`
- 商标 `&trade;`



## URL - 统一资源定位器

Web浏览器通过URL从Web服务器请求页面。当您点击html页面中的某个链接时，对应的 `<a>`标签指向万维网上的一个地址。

一个统一资源定位器(URL) 用于定位万维网上的文档。

**语法规则:**

``scheme://host.domain:port/path/filename``

**说明:**

- scheme - 定义因特网服务的类型。最常见的类型是 http
- host - 定义域主机（http 的默认主机是 www）
- domain - 定义因特网域名，比如 runoob.com
- :port - 定义主机上的端口号（http 的默认端口号是 80）
- path - 定义服务器上的路径（如果省略，则文档必须位于网站的根目录中）。
- filename - 定义文档/资源的名称

