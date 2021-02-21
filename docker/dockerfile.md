[TOC]

# Dockerfile

Docker 可以通过 `Dockerfile` 的内容来自动构建镜像.
- 每条保留字指令都必须为大写字母且后面要跟至少一个参数（即不能只写关键字然后不跟参数）
- 指令按照从上到下，顺序执行
- 每条指令都会创建一个新的镜像层，并对镜像进行提交
- 镜像最多127层

`Dockerfile` 是一个包含创建镜像所有命令的文本文件，通过docker build命令可以根据 `Dockerfile` 的内容构建镜像，在介绍如何构建之前先介绍下 `Dockerfile` 的基本语法结构。
`Dockerfile` 有以下指令选项:

| 指令       | 作用                                          |
| ---------- | --------------------------------------------- |
| #          | 注释                                          |
| FROM       | 基础镜像,当前的镜像是基于哪一个已经存在的镜像 |
| MAINTAINER | 设置创建镜像的用户                            |
| LABEL      | 设置镜像的标签                                |
| ARG        | 设置编译镜像时加入的参数                      |
| RUN        | 编译镜像时运行的命令                          |
| EXPOSE     | 设置镜像暴露的端口                            |
| ENV        | 设置容器的环境变量                            |
| ADD        | 编译镜像时复制文件到镜像中                    |
| COPY       | 编译镜像时复制文件到镜像中                    |
| CMD        | 设置容器的启动命令                            |
| ENTRYPOINT | 设置容器的入口程序                            |
| VOLUME     | 设置容器的挂载卷                              |
| USER       | 设置运行RUN CMD ENTRYPOINT的用户名            |
| WORKDIR    | 设置运行RUN CMD ENTRYPOINT COPY ADD的工作目录 |
| ONBUILD    | 设置镜像的ONBUILD指令                         |
| STOPSIGNAL | 设置容器的退出信号量                          |

## 1. FROM

用法: `FROM <image>` 或者 `FROM <image>[:<tag>]`
1. `FROM`指定构建镜像的基础源镜像，如果本地没有指定的镜像，则会自动从 Docker 的公共库 pull 镜像下来。
2. `FROM`必须是 `Dockerfile` 中非注释行的第一个指令，即一个 `Dockerfile` 从FROM语句开始。
3. `FROM`可以在一个 `Dockerfile` 中出现多次，如果有需求在一个 `Dockerfile` 中创建多个镜像。
4. 如果`FROM`语句没有指定镜像标签，则默认使用latest标签。

## 2. MAINTAINER

用法: `MAINTAINER <name>`, 设置创建镜像的用户

## 3. LABEL

用法:`LABEL <key>=<value> <key>=<value>...` 设置镜像的标签

## 4. ARG

用法: `ARG <name>[=<defaultValue>]`,设置编译变量

## 5. RUN

用法:  `RUN  "executable", "param1", "param2"`,编译镜像运行的命令
-   每条`RUN`指令将在当前镜像基础上执行指定命令，并提交为新的镜像，后续的RUN都在之前`RUN`提交后的镜像为基础，镜像是分层的，可以通过一个镜像的任何一个历史提交点来创建，类似源码的版本控制 。
- exec方式会被解析为一个 JSON 数组，所以必须使用双引号而不是单引号。***exec 方式不会调用一个命令 shell***，所以也就不会继承相应的变量，如`RUN [ "echo", "$HOME" ]`这种方式是不会达到输出 HOME 变量的，正确的方式应该是用shell方式`RUN [ "sh", "-c", "echo", "$HOME" ]`,`RUN`产生的缓存在下一次构建的时候是不会失效的，会被重用，可以使用--no-cache选项，即`docker build --no-cache`，如此便不会缓存。

## 6. EXPOSE

`EXPOSE <port> [<port>...]` 告诉 Docker 服务端容器对外映射的本地端口，需要在 docker run 的时候使用-p或者-P选项生效。

## 7. ENV

用法:
1. `ENV <key> <value>       # 只能设置一个变量`

2. `ENV <key>=<value> ...  # 允许一次设置多个变量`

指定一个环镜变量，会被后续RUN指令使用，并在容器运行时保留。

例子:
```dockerfile
ENV myName="John Doe" myDog=Rex The Dog myCat=fluffy
# 等同于
ENV myName John Doe
ENV myDog Rex The Dog
ENV myCat fluffy
```

## 8. ADD

用法: 
- `ADD <src>... <dest>`
- `ADD [<src>,..., <dest>]`
`ADD`复制本地主机文件、目录或者远程文件 URLS 从 并且添加到容器指定路径中 。
支持通过 Go 的正则模糊匹配，具体规则可参见  Go filepath.Match

```dockerfile
ADD hom* /mydir/        # adds all files starting with "hom"
ADD hom?.txt /mydir/    # ? is replaced with any single character
```
- 路径必须是绝对路径，如果不存在，会自动创建对应目录
- 路径必须是 `Dockerfile` 所在路径的相对路径
- 如果是一个目录，只会复制目录下的内容，而目录本身则不会被复制

## 9. COPY

用法: 

- `COPY <src>... <dest>`
- `COPY [<src>,..., <dest>]`

`COPY`复制新文件或者目录从 并且添加到容器指定路径中 。用法同`ADD`，唯一的不同是不能指定远程文件 URLS。

## 10. CMD

`CMD` 有三种使用方式:

1. shell 格式: `CMD  ["executable","param1","param2"]`
2. exec 格式: `CMD command param1 param2 (shell form)`
3. 参数列表格式: `CMD  "param1","param2"`

***`CMD`指令在`Dockerfile`中只能使用一次，如果有多个,则只有最后一个会生效***。

`CMD`的目的是为了在启动容器时提供一个默认的命令执行选项。**如果用户启动容器时指定了运行的命令，则会覆盖掉`CMD`指定的命令.**
`CMD`会在启动容器的时候执行，build 时不执行，而`RUN`只是在构建镜像的时候执行，后续镜像构建完成之后，启动容器就与RUN无关了，这个初学者容易弄混这个概念，这里简单注解一下。


## 11. ENTRYPOINT

用法: 
1. shell格式: `ENTRYPOINT  ["executable", "param1", "param2"]`
2. exec格式: `ENTRYPOINT command param1 param2 (shell form)`

配置容器启动后执行的命令，并且不可被 docker run 提供的参数覆盖，而`CMD`是可以被覆盖的。
如果需要覆盖，则可以使用`--entrypoint`选项。
*每个 `Dockerfile` 中只能有一个`ENTRYPOINT`，当指定多个时，只有最后一个生效.*

*Exec form ENTRYPOINT* 例子: 
通过`ENTRYPOINT`使用 exec form 方式设置稳定的默认命令和选项，而使用`CMD`添加默认之外经常被改动的选项。

```dockerfile
FROM ubuntu
ENTRYPOINT ["top", "-b"]
CMD ["-c"]
```
通过 `Dockerfile` 使用`ENTRYPOINT`展示前台运行 Apache 服务
```dockerfile
FROM debian:stable
RUN apt-get update && apt-get install -y --force-yes apache2
EXPOSE 80 443
VOLUME ["/var/www", "/var/log/apache2", "/etc/apache2"]
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
```
*Shell form ENTRYPOINT* 例子
这种方式会在`/bin/sh -c`中执行，会忽略任何`CMD`或者docker run命令行选项，为了确保docker stop能够停止长时间运行`ENTRYPOINT`的容器，确保执行的时候使用exec选项。

```dockerfile
FROM ubuntu
ENTRYPOINT exec top -b
```
如果在`ENTRYPOINT`忘记使用exec选项，则可以使用`CMD`补上:
```dockerfile
FROM ubuntu
ENTRYPOINT top -b
CMD --ignored-param1 # --ignored-param2 ... --ignored-param3 ... 依此类推
```

## 12. VOLUME

用法: `VOLUME ["/data"]`创建一个可以从本地主机或其他容器挂载的挂载点.

## 13. USER
用法: `USER daemon`指定运行容器时的用户名或 UID，后续的`RUN`、`CMD`、`ENTRYPOINT`也会使用指定用户。

## 14. WORKDIR
用法: `WORKDIR /path/to/workdir`
为后续的`RUN`、`CMD`、`ENTRYPOINT`指令配置工作目录。可以使用多个`WORKDIR`指令，后续命令如果参数是相对路径，则会基于之前命令指定的路径。

```dockerfile
WORKDIR /a
WORKDIR b
WORKDIR c
RUN pwd
# 最终路径是/a/b/c。
```

`WORKDIR`指令可以在`ENV`设置变量之后调用环境变量:

```dockerfile
ENV DIRPATH /path
WORKDIR $DIRPATH/$DIRNAME
# 最终路径则为 `/path/$DIRNAME`
```
## 15. ONBUILD
用法: `ONBUILD [INSTRUCTION]`,配置当所创建的镜像作为其它新创建镜像的基础镜像时，所执行的操作指令。
例如，`Dockerfile` 使用如下的内容创建了镜像 image-A：
```dockerfile
[...]
ONBUILD ADD . /app/src
ONBUILD RUN /usr/local/bin/python-build --dir /app/src
[...]
```
如果基于 image-A 创建新的镜像时，新的 `Dockerfile` 中使用 `FROM image-A` 指定基础镜像时，会自动执行 `ONBUILD` 指令内容，等价于在后面添加了两条指令。

```dockerfile
# Automatically run the following
ADD . /app/src
RUN /usr/local/bin/python-build --dir /app/src
```
使用`ONBUILD`指令的镜像，推荐在标签中注明，例如 ruby:1.9-onbuild。

## 16. STOPSIGNAL

用法: `STOPSIGNAL signal`,设置容器退出时，Docker Daemon向容器发送的信号量 

## 17. HEALTHCHECK

用法: 
- `HEALTHCHECK [选项] CMD <命令>` 
- `HEALTHCHECK NONE`,如果基础镜像有健康检查指令,命名用这行可以屏蔽掉其健康检查指令

## 18. Dockerfile Examples

```dockerfile
# Nginx
# VERSION               0.0.1
FROM      ubuntu
MAINTAINER Victor Vieux <victor@docker.com>
RUN apt-get update && apt-get install -y inotify-tools nginx apache2 openssh-server

# Firefox over VNC
# VERSION               0.3
FROM ubuntu
# Install vnc, xvfb in order to create a 'fake' display and firefox
RUN apt-get update && apt-get install -y x11vnc xvfb firefox
RUN mkdir ~/.vnc
# Setup a password
RUN x11vnc -storepasswd 1234 ~/.vnc/passwd
# Autostart firefox (might not be the best way, but it does the trick)
RUN bash -c 'echo "firefox" >> /.bashrc'
EXPOSE 5900
CMD    ["x11vnc", "-forever", "-usepw", "-create"]

# Multiple images example
# VERSION               0.1
FROM ubuntu
RUN echo foo > bar
# Will output something like ===> 907ad6c2736f
FROM ubuntu
RUN echo moo > oink
# Will output something like ===> 695d7793cbe4
# You᾿ll now have two images, 907ad6c2736f with /bar, and 695d7793cbe4 with
# /oink.
```

## 19. docker build
```shell
$ docker build --help
Usage: docker build [OPTIONS] PATH | URL | -
Build a new image from the source code at PATH
  --force-rm=false     Always remove intermediate containers, even after unsuccessful builds # 移除过渡容器，即使构建失败
  --no-cache=false     Do not use cache when building the image                              # 不实用 cache        
  -q, --quiet=false    Suppress the verbose output generated by the containers               
  --rm=true            Remove intermediate containers after a successful build               # 构建成功后移除过渡层容器
  -t, --tag=""         Repository name (and optionally a tag) to be applied to the resulting image in case of success
```
参考文档: [Dockerfile Reference](https://docs.docker.com/engine/reference/builder/)

## 20. Dockerfile 最佳实践
1. 使用`.dockerignore`文件
为了在docker build过程中更快上传和更加高效，应该使用一个`.dockerignore`文件用来排除构建镜像时不需要的文件或目录。例如,除非. Git 在构建过程中需要用到，否则你应该将它添加到`.dockerignore`文件中，这样可以节省很多时间。
2. 避免安装不必要的软件包
为了降低复杂性、依赖性、文件大小以及构建时间，应该避免安装额外的或不必要的包。例如，不需要在一个数据库镜像中安装一个文本编辑器。
3. 每个容器都跑一个进程
在大多数情况下，一个容器应该只单独跑一个程序。解耦应用到多个容器使其更容易横向扩展和重用。如果一个服务依赖另外一个服务，可以参考 Linking Containers Together 。
4. 最小化层
我们知道每执行一个指令，都会有一次镜像的提交，镜像是分层的结构，对于`Dockerfile`，应该找到可读性和最小化层之间的平衡。
5. 多行参数排序
 如果可能，通过字母顺序来排序，这样可以避免安装包的重复并且更容易更新列表，另外可读性也会更强，添加一个空行使用\换行:
```dockerfile
RUN apt-get update && apt-get install -y \
		bzr \
        cvs \
        git \
        mercurial \
        subversion
```
6. 创建缓存
镜像构建过程中会按照`Dockerfile`的顺序依次执行，每执行一次指令 Docker 会寻找是否有存在的镜像缓存可复用，如果没有则创建新的镜像。如果不想使用缓存，则可以在docker build时添加--no-cache=true选项。
从基础镜像开始就已经在缓存中了，下一个指令会对比所有的子镜像寻找是否执行相同的指令，如果没有则缓存失效。在大多数情况下只对比`Dockerfile`指令和子镜像就足够了。`ADD`和`COPY`指令除外，执行`ADD`和`COPY`时存放到镜像的文件也是需要检查的，完成一个文件的校验之后再利用这个校验在缓存中查找，如果检测的文件改变则缓存失效。`RUN apt-get -y update`命令只检查命令是否匹配，如果匹配就不会再执行更新了。
为了有效地利用缓存，你需要保持你的 `Dockerfile` 一致，并且尽量在末尾修改。

7. `Dockerfile` 指令
- `FROM`: 只要可能就使用官方镜像库作为基础镜像
- `RUN`: 为保持可读性、方便理解、可维护性，把长或者复杂的RUN语句使用'\'分隔符分成多行
  不建议`RUN apt-get update`独立成行，否则如果后续包有更新，那么也不会再执行更新
  避免使用`RUN apt-get upgrade`或者`dist-upgrade`，很多必要的包在一个非privileged权限的容器里是无法升级的。如果知道某个包更新，使用`apt-get install -y xxx`
  标准写法
  `RUN apt-get update && apt-get install -y package-bar package-foo`
  例子:
```dockerfile
RUN apt-get update && apt-get install -y \
		aufs-tools \
		automake \
		btrfs-tools \
		build-essential \
		curl \
		dpkg-sig \
		git \
		iptables \
		libapparmor-dev \
		libcap-dev \
        libsqlite3-dev \
        lxc=1.0* \
        mercurial \
        parallel \
        reprepro \
        ruby1.9.1 \
        ruby1.9.1-dev \
		s3cmd=1.1.0*
```
- `CMD`: 推荐使用`CMD [“executable”, “param1”, “param2”…]`这种格式，`CMD [“param”, “param”]`则配合`ENTRYPOINT`使用
- `EXPOSE`: `Dockerfile` 指定要公开的端口，使用docker run时指定映射到宿主机的端口即可
- `ENV`: 为了使新的软件更容易运行，可以使用`ENV`更新PATH变量。如`ENV PATH /usr/local/nginx/bin:$PATH`确保`CMD ["nginx"]`即可运行
`ENV`也可以这样定义变量：
```dockerfile
ENV PG_MAJOR 9.3
ENV PG_VERSION 9.3.4
RUN curl -SL http://example.com/postgres-$PG_VERSION.tar.xz | tar -xJC /usr/src/postgress && …
ENV PATH /usr/local/postgres-$PG_MAJOR/bin:$PATH
```
- `ADD` or `COPY`: `ADD`比`COPY`多一些特性「tar 文件自动解包和支持远程 URL,
不推荐添加远程 URL,如不推荐这种方式:
```dockerfile
ADD http://example.com/big.tar.xz /usr/src/things/
RUN tar -xJf /usr/src/things/big.tar.xz -C /usr/src/things
RUN make -C /usr/src/things all
```
推荐使用 curl 或者 wget 替换，使用如下方式:
```dockerfile
RUN mkdir -p /usr/src/things \
		&& curl -SL http://example.com/big.tar.gz \
		| tar -xJC /usr/src/things \
		&& make -C /usr/src/things all
```
如果不需要添加 tar 文件，推荐使用`COPY`。