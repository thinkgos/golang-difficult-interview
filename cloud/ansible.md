

# ansible 基本使用

>```sh
>ansible <host-pattern> [-m module_name] [-a args]
>```
>
>

## 一. 架构和原理





## 二. 常用模块

### 1. command 默认

`ansible <host-pattern> -a 'ls /'`

### 2. shell 

`ansible <host-pattern> -m shell -a 'ls /'`

### 3. script 在远程主机执行脚本

`ansible <host-pattern> -m script -a 'path/xx.sh'`

### 4. copy 复制文件到远程主机

`ansible <host-pattern> -m copy -a 'src=path/srcfile dest=path/destfile backup=yes'`

### 5. fetch 从远程主机取文件到本机

不支持,可以考虑目录可以先进行tar压缩

`ansible <host-pattern> -m fetch -a 'src=path/srcfile dest=path/destfile'`

### 6. file 设置文件/目录的属性

`ansible <host-pattern> -m file -a 'name=path/file state=touch'`

### 7. hostname 修改主机名

`ansible <host-pattern> -m hostname -a 'name=newhostname'`

### 8. cron 计划任务

`ansible <host-pattern> -m cron -a 'minute=* job=""/usr/bin/wall fbi warn" name=warning'`

### 9. apt ubuntu/debian包管理

`ansible <host-pattern> -m apt -a 'name=dstat update_cache=yes upgrade=yes'`

### 10. service 服务管理

`ansible <host-pattern> -m service -a 'name=httpd enabled=yes state=[stated|stopped|reloaded|restarted]'`

### 11. user 用户管理

`ansible <host-pattern> -m user -a 'name=user1 comment="test user" uid=2048 home=/home/user1 group=root'`

### 12. group 组管理

`ansible <host-pattern> -m group -a "name=testgroup system=yes"`