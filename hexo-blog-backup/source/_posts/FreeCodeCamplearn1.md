---
title: FreeCodeCamp学习笔记(一)
date: 2017-04-24
tags: [html,css,jquery,FreeCodeCamp]
categories: web前端
---

# FreeCodeCamp学习笔记(一)

# html学习

## 知识点补充

- a标签用#做占位符

- img标签里应加alt属性，为了盲人朋友
```html
<a href="#"><img class="smaller-image thick-green-border" alt="A cute orange cat lying on its back" src="/images/relaxing-cat.jpg"></a>
```

<!-- more-->

- input标签加placeholder做占位符提示，在需要设置必填项的时候加required属性
```html
<input type="text" placeholder="cat photo URL" required>
```

- 单选和复选按钮应加入到label标签里，name属性名应一致，checked为默认选中
```html
  <label><input type="radio" name="indoor-outdoor" checked> Indoor</label>
  <label><input type="radio" name="indoor-outdoor"> Outdoor</label>
  <label><input type="checkbox" name="personality" checked> Loving</label>
  <label><input type="checkbox" name="personality"> Lazy</label>
  <label><input type="checkbox" name="personality"> Energetic</label>
```

## 盒子模型

有三个影响HTML元素布局的重要属性：padding(内边距)、margin(外边距)、border(边框)。

- 元素的 padding 控制元素内容 content和元素边框 border 之间的距离。

  当加大 padding, 将扩大元素内容和元素边框的距离。

- 元素的外边距 margin 控制元素边框 border 和元素实际所占空间的距离。

  当增大 margin 时，将会增加元素边框和元素实际所占空间之间的距离。

  如果你将一个元素的 margin 设置为负值，元素将会变大。

# css学习

浏览器读取 CSS 的顺序是从上到下，这意味着，在发生冲突时，浏览器会使用最后的 CSS 声明。但是如果设置id， id 属性总是具有更高的优先级。

很多情况下，你会使用 CSS 库，这些库可能会意外覆盖掉你自己的 CSS。所以当你需要确保某元素具有指定的 CSS 时，你可以使用 !important.


## rgb颜色设置

0 是 hex code（十六进制编码）中最小的一个，它代表颜色的完全缺失。

F 是 hex code（十六进制编码）中最大的一个，它代表最大可能的亮度。

16 个值和 6 个位置意味着我们有 16 的 6 次方，或者说超过 1600 万种可能的颜色.

Hex code 遵循 red-green-blue（红-绿-蓝），或者叫 rgb 格式。hex code 中的前两位表示颜色中红色的数量，第三四位代表绿色的数量，第五六位代表蓝色的数量。

# jquery学习

**jQuery通过选择器来选择一个元素的，然后操作元素做些改变。**

1. 要让所有的按钮做弹回效果，只要把这段代码写在
```js
$(document).ready(function() {});
```
里面，然后
```js
$("button").addClass("animated bounce");
```

2. 你可以通过jQuery的addClass()方法给元素添加class,也可以通过jQueryremoveClass()方法去掉元素上的class。
```js
$("#target2").removeClass("btn-default");
```

3. jQuery有一个叫做.css()的方法能让你改变元素的CSS样式。
```js
$("#target1").css("color", "blue");
```

4. jQuery有一个.prop()的方法让你来调整元素的属性
```js
$("button").prop("disabled", true);
```

5. jQuery的.html()方法可以添加HTML标签和文字到元素，而元素之前的内容都会被方法的内容所替换掉。

  我们是通过em[emphasize]标签来重写和强调标题文本的：
```js
$("h3").html("<em>jQuery Playground</em>");
```

6. jQuery 还有一个类似的方法叫.text()，它只能改变文本但不能修改标记。换句话说，这个方法只会把传进来的任何东西(包括标记)当成文本来显示。

7. jQuery有一个appendTo()方法可以把选中的元素加到其他元素中。
```js
$("#target4").appendTo("#left-well");
```

8. jQuery的clone()方法可以拷贝元素。
方法链function chaining，使用起来很方便
```js
$("#target2").clone().appendTo("#right-well");
```

9. 每个HTML元素根据继承属性都有父parent元素,jQuery有一个方法叫parent()，它允许你访问指定元素的父元素
```js
$("#left-well").parent().css("background-color", "blue")
```

10. 许多HTML元素都有children(子元素)，每个子元素都从父元素那里继承了一些属性jQuery有一个方法叫children()，它允许你访问指定元素的子元素。
```js
$("#left-well").children().css("color", "blue")
```

11. jQuery 用CSS选择器来选取元素，target:nth-child(n) CSS选择器允许你按照索引顺序(从1开始)选择目标元素的所有子元素。
```js
$(".target:nth-child(3)").addClass("animated bounce");
```

12. 获取class为target且索引为奇数的所有元素，并给他们添加class。
```js
$(".target:odd").addClass("animated shake");
```
jQuery里的索引是从0开始的，也就是说：:odd 选择第2、4、6个元素，因为target#2(索引为1)，target#4(索引为3)，target6(索引为5)。获取class为target且索引为偶数的所有元素，并给他们添加class。
```js
$(".target:even").addClass("animated shake");
```

13. 让整个body都有淡出效果(fadeOut)：
```js
$("body").addClass("animated fadeOut");
```

14. $(document).ready(),这个函数中的代码只会在我们的页面加载时候运行一次，确保执行js之前页面所有的dom已经准备就绪。

15. 增加一个click事件,通过点击事件来更改文本。
```js
$("#getMessage").on("click", function(){
  $(".message").html("Here is the message");
});
```
