# netstat

`Netstat`是控制台命令,是一个监控TCP/IP网络的非常有用的工具，它可以显示路由表、实际的网络连接以及每一个网络接口设备的状态信息。

`Netstat`用于显示与IP、TCP、UDP和ICMP协议相关的统计数据，一般用于检验本机各端口的网络连接情况。

## 1. 输出信息描述

```shell
$ netstat
Active Internet connections (w/o servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State
tcp        0      0 k8sdev.sui:sun-sr-https k8sdev.suiyi.com.:34880 SYN_RECV
tcp        0      0 k8sdev.suiyi.com.c:2379 10.1.62.21:47910        ESTABLISHED
tcp        0      0 k8sdev.suiyi.com.c:2379 k8sdev.suiyi.com.:37790 ESTABLISH
...
Active UNIX domain sockets (w/o servers)
Proto RefCnt Flags       Type       State         I-Node   Path
unix  3      [ ]         DGRAM                    18442    /run/systemd/notify
unix  2      [ ]         DGRAM                    18444    /run/systemd/cgroups-agen
```

1、**Active Internet connections** 有源TCP连接，其中"Recv-Q"和"Send-Q"指接收队列和发送队列。

​		这些数字一般都应该是0。如果不是则表示软件包正在队列中堆积。这种情况只能在非常少的情况见到。

2、**Active UNIX domain sockets** 有源Unix域套接口(和网络套接字一样，但是只能用于本机通信，性能可以提高一倍)。

列名解释：

- `Proto`：显示连接使用的*协议*。

- `RefCnt`：表示连接到本套接口上的*进程号*。

- `Types`：显示套接口的*类型*。

- `State`：显示套接口当前的*状态*。

- `Path`：表示连接到套接口的其它*进程使用的路径名*。

## 2. 常见参数

> `-a` (all) 显示所有选项，默认不显示LISTEN相关。
> `-t` (tcp) 仅显示tcp相关选项。
> `-u` (udp) 仅显示udp相关选项。
> `-n` 拒绝显示别名，能显示数字的全部转化成数字。
> `-l` 仅列出有在 Listen (监听) 的服务状态。
>
> `-p` 显示建立相关链接的程序名
> `-r` 显示路由信息，路由表
> `-e` 显示扩展信息，例如uid等
> `-s` 按各个协议进行统计
> `-c` 每隔一个固定时间，执行该netstat命令。
>
> NOTE: **LISTEN**和**LISTENING**的状态只有用`-a`或者`-l`才能看到。