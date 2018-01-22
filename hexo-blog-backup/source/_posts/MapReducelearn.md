---
title: MapReduce初探
date: 2017-04-14
tags: [MapReduce]
categories: 大数据
---

# MapReduce初探

**MapReduce是一个用于处理海量数据的分布式计算框架**

MapReduce解决的问题：
- 数据分布式存储
- 作业调度
- 容错
- 机器间通信

<!-- more-->

MapReduce存储：HDFS
- 系统可靠性
- 可扩展性
- 并发处理

![Alt text](./HDFS.png)

MapReduce思想：分治
- 分解
- 求解
- 合并

- 分：map

  把复杂的问题分解为若干简单的任务

- 合：reduce

# MapReduce执行流程

![Alt text](./MR1.png)

![Alt text](./MR2.png)

![Alt text](./MR3.png)

![Alt text](./MR4.png)

![Alt text](./MR5.png)

![Alt text](./MR6.png)

![Alt text](./MR7.png)

![Alt text](./MR8.png)

![Alt text](./MR9.png)

![Alt text](./MR10.png)

![Alt text](./MR11.png)

![Alt text](./MR12.png)

![Alt text](./MR13.png)

![Alt text](./MR14.png)


# 实例

## WordCount

![Alt text](./WordCount.png)

# 应用

- 数据统计
  - A/B test的需要，实验和对照统计对比各个指标
  - 统计广告每天的展示、点击和消费总量
  - 统计视频在一段时间内展示和点击数量，CTR指标


- 数据过滤
  - 从日志中找到某一个条件数据
  - 除去非法数据，保留合法数据
  - 数据格式整理


- 同类汇聚
  - 多份日志中，相同时间点、用户行为日志混合
  - 类表格文件存储中，相同主键拼接相关的属性
  - 历史的主数据与新增、修改数据合并


- 全局排序
  - 混合日志按时间排序
  - 多个字段排序
  - 数据按名称排序


- 容错框架
  - 易出错的服务，大数值计算
  - 计算规模经常变化调整的服务
  - 单进程程序。迅速提升执行计算效率
