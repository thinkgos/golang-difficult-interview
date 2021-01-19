[TOC]

# redis统计

集合类型常见的四种统计模式:**聚合统计**,**排序统计**,**二值状态统计**,**基数统计**

## 1. 聚合统计

 所谓的聚合统计，就是指统计多个集合元素的聚合结果，包括：

 - **交集统计**: 统计多个集合的共有元素；
 - **差集统计**: 把两个集合相比，统计其中一个集合独有的元素；
 - **并集统计**: 统计多个集合的所有元素;

> 例: 用户登录过APP的用户和每一天登录APP的用户,采用Set集合
>
> - 用户登录过APP的用户,以`user:id`为key, 用户id为value
> - 每日登录过APP的用户,以`user:id:20yymmdd`,用户id为value,
>
> 假设8月3日上线APP,
>
> 累计用户Set是空集,`user:id:20200803`为8月3日当天新增用户
>
> 并集: 执行`SUNIONSTORE  user:id  user:id  user:id:20200803 `后,`user:id`就有8月3日的用户,
>
> 8月4日的用户记录在`user:id:20200804`,
>
> 差集: 执行`SDIFFSTORE  user:new  user:id:20200804 user:id  `就是8月4日当日增加的用户放入`user:new`
>
> 交集: 执行`SINTERSTORE user:id:rem user:id:20200803 user:id:20200804` 得到8月3日登录,8月4日留存的用户

> Set 的差集、并集和交集的计算复杂度较高，在数据量较大的情况下，如果直接执行这些计算，会导致 Redis 实例阻塞。所以，建议：
>
> > 可以从主从集群中选择一个从库，让它专门负责聚合计算，或者是把数据读取到客户端，在客户端来完成聚合统计，这样就可以规避阻塞主库实例和其他从库实例的风险了。

## 2. 排序统计

在 Redis 常用的 4 个集合类型中（List、Hash、Set、Sorted Set），List 和 Sorted Set 就属于有序集合

- List 是按照元素进入 List 的顺序进行排序的

- Sorted Set 可以根据元素的权重来排序，我们可以自己来决定每个元素的权重值   

> 在面对需要展示最新列表、排行榜等场景时，如果数据更新频繁或者需要分页显示，建议你优先考虑使用 Sorted Set。

## 3. 二值状态统计

Bitmap 本身是用 String 类型作为底层数据结构实现的一种统计二值状态的数据类型。

String 类型是会保存为二进制的字节数组，所以，Redis 就把字节数组的每个 bit 位利用起来，用来表示一个元素的二值状态。你可以把 Bitmap 看作是一个 bit 数组。

Bitmap 提供了 GETBIT/SETBIT 操作，使用一个偏移值 offset 对 bit 数组的某一个 bit 位进行读和写。不过，需要注意的是，Bitmap 的偏移量是从 0 开始算的，也就是说 offset 的最小值是 0。

当使用 SETBIT 对一个 bit 位进行写操作时，这个 bit 位会被设置为 1。Bitmap 还提供了 BITCOUNT 操作，用来统计这个 bit 数组中所有“1”的个数。

## 4. 基数统计

基数统计。基数统计就是指统计一个集合中不重复的元素个数

hash和set集合都可以实现,但HyperLogLog更省内存

HyperLogLog 是一种用于统计基数的数据集合类型，它的最大优势就在于，当集合元素数量非常多时，它计算基数所需的空间总是固定的，而且还很小。

在 Redis 中，每个 HyperLogLog 只需要花费 12 KB 内存，就可以计算接近 2^64 个元素的基数

> 在统计 UV 时，你可以用 PFADD 命令（用于向 HyperLogLog 中添加新元素）把访问页面的每个用户都添加到 HyperLogLog 中。
>
> `PFADD page1:uv user1 user2 user3 user4 user5`
>
> 接下来，就可以用 PFCOUNT 命令直接获得 page1 的 UV 值了，这个命令的作用就是返回 HyperLogLog 的统计结果。
>
> `PFCOUNT page1:uv`
>
> 注意: HyperLogLog 的统计规则是基于概率完成的，所以它给出的统计结果是有一定误差的，标准误算率是 0.81%。这也就意味着，你使用 HyperLogLog 统计的 UV 是 100 万，但实际的 UV 可能是 101 万。虽然误差率不算大，但是，如果你需要精确统计结果的话，最好还是继续用 Set 或 Hash 类型
>
> 链接: [HyperLogLog原理](https://en.wikipedia.org/wiki/HyperLogLog)

## 5. 总结

![统计](asserts/tongji.jpg)





