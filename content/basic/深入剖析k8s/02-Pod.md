# `Pod`

- `Pod`最重要一个事实,它只是一个逻辑概念.
- `Pod`其实是一组共享了某些资源的容器.
- `Pod` 里的所有容器,共享的是同一个 **Network Namespace**,并且可以声明共享同一个 **Volume**.类似`docker run --net=B --volumes-from=B --name=A image-A ...`,但这样必须选启动B,再启动A,这样不是对等关系,而是拓扑关系了. 
- `Pod` 的实现需要使用一个 **中间容器,这个容器叫作 Infra 容器(pause).** 在这个 `Pod` 中,Infra 容器永远都是第一个被创建的容器,而其他用户定义的容器,则通过 Join Network Namespace 的方式,与 Infra 容器关联在一起.这对于`Pod`中的容器来说:
  - 它们可以直接使用 **localhost** 进行通信；
  - 它们看到的网络设备跟 Infra 容器看到的完全一样；
  - 一个 `Pod` 只有一个 IP 地址,也就是这个 `Pod` 的 Network Namespace 对应的 IP 地址；
  - 当然,其他的所有网络资源,都是一个 `Pod` 一份,并且被该 `Pod` 中的所有容器共享；
  - `Pod` 的生命周期只跟 `Infra` 容器一致,而与`Pod`中其它容器无关.
  - 凡是调度、网络、存储,以及安全相关的属性,基本上是 `Pod` 级别的.
  - 凡是跟容器的 Linux Namespace 相关的属性,也一定是 `Pod` 级别的.`Pod` 的设计,就是要让它里面的容器尽可能多地共享 Linux Namespace,仅保留必要的隔离和限制能力.
  - 凡是 `Pod` 中的容器要共享宿主机的 `Namespace`,也一定是 `Pod` 级别的定义
  - 同一个 `Pod` 里面的所有用户容器来说,它们的进出流量,也可以认为都是通过 Infra 容器完成的.将来如果你要为 Kubernetes 开发一个网络插件时,应该重点考虑的是如何配置这个 `Pod` 的 Network Namespace,而不是每一个用户容器如何使用你的网络配置,这是没有意义的.

```yaml
# `Pod`级共享volume定义.
apiVersion: v1
kind: Pod
metadata:
  name: two-containers
spec:
  restartPolicy: Never
  volumes: # 共享的`Pod`的volume定义
      - name: shared-data
        hostPath:      
          path: /data
  containers:
      - name: nginx-container
        image: nginx
        volumeMounts:
            - name: shared-data 
              mountPath: /usr/share/nginx/html
      - name: debian-container
        image: debian
        volumeMounts:
            - name: shared-data
              mountPath: /`Pod`-data
        command: ["/bin/sh"]
        args: ["-c", "echo Hello from the debian container > /`Pod`-data/index.html"]
```

## Projected Volume

- Secret；
- ConfigMap；
- Downward API；让 `Pod` 里的容器能够直接获取到这个 `Pod` API 对象本身的信息
- ServiceAccountToken; 保存k8s的授权信息,合法访问API Server

### 1. secret

```yaml
apiVersion: v1
kind: `Pod`
metadata:
  name: test-projected-volume 
spec:
  containers:
  - name: test-secret-volume
    image: busybox
    args:
    - sleep
    - "86400"
    volumeMounts:
    - name: mysql-cred
      mountPath: "/projected-volume"
      readOnly: true
  volumes:
  - name: mysql-cred
    secret:
      secretname: mysecret
      items: # 可定义到不同的路径
        - key: user
          path: my-group/user
        - key: pass
          path: my-group/pass
```

shell方式创建secret

```shell
$ cat ./username.txt
admin
$ cat ./password.txt
c1oudc0w!

$ kubectl create secret generic user --from-file=./username.txt
$ kubectl create secret generic pass --from-file=./password.txt
```

yaml方式创建secret

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: mysecret
type: Opaque
data:
  user: YWRtaW4=  # base64加密
  pass: MWYyZDFlMmU2N2Rm
```

### 2. configMap

```shell
# .properties文件的内容
$ cat example/ui.properties
color.good=purple
color.bad=yellow
allow.textmode=true
how.nice.to.look=fairlyNice

# 从.properties文件创建ConfigMap
$ kubectl create configmap ui-config --from-file=example/ui.properties

# 查看这个ConfigMap里保存的信息(data)
$ kubectl get configmaps ui-config -o yaml
apiVersion: v1
data:
  ui.properties: |
    color.good=purple
    color.bad=yellow
    allow.textmode=true
    how.nice.to.look=fairlyNice
kind: ConfigMap
metadata:
  name: ui-config
  ...
```

### 3. Downward API

让 `Pod` 里的容器能够直接获取到这个 `Pod` API 对象本身的信息.

**Downward API 能够获取到的信息,一定是 `Pod` 里的容器进程启动之前就能够确定下来的信息.**

这个 Downward API Volume,则声明了要暴露 `Pod` 的 metadata.labels 信息给容器

通过这样的声明方式,当前 `Pod` 的 Labels 字段的值,就会被 Kubernetes 自动挂载成为容器里的 /etc/`Pod`info/labels 文件.

```yaml
# 当前 `Pod` 的 Labels 字段的值,就会被 Kubernetes 自动挂载成为容器里的 /etc/`Pod`info/labels 文件.
apiVersion: v1
kind: `Pod`
metadata:
  name: test-downwardapi-volume
  labels:
    zone: us-est-coast
    cluster: test-cluster1
    rack: rack-22
spec:
  containers:
    - name: client-container
      image: k8s.gcr.io/busybox
      command: ["sh", "-c"]
      args:
      - while true; do
          if [[ -e /etc/`Pod`info/labels ]]; then
            echo -en '\n\n'; cat /etc/`Pod`info/labels; fi;
          sleep 5;
        done;
      volumeMounts:
        - name: `Pod`info
          mountPath: /etc/`Pod`info
          readOnly: false
  volumes:
    - name: `Pod`info
      projected:
        sources:
        - downwardAPI:
            items:
              - path: "labels"
                fieldRef:
                  fieldPath: metadata.labels
```

> Downward API 支持的字段已经非常丰富了,比如：
>
> 1. 使用fieldRef可以声明使用:
>     spec.nodeName - 宿主机名字
>     status.hostIP - 宿主机IP
>     metadata.name - `Pod`的名字
>     metadata.namespace - `Pod`的Namespace
>     status.`Pod`IP - `Pod`的IP
>     spec.serviceAccountName - `Pod`的Service Account的名字
>     metadata.uid - `Pod`的UID
>     metadata.labels['<KEY>'] - 指定<KEY>的Label值
>     metadata.annotations['<KEY>'] - 指定<KEY>的Annotation值
>     metadata.labels - `Pod`的所有Label
>     metadata.annotations - `Pod`的所有Annotation
> 2. 使用resourceFieldRef可以声明使用:
>     容器的CPU limit
>     容器的CPU request
>     容器的memory limit
>     容器的memory request

### 4. ServiceAccount

任何运行在 Kubernetes 集群上的应用,都必须使用这个**ServiceAccountToken**里保存的授权信息,也就是 Token,才可以合法地访问 API Server.

为了方便使用,Kubernetes 已经为你提供了一个默认“服务账户”(default Service Account)

```shell
# 一旦 `Pod` 创建完成,容器里的应用就可以直接从这个默认 ServiceAccountToken 的挂载目录里访问到授权信息和文件.这个容器内的路径在 Kubernetes 里是固定的,即：/var/run/secrets/kubernetes.io/serviceaccount
$ ls /var/run/secrets/kubernetes.io/serviceaccount 
ca.crt namespace  token
```

## `Pod`Preset

`Pod` 字段预设功能.

`Pod`Preset 里定义的内容,只会在 `Pod` API 对象被创建之前追加在这个对象本身上,而不会影响任何 `Pod` 的控制器的定义.

```yaml
apiVersion: settings.k8s.io/v1alpha1
kind: `Pod`Preset
metadata:
  name: allow-database
spec:
  selector:
    matchLabels:
      role: frontend
  env:
    - name: DB_PORT
      value: "6379"
  volumeMounts:
    - mountPath: /cache
      name: cache-volume
  volumes:
    - name: cache-volume
      emptyDir: {}
```

