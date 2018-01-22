---
title: FreeCodeCamp学习笔记（四）
date: 2017-05-17
tags: [html,css,jquery,FreeCodeCamp]
categories: web前端
---

# FreeCodeCamp学习笔记（四）

# JavaScript基础

## 循环

- 一个条件语句只能执行一次代码，而一个循环语句可以多次执行代码。

<!-- more-->

- JavaScript 中最常见的循环就是“for循环”。

  - for循环中的三个表达式用分号隔开：for ([初始化]; [条件判断]; [计数器])

  - 初始化语句只会在执行循环开始之前执行一次。它通常用于定义和设置你的循环变量。

  - 条件判断语句会在每一轮循环的开始执行，只要条件判断为 true 就会继续执行循环。当条件为 false的时候，循环将停止执行。这意味着，如果条件在一开始就为 false，这个循环将不会执行。

  - 计数器是在每一轮循环结束时执行，通常用于递增或递减。

  - for循环可以按照我们指定的顺序来迭代，通过更改我们的 计数器，我们可以按照偶数顺序来迭代。

  - for循环也可以逆向迭代，只要我们定义好合适的条件。

  - 迭代输出一个数组的每个元素是 JavaScript 中的常见需求， for 循环可以做到这一点。记住数组的索引从零开始的，这意味着数组的最后一个元素的下标是：数组的长度 - 1。

  - 如果你有一个二维数组，可以使用相同的逻辑，先遍历外面的数组，再遍历里面的子数组。对于内部循环，我们可以通过 arr[i] 的 .length 来获得子数组的长度，因为 arr[i] 的本身就是一个数组。

- 另一种类型的 JavaScript 循环被称为while循环，因为它规定，当（while）条件为真，循环才会执行，反之不执行。


## Math

- Math.random()用来生成一个在0(包括0)到1(不包括1)之间的随机小数，因此Math.random()可能返回0但绝不会返回1。要生成的随机数是在两个指定的数之间。

- 用 Math.floor() 向下取整 获得它最近的整数

  ```js
  Math.floor(Math.random() * 20);
  ```

- 定义一个最小值和一个最大值。

  ```js
  Math.floor(Math.random() * (max - min + 1)) + min
  ```

## 正则

- Regular expressions 正则表达式被用来根据某种匹配模式来寻找strings中的某些单词。

- 我们可以把这个正则表达式分成几段：

  - / 是这个正则表达式的头部

  - the 是我们想要匹配的模式

  - / 是这个正则表达式的尾部

  - g 代表着 global(全局)，意味着返回所有的匹配而不仅仅是第一个。

  - i 代表着忽略大小写，意思是当我们寻找匹配的字符串的时候忽略掉字母的大小写。

- 我们可以在正则表达式中使用特殊选择器来选取特殊类型的值。

  - 特殊选择器中的一种就是数字选择器``\d``，意思是被用来获取一个字符串的数字.在JavaScript中, 数字选择器类似于: ``/\d/g``。

  - 在选择器后面添加一个加号标记(+)，例如：``/\d+/g``，它允许这个正则表达式匹配一个或更多数字。尾部的g是'global'的简写，意思是允许这个正则表达式 找到所有的匹配而不是仅仅找到第一个匹配。

  - 我们也可以使用正则表达式选择器 ``\s`` 来选择一个字符串中的空白。空白字符有`` " " (空格符)、\r (回车符)、\n (换行符)、\t (制表符) 和 \f (换页符)``。空白正则表达式类似于：``/\s+/g``

  - 你可以用正则表达式选择器的大写版本 来转化任何匹配。举个例子：``\s`` 匹配任何空白字符，``\S`` 匹配任何非空白字符。


## JSON与API

- JavaScript Object Notation 简称 JSON，它使用JavaScript对象的格式来存储数据。JSON是灵活的，因为它允许数据结构是字符串，数字，布尔值，字符串，和对象的任意组合。

- 数组中有多个 JSON 对象的时候，对象与对象之间要用逗号隔开。

- 通过串联起来的点操作符或中括号操作符来访问JSON对象的嵌套属性。因为属性的名字带有空格，请使用中括号操作符来访问属性的值。

- JSON对象可以嵌套对象和数组。与访问嵌套对象一样，用中括号操作符同样可以访问嵌套数组。

- 函数返回的永远是整个对象

- 使用中括号操作符来访问对象的变量属性

- JSON是一种非常简洁的数据格式。它通常表现为了两种形式，一种为单个对象，一种为多个对象

  - 单个对象类似于：
  ```js
  {name:'盖伦',advantage:'单挑无敌'}
  ```
  - 多个对象类似于：
  ```js
  [{name:'盖伦',advantage:'单挑无敌'},{name:'诺克',advantage:'上单霸主'}]
  ```

  - 每个对象属性和属性值的组合就是我们经常听到的"键值对(key-value pairs)"。

- 当你需要根据服务器返回的数据来动态改变页面的时候，应用程序接口(API)就派上用场了。API——应用程序接口(Application Programming Interface)是计算机之间相互交流沟通的工具。

- 许多网站的应用程序接口(API)都是通过一种称为JSON格式的数据来传输的，JSON 是 JavaScript Object Notation的简写。

**举例：**
- 从JSON API中获得了数据：
  ```js
  $.getJSON("/json/cats.json", function(json) {
    $(".message").html(JSON.stringify(json));
  });
  ```

- 把它们展现到我们的HTML页面中吧。

  - 使用.forEach()函数来循环遍历JSON数据写到html变量中。

  - 首先我们定义一个HTML变量，``var html = "";`` 。

  - 然后，我们使用.forEach()函数来循环遍历JSON数据写到html变量中，最后把html变量显示到我们的页面中。

  ```js
  json.forEach(function(val) {
    var keys = Object.keys(val);
    html += "<div class = 'cat'>";
    keys.forEach(function(key) {
      html += "<b>" + key + "</b>: " + val[key] + "<br>";
    });
    html += "</div><br>";
  });
  ```

- 获得的JSON数组中，每个对象都包含了一个以imageLink为键(key)，以猫的图片的url为值(value)的键值对。

  遍历,用imageLink的属性来显示img元素的图片。
  ```js
  html += "<img src = '" + val.imageLink + "'>";
  ```

- 不想把所有从JSON API中得到的图片都展现出来，可以在遍历之前做一次过滤。把其中 "id" 键的值为1的图片过滤掉。
  ```js
  json = json.filter(function(val) {
    return (val.id !== 1);
  });
  ```

- 可以通过浏览器navigator获得我们当前所在的位置geolocation。位置的信息包括经度longitude和纬度latitude。
  ```js
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      $("#data").html("latitude: " + position.coords.latitude + "<br>longitude: " + position.coords.longitude);
    });
  }
  ```

# Object对象

- 可以使用构造函数来创建对象。

- 构造函数通常使用大写字母开头，以便把自己和其他普通函数区别开。

  下面便是一个构造函数：
  ```js
  var Car = function() {
    this.wheels = 4;
    this.engines = 1;
    this.seats = 1;
  };
  ```

- 在构造函数中，this 指向被此构造函数创建出来的对象 。所以当我们在构造函数中写：
  ```js
  this.wheels = 4;
  ```

  - 创建出来的新对象将带有 wheels 属性，并且赋值为 4.


- 构造函数描述了它所创建出来的对象。

- 使用构造函数时，我们通过在它前面使用 new 关键字 来对它进行调用，如下：
  ```js
  var myCar = new Car();
  ```

  - myCar 现在成为了 Car 的一个实例(instance），它被构造函数描述成下面的样子：
  ```js
  {
    wheels: 4,
    engines: 1,
    seats: 1
  }
  ```

  - 要使用 new 关键字去调用构造函数。因为只有这样，Javascript才知道这是要去构造一个新对象 ，并且把构造函数中的 this 指向这个新对象。

  - 当 myCar（即 Car 的一个 实例 ）创建后，他可以像普通对象一样被使用，包括创建、访问、修改它的属性等，就像我们使用其他对象一样。

- 对象拥有自己的特征，称为属性，对象还有自己的函数，称为方法。

- 构造函数中，我们使用了 this 指向当前（将要被创建的）对象中的公有属性 。

- 我们也可以创建私有属性和私有方法，它们两个在对象外部是不可访问的。
