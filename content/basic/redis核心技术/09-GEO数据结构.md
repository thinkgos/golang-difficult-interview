[TOC]

# GEO数据结构

- [GEO算法原理与实现](https://www.jianshu.com/p/2fd0cf12e5ba)
- [Go geohash](https://github.com/mmcloughlin/geohash)

## 一. 如何操作GEO类型

在使用 GEO 类型时，我们经常会用到两个命令，分别是 GEOADD 和 GEORADIUS。

> 假设车辆 ID 是 33，经纬度位置是（116.034579，39.030452），我们可以用一个 GEO 集合保存所有车辆的经纬度，集合 key 是 cars:locations
>
> ```sh
> GEOADD cars:locations 116.034579 39.030452 33
> ```
>
> 当用户想要寻找自己附近的车辆时，LBS 应用就可以使用 GEORADIUS 命令。
>
> LBS 应用执行下面的命令时，Redis 会根据输入的用户的经纬度信息（116.054579，39.030452 ），查找以这个经纬度为中心的 5 公里内的车辆信息，并返回给 LBS 应用
>
> ```shell
> GEORADIUS cars:locations 116.054579 39.030452 5 km ASC COUNT 10
> ```

## 二. GEO操作方法

Redis GEO 操作方法有：

- **geoadd**：添加地理位置的坐标。

  `GEOADD key longitude latitude member [longitude latitude member ...]`

- **geopos**：获取地理位置的坐标。

  `GEOPOS key member [member ...]`

- **geodist**：计算两个位置之间的距离。

  `GEODIST key member1 member2 [m|km|ft|mi]`

- **georadius**：根据用户给定的经纬度坐标来获取指定范围内的地理位置集合。

  `GEORADIUS key longitude latitude radius m|km|ft|mi [WITHCOORD] [WITHDIST] [WITHHASH] [COUNT count] [ASC|DESC] [STORE key] [STOREDIST key]`

- **georadiusbymember**：根据储存在位置集合里面的某个地点获取指定范围内的地理位置集合。

  `GEORADIUSBYMEMBER key member radius m|km|ft|mi [WITHCOORD] [WITHDIST] [WITHHASH] [COUNT count] [ASC|DESC] [STORE key] [STOREDIST key]`

  - WITHDIST: 在返回位置元素的同时， 将位置元素与中心之间的距离也一并返回。
  - WITHCOORD: 将位置元素的经度和维度也一并返回。
  - WITHHASH: 以 52 位有符号整数的形式， 返回位置元素经过原始 geohash 编码的有序集合分值。 这个选项主要用于底层应用或者调试， 实际中的作用并不大。
  - COUNT 限定返回的记录数。
  - ASC: 查找结果根据距离从近到远排序。
  - DESC: 查找结果根据从远到近排序。

- **geohash**：返回一个或多个位置对象的 geohash 值

  `GEOHASH key member [member ...]`

单位: 

- **m**：米，默认单位。
- **km** ：千米。
- **mi** ：英里。
- **ft** ：英尺。



