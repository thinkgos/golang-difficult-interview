# git

## 私有仓库访问

```shell
git config --global url."https://${username}:${token}@github.com".insteadof "https://github.com"
```



## 1. 配置

```shell
git config --global user.name "Your Name"
git config --global user.email "email@example.com"


[core]
        #  autocrlf
        # windows 和linux 换行符差异,需要配置换行符
        # windows 是CRLF
        # linux/mac是LF
        # 保存仓库永远为LF,在Windows工作空间都是CRLF, 在Mac/Linux工作空间都是LF.
        # windows配置`autocrlf = true`, 提交时自动CRLF转LF, 检出时自动将LF转CRLF
        # linux/mac配置`autocrlf = input`,提交时自动CRLF转LF, 检出时自动将保持LF.

        # safecrlf
        #拒绝提交包含混合换行符的文件
        safecrlf=true   
        #允许提交包含混合换行符的文件
        safecrlf=false
        #提交包含混合换行符的文件时给出警告
        safecrlf= warn

```

## 2. 暂存,提交,日志,状态

```shell
git add . # 提交所有到本地暂存区 
git commit -m "消息" # 提交到本地仓库
git status # 查看当前仓库状态
git log # 查看提交日志
git diff #查看差异化
```

## 3. 版本回退,前进,指定到相关版本

```shell
git reset --hard HEAD^ # 回退到上一个版本
git reset --hard hash值 # 回退到指定版本
git reflog # 查看最近回退的版本
```

### 4. 远程仓库

```shell
git remote add origin https://github.com/thinkgos/learngit.git
git push -u origin master
```

### 5. 分支,代码冲突,合并,变基.

```shell
git branch # 列出分支
git checkout dev # 检出分支
git checkout -b 分支 # 加上-b表示检出分支
git merge dev  # 合并dev分支到当前分支
```

### 6. 打标签

```shell
git tag # 列出所有标签
git tag v1.0.0 # 给当前分支打标签
git show v1.0.0 # 查看标签信息
git tag -d v0.9.0 # 删除某个标签
git push origin v1.0.0 #推送某个标签到远程 

# 如果标签已经推到远程
# 先删除本地
git tag -d v0.9.0
# 再删除远程
git push origin :refs/tags/v0.9.0
```

7. 子模块

```shell
# 增加子模块
git submodule add  https://github.com/thinkgos/submodule.git libs/yoursubmodule

# 克隆含有子模块的项目,可通过增加 --recurse-submodules 来嵌入克隆子模块
git clone https://github.com/thinkgos/learngit.git
# 将子模块的项目克隆下来
git submodule update --init 
# 拉取子模块最新的推送
git submodule update --remote yoursubmodule
# 可以设置指定的分支并更新所有子模块
 git config -f .gitmodules submodule.DbConnector.branch stable
 git submodule update --remote
 # NOTE: git pull 命令会递归抓取子模块的更改,但不会更新子模块. 可以增加 --recurse-submodules
 # 为了完成所有更新,需要运行
 git submodule update --init --recursive
```

![git command](asserts/git_command.png)