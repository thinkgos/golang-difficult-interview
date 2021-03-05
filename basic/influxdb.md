[TOC]

# influxdb

> [influxdb中文](https://www.hellodemos.com/hello-influxdb/influxdb-demos.html)

## 一. 名词解释

| 名词          | 解释       |
| ------------- | ---------- |
| `database`    | 数据库     |
| `measurement` | 表         |
| `points`      | 一行的数据 |

### 1. points由时间戳(time),数据(field),标签(tags)组成

| 名词     | 解释                                                    |
| -------- | ------------------------------------------------------- |
| `time`   | 每个数据记录时间，是数据库中的主索引(会自动生成)        |
| `fields` | 各种记录值（没有索引的属性）也就是记录的值：温度， 湿度 |
| `tags`   | 各种有索引的属性                                        |

### 2. series

所有在数据库中的数据，都需要通过图表来展示，而这个series表示这个表里面的数据，可以在图表上画成几条线：**通过tags排列组合算出来。** `show series from <measurement>`显示表的`series`

## 二. 基本操作

### 1. 常用操作

| 命令                             | 解释           |
| -------------------------------- | -------------- |
| `SHOW DATABASES`                 | 显示数据库     |
| `USE <db-name>`                  | 使用数据库     |
| `CREATE DATABASE <db-name>`      | 创建数据库     |
| `DROP DATABASE <db-name>`        | 删除数据库     |
| `SHOW MEASUREMENTS`              | 显示表         |
| `DROP MEASUREMENT <measurement>` | 删除表         |
| `SHOW series FROM <measurement>` | 显示表的series |

### 2. 增

直接在插入数据的时候指定表名,表会自动创建.

``insert <measurement>[,<tag-key>=<tag-value>...] <field-key>=<field-value>[,<field2-key>=<field2-value>...] [unix-nano-timestamp]`

### 3. 删与改

在InfluxDB中并没有提供数据的删除与修改方法. 不过我们可以通过数据保存策略（Retention Policies）来实现删除。
具体请看：[数据保存策略(Retention Policies)](#数据保存策略(Retention Policies))这一章节。

### 4. 查

**InfluxDB是支持类SQL语句的**

`SELECT * FROM <measurement> ORDER BY time DESC LIMIT 3`

> 对where语句,可以使用时间格式`YYYY-MM-DD HH:MM:SS.mmm`(`mmm`是可选的,可以指定微秒或纳秒),你也可以使用相对时间`now()`相对于服务器的当前时间戳
>
> ```sql
> SELECT * FROM "foodships" WHERE time > now() - 1h
> ```
>
> 在上面表达式中可减去的时间度量如下:
>
> | Letter |   Meaning    |
> | :----: | :----------: |
> |   ns   | nanoseconds  |
> | u or µ | microseconds |
> |   ms   | milliseconds |
> |   s    |   seconds    |
> |   m    |   minutes    |
> |   h    |    hours     |
> |   d    |     days     |
> |   w    |    weeks     |

InfluxDB还支持正则



## 三. 数据保存策略(Retention Policies)

InfluxDB没有提供直接删除`Points`的方法,但是它提供了**Retention Policies**.主要用于指定数据的保留时间:当数据超过了指定的时间之后,就会被删除.

### 1. 查看数据库的数据保存策略(Retention Policies)

`SHOW RETENTION POLICIES ON <db-name>`

### 2. 创建数据库的数据保存策略(Retention Policies)

`CREATE RETENTION POLICY <rp_name> ON <db-name> DURATION 30d REPLICATION 1 DEFAULT`

> 1. <rp_name>：策略名
> 2. <db-name>：具体的数据库名
> 3. 30d：保存30天，30天之前的数据将被删除, 它具有各种时间参数，比如：h（小时），w（星期）
> 4. REPLICATION 1：副本个数，这里填1就可以了
> 5. DEFAULT 设为默认的策略

### 3. 修改数据库的数据保存策略(Retention Policies)

`ALTER RETENTION POLICY <rp_name> ON <db-name> DURATION 3w DEFAULT`

### 4. 删除数据库的数据保存策略(Retention Policies)

`DROP RETENTION POLICY <rp_name> ON <db-name> `

## 四. 连续查询

当数据超过保存策略里指定的时间之后，就会被删除。如果我们不想完全删除掉，比如做一个数据统计采样：把原先每秒的数据，存为每小时的数据，让数据占用的空间大大减少（以降低精度为代价）。

这就需要InfluxDB提供的：连续查询（Continuous Queries）

### 1. 查看数据库CQ

`SHOW CONTINUOUS QUERIES`

### 2. 创建新的CQ

`CREATE CONTINUOUS QUERY <cq_name> ON <db-name> BEGIN SELECT mean(temperature) INTO <new_measurement> FROM <measurement> GROUP BY time(30m) END`

> 1. <cq_name>：连续查询的名字
> 2. <db-name>：具体的数据库名
> 3. mean(temperature): 算平均温度
> 4. <measurement>： 当前表名
> 5. <new_measurement>： 存新数据的表名
> 6. 30m：时间间隔为30分钟

### 3. 删除CQ

`DROP CONTINUOUS QUERY <cq_name> ON <db-name>`

## 五. 用户管理


### 1. 显示用户
`SHOW USERS`

### 2.  创建用户
 创建普通用户: `CREATE USER "username" WITH PASSWORD 'password'`
 创建管理员权限的用户: `CREATE USER "username" WITH PASSWORD 'password' WITH ALL PRIVILEGES`

### 3. 删除用户
`DROP USER "username"`





