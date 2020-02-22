---
title: 数据结构与算法JavaScript学习(二)
date: 2017-07-05
tags: [JavaScript]
categories: web前端
---

# 数据结构与算法JavaScript学习(二)

## 搜索算法

### 顺序或线性搜索

<!-- more -->

```js
function ArrayList(){
  var array=[];

  this.insert=function(item){
    array.push(item);
  };

  this.toString=function(){
    return array.join();
  };

  //顺序搜索
  this.sequentialSearch=function (item) {
    for (var i = 0; i < array.length; i++) {
      if (item===array[i]) {
        return i;
      }
    }
    return -1;
  };
}
```



### 二分搜索

```js
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

  //二分搜索
  this.binarySearch=function (item) {
    this.quickSort();//快速排序

    var low=0,high=array.length-1,mid,element;

    while (low<=high) {
      mid=Math.floor((low+high)/2);
      element=array[mid];

      if (element<item) {
        low=mid+1;
      }else if (element>item) {
        high=mid-1;
      }else {
        return mid;
      }
    }
    return -1;
  };
}
```



## 算法思想

### 递归

```javascript
//斐波那契数列:递归
function fibonacci(num) {
  if (num===1||num===2) {
    return 1;
  }

  return fibonacci(num-1)+fibonacci(num-2);
}
```



### 非递归

```javascript
//斐波那契数列:非递归
function fib(num) {
  var n1=1,n2=1,n=1;
  for (var i = 3; i <= num; i++) {
    n=n1+n2;
    n1=n2;
    n2=n;
  }
  return n;
}
```



### 动态规划

```javascript
//动态规划：将大问题转化成小问题
//最少硬币找零问题:找到n所需的最小硬币数
function dpMinCoinChange(coins) {
  var coins=coins;
  var cache={};

  this.makeChange=function (amount) {
    var me=this;
    if (!amount) {//判断为正
      return [];
    }
    if (cache[amount]) {//判断是否有缓存
      return cache[amount];
    }

    var min=[],newMin,newAmount;
    for (var i = 0; i < coins.length; i++) {//对每个面额计算
      var coin=coins[i];
      newAmount=amount-coin;
      if (newAmount>=0) {
        newMin=me.makeChange(newAmount);
      }
      if (newAmount>=0 && (newMin.length<min.length-1 || !min.length) && (newMin.length || !newAmount)) {
        //判断newAmount是否有效，最小硬币数是否最优，newMin和newAmount是否合理
        min=[coin].concat(newMin);
        console.log('new Min '+min+ ' for '+amount);
      }
    }
    return (cache[amount]=min);
  }
}
```



### 贪心策略

```javascript
//贪心算法：近似求解，通过局部最优达到全局最优
//最少硬币找零问题:找到n所需的最小硬币数
function txMinCoinChange(coins){
  var coins=coins;

  this.makeChange=function(amount){
    var change=[],total=0;

    for (var i = coins.length; i >= 0; i--) {//对每个面额从大面额开始，从大到小依次
      var coin=coins[i];
      while (total+coin<=amount) {
        change.push(coin);
        total+=coin;
      }
    }
    return change;
  }
}
```

