[TOC]

# golang底层实现

### 1. goroutine初始栈大小，上下文如何切换，存在哪里

目前版本goroutine初始栈为`2Kb`.

### 2. GMP 
    - GMP说一下，P有多少个，G有多少个，M有多少个。系统调用的时候M会如何，网络IO的时候M会怎样。
    - go func(){} 执行过程  
> - [golang调试器GMP原理与调度全分析](https://mp.weixin.qq.com/s?__biz=MzAxMTA4Njc0OQ==&mid=2651438895&idx=3&sn=d7328484410c825c6e35b51a324f0c65&chksm=80bb61ddb7cce8cba59349bcae7c067db08e66428650962450cd3a081b9e96fae8db45758087&scene=0&xtrack=1&ascene=14&devicetype=android-%20-%20[%20]28&version=27000e39&nettype=cmnet&abtest_cookie=AAACAA%3D%3D&lang=zh_CN&exportkey=AY8miRgvHLg9mDv8QDJmkcI%3D&pass_ticket=BJCXwLPNm6YpRH9xw37LAKHpI5EAF10%2FbqX9NmktreIPuIM8YiWuS09sK3AK7FW4&wx_header=1)
 [附加视频讲解链接](https://www.bilibili.com/video/BV19r4y1w7Nx)  
> - [Go 协程的实现原理](https://mp.weixin.qq.com/s?__biz=MzAxMTA4Njc0OQ==&mid=2651439783&idx=3&sn=04678dff653a7ae14720a6df1186972e&chksm=80bb1c55b7cc9543866bdea06312113c1cba2998a509c3459825e3d6d48199f8647f4e8cf5d1&mpshare=1&scene=24&srcid=&sharer_sharetime=1590811125480&sharer_shareid=fbafc624aa53cd09857fb0861ac2a16d&exportkey=Aex1FRyFVm113aTJzpQfrd8%3D&pass_ticket=edom3%2BQWJv2%2F6ag8wwGj83w98nQSUN8ex7sdZB89cFp%2FbMiUGbmDvKeH%2BLBfXRK2#rd)  
> - [从源码角度看Golang的调度 ](https://mp.weixin.qq.com/s?__biz=MzAxMTA4Njc0OQ==&mid=2651439430&idx=2&sn=a446f84a61424e7bfb1854db6e1796f4&chksm=80bb1fb4b7cc96a2359911c9a13a9bb08c7d4ed0166ab56c41ee27b6d2a78779e37a2b0409ab&scene=0&xtrack=1&exportkey=ATjw%2FjQHNfau3d7DvjZ1yRI%3D&pass_ticket=edom3%2BQWJv2%2F6ag8wwGj83w98nQSUN8ex7sdZB89cFp%2FbMiUGbmDvKeH%2BLBfXRK2#rd)  
> - [深度解密Go语言之scheduler](https://mp.weixin.qq.com/s?__biz=MzAxMTA4Njc0OQ==&mid=2651437243&idx=2&sn=8a7543527e51e3a0c58217931ced9fad&chksm=80bb6649b7ccef5f38bca80f0aaa995e461fd2578478e20ff9709f5651bb318bdcdd7c0a31d6&scene=0&xtrack=1&exportkey=AUqcLV%2FAvDQLPgNM2pNYyJg%3D&pass_ticket=edom3%2BQWJv2%2F6ag8wwGj83w98nQSUN8ex7sdZB89cFp%2FbMiUGbmDvKeH%2BLBfXRK2#rd)  
> - [Go中goroutine是如何协作与抢占 ](https://mp.weixin.qq.com/s?__biz=MzAxMTA4Njc0OQ==&mid=2651439330&idx=3&sn=9ebccea18ceeb9e13474877c822c5ec0&chksm=80bb1e10b7cc9706432b653ea2396d9817016a291934ee2063740a844078e4d0e59d801c1a64&scene=0&xtrack=1&exportkey=AWbIFtMC8E8NLtn1zhofLWM%3D&pass_ticket=edom3%2BQWJv2%2F6ag8wwGj83w98nQSUN8ex7sdZB89cFp%2FbMiUGbmDvKeH%2BLBfXRK2#rd)

#### a.  goroutine自旋占用cpu如何解决,goroutine抢占时机?

> - ***同步协作式调度***
>   - **主动用户让权**：通过 `runtime.Gosched` 调用主动让出执行机会；
>   - **主动调度弃权**：(**执行栈扩张**)当发生执行栈分段时，检查自身的抢占标记，决定是否继续执行；
> - ***异步抢占式调度***
>   - **被动监控抢占**：当 G 阻塞在 M 上时(系统调用、channel 等)，系统监控会将 P 从 M 上抢夺并分配给其他的 M 来执行其他的 G，而位于被抢夺 P 的本地调度队列中的 G 则可能会被偷取到其他 M 执行。
>   - **被动GC抢占**：当需要进行垃圾回收时，为了保证不具备主动抢占处理的函数执行时间过长，导致垃圾回收迟迟不能执行而导致的高延迟，而强制停止 G 并转为执行垃圾回收。

### 3. Go的GC说一下，扫描从哪里发起？

> - [GO GC的认识](https://www.bookstack.cn/read/qcrao-Go-Questions/GC-GC.md)
> - [Go三色标记,混合写屏障GC模式图文全分析](https://studygolang.com/articles/27243?fr=sidebar)
> - [图解Golang的GC算法](https://www.jianshu.com/p/eb6b3aff9ca5?from=singlemessage)

> 常见GC实现方法:
>
> - **追踪式 GC**: 从根对象出发，根据对象之间的引用信息，一步步推进直到扫描完毕整个堆并确定需要保留的对象，从而回收所有可回收的对象。Go、 Java、V8 对 JavaScript 的实现等均为追踪式 GC。
> - **引用计数式 GC**: 每个对象自身包含一个被引用的计数器，当计数器归零时自动得到回收.
>
> **GO采用无分代、不整理、并发的三色标记清扫算法.**

> **根对象**在垃圾回收的术语中又叫做**根集合**，它是垃圾回收器在标记过程时最先检查的对象，包括：
>
> 1. **全局变量**：程序在编译期就能确定的那些存在于程序整个生命周期的变量。
> 2. **执行栈**：每个 goroutine 都包含自己的执行栈，这些执行栈上包含栈上的变量及指向分配的堆内存区块的指针。
> 3. **寄存器**：寄存器的值可能表示一个指针，参与计算的这些指针可能指向某些赋值器分配的堆内存区块。

#### a. GC触发时机

> 1. **主动触发**，通过调用 `runtime.GC` 来触发 GC，此调用阻塞式地等待当前 GC 运行完毕。
> 2. **被动触发**，分为两种方式：
>    - **被动系统监控**，当超过***两分钟***没有产生任何 GC 时，强制触发 GC。
>    - 采用**步调(Pacing)算法**, 其核心思想是控制内存增长的比例。

### 4. Go的内存分配说一下

> - [图解go语言内存分配器](https://mp.weixin.qq.com/s?__biz=MjM5MDUwNTQwMQ==&mid=2257483713&idx=1&sn=8d85a50d9b4252127d2e3508b2301927&chksm=a5391717924e9e01ef62dc6f711708fb67c95d5a7f83be31c2c17c845c9663bff654b8ef61b1&mpshare=1&scene=1&srcid=0113p8F0vGjt1076TGPpNUH3&sharer_sharetime=1610520769048&sharer_shareid=fbafc624aa53cd09857fb0861ac2a16d&exportkey=ARfNogc55ycqbyLgXyU80zA%3D&pass_ticket=FAnMR4cMV3SbId5u%2Bx1LtsyyIB%2BmhcAGBniZjgLQb31SPXL7JA4k82t2uzBMkjog&wx_header=0#rd)
> - [可视化讲解Go内存管理](https://mp.weixin.qq.com/s?__biz=MzAxMTA4Njc0OQ==&mid=2651439005&idx=3&sn=4365d40f20f10ff6b8aef9701c4bc83d&chksm=80bb616fb7cce8795d32393373672957411fc88c5ef298e6dad21776fb6dfe7426751b2f52f6&scene=0&xtrack=1&exportkey=ATJm5TbtlZpxA368CmWg2Rw%3D&pass_ticket=edom3%2BQWJv2%2F6ag8wwGj83w98nQSUN8ex7sdZB89cFp%2FbMiUGbmDvKeH%2BLBfXRK2#rd)
> - [由一个简单程序图解Go语言内存分配和管理](https://mp.weixin.qq.com/s?__biz=MzAxMTA4Njc0OQ==&mid=2651437847&idx=1&sn=530aa8bdd2a2d1cda8885050a3736e4b&chksm=80bb65e5b7ccecf37152280f822947983718884d3809a1ecfcf10f85310cecbe11f99e2ac3f2&scene=0&xtrack=1&exportkey=AceN%2FwJsd9qFFX4sFtasaf4%3D&pass_ticket=edom3%2BQWJv2%2F6ag8wwGj83w98nQSUN8ex7sdZB89cFp%2FbMiUGbmDvKeH%2BLBfXRK2#rd)
> - [Go 内存分配器的设计与实现](https://mp.weixin.qq.com/s?__biz=MzAxMTA4Njc0OQ==&mid=2651439891&idx=4&sn=a681e85f8622654e62c5717b407c4429&chksm=80bb1de1b7cc94f761ca08263dbf1b211bf511594c13d60da8cbec865866eb96fc1bb865d5ce&mpshare=1&scene=24&srcid=&sharer_sharetime=1592662271836&sharer_shareid=fbafc624aa53cd09857fb0861ac2a16d&exportkey=AelGHF9x2Zp0O1%2BHem%2F3lVs%3D&pass_ticket=HSfia8M%2FcudeM2A0QdELgKNMzeTqliF8Rz16RbaF%2BAhwzwuPRRD%2FlLqNInmNBsRk#rd)
> - [栈内存管理原理分析](https://mp.weixin.qq.com/s?__biz=MzAxMTA4Njc0OQ==&mid=2651439905&idx=5&sn=7693f01a174fff749896ef124a48c30f&chksm=80bb1dd3b7cc94c520a973e6585f8b9594bf4eaf77666a8d4a4336e43caaf9a86d9decf5dc0f&mpshare=1&scene=24&srcid=&sharer_sharetime=1592662092252&sharer_shareid=fbafc624aa53cd09857fb0861ac2a16d&exportkey=AXTgMGvMphdhkI0Ueqf9WhY%3D&pass_ticket=HSfia8M%2FcudeM2A0QdELgKNMzeTqliF8Rz16RbaF%2BAhwzwuPRRD%2FlLqNInmNBsRk#rd)
#### a. Go内存管理方式

> 自己管理,tcmaclloc,采用追踪法GC.

#### b.  Chan分配在栈上还是堆上？哪些对象分配在堆上，哪些对象分配在栈上？

> chan是分配在堆上的.
>
> 看具体情况,由编译器决定,编译器会做逃逸分析.
>
> 如果编译器不能确保变量在函数 return 之后不再被引用，编译器就会将变量分配到堆上
>
> 如果对象比较大的话,直接分在堆上.

#### c. 介绍一下大对象小对象，为什么小对象多了会造成gc压力？

> 通常小对象过多会导致GC三色法消耗过多的CPU

### 5. Go有哪些坑？for range为什么会有坑？

### 6. CAS知道吗，在Go的哪些地方用到了？

> compare and swap (比较并交换)是原子操作

### 7. map
> - [深度解密Go语言之map](https://mp.weixin.qq.com/s?__biz=MzAxMTA4Njc0OQ==&mid=2651436520&idx=1&sn=779464a520683a289bb9744908fbed88&chksm=80bb6b1ab7cce20cb410c523b35597d9b150709de252eab917b1e81ba2b27f274591e86cb221&scene=0&xtrack=1&exportkey=AWjT26ksveApdN2JDJhvPkw%3D&pass_ticket=edom3%2BQWJv2%2F6ag8wwGj83w98nQSUN8ex7sdZB89cFp%2FbMiUGbmDvKeH%2BLBfXRK2#rd)  
> - [理解 Golang 哈希表Map的原理](https://mp.weixin.qq.com/s?__biz=MzAxMTA4Njc0OQ==&mid=2651438047&idx=4&sn=d234ffa237982e362c38228fe624b11b&chksm=80bb652db7ccec3b59c9752d8513c12018fd1547c886b5d378b845a09c1840ce63caa9a129cc&scene=0&xtrack=1&exportkey=ARaBWq19Ty4X7nN7vLQgb2g%3D&pass_ticket=edom3%2BQWJv2%2F6ag8wwGj83w98nQSUN8ex7sdZB89cFp%2FbMiUGbmDvKeH%2BLBfXRK2#rd)  
> - [深度解密之Go的sync.Map](https://www.cnblogs.com/qcrao-2018/p/12833787.html)

#### 	a. Go的map是如何实现的，是并发安全的吗？

#### 	b. sync.map是如何实现的？
> sync.map 适用于*读多写少*的场景。
>
> 对于写多的场景，会导致 read map 缓存失效，需要加锁，导致冲突变多；而且由于未命中 read map 次数过多，导致 dirty map 提升为 read map，这是一个 O(N) 的操作，会进一步降低性能。

### 8. slice 和 array

> - [深度解密Go语言之Slice](https://mp.weixin.qq.com/s?__biz=MjM5MDUwNTQwMQ==&mid=2257483743&idx=1&sn=af5059b90933bef5a7c9d491509d56d9&chksm=a5391709924e9e1f3839aef41d05820c52181ace22a43dc3177df98f9faa9edcfdfefe670d88&mpshare=1&scene=1&srcid=0113ct1PjyXoxFCKUNiTGTBV&sharer_sharetime=1610520699687&sharer_shareid=fbafc624aa53cd09857fb0861ac2a16d&exportkey=ASYHgz6CwuLw174gcho5fGQ%3D&pass_ticket=FAnMR4cMV3SbId5u%2Bx1LtsyyIB%2BmhcAGBniZjgLQb31SPXL7JA4k82t2uzBMkjog&wx_header=0#rd)
### 9. channel
> - [深度理解Go语言之channel](https://zhuanlan.zhihu.com/p/74613114 )

#### a. `chan`的优点是什么，如何实现的?

#### 	b.  `chan`的使用场景？

> - 生产消费者模型
> - 信号通知
> - 超时控制
> - 数据传递
> - 控制并发
> - 互斥锁

#### 	c. 对未初始化的`chan`读写会发生什么?

> 读写未初始化的`chan`都会发生阻塞

#### d. `chan`哪此操作会引起panic?

> - 关闭一个nil值的chan
> - 关闭一个已经关闭的chan
> - 向一个已经关闭的chan发送数据

#### c. `chan`无缓冲和有缓冲的区别

> `chan`无缓冲时，发送阻塞直到数据被接收，接收阻塞直到读取到数据
>
> `chan`有缓冲时，当缓冲满时发送阻塞，当缓冲空时接收阻塞

#### d. 是否了解channel底层实现，比如实现channel的数据结构是什么？

### 10. interface

> - [Golang中interface内部构造与面试真题分析](https://mp.weixin.qq.com/s?__biz=MzAxMTA4Njc0OQ==&mid=2651439330&idx=5&sn=7798c0a3d4e0d01111eef97bed2c2b00&chksm=80bb1e10b7cc9706f64818c5a5dd29f66f7570739b9cc0bf77c3eba7918e11c5881dcf1d5a8f&scene=0&xtrack=1&exportkey=AbjgHay%2FnhfmrSlqygAh110%3D&pass_ticket=edom3%2BQWJv2%2F6ag8wwGj83w98nQSUN8ex7sdZB89cFp%2FbMiUGbmDvKeH%2BLBfXRK2#rd) 
> - [深度解密Go语言之关于 interface 的 10 个问题](https://mp.weixin.qq.com/s?__biz=MjM5MDUwNTQwMQ==&mid=2257483749&idx=1&sn=b6bca6ac5afab7ac6963871d41a51473&scene=19&ascene=7&devicetype=android-28&version=2700163b&nettype=cmnet&abtest_cookie=AAACAA%3D%3D&lang=zh_CN&exportkey=Ad5xpebZGbUSbpcBnGK%2Fuxg%3D&pass_ticket=FAnMR4cMV3SbId5u%2Bx1LtsyyIB%2BmhcAGBniZjgLQb31SPXL7JA4k82t2uzBMkjog&wx_header=0)
### 11. 反射
> - [Go反射图解](https://mp.weixin.qq.com/s?__biz=MzAxMTA4Njc0OQ==&mid=2651438044&idx=4&sn=40ccaaf1d38d0b1cb7717b2ffe86f449&chksm=80bb652eb7ccec384a5adec65bd75c4513322ea04546706c5811d5a85e79c0b41415a3998857&scene=0&xtrack=1&exportkey=ATWxMC0LeI5tSPWGJ9lNJlQ%3D&pass_ticket=edom3%2BQWJv2%2F6ag8wwGj83w98nQSUN8ex7sdZB89cFp%2FbMiUGbmDvKeH%2BLBfXRK2#rd)
> - [深度解密Go语言之反射](https://mp.weixin.qq.com/s?__biz=MzAxMTA4Njc0OQ==&mid=2651436469&idx=1&sn=a89a587e7bc5f3b43c0f97273d85b858&chksm=80bb6b47b7cce251e4dc2f5b12cb60cb70879e610a22e7ad57f08f05755f31920db6de956d6c&scene=0&xtrack=1&exportkey=AaAtrtVLh71R8THsVitTQyA%3D&pass_ticket=edom3%2BQWJv2%2F6ag8wwGj83w98nQSUN8ex7sdZB89cFp%2FbMiUGbmDvKeH%2BLBfXRK2#rd)

### 12. sync.pool是如何实现的
> [深入浅出sync.Pool使用姿势篇](https://mp.weixin.qq.com/s?__biz=MzAxMTA4Njc0OQ==&mid=2651445612&idx=3&sn=4fa1acce4fb10fab7611280d151c1f3a&chksm=80bb079eb7cc8e88cab92133127a4e5cf5ac8e9b54cc3dc3bf84d9c3c4d956f0d38f3d7288b7&mpshare=1&scene=1&srcid=03017pB0oyJcF6oj1iBLFFfg&sharer_sharetime=1614562522328&sharer_shareid=fbafc624aa53cd09857fb0861ac2a16d&exportkey=Ac5IW8Ma93uqb783n2JfnF4%3D&pass_ticket=ll15823uu8mhVAL4yECcmDsxKIBjxWVnXv%2FANTvNoR%2FAiFgnkMnfxzcU2XP6YYtZ&wx_header=0#rd)  
> [sync.Pool源码级原理剖析](https://mp.weixin.qq.com/s?__biz=Mzg3NTU3OTgxOA==&mid=2247487157&idx=1&sn=231af45701885f70e40fbf013f032192&chksm=cf3e1e70f8499766622ccf8c204e6a5ee667c70372a530e9d3d77ed4cd54be8b257d9efb65e2&mpshare=1&scene=1&srcid=0301LjqwhGJngNH3rrnpxYeO&sharer_sharetime=1614562583650&sharer_shareid=fbafc624aa53cd09857fb0861ac2a16d&exportkey=AWqCypMqymdCTksPWP5Zpu4%3D&pass_ticket=ll15823uu8mhVAL4yECcmDsxKIBjxWVnXv%2FANTvNoR%2FAiFgnkMnfxzcU2XP6YYtZ&wx_header=0#rd)

### 13. Go select是怎么用的，具体如何实现的？

### 14. 并发
    - gorotinue控制
        - 如果我希望主协程通知并且等待子协程关闭，应该如何做？
        - context了解吗，怎么用的，如何实现的？
    - 并发原语
> - [channel ](#9. channel)
> - [context]()  
> - [WaitGroup]()  
> - [Golang 并发编程之同步原语](https://mp.weixin.qq.com/s?__biz=MzUzNTY5MzU2MA==&mid=2247484379&idx=1&sn=1a2abc6f639a34e62f3a5a0fcd774a71&chksm=fa80d24ccdf75b5a70d45168ad9e3a55dd258c1dd57147166a86062ee70d909ff1e5b0ba2bcb&mpshare=1&scene=24&srcid=0505AFXvMENOsYGRyuReUgg6&sharer_sharetime=1588660556807&sharer_shareid=fbafc624aa53cd09857fb0861ac2a16d&exportkey=AWReVUbhJey74WnVZJKh7o0%3D&pass_ticket=edom3%2BQWJv2%2F6ag8wwGj83w98nQSUN8ex7sdZB89cFp%2FbMiUGbmDvKeH%2BLBfXRK2#rd)
> - [译文 - Go高级并发](https://mp.weixin.qq.com/s?__biz=MzA4ODg0NDkzOA==&mid=2247487782&idx=1&sn=7dd6134073b75e226f19f9586a5cc430&chksm=9022aec3a75527d5511e2af98026074c61ef52093339d2e0f43159f5eb41f4db50ed8523b9bd&mpshare=1&scene=24&srcid=0429ILG6qj9iodwnNrkMS7Or&sharer_sharetime=1588172711436&sharer_shareid=fbafc624aa53cd09857fb0861ac2a16d&exportkey=AVBkAkzF5TwXF9RaQIygd0g%3D&pass_ticket=edom3%2BQWJv2%2F6ag8wwGj83w98nQSUN8ex7sdZB89cFp%2FbMiUGbmDvKeH%2BLBfXRK2#rd)

#### a. Mutex几种模式

> **正常模式**和**饥饿模式**
>
> 加锁过程: 
>
> > - 如果互斥锁处于初始化状态，就会直接通过置位 `mutexLocked` 加锁；
> > - 如果互斥锁处于 `mutexLocked` 并且在**普通模式**下工作，就会进入自旋，执行 30 次 `PAUSE` 指令消耗 CPU 时间等待锁的释放；
> > - 如果当前 Goroutine 等待锁的时间超过了 `1ms`，互斥锁就会被切换到**饥饿模式**；
> > - 互斥锁在正常情况下会通过 `runtime_SemacquireMutex` 方法将调用 `Lock` 的 Goroutine 切换至休眠状态，等待持有信号量的 Goroutine 唤醒当前协程；
> > - 如果当前 Goroutine 是互斥锁上的最后一个等待的协程或者等待的时间小于 `1ms`，当前 Goroutine 会将互斥锁切换回**正常模式**.
>
> 解锁过程:
>
> - 如果互斥锁已经被解锁，那么调用 `Unlock` 会直接抛出异常；
> - 如果互斥锁处于**饥饿模式**，会直接将锁的所有权交给队列中的下一个等待者，等待者会负责设置 `mutexLocked` 标志位；
> - 如果互斥锁处于**普通模式**，并且没有 Goroutine 等待锁的释放或者已经有被唤醒的 Goroutine 获得了锁就会直接返回，在其他情况下回通过 `runtime_Semrelease` 唤醒对应的 Goroutine

#### b. Mutex可以做自旋锁么

> 不可以

#### c. 介绍一下RWMutex

> 针对读多写少情况可以使用sync.RWMutex
>
> **共享读锁, 独占写锁**

#### d. 悲观锁和乐观锁

#### e. 并发安全读写共享变量

> 1. 通过Channel进行安全读写共享变量
> 2. 通过Mutex加锁处理
> 3. 对于Map可以使用sync.Map
> 4. 针对读多写少情况可以使用sync.RWMutex

### 15. goroutine的泄露如何排查？pprof了解吗，说一下.

> [pprof](pprof.md)

### 16. 项目中遇到OOM情况?

> 1. goroutine使用结束未释放
> 2. response body未关闭
> 3. 文件未关闭
> 4. 大slice底层持有对象 

