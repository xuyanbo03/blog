---
title: 数据结构与算法JavaScript版(一)
tags:
  - JavaScript
categories: 
  - 前端
abbrlink: 742c7f0a
copyright: ture
author: Awebone
date: 2020-07-18 15:00:00
---

> 本文使用JavaScript实现基础数据结构：数组、链表、栈、队列、树



# 数组

- 在数组的**末尾插入/删除**、**更新**、**获取**某个位置的元素，都是 O(1) 的时间复杂度
- 在数组的任何其它地方**插入/删除**元素，都是 O(n) 的时间复杂度
- 空间复杂度：O(n)



## 数组创建

```javascript
var arr = new Array(element0, element1, ..., elementN);
var arr = Array(element0, element1, ..., elementN);
var arr = [element0, element1, ..., elementN];

var arr = new Array(arrayLength);
var arr = Array(arrayLength);
```

<!--more-->



## 常用数组方法

### 增加与删除

- `push()`：在数组末尾添加一个或多个元素，并返回数组操作后的长度

- `unshift()`：在数组开头添加一个或多个元素，并返回数组的新长度

- `pop()`：从数组移出最后一个元素，并返回该元素

- `shift()`：从数组移出第一个元素，并返回该元素

- `splice(start_index, upto_index)`从数组提取一个片段，并作为一个新数组返回

- `splice(index, count_to_remove, addElement1, addElement2, ...)`从数组移出一些元素，（可选）并替换它们

  `number.splice(2,2)`删除从数组索引2开始2个元素

  `number.splice(2,0,1,2,3)`从数组索引5开始增加3个元素2,3,4

![1595052302829](/images/js数据结构与算法1/1595052302829.png)



### 合并

- `concat()`：连接两个数组并返回一个新的数组

![1595053505788](/images/js数据结构与算法1/1595053505788.png)



### 排序

- `reverse()`：颠倒数组元素的顺序，第一个变成最后一个，最后一个变成第一个
- `sort()`：数组元素排序，也可以带一个回调函数来决定怎么比较数组元素

![1595053659661](/images/js数据结构与算法1/1595053659661.png)

![1595053814196](/images/js数据结构与算法1/1595053814196.png)



### 搜索

- `indexOf(searchElement[, fromIndex])`：在数组中搜索`searchElement` 并返回第一个匹配的索引
- `lastIndexOf(searchElement[, fromIndex]`：和 `indexOf`差不多，但这是从结尾开始，并且是反向搜索

![1595054114155](/images/js数据结构与算法1/1595054114155.png)



### 输出字符串

- `toString()`：把数组里所有元素输出为一个字符串，默认逗号分隔
- `join(deliminator = ',')`：用指定分隔符把元素隔开，将数组的所有元素连接成一个字符串，默认逗号分隔

![1595054159709](/images/js数据结构与算法1/1595054159709.png)



### 迭代器函数

- `forEach(callback[, thisObject])`：在数组每个元素项上执行`callback`

  ```javascript
  var a = ['a', 'b', 'c'];
  a.forEach(function(element) { console.log(element);} ); 
  ```

  

- `map(callback[, thisObject])`：遍历数组，并通过`callback`对数组元素进行操作，并将所有操作结果放入数组中并返回该数组

  ```javascript
  var a1 = ['a', 'b', 'c'];
  var a2 = a1.map(function(item) { return item.toUpperCase(); });
  console.log(a2); // logs A,B,C
  ```

  

- `filter(callback[, thisObject])`：返回一个包含所有在回调函数上返回为`true`的元素的新数组，`callback`在这里担任的是过滤器的角色，当元素符合条件，过滤器就返回`true`，而`filter`则会返回所有符合过滤条件的元素

  ```javascript
  var a1 = ['a', 10, 'b', 20, 'c', 30];
  var a2 = a1.filter(function(item) { return typeof item == 'number'; });
  console.log(a2); // logs 10,20,30
  ```

  

- `every(callback[, thisObject])`：当数组中每一个元素在`callback`上被返回`true`时就返回`true`，`every`其实类似`filter`，只不过它的功能是判断是不是数组中的所有元素都符合条件，并且返回的是布尔值

  ```javascript
  function isNumber(value){
    return typeof value == 'number';
  }
  var a1 = [1, 2, 3];
  console.log(a1.every(isNumber)); // logs true
  var a2 = [1, '2', 3];
  console.log(a2.every(isNumber)); // logs false
  ```

  

- `some(callback[, thisObject])`：只要数组中有一项在`callback`上被返回`true`，就返回`true`，类似`every`，不过前者要求都符合筛选条件才返回`true`，后者只要有符合条件的就返回`true`

  ```javascript
  function isNumber(value){
    return typeof value == 'number';
  }
  var a1 = [1, 2, 3];
  console.log(a1.some(isNumber)); // logs true
  var a2 = [1, '2', 3];
  console.log(a2.some(isNumber)); // logs true
  var a3 = ['1', '2', '3'];
  console.log(a3.some(isNumber)); // logs false
  ```

  

- `reduce(callback[, initialValue])`：使用回调函数 `callback(firstValue, secondValue)` 把数组列表计算成一个单一值，对数组元素两两递归处理的方式把数组计算成一个值

  ```javascript
  var a = [10, 20, 30];
  var total = a.reduce(function(first, second) { return first + second; }, 0);
  console.log(total) // Prints 60
  ```

  

- `reduceRight(callback[, initalvalue])`：和 `reduce()`相似，但这从最后一个元素开始的，应该使用在那些需要把数组的元素两两递归处理，并最终计算成一个单一结果的算法

<br />



# 链表

- 在链表的**首部插入/移除结点**、获得**链表首部的值**，都是O(1)时间复杂度
- 获取/移除/插入任一结点、尾部结点，都是O(n)时间复杂度



## 单链表结构图

![1595061903035](/images/js数据结构与算法1/1595061903035.png)

![1595062001664](/images/js数据结构与算法1/1595062001664.png)

### 插入示意图

![1595065003973](/images/js数据结构与算法1/1595065003973.png)

### 删除示意图

![1595065020710](/images/js数据结构与算法1/1595065020710.png)



## 单链表实例

**ES5实现：**

```javascript
//节点
function LinkNode(element) {
    this.element = element;   //当前节点的元素
    this.next = null;         //下一个节点链接
}

//链表类
function LinkList() {
    this.head = null; //头节点
    
    //查看链表长度
    this.length = function(){
        var currNode = this.head;
        var count = 0
        while (currNode) {
            count += 1;
            currNode = currNode.next;
        }
        return count;
    };
    
    //打印链表
    this.display = function(){
        var res = []
        var currNode = this.head;
        while (currNode) {
            res.push(currNode.element);
            currNode = currNode.next;
        }
        return res;
    };
    
    //判断链表是否为空
    this.isEmpty = function(){
        if (this.head == null){
            return true;
        }else{
            return false;
        }
    };
    
    //查找节点
    this.find = function(item){
        var currNode = this.head;
        while(currNode && currNode.element !== item) {
            currNode = currNode.next;
        }
        return currNode;
    };
    
    //查找前一个节点
    this.findPrev = function(item){
        var currNode = this.head;
        while(currNode && currNode.next !== null && currNode.next.element !== item) {
            currNode = currNode.next;
        }
        return currNode;
    };
    
    //头部插入节点
    this.add = function(newElement){
        var newNode = new LinkNode(newElement);
        newNode.next = this.head;
        this.head = newNode;
        return this.head;
    };
    
    //尾部插入节点
    this.append = function(newElement){
        var newNode = new LinkNode(newElement);
        if (this.head == null){
            this.head = newNode;
            return;
        }
        var currNode = this.head;
        while (currNode.next){
            currNode = currNode.next;
        }
        currNode.next = newNode;
    };
    
    //删除节点
    this.remove = function(item){
        var prevNode = this.findPrev(item);
        var currNode = this.find(item);
        if(prevNode.next !== null) {
            prevNode.next = prevNode.next.next;
            currNode.next = null;
        }
    };
    
    //链表反转
    this.reverse = function(){
        var prevNode = null;
        var currNode = this.head;
        while(currNode) {
            var tmpNode = currNode.next;
            currNode.next = prevNode;
            prevNode = currNode;
            currNode = tmpNode;
        }
        this.head = prevNode
        return this.head
    };
}
```



**用例测试：**

```javascript
ll = new LinkList()
ll.add(1)
ll.add(2)
ll.add(3)
ll.append(1)
ll.remove(1)
ll.reverse()
console.log(ll.display())
```



## 双向链表结构图

双向链表和普通链表的区别在于，在链表中，一个节点只有链向下一个节点的链接，而在双向链表中，链接是双向的：一个链向下一个元素，另一个链向前一个元素。

![1595064780983](/images/js数据结构与算法1/1595064780983.png)



### 插入示意图

![1595064910440](/images/js数据结构与算法1/1595064910440.png)

### 删除示意图

![1595064937011](/images/js数据结构与算法1/1595064937011.png)

<br />



# 栈

- 栈满足**后进先出 LIFO**的原则
- 时间复杂度：压栈、出栈都是 O(1)



## 栈实例

**ES5实现：**

```js
function Stack() {
    var data  = [];
    
    //向栈顶添加元素
    this.push = function(element){
        data.push(element);
    };
    
    //弹出栈顶的元素，若栈为空则报错
    this.pop = function(){
        return data.pop();
    };
    
    //返回栈顶的元素（但是不弹出），若栈为空则报错
    this.peek = function(){
        return data[data.length - 1];
    };
    
    //判断栈是否为空
    this.isEmpty = function(){
        return data.length === 0;
    };
    
    //返回栈的长度
    this.size = function(){
        return data.length;
    };
    
    //清空栈
    this.clear = function(){
        data = [];
    };
    
    //打印栈元素
    this.print = function(){
        console.log(data.toString());
    };
}
```



**用例测试：**

```javascript
s = new Stack()
s.push(1)
s.push(2)
s.push(3)
console.log(s.pop())
console.log(s.peek())
console.log(s.isEmpty())
console.log(s.size())
```



**ES6语法：**

```js
class Stack {
    constructor () {
        this.data = [];
    }
    push(element){
        this.data.push(element);
    }
    pop(){
        return this.data.pop();
    }
    peek(){
        return this.data[data.length - 1];
    }
    isEmpty(){
        return this.data.length === 0;
    }
    size(){
        return this.data.length;
    }
    clear(){
        this.data = [];
    }
    print(){
        console.log(this.data.toString());
    }
}
```

<br />



# 队列

- 队列满足**先进先出 FIFO** 的原则
- 时间复杂度：出队列使用了数组的 `shift()` 方法，故时间复杂度为 O(n)；入队列采用了列表的 `push()` 方法，故时间复杂度为 O(1)



## 队列实例

**ES5实现：**

```js
function Queue() {
    var data = [];
    
    //将一个元素入队（在队尾添加元素）
    this.enqueue = function(element){
        data.push(element);
    };
    
    //将队首的元素出队，若队列为空则报错
    this.dequeue = function(){
        return data.shift();
    };
    
    //返回队首元素，不出队
    this.front = function(){
        return data[0];
    };
    
    //判断队列是否为空
    this.isEmpty = function(){
        return data.length === 0;
    };
    
    //清空队列
    this.clear = function(){
        data = [];
    };
    
    //返回队列长度
    this.size = function(){
        return data.length;
    };
    
    //打印队列元素
    this.print = function(){
        console.log(data.toString());
    };
}
```



**用例测试：**

```javascript
q = new Queue()
q.enqueue(1)
q.enqueue(2)
q.enqueue(3)
console.log(q.dequeue())
console.log(q.front())
console.log(q.isEmpty())
console.log(q.size())
console.log(q.print())
```



**ES6语法：**

```js
class Queue {
    constructor () {
        this.data = [];
    }
    enqueue(element){
        this.data.push(element);
    }
    dequeue(){
        return this.data.shift();
    }
    front(){
        return this.data[0];
    }
    isEmpty(){
        return this.data.length === 0;
    }
    size(){
        return this.data.length;
    }
    clear(){
        this.data = [];
    }
    print(){
        console.log(this.data.toString());
    }
}
```



## 循环队列

- 循环队列有一个最大长度`max_size`，仍然采用数组实现。两个成员变量`front`和`rear`分别为队首元素和下一个入队的元素在列表中的索引。为了区别队列为空和队列为满，列表大小应为`length = max_size + 1`，列表中最多只能有`max_size`个队列元素
- 当进行入队操作时，先**判断队列是否已满**：**(rear + 1) % length == front**，一种方法是已满直接报错，另一种是若队列已满则扩容为原来的两倍。入队时，`rear = (rear + 1) % max_size`
- 进行出队操作时，先**判断队列是否为空**：**front == rear**，如果为空则报错。出队时，`front = (front + 1) % max_size`
- 获得**当前队列长度**：**(rear - front + length) % length**
- 使用循环队列的方法，由于入队和出队操作都是直接通过索引访问列表，所以时间复杂度都是 O(1)

<br />



# 树

- 结点、父结点、子结点、兄弟结点
- 层数、深度、高度、结点的度：结点的子树个数
- 满二叉树：除了叶结点，其它所有结点都有两个子结点（国内定义：除最后一层全为叶结点外，其它的层的每个结点都有两个子结点）
- 完全二叉树：除最后一层外，其它层全满，最后一层的叶结点必须从左到右填满



## 二叉树实例

**ES5实现：**

```js
//节点
function treeNode(val) {
    this.val = val;   //当前节点的元素
    this.left = null;         //左节点链接
    this.right = null;         //右节点链接
}

//前序遍历
function preorder(root) {
    if(root === null){
        return [];
    }
    return [root.val] + preorder(root.left) + preorder(root.right);
}

//中序遍历
function inorder(root) {
    if(root === null){
        return [];
    }
    return inorder(root.left) + [root.val] + inorder(root.right);
}

//后序遍历
function postorder(root) {
    if(root === null){
        return [];
    }
    return postorder(root.left) + postorder(root.right) + [root.val];
}

//层次遍历
function levelorder(root) {
    if(root === null){
        return [];
    }
    var res = [];
    var nodequeue = [root];
    while (nodequeue){
        root = nodequeue.shift();
        res.push(root.val)
        if (root.left){
            nodequeue.push(root.left);
        }
        if (root.right){
            nodequeue.push(root.right);
        }
    }
    return res;
}
```



**用例测试：**

```javascript
a1 = treeNode(1)
a2 = treeNode(2)
a3 = treeNode(3)
a4 = treeNode(4)
a5 = treeNode(5)
a6 = treeNode(6)

a1.left = a2
a1.right = a3
a2.left = a4
a2.right = a5
a3.right = a6

console.log("PreOrder: ", preorder(a1))
console.log("InOrder: ", inorder(a1))
console.log("PostOrder: ", postorder(a1))
console.log("LevelOrder: ", levelorder(a1))
```

<br />



# 参考链接

https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Guide/Indexed_collections

https://github.com/wolverinn/Iridescent/blob/master/Data%20Structure.md

https://github.com/wolverinn/Iridescent/blob/master/Data%20Structure%20code%20complete.ipynb

https://juejin.im/post/5b87c60c6fb9a019fa06495b