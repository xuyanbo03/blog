---
title: MySQL基本使用
tags:
  - MySQL
categories:
  - 数据库
copyright: ture
author: Awebone
abbrlink: 75c6e52f
date: 2019-03-17 15:00:00
---

# MySQL基本使用

## 修改MySQL提示符

**修改提示符的两种方式：**

1. 连接客户端时通过参数指定：`shell>mysql -uroot -proot --prompt` 提示符
2. 连接上客户端后，通过`prompt`修改：`mysql>prompt` 提示符

**修改参数：**

`\D` 完整日期
`\d` 数据库
还可以搭配一起`+`符号
`\h` 服务器
`\u` 用户

<!-- more -->



## MySQL常用命令

**系统查看：**

`VERSION();` 当前数据库版本
`NOW(); `当前系统时间
`USER();` 当前登录的用户



**MySQL语句的规范：**

1. 关键字与函数名称全部大写
2. 数据库名称、表名称、字段名称全部小写
3. SQL语句必须以分号结尾



## 数据库相关语句

> 成功安装后默认会带4个数据库；{}代表必选项；"|"代表从这里面做选择；中括号[]代表有或没有都可以，可选项。


- 查看所有数据库

  `SHOW DATABASES;`

-  查看所有警告
   
   `SHOW WARNINGS;`
   
-  查看数据库创建时的信息
   
   `SHOW CREATE DATABASE db_name（数据库名）;`
   
-  新建数据库
   
   `CREATE {DATABASE|SCHERMA}[IF NOT EXISTS] db_name [DEFAULT] CHARACTER SET = charset_name`
   
   如：新建数据库并设置格式
   
   `CREATE DATABASE IF NOT EXISTS db_name [DEFAULT] （default可省略）CHARACTER SET utf-8（格式，默认utf-8，可以改为任意的）；`
   
-  修改数据库
   
   `ALTER {DATABASE|SCHEMA}[db_name][DEFAULT] CHARACTER SET charset_name;`
   
   如果需要修改编码格式，可写：
   
   `ALTER DATABASE db_name CHARACTER SET = uft8;`
   
-  删除数据库
   
   `DROP {DATABASE|SCHEMA}[IF EXISTS] db_name;`



## 表相关语句

- 打开某个数据库

  `USE db_name;`

- 查看用户当前所打开的数据库

  `SELECT DATABASE();`

- 创建数据表（如果数据表已存在，加上`if not exists`，系统将不提示错误，否则会提示错误）

  `CREATE TABLE[IF NOT EXISTS] table_name(colume_name data_type);`

  列名称：经过分析得到

  数据类型：整型，浮点型等

  注意：逗号是两个字段之间的分隔符，最后一个字段不需要加逗号。

  例子：

  ```sql
  /*打开要创建表的数据库*/
  USE 数据库名;
  
  /*在打开的数据库中创建表*/
  CREATE TABLE tb1(
      username VARCHAR(20), 
      age TINYINT UNSIGNED,
      salary FLOAT(8,2) UNSIGNED
  );
  ```

- 显示当前数据库的表

  `SHOW TABLES;`

- 显示mysql库中的表

  `SHOW TABLES FROM mysql;`

  注：但是并没有改变当前数据库，只是显示了一次其他数据库的列表

- 查看数据表结构

  `SHOW COLUMNS FROM table_name;`

- 插入数据

  `INSERT [INTO] tb_name（表名) [col_name,....](表里的哪几列要赋值，可省略) VALUES(val,...)（值是多少）`

  如果省略列的名称，必须给所有字段赋值，否则会报错。

- 查询全表

  `SELECT * FROM tb1;`



## 创建表时需要注意的字段控制

**字段是否为空**

`NULL`：字段值可为空

`NOT NULL`：字段值不为空

同一个字段不可能既为NULL，又为NOT NULL

在创建数据表的时候，如果字段值可为空，可以写NULL，也可省略，不写的话默认为空，如果为空可赋值也可不赋值

```sql
CREATE TABLE tb2(
    username VARCHAR(20) UNSIGNED NOT NULL,
    age TINYINT UNSIGNED NULL
);
```



**字段是否自增**

字段为数值型时可为整数或浮点数，为浮点数时小数位必须要为0，如：`FLOAT (7,0)`

`AUTO_INCREMENT`：自动编号，必须与主键组合使用，否则会报错，默认情况下，起始值为1，每次的增量为1，保证记录唯一性

`AUTO_INCREMENT`必须和`PRIMARY KEY` 一起使用，每次自增1，可不进行赋值

而`PRIMARY KEY` 可以不和`AUTO_INCREMENT`一起使用，可以被赋值但是不允许有相同值的出现

```sql
CREATE TABLE tb3(
    id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(20) UNSIGNED NOT NULL
);
```



**字段是否唯一**

`unique key`：唯一约束

唯一约束可以保证记录的唯一性

唯一约束的字段可以为空值（null），即使存储多个值，最终保留的空值也只有一个，故可以保证唯一性。

每张数据表可以存在多个唯一约束，可以存在多个空值null，primary key就只有1个。

唯一约束添加语句：`username varchar(20) not null unique key`

达到的效果就是如果插入语句有相同的字段，那么会约束它，只能保证数据唯一性。



**`primary key`与`unique key`的区别**

`primary key`与`unique key`都是唯一性约束，但二者有很大的区别：

1. 作为`primary key`的1个或多个列必须为`NOT NULL`，而`unique key`约束的列可以为`null`，这是`primary key`与`unique key`最大的区别。
2. 一个表只能有一个`primary key`(单列或多列，多列主键叫联合主键)，但可以有多个`unique key`。



**默认值设置**

default 设置：当插入记录时，如果没有明确为字段赋值，则自动赋予默认值

`sex enum('1','2','3') default '3'`

这个语句要达成的效果就是性别提供三个选项：1男，2女，3保密，那么如果数据插入没有添加性别，那么默认为3选项



## 数据类型

**字符型**

![mysql_char](/images/mysql/mysql_char.jpg)

**整型**

![mysql_int](/images/mysql/mysql_int.jpg)

**浮点型**

![mysql_float](/images/mysql/mysql_float.jpg)

**日期时间型**

![mysql_data](/images/mysql/mysql_data.jpg)











数据表操作：插入几录 查找记录
记录操作：创建数据表 约束的使用

create table table_name 创建数据表
show columns from table_name查看数据表结构
select*from table_name数据查找，验证数据是否成功写入。

auto_increment必须要和主键一起使用 但是主键可以不和auto_increment一起使用 不一起使用时主键可以自主赋值
PRIMARY KEY 主键约束 一张表只能有一个主键约束
Unique key 唯一约束 一个表可以有多个Unique约束
default 默认约束

具有外键列的表称为子表；子表所参照的表称为父表
1.父表和子表必须使用相同的存储引擎，而且禁止使用临时表
2.数据表的存储引擎只能为InnoDB
3.外键列和参照列必须具有相似的数据类型，其中数字的长度或是否有符号位必须相同；而字符的长度则可以不同
4.外键列和参照列必须创建索引，如果参照列不存在索引的话，mysql将自动创建索引；如果外键列没有索引，mysql将不会自动创建索引（此处根据语音修改，与PPT内容不一致——经查，mysql5.5以上的版本不会自动创建外键索引，但根据实际情况，创建外建索引很有必要。）

表级约束：约束只针对某一字段
列级约束：约束针对两个及两个以上字段
FOREIGN KEY（外键约束）:保持数据的一致性，完整性。实现数据表的一对一，一对多的关系。
1，父表（子表所参照的表）和子表（具有外键列的表）必须使用相同的存储引擎，而且禁止使用临时表。
2，数据表的存储引擎只能为InnoDB（可在my.ini查看修改。5.7版本my.ini地址：C:\ProgramData\MySQL\MySQL Server 5.7\my.ini）。
3，外键列（曾经加过foreign关键词的那一列）和参照列（外键列所参照的那列）必须具有相似的数据类型(字符，整型，日期时间等）。其中数字的长度或是否有符号位（如整型有无符号(unsigned)和有符号(signed)两种类型;）必须相同；而字符的长度则可以不同。比如说父表里面有一个参数id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,子表里面就要写作pid SMALLINT UNSIGNED(符号位和数据类型要相似)
4，外键列和参照列必须创建索引。如果外键列不存在索引的话，MySQL将自动创建索引。
FOREIGN KEY (pid)REFERENCES 父表名(id)
也就是users表中有两个索引（id pid）
外键列：pid （可自定义）
参照列：id  （可自定义）
SHOW INDEXES FROM table_name查看索引
SHOW INDEXES FROM table_name\G;以网格方式来查看索引

外键约束的参照操作：
在实际的项目开发中，为避免受引擎限制，通常使用逻辑外键约束，而不使用此物理的外键约束（按照外键的定义来设计数据表，但不使用FOREIGN KEY）。
1.CASCADE从父表删除或更新时自动删除或更新子表中的匹配行
2.SET NULL从父表删除或更新行时，设置子表中的外键列为NULL。如果使用该选项，必须保证子表列没有指定NOT NULL
3.RESTRICT拒绝对父表的删除或更新操作
4.NO ACTION标准的SQL关键字，在mysql中与RESTRICT作用相同

对于一个列所创建的约束，称之为列级约束。
而对于两个或两个以上的列所创建的约束，我们称之为表级约束。
列级约束在使用时，既可以在列定义的时候声明，也可以在列定义以后声明，而表级的约束只能在列定义以后来声明。
在实际开发中，用列级约束比较多，表级约束很少用，
在所有的约束中，并不是说每种约束都存在着表级或列级约束，其中，NOT NULL 非空约束，DEFAULT约束这两种约束就不存在表级约束，它们只有列级约束，而对于其他的三种，像主键，唯一，外键，它们都可以存在表级和列级约束。

删除列：ALTER TABLE tb1_name DROP[COLUMN] col_name;
添加多列：ALTER TABLE tb1_name ADD[COLUMN] (col_name column_definition,...);
添加单列：ALTER TABLE tb1_name ADD[COLUMN] col_name column_definition [FIRST|AFTER col_name];
删除记录：DELETE FROM province WHERE id=3;
验证表中是否有相应的记录：SELECT * FROM province;
显示索引：SHOW INDEXES FROM province;SHOW INDEXES FROM province\G;(以网格呈现)
打开数据表test：USE test;
查看创建命令：SHOW CREATE TABLE province;
查看数据表结构：SHOW COLUMNS FROM tb3;
插入记录：INSERT [INTO] tb1_name [(col_name,...)] VALUES (val,...);
查看数据表列表：SHOW TABLES [FROM db_name] [LIKE 'pattern'|WHERE expr];
添加的单列将他至于那一列后面语句：after 后面跟要添加其下的列名
alter table users1 add 要添加的列名 varchar(32) not null after 列名；
将添加的单列位于所有列之前：first
alter table users1 add 要添加的列名和属性 first；
多个操作可以同时操作，用逗号分开

增加一行
ALTER TABLE tb_name ADD age SMALLINT UNSIGNED NOT NULL;
添加主键约束（只能添加一个）
ALTER TABLE tbl_name ADD [CONSTRAINT [symbol自定义的约束的名称]] PRIMARY KEY [index_type] (index_col_name,...)
ALTER TABLE tb_1 ADD PRIMARY KEY(id);
添加唯一约束（可以添加多个）
ALTER TABLE tbl_name ADD [CONSTRAINT [symbol]] UNIQUE [index_type] (index_col_name,...)
ALTER TABLE tb_1 ADD UNIQUE (username);
添加外键约束
ALTER TABLE tbl_name ADD [CONSTRAINT [symbol]] FOREIGN KEY [index_type] (index_col_name,...)
reference_definition
例：ALTER TABLE t3 ADD FOREIGN KEY (age)REFERENCES t2(age);
添加/删除默认约束
ALTER TABLE tbl_name ALTER [COLUMN] col_name SET DAFAULT literal（比如age里面可设置为10，20 |DROP DEFAULT
例：ALTER TABLE user2 ALTER age SET DEFAULT 15;
ALTER TABLE user2 ALTER age DROP DEFAULT;

查索引是SHOW INDEX
查约束是SHOW INDEXES
约束和索引， 前者是用来检查数据的正确性，后者用来实现数据查询的优化，目的不同。
唯一性约束与唯一索引有所不同：
（1）.创建唯一约束会在Oracle中创建一个Constraint，同时也会创建一个该约束对应的唯一索引。
（2）.创建唯一索引只会创建一个唯一索引，不会创建Constraint。
也就是说其实唯一约束是通过创建唯一索引来实现的。
在删除时这两者也有一定的区别：
删除唯一约束时可以只删除约束而不删除对应的索引，所以对应的列还是必须唯一的，
而删除了唯一索引的话就可以插入不唯一的值。
删除唯一约束:ALTER TABLE table_name DROP INDEX 数据名；
PRIMARY KEY 和 KEY 的区别：
主键一定是唯一性索引，唯一性索引并不一定就是主键
一个表中可以有多个唯一性索引，但只能有一个主键
主键列不允许空值，而唯一性索引列允许空值
删除主键约束：alter table user2 drop primary key;
不用选择字段 因为一张表有也只有一个主键。
删除外键约束：alter table 数据表名 drop foreign key user_ibfk_1;
在删除之前要先找到外键名 需用show create table 数据表名；来查看

1.修改列定义
用关键字ALTER TABLE..MODIFY
ALTER TABLE tbl_name MODIFY [COLUMN] col_name column_definition [FIRST |AFTER col_name];
ALTER TABLE users2 MODIFY id SMALLINT UNSIGNED NOT NULL FIRST; //将id字段的位置提到第一列
SHOW COLUMNS FROM users2;
ALTER TABLE users2 MODIFY id TINYINT UNSIGNED NOT NULL; //修改数据类型,需注意数据丢失的问题

2.修改列名称,用CHANGE方法可以同时修改列名称和列定义.
用关键字ALTER..CHANGE
ALTER TABLE tbl_name CHANGE [COLUMN] col_name new_col_name column_definition [FIRST|AFTER col_name];
ALTER TABLE users2 CHANGE pid p_id TINYINT UNSIGNED; //修改列名称

3.更换数据表名
用关键字ALTER..RENAME
修改一个表的表名(方法1)
ALTER TABLE users2 RENAME person;
修改一个表的表名(方法2)
用关键字RENAME..TO
RENAME TABLE users5 TO users2;
一次修改多个表的表名,操作间用逗号隔开.
RENAME TABLE users5 TO users2,users3 TO users4;
应该少使用数据表的列名及表名的更名。

1. 创建表：
   create table user(
       id smallint primary key not null auto_increment,
       name varchar(20),
       age smallint
   );
2. show create table user;  查看创建表信息
   show tables; 显示当前数据库所有的表
   show columns from user;  显示列属性  或 discribe user;
   show indexes from user \G;  显示所有的索引，“\G” 表示按列显示
3. drop table user1;  删除表
4. 表添加一列： alter table user add age tinyint
   表删除一列： alter table user drop age;
5. 添加主键约束：alter table user2 add primary key (id);
   删除主键约束：alter table user2 drop primary key;
   添加唯一约束： alter table user2 add unique key uni_key (name);
   删除唯一约束： drop index uni_key on user2;
   添加外键约束：alter table user2 add foreign key (age) references user(id);
   添加默认约束：alter table user2 alter age set default 20;
   删除默认约束：alter table user2 alter age drop default;
   修改列属性：alter table user2 modify name varchar(30);
   修改列名：alter table user2 change age age1 tinyint not null;
   修改表名：alter tabler user2 rename user3  或者  rename table user3 to user2;
   注：尽量不要修改列名和表名