[TOC]

# `Pod`

- `Pod`最重要一个事实,它只是一个**逻辑概念**.
- `Pod`其实是一组共享了某些资源的容器.
- `Pod` 里的所有容器,共享的是同一个 **`Network Namespace`**,并且可以声明共享同一个 **`Volume`**.类似`docker run --net=B --volumes-from=B --name=A image-A ...`,但这样必须选启动B,再启动A,这样不是对等关系,而是拓扑关系了. 
- `Pod` 的实现需要使用一个 **中间容器,这个容器叫作`Infra容器`(pause).** 在这个 `Pod` 中,`Infra容器`永远都是第一个被创建的容器,而其他用户定义的容器,则通过 Join Network Namespace 的方式,与 Infra 容器关联在一起.这对于`Pod`中的容器来说:
  - 它们可以直接使用 **`localhost`** 进行通信；
  - 它们看到的网络设备跟 `Infra容器`看到的完全一样；
  - 一个 `Pod` 只有一个 IP 地址,也就是这个 `Pod` 的 `Network Namespace`对应的 IP 地址；
  - 当然,其他的所有网络资源,都是一个 `Pod` 一份,并且被该 `Pod` 中的所有容器共享；
  - `Pod` 的生命周期只跟 `Infra` 容器一致,而与`Pod`中其它容器无关.
  - 凡是调度、网络、存储,以及安全相关的属性,基本上是 `Pod` 级别的.
  - 凡是跟容器的 `Linux Namespace` 相关的属性,也一定是 `Pod` 级别的.`Pod` 的设计,就是要让它里面的容器尽可能多地共享`Linux Namespace`,仅保留必要的隔离和限制能力.
  - 凡是 `Pod` 中的容器要共享宿主机的 `Namespace`,也一定是 `Pod` 级别的定义
  - 同一个 `Pod` 里面的所有用户容器来说,它们的进出流量,也可以认为都是通过 `Infra容器`完成的.将来如果你要为 Kubernetes 开发一个网络插件时,应该重点考虑的是如何配置这个 `Pod`的 `Network Namespace`,而不是每一个用户容器如何使用你的网络配置,这是没有意义的.

## 一. Volume

```yaml
# Pod级共享volume定义
apiVersion: v1
kind: Pod
metadata:
  name: two-containers
spec:
  restartPolicy: Never
  volumes: # 共享的Pod的volume定义
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
              mountPath: /Pod-data
        command: ["/bin/sh"]
        args: ["-c", "echo Hello from the debian container > /Pod-data/index.html"]
```



## 二. Projected Volume

- Secret；
- ConfigMap；
- Downward API；让 `Pod` 里的容器能够直接获取到这个 `Pod` API 对象本身的信息
- ServiceAccountToken; 保存k8s的授权信息,合法访问API Server

### 1. secret

它的作用，是帮你把 `Pod` 想要访问的加密数据，存放到 `Etcd` 中。然后，你就可以通过在` Pod `的容器里挂载 `Volum` 的方式，访问到这些 `Secret` 里保存的信息了。

```yaml
apiVersion: v1
kind: Pod
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

#### a. shell方式创建secret

```shell
$ cat ./username.txt
admin
$ cat ./password.txt
c1oudc0w!

$ kubectl create secret generic user --from-file=./username.txt
$ kubectl create secret generic pass --from-file=./password.txt
```

#### b. yaml方式创建secret

```shell
$ echo -n "admin" | base64
YWRtaW4=
$ echo -n "1f2d1e2e67df" | base64
MWYyZDFlMmU2N2Rm
```

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: mysecret
type: Opaque
data: # base64加密
  user: YWRtaW4=  
  pass: MWYyZDFlMmU2N2Rm
```

> 像这样通过挂载方式进入到容器里的 Secret，一旦其对应的 Etcd 里的数据被更新，这些 Volume 里的文件内容，同样也会被更新。其实，这是 kubelet 组件在定时维护这些 Volume。

### 2. configMap

ConfigMap与 Secret 的区别在于，ConfigMap 保存的是不需要加密的、应用所需的配置信息.

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
# 当前 Pod 的 Labels 字段的值,就会被 Kubernetes 自动挂载成为容器里的 /etc/Podinfo/labels 文件.
apiVersion: v1
kind: Pod
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
          if [[ -e /etc/Podinfo/labels ]]; then
            echo -en '\n\n'; cat /etc/Podinfo/labels; fi;
          sleep 5;
        done;
      volumeMounts:
        - name: Podinfo
          mountPath: /etc/Podinfo
          readOnly: false
  volumes:
    - name: Podinfo
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

> Note: Secret、ConfigMap，以及 Downward API 这三种 Projected Volume 定义的信息，大多还可以通过环境变量的方式出现在容器里。但是，通过环境变量获取这些信息的方式，不具备自动更新的能力。所以，一般情况下，我都建议你使用 Volume 文件的方式获取这些信息。

### 4. ServiceAccount

任何运行在 Kubernetes 集群上的应用,都必须使用这个**ServiceAccountToken**里保存的授权信息,也就是 Token,才可以合法地访问 API Server.

为了方便使用,Kubernetes 已经为你提供了一个默认“服务账户”(default Service Account)

> 一旦 Pod创建完成,容器里的应用就可以直接从这个默认 ServiceAccountToken 的挂载目录里访问到授权信息和文件.这个容器内的路径在 Kubernetes 里是固定的,即：`/var/run/secrets/kubernetes.io/serviceaccountPod`
>
> ```shell
> $ ls /var/run/secrets/kubernetes.io/serviceaccount 
> ca.crt namespace  token
> ```
>

**这种把 Kubernetes 客户端以容器的方式运行在集群里，然后使用 default Service Account 自动授权的方式，被称作“InClusterConfig”，也是我最推荐的进行 Kubernetes API 编程的授权方式。**



## 三. Preset

`Pod` 字段预设功能.

`Pod`Preset 里定义的内容,只会在 `Pod` API 对象被创建之前追加在这个对象本身上,而不会影响任何 `Pod` 的控制器的定义.

```yaml
apiVersion: settings.k8s.io/v1alpha1
kind: PodPreset
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

