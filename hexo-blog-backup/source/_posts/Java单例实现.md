---
title: Java单例模式
tags:
  - Java
  - 面试
categories:
  - Java
copyright: ture
author: Awebone
abbrlink: 86ceb8f1
date: 2020-03-20 15:00:00
---

# 懒汉式

在初次调用静态方法getSingleton，才会初始化signleton实例。

**双重检查模式实现**

```java
public class Singletom {
    private volatile static Singletom singletom;
    private Singletom(){}
    
    public static Singletom getSingleton(){
        if (singletom == null){
            synchronized (Singletom.class){
                if (singletom == null){
                    singletom = new Singletom();
                }
            }
        }
        return singletom;
    }
}
```

- 实现了延迟初始化，只有在初次调用静态方法getSingleton，才会初始化signleton实例。

- 性能优化，同步会造成性能下降，在同步前通过判读singleton是否初始化，减少不必要的同步开销。

- 线程安全，同步创建Singleton对象，同时注意到静态变量singleton使用volatile修饰，避免JVM进行优化重排序。

<!-- more -->



**静态内部类实现**

```java
public class Singletom {
    private Singletom(){}
    public static Singletom getSingleton(){
        return Inner.instance;
    }

    private static class Inner {
        private static final Singletom instance = new Singletom();
    }
}
```

- 代码简洁，和双重检查模式对比，静态内部类单例实现清晰明了。

* 延迟初始化，调用getSingleton才初始化Singleton对象。

* 线程安全，JVM在执行类的初始化阶段，会获得一个可以同步多个线程对同一个类的初始化的锁。

<br />



# 饿汉式

直接初始化signleton实例，直接获取实例，没有延迟初始化。

**多线程安全实现**

```java
public class Singletom {
    private static Singletom instance = new Singletom();
    private Singletom(){}
    
    public static Singletom getSingleton(){
        return instance;
    }
}
```

