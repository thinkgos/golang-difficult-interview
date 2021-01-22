[TOC]

# RedisTimeSeries

## 1. 基于 RedisTimeSeries 模块保存时间序列数据

`RedisTimeSeries` 是 Redis 的一个扩展模块。它专门面向时间序列数据提供了数据类型和访问接口，并且支持在 Redis 实例上直接对数据进行按时间范围的聚合计算。

因为 `RedisTimeSeries`  不属于 Redis 的内建功能模块，在使用时，我们需要先把它的源码单独编译成动态链接库 `redistimeseries.so`，再使用 loadmodule 命令进行加载

```shell
$ loadmodule redistimeseries.so
```

当用于时间序列数据存取时，`RedisTimeSeries`  的操作主要有 5 个：`TS.CREATE` ,`TS.ADD` ,`TS.GET` ,`TS.MGET` ,`TS.RANGE` 

- 用 `TS.CREATE` 命令创建时间序列数据集合；

> 在 `TS.CREATE` 命令中，我们需要设置时间序列
>
> - 数据集合的key 
> - 数据的过期时间（以**毫秒**为单位）
> - 数据集合设置标签，来表示数据集合的属性。(可选?)
>
> >  例如: 创建一个 key 为 device:temperature、数据有效期为 600s 的时间序列数据集合。最后，我们给这个集合设置了一个标签属性{device_id:1}，表明这个数据集合中记录的是属于设备 ID 号为 1 的数据
> > ```shell
> > TS.CREATE device:temperature RETENTION 600000 LABELS device_id 1
> > ```
> > 

- 用` TS.ADD` 命令插入数据；用 `TS.GET` 命令读取最新数据；

> 用 `TS.ADD` 命令往时间序列集合中插入数据，包括时间戳和具体的数值，并使用 TS.GET 命令读取数据集合中的最新一条数据。
>
> > 往 device:temperature 集合中插入了一条数据，记录的是设备在 2020 年 8 月 3 日 9 时 5 分的设备温度；再执行 TS.GET 命令时，就会把刚刚插入的最新数据读取出来。
> >
> > ```shell
> > $ TS.ADD device:temperature 1596416700 25.1
> > $ 1596416700
> > 
> > $ TS.GET device:temperature 
> > $ 25.1
> > ```

- 用`TS.MGET` 命令按标签过滤查询数据集合；

> 在保存多个设备的时间序列数据时，我们通常会把不同设备的数据保存到不同集合中。此时，我们就可以使用 `TS.MGET` 命令，按照标签查询部分集合中的最新数据。
>
> 在使用 `TS.CREATE` 创建数据集合时，我们可以给集合设置标签属性。
>
> 当我们进行查询时，就可以在查询条件中对集合标签属性进行匹配，最后的查询结果里只返回匹配上的集合中的最新数据。
>
> > 假设我们一共用 4 个集合为 4 个设备保存时间序列数据，设备的 ID 号是 1、2、3、4，我们在创建数据集合时，把 device_id 设置为每个集合的标签。
> >
> > ```shell
> > TS.MGET FILTER device_id!=2 
> > 1) 1) "device:temperature:1"
> >    2) (empty list or set)
> >    3) 1) (integer) 1596417000
> >       2) "25.3"
> > 2) 1) "device:temperature:3"
> >    2) (empty list or set)
> >    3) 1) (integer) 1596417000
> >       2) "29.5
> > 3) 1) "device:temperature:4"
> >    2) (empty list or set)
> >    3) 1) (integer) 1596417000
> >       2) "30.1"
> > ```

- 用 `TS.RANGE` 支持聚合计算的范围查询。

> 在对时间序列数据进行聚合计算时，我们可以使用 `TS.RANGE` 命令指定要查询的数据的时间范围，同时用 `AGGREGATION` 参数指定要执行的聚合计算类型。
>
> RedisTimeSeries 支持的聚合计算类型很丰富，包括***求均值（avg）***、***求最大 / 最小值（max/min）***，***求和（sum）***等
>
> > 在执行下列命令时，我们就可以按照每 180s 的时间窗口，对 2020 年 8 月 3 日 9 时 5 分和 2020 年 8 月 3 日 9 时 12 分这段时间内的数据进行均值计算了
> >
> > ```shell
> > TS.RANGE device:temperature 1596416700 1596417120 AGGREGATION avg 180000
> > 1) 1) (integer) 1596416700
> >    2) "25.6"
> > 2) 1) (integer) 1596416880
> >    2) "25.8"
> > 3) 1) (integer) 1596417060
> >    2) "26.1"
> > ```





