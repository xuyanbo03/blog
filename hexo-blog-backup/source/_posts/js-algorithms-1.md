---
title: 数据结构与算法JavaScript学习(一)
tags:
  - JavaScript
categories: web前端
abbrlink: 15486
date: 2017-05-10 00:00:00
---

# 数据结构与算法JavaScript学习(一)

## 数组

### 常用数组方法

- push方法，能把元素添加到数组的末尾

- unshift方法，可直接把数值插入到数组首位

- pop方法，删除数组里靠后的元素

- shift方法，删除数组的第一个元素

- splice方法，通过指定位置/索引，删除或增加相应位置和数量的元素

  `number.splice(5,3)`删除从数组索引5开始3个元素

  `number.splice(5,0,2,3,4)`从数组索引5开始增加3个元素2,3,4

<!--more-->



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

**ES5实现：**

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

**ES6语法：**

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

**ES5实现：**

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

**ES6语法：**

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



## 排序算法

### 冒泡排序

```javascript
function ArrayList(){
  var array=[];

  this.insert=function(item){
    array.push(item);
  };

  this.toString=function(){
    return array.join();
  };

  //交换两个数
  var swap=function(index1,index2){
    var aux=array[index1];
    array[index1]=array[index2];
    array[index2]=aux;
  };

  //改进冒泡排序
  this.modifiedBubbleSort=function(){
    var length=array.length;

    for(var i=0;i<length;i++){//控制数组经过多少轮排序
      for(var j=0;j<length-1-i;i++){//从第一位迭代至倒数第二位
        if(array[j]>array[j+1]){//当前项和下一项比较
          swap(j,j+1);
        }
      }
    }
  };
}
```



### 选择排序

```javascript
function ArrayList(){
  var array=[];

  this.insert=function(item){
    array.push(item);
  };

  this.toString=function(){
    return array.join();
  };

  //交换两个数
  var swap=function(index1,index2){
    var aux=array[index1];
    array[index1]=array[index2];
    array[index2]=aux;
  };

  this.selectionSort=function(){
    var length=array.length,indexMin;

    for(var i=0;i<length-1;i++){//迭代数组
      indexMin=i;//数组第一个为最小值
      for(var j=i;j<length;j++){//从当前i至数组结束
        if(array[indexMin]>array[j]){
          indexMin=j;
        }
      }
      if(i!==indexMin){
        swap(i,indexMin);
      }
    }
  };
}
```



### 插入排序

```javascript
function ArrayList(){
  var array=[];

  this.insert=function(item){
    array.push(item);
  };

  this.toString=function(){
    return array.join();
  };

  this.insertionSort=function(){
    var length=array.length,j,temp;

    for (var i = 1; i < length; i++) {//迭代数组，默认第一项排序
      j=i;//初始化一个辅助变量
      temp=array[i];
      while (j>0&&array[j-1]>temp) {//找到位置，前面的值比此值大
        array[j]=array[j-1];//交换
        j--;//j减少
      }
      array[j]=temp;//赋值
    }
  };
}
```



### 归并排序

```javascript
function ArrayList(){
  var array=[];

  this.insert=function(item){
    array.push(item);
  };

  this.toString=function(){
    return array.join();
  };

  //归并排序:分治递归算法
  this.mergeSort=function(){
    array=mergeSortRec(array);
  };
  //将大数组分成小数组
  var mergeSortRec=function (array) {
    var length=array.length;

    if (length===1) {
      return array;
    }

    var mid=Math.floor(length/2),
        left=array.slice(0,mmid),
        right=array.slice(mid,length);

    return merge(mergeSortRec(left),mergeSortRec(right));
  };
  //合并小数组
  var merge=function(left,right){
    var result=[],il=0,ir=0;

    while (il<left.length && ir<right.length) {
      if (left[il]<right[ir]) {
        result.push(left[il++]);
      }else {
        result.push(right[ir++]);
      }
    }

    while (il<left.length) {
      result.push(left[il++]);
    }
    while (il<right.length) {
      result.push(right[ir++]);
    }

    return result;
  };
}
```



### 快速排序

```javascript
function ArrayList(){
  var array=[];

  this.insert=function(item){
    array.push(item);
  };

  this.toString=function(){
    return array.join();
  };

  //快速排序:分治递归
  this.quickSort=function () {
    quick(array,0,array.length-1);
  };
  //快排
  var quick=function (array,left,right) {
    var index;

    if (array.length>1) {
      index=partition(array,left,right);
      if (left<index-1) {
        quick(array,left,index-1);
      }
      if (index<right) {
        quick(array,index,right);
      }
    }
  };
  //划分过程
  var partition=function(array,left,right){
    var pivot=array[Math.floor((right+left)/2)],i=left,j=right;//选主元

    while (i<=j) {
      while (array[i]<pivot) {
        i++;
      }
      while (array[j]>pivot) {
        j--;
      }
      if (i<=j) {
        swapQuickStort(array,i,j);
        i++;
        j--;
      }
    }
    return i;
  }；
  //交换数组元素
  var swapQuickStort=function (array,index1,index2) {
    var aux=array[index1];
    array[index1]=array[index2];
    array[index2]=aux;
  };
}
```

