---
title: 多种计算引擎实现WordCount
tags:
  - 算法
  - 面试
categories:
  - 大数据
copyright: ture
author: Awebone
abbrlink: dd22b276
date: 2020-03-26 15:00:00
---

> 本文使用多种计算引擎实现词频统计



# MapReduce实现

编写MapReduce程序分成三部分：`Mapper`、`Reducer`、`Driver`



**业务逻辑**

1. `MapTask`阶段处理每个数据分块的单词统计分析，每遇到一个单词，将其转换为一个`k-v`对，如`<hello, 1>`的形式，发送给`ReduceTask`进行汇总
2. `ReduceTask`阶段接受`MapTask`的结果，做汇总计数



**Mapper接受的四个泛型**

 * `KEYIN`：输入的键的类型，在这里指的是每一行起始的偏移量
 * `VALUEIN`：输入的值的类型，在这里指的是一行的内容
 * `KEYOUT`：输出的键的类型，这里指的是单词，允许重复的
 * `VALUEOUT`：输出的值的类型

<!-- more -->



**Reducer接受的四个泛型**

- `KEYIN`：map输出的key，指的就是单词
- `VALUEIN`：map输出的value，指的就是1

- `KEYOUT`：输出的key的类型，这里指的就是单词，这里的key不可以重复
- `VALUEOUT`：输出的value的类型，这里指的就是总的词频



**Hadoop中自定义的序列化和反序列化的接口**

Java中的序列化和反序列化接口Serializable，将类结构一并进行序列化和反序列化，过于臃肿

- `long——LongWritable`
- `int——IntWritable`
- `double——DoubleWritable`
- `float——FloatWritable`
- `null——NullWritable`
- `string——Text`



**Map实现**

```java
static class WordCountMapper extends Mapper<LongWritable, Text, Text, IntWritable>{
	/**
	 * 这个方法的调用频率：每行调用一次,文本中有几行就调用几次
	 * key:当前行的起始偏移量
	 * value:当前行的内容,和key是一一对应的
	 */
    @Override
	protected void map(LongWritable key,
			Text value, 
			Context context)
			throws IOException, InterruptedException {
		//拿到每一行的内容  进行分割  
		//将text---String
		String line = value.toString();
		//拆分单词
		String[] words = line.split("\t");
		//循环遍历每一个单词  进行打标机  1  发送给reduce进行统一统计
		for(String w:words){
			//参数1：key   参数2：value
			//String--text
			Text k=new Text(w);
			IntWritable v=new IntWritable(1);
			context.write(k, v);
		}
	}
}
```



**Reduce实现**

```java
static class WordCountReducer extends Reducer<Text, IntWritable, Text, IntWritable>{
	/**
	 * 这个方法的调用频率：每组调用一次
	 * 分组规则：key相同的为一组
	 * key:reduce输入的,这里指的是单词,每一组中的一个key
	 * values:每一组中的所有value,<1,1,1>
	 */
	@Override
	protected void reduce(Text key, 
			Iterable<IntWritable> values,
			Context context) throws IOException, InterruptedException {
		//进行词频统计
		int sum=0;
		//循环变遍历values   求和
		for(IntWritable v:values){
			//v.get()  这个是将intwritable转换为int
			sum+=v.get();
		}
		context.write(key, new IntWritable(sum));
	}
}
```



**Driver实现**

```java
public class Driver {
	public static void main(String[] args) 
        throws IOException, ClassNotFoundException, InterruptedException {
		System.setProperty("HADOOP_USER_NAME", "hadoop");
		//加载配置文件
		Configuration conf=new Configuration();
		//启动一个job：一个map reduce程序，这里叫做一个job
		Job job=Job.getInstance(conf);
		
		//ָ指定job运行的主类
		job.setJarByClass(Driver.class);
		
		//指定这个job的mapper类和reduce类
		job.setMapperClass(WordCountMapper.class);
		job.setReducerClass(WordCountReducer.class);
		
		//指定map的输出的key和value的类型
		//这里为什么还要指定：泛型的只在编译的时候有作用，运行会自动擦除，所以在这里需要指定一下
		job.setMapOutputKeyClass(Text.class);
		job.setMapOutputValueClass(IntWritable.class);
		
		//指定reduce输出的key和value类型
		job.setOutputKeyClass(Text.class);
		job.setOutputValueClass(IntWritable.class);
		
		//指定combiner组件
		//job.setCombinerClass(WordCountReducer.class);
		//添加自定义分区
		//job.setPartitionerClass(MyPartitioner.class);
		// 这个参数如果不指定,默认reducetask=1
		job.setNumReduceTasks(4);
	
        //传参方式
		//FileInputFormat.addInputPath(job, new Path(args[0]));
		//添加输出路径：输出路径一定不能存在，怕如果存在会进行覆盖
		//FileOutputFormat.setOutputPath(job, new Path(args[1]));
        
        //固定写死
		FileInputFormat.addInputPath(job, new Path("hdfs://hadoop01:9000/in"));
		FileOutputFormat.setOutputPath(job, new Path("hdfs://hadoop01:9000/out"));
		//提交job
		job.waitForCompletion(true);
	}
}
```

<br />



# Scala实现

定义数据：`array = Array("a b", "c c", "b c")`



## 第一种方式实现

```scala
val countWord = array.flatMap(_.split(" "))
	.map((_,1))
	.groupBy(_._1)
	.map( x => (x._1, x._2.length))
	.toList
	.sortBy(_._2)
	.reverse
```



**中间结果详解**

- `array.map(_.split(" "))`输出：`Array(Array("a","b"), Array("c","c"), Array("b","c"))`
- 使用`flatMap(_.split(" "))`输出：`Array("a","b", "c","c", "b","c")`
- 再使用`map((_,1))`输出：`Array((a,1), (b,1), (c,1), (c,1), (b,1), (c,1))`
- 再使用`groupBy(_._1)`输出：`(a,1)，(b,1)，(b,1)，(c,1)，(c,1)，(c,1)`，即`Map(b -> Array((b,1), (b,1)), a -> Array((a,1)), c -> Array((c,1), (c,1), (c,1)))`
- 在进行计数：`array.flatMap(_.split(" ")).map((_,1)).groupBy(_._1).map( x => (x._1, x._2.length))`
- 从大到小排序：`array.flatMap(_.split(" ")).map((_,1)).groupBy(_._1).map( x => (x._1, x._2.length)).toList.sortBy(_._2).reverse`



## 其他方式实现

```scala
val countWord1 = array.map(_.split(" "))
	.flatten
	.map((_,1))
	.groupBy(_._1)
	.map(t => (t._1,t._2.size))
	.toList
	.sortBy(_._2)
	.reverse

val countWord2 = array.flatMap(_.split(" "))
	.map((_,1))
	.groupBy(_._1)
	.mapValues(_.size)
	.toList
	.sortBy(_._2)
	.reverse

val countWord3 = array.flatMap(_.split(" "))
	.map((_,1))
	.groupBy(_._1)
	.mapValues(_.foldLeft(0)(_+_._2))
	.toList
	.sortBy(_._2)
	.reverse
```

<br />



# Spark-Shell实现

## 第一种方式实现

```scala
sc.textFile("hdfs://myha/spark/wc/input/words.txt")
	.flatMap(_.split(" "))
	.map((_, 1))
	.reduceByKey(_+_)
	.collect
```



**详解**

- `sc`是`SparkContext`对象，该对象是提交`spark`程序的入口
- `textFile("hdfs://myha/spark/wc/input/words.txt")`是从`HDFS`中读取数据
- `flatMap(_.split(" "))`先`map`再压平
- `map((_,1))`将单词和1构成元组
- `reduceByKey(_+_)`按照`key`进行`reduce`，并将`value`累加
- `saveAsTextFile("hdfs://myha/spark/wc/output")`将结果写入到`HDFS`中
- 其中：`reduceByKey =  groupByKey + reduce = groupBy +  reduce =  groupBy + map`



## 其他方式实现

```scala
sc.textFile("hdfs://myha/spark/wc/input/words.txt")
	.flatMap(_.split(" "))
	.map((_,1))
	.reduceByKey(_+_)
	.collect
	.foreach(println)

sc.textFile("hdfs://myha/spark/wc/input/words.txt")
	.flatMap(_.split(" "))
	.countByValue
	.foreach(println)

sc.textFile("hdfs://myha/spark/wc/input/words.txt")
	.flatMap(_.split(" "))
	.map((_,1))
	.countByKey()
	.foreach(println)
```

