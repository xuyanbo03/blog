---
title: 数据结构与算法JavaScript学习（一）
date: 2017-05-10
tags: [html, css, javascript]
categories: web前端
---

# 数据结构与算法JavaScript学习（一）

## 数组

### 常用数组方法

- push方法，能把元素添加到数组的末尾

- unshift方法，可直接把数值插入到数组首位

- pop方法，删除数组里靠后的元素

<!--more-->

- shift方法，删除数组的第一个元素

- splice方法，通过指定位置/索引，删除或增加相应位置和数量的元素

  ``number.splice(5,3)``删除从数组索引5开始3个元素

  ``number.splice(5,0,2,3,4)``从数组索引5开始增加3个元素2,3,4


### 合并

- concat方法，合并数组，可迭代数组，把每个元素加入到最终数组

### 迭代器函数

- every方法，迭代数组中的每个元素，直到返回false

- some方法，迭代数组中的每个元素，直到返回true

- forEach方法，迭代整个数组

- map方法，遍历数组，得到新数组

- filter方法，遍历数组，返回新数组，返回的数组由使函数返回true的元素组成

- reduce方法，接受一个函数作为参数，函数有四个参数：previousValue, currentValue, index, array.函数返回一个将被叠加到累加器的值，方法停止执行返回累加器

### 排序

- reverse方法，将数组元素反序输出

- sort方法，排序，把元素默认成字符串进行相互比较

### 搜索

- indexOf方法，返回与参数匹配的第一个元素的索引

- lastIndexOf方法，返回与参数匹配的最后一个元素的索引

### 输出字符串

- toString方法，把数组里所有元素输出为一个字符串

- join方法，用不同分隔符把元素隔开


## 栈

### 常用方法

- push(element(s)),添加一个或几个新元素到栈顶

- pop(),移除栈顶的元素，同时返回被移除的元素

- peek(),返回栈顶的元素，不对栈做修改

- isEmpty(),看栈是否为空，空返回true，否则返回false

- clear(),移除栈里的所有元素

- size(),返回栈里元素的个数

### 完整实例

```js
function Stack() {

    let items = [];

    this.push = function(element){
        items.push(element);
    };

    this.pop = function(){
        return items.pop();
    };

    this.peek = function(){
        return items[items.length-1];
    };

    this.isEmpty = function(){
        return items.length == 0;
    };

    this.size = function(){
        return items.length;
    };

    this.clear = function(){
        items = [];
    };

    this.print = function(){
        console.log(items.toString());
    };

    this.toString = function(){
        return items.toString();
    };
}
```

ES6语法：

```js
class Stack {

    constructor () {
        this.items = [];
    }

    push(element){
        this.items.push(element);
    }

    pop(){
        return this.items.pop();
    }

    peek(){
        return this.items[this.items.length-1];
    }

    isEmpty(){
        return this.items.length == 0;
    }

    size(){
        return this.items.length;
    }

    clear(){
        this.items = [];
    }

    print(){
        console.log(this.toString());
    }

    toString(){
        return this.items.toString();
    }
}
```

## 队列

### 常用方法

- enqueue(element(s)),向队列尾部添加一个或多个新的项

- dequeue(),移除队列的第一项，并返回移除的元素

- front(),返回队列第一个元素，不做任何修改

- isEmpty(),判断是否为空，空返回true，否则返回false

- size(),返回队列包含的元素个数

### 完整实例

```js
function Queue() {

    let items = [];

    this.enqueue = function(element){
        items.push(element);
    };

    this.dequeue = function(){
        return items.shift();
    };

    this.front = function(){
        return items[0];
    };

    this.isEmpty = function(){
        return items.length == 0;
    };

    this.clear = function(){
        items = [];
    };

    this.size = function(){
        return items.length;
    };

    this.print = function(){
        console.log(items.toString());
    };
}
```

ES6语法：

```js
class Queue {

    constructor () {
        this.items = [];
    }

    enqueue(element){
        this.items.push(element);
    }

    dequeue(){
        return this.items.shift();
    }

    front(){
        return this.items[0];
    }

    isEmpty(){
        return this.items.length == 0;
    }

    size(){
        return this.items.length;
    }

    clear(){
        this.items = [];
    }

    print(){
        console.log(this.toString());
    }

    toString(){
        return this.items.toString();
    }
}
```