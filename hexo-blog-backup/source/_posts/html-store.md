---
title: HTML5存储初探
tags:
  - HTML
categories: web前端
top: 10
abbrlink: 57791
date: 2017-04-26 00:00:00
---

# HTML5存储初探

**常见存储：**

1. Cookies
2. localStorage  &&  sessionStorage
3. indexedDB
4. application cache



**其它客户端存储：**

1. userData

     只有IE支持（IE5.0 ... 9.0）

2. google Gears

   - chrome (12.0后放弃支持)
   - 引擎：64SQLite
   - 需要用户授权

<!-- more -->



## Cookies

Cookies是一种能够让网站服务器把少量数据储存到客户端的硬盘或内存，或是从客户端的硬盘读取数据的一种技术。Cookies是当你浏览某网站时，由Web服务器置于你硬盘上的一个非常小的文本文件，它可以记录你的用户ID、密码、浏览过的网页、停留的时间等信息。

当你再次来到该网站时，网站通过读取Cookies，得知你的相关信息，就可以做出相应的动作，如在页面显示欢迎你的标语，或者让你不用输入ID、密码就直接登录等等

Cookies文件是在无声无息中伴随浏览器进入我们本地硬盘的，当我们浏览某个站点时，该站点很可能将记录我们隐私的cookies文件上传到本地硬盘。

H5存储解决了cookie的问题
- 解决cookie总数和单个大小的限制(4k 4095B)
- 解决请求头常带存储信息的问题
- 解决关系型存储的问题
- 跨浏览器



## 本地存储( localStorage  &&  sessionStorage)

>图片不经常更改，不过如果图片bash64比较大的话，会比较浪费资源）

- 常用属性和方法：
```
localStorage.key(i)
.length
.getItem("<key>")
.setItem("<key>","<value>")
.removeItem("<key>")
.clear()
```

- 使用注意事项：
  - 使用前先判断浏览器是否支持（浏览器开启无痕模式后不能用，有的可读但不可写，所以不能用 `if(window.localStorage){}`来做兼容处理，先set，然后再捕获异常）
  - 写数据时，要异常处理，避免抛出容量错误
  - 避免将敏感信息写入localStorage
  - 注意key的唯一性，会被覆盖


- 使用场景：
  - 利用本地数据，减少网络传输
  - 弱网络环境下，高延迟，低带宽，尽量把数据本地化


- H5本地存储的使用限制
  - 需要添加存储更新策略和过期控制
  - 子域名之间不能共享存储数据
  - 超出存储后如何存储`(LRU,FIFO)  -->  LRU (Least Recently Used) FIFO (先入先出)`
  - server端如何取到数据（请求参数）


- localStorage优点：
  - 存储大小达5M
  - 兼容性好，功能强大
  - 应用范围广



## IndexedDB

- 定义

  一种能在浏览器中持久存储结构化数据的数据库，并为web应用提供了丰富的查询能力。

- 浏览器支持

  chromw11+，FF4+，IE10+，移动端支持弱

- 存储结构

  按域名分配独立空间，一个域名下可创建多个数据库，一个DB可以创建多个对象储存空间（表），一个对象存储空间可以创建多个对象数据。

  ![IndexedSQL](/images/html-store/IndexedSQL.jpg)

- 功能
  - 增删改
  - 事务
  - 游标  
  - 索引

*注：w3c已不在维护Web SQL.*



## 离线缓存（application cache）

- 离线缓存（application cache）：让web应用在离线情况下继续使用，通过manifest文件指明要缓存的资源

- 检测是否在线：navigator.onLine

- 原理（如图）：读取离线缓存，同时检查manifest文件，有更新时更新文件和缓存

  ![H51](/images/html-store/H51.jpg)

- appcache使用和更新
  - 使用：创建manifest文件
  - 修改资源文件，必须通过修改manifest文件来更新被缓存的文件列表

  ![H52](/images/html-store/H52.jpg)

- 优点
  - 完全离线
  - 资源被缓存，加载更快
  - 降低server负载


- 缺陷
  - 含有manifest属性的当前页一定会被缓存
  - 更新依赖manifest文件，更新后需要再次刷新
  - 更新是全局性的，无法单点更新
  - 对于链接的参数变化敏感，不同的参数视为不同的文件
  - 占用资源
  - 更新内容会在下次生效


- 浏览器支持：IE8-不支持

- 适用场景
  - 单地址的页面（无参数）
  - 对实时性要求不高的业务
  - 离线webapp



## 总结

- H5存储优势：
  - 存储空间大
  - 接口丰富
  - 数据相对安全
  - 关系型
  - 省流量

- H5存储劣势：
  - 浏览器兼容( localStorage 和 app cache 主流浏览器都兼容的不错 )
  - 同源策略( localStorage 不可以跨子域，manifest 所引用的文件必须在同一个域名下面 )
  - 脚本控制( 只能在浏览器端存放；服务器端想拿到数据，只能通过请求 )
  - 更新策略（不像cookie可以设置过期时间；比如localStorage永不过期，必须自己写一套更新机制 )

