#  netcat 

`nc`全名叫 `netcat`，它可以用来完成很多的网络功能，譬如端口扫描、建立TCP/UDP连接，数据传输、网络调试等等，因此，它也常被称为网络工具的 **瑞士军刀** .

## 1. 使用方式

```shell
$ nc -h
OpenBSD netcat (Debian patchlevel 1.187-1ubuntu0.1)
usage: nc [-46CDdFhklNnrStUuvZz] [-I length] [-i interval] [-M ttl]
	  [-m minttl] [-O length] [-P proxy_username] [-p source_port]
	  [-q seconds] [-s source] [-T keyword] [-V rtable] [-W recvlimit] [-w timeout]
	  [-X proxy_protocol] [-x proxy_address[:port]] 	  [destination] [port]
```

> - -4：只使用 IPv4 地址
> - -6：只使用 IPv6 地址
> - -l：启动本地监听
> - -n：不使用 DNS 解析
> - -p：指定源端口
> - -s：指定源 IP 地址
> - -u：使用 UDP，默认是 TCP
> - -v：显示详细信息
> - -w：设定超时时间（只适合用在 Client 端）
> - -d：禁止从标准输入读取数据，也就是客户端输入数据不会发送到服务端
> - -k：让服务端保持连接，不断开

## 2. 建立本地会话

```shell
# 模拟server端
# -v ：输出详细信息
# -l ：指定监听地址和端口
$ nc -v -l 127.0.0.1 6000

# 模拟client端
# -p : 指定源端口
$ nc -v -p 5000 localhost 6000
```

## 3. 发送文件

假设服务端有一个 `out.txt` 的空文件，而客户端有一个` in.txt` 文件，含有数据：`hello server`。

```shell
# Server 端接收文件
$ nc localhost 6000 > out.txt

# Client 端发送文件
nc localhost 6000 < in.txt
```

## 4. 支持UDP和IPv6连接

```shell
# server端
$ nc -u -6 -l localhost 6000
# client 端
$ nc -u -6 localhost 6000
```

## 5. 端口扫描

```shell
# 扫描 192.168.1.3 上 1-100 端口区间，有哪些端口是开放的
$ nc -vz 192.168.0.117 1-100
```

> 如果我们想扫描多个服务器上的多个端口是否开放，可以写一个脚本来完成











