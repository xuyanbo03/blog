---
title: Hadoop面经总结
tags:
  - Hadoop
  - 面试
categories:
  - 大数据
copyright: ture
author: Awebone
abbrlink: 1d6a9c79
date: 2020-03-31 15:00:00
---

# Hadoop面经总结

本文主要收集大数据Hadoop相关知识点总结。



## HDFS总结

### 介绍一下HDFS的NameNode和DataNode

主节点NameNode：掌管文件系统目录树，处理客户端读写请求，负责管理整个文件系统的元数据，负责维持文件的副本数量

SecondaryNameNode：主要是给NameNode分担压力，把NN的fsimage和edit log做定期融合，融合后传给NN，以确保备份到的元数据是最新的，是冷备。

从节点DataNode：存储整个集群所有数据块，处理真正的数据读写，通过心跳信息定期地向NameNode汇报自身保存的文件块信息

<!-- more -->



### NameNode如何保证高可用

搭建Hadoop HA集群，通过多个NameNode实现集群中NameNode的热备，解决单点故障问题，保证高可用。在任何时候，要确保NameNode只有一个处于Active状态，其他处于Standby状态。

在高可用配置下，edit log不在存放在SecondaryNameNode，而是存放在QJM（quorum journal manager）共享存储系统中，Standby NameNode监听这个共享存储系统，发现新数据写入，则读取数据并且加载到自己内存中，确保自己的内存状态和Active NameNode保持一致。



### HDFS为什么不适合存储小文件

1. 数据的元信息存储在NameNode内存中，但是NameNode的内存和存储block数目是有限的。一个block元信息消耗大约150byte内存，存储一亿个block，会需要20GB内存。
2. 相比于存取同等大小的一个大文件，存取大量小文件会消耗大量的寻道时间



### Hadoop心跳机制

1. Hadoop是主从架构，Master有NameNode和ResourceManager，Slave有DataNode和NodeManager。
2. Master启动时会启动一个IPC Server（进程间通信服务），等待Slave的连接。
3. Slave启动时，主动连接Master的IPC Server，每隔3s连接一次。Slave通过心跳汇报自己的信息，Master通过心跳给Slave下达命令。
4. HDFS默认的超时时间为10min+30s，当超过这个时间还没有心跳，则认为节点宕机。其中10min为2次心跳重试间隔时间（5min），30秒为10次心跳间隔时间（3s）。



### Hadoop正常启动时进入安全模式的原因

1. NameNode的内存元数据中，包含文件路径、副本数、blockid、每一个block所在的DataNode的信息。但是在NameNode启动时，元数据从fsimage中加载，没有每一个block所在的DataNode的信息。
2. NameNode认为block丢失，block丢失率超过0.1%即进入安全模式。
3. DataNode启动后，通过心跳机制汇报自身持有的blockid信息，NameNode接受心跳，会将内存元数据中的每一个block所在的DataNode的信息补全，找到所有block位置后，退出安全模式。