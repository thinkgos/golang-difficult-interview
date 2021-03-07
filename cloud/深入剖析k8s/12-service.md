[TOC]

# Service

`Kubernetes` 之所以需要 `Service`是因为: 

-  `Pod` 的 IP 不是固定的，
- 一组 `Pod` 实例之间总会有负载均衡的需求。

> `Service` 是由` kube-proxy `组件，加上 `iptables `<或`IPVS`>来共同实现的。

## 一. Service原理

**Service**: 

```yaml
apiVersion: v1
kind: Service
metadata:
  name: hostnames
spec:
  selector:
    app: hostnames
  ports:
  - name: default
    protocol: TCP
    port: 80 # service的端口
    targetPort: 9376  # 代理的端口
```

**Deoloyment**: 

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hostnames
spec:
  selector:
    matchLabels:
      app: hostnames
  replicas: 3
  template:
    metadata:
      labels:
        app: hostnames
    spec:
      containers:
      - name: hostnames
        image: k8s.gcr.io/serve_hostname
        ports:
        - containerPort: 9376
          protocol: TCP
```

而被 selector 选中的 `Pod`，就称为 `Service` 的 `Endpoints`，你可以使用` kubectl get ep` 命令看到它们，如下所示：

```shell
$ kubectl get endpoints hostnames
NAME        ENDPOINTS
hostnames   10.244.0.5:9376,10.244.0.6:9376,10.244.0.7:9376
```

> 只有处于 Running 状态，且 readinessProbe 检查通过的 Pod，才会出现在 `Service` 的 Endpoints 列表里。并且，当某一个 `Pod `出现问题时，Kubernetes 会自动把它从 `Service` 里摘除掉。

>一直以来，基于 iptables 的 `Service` 实现，都是制约 Kubernetes 项目承载更多量级的 `Pod` 的主要障碍。而 IPVS 模式的 `Service`，就是解决这个问题的一个行之有效的方法。

IPVS 模式的工作原理，其实跟 iptables 模式类似。

当我们创建了前面的 `Service` 之后，`kube-proxy` 首先会在宿主机上创建一个虚拟网卡（叫作：`kube-ipvs0`），并为它分配 Service VIP 作为 IP 地址,而接下来，`kube-proxy` 就会通过 Linux 的 IPVS 模块，为这个 IP 地址设置三个 IPVS 虚拟主机，并设置这三个虚拟主机之间使用轮询模式 (rr) 来作为负载均衡策略

> 而相比于 iptables，IPVS 在内核中的实现其实也是基于 Netfilter 的 NAT 模式，所以在转发这一层上，理论上 IPVS 并没有显著的性能提升。
>
> 但是，IPVS 并不需要在宿主机上为每个 Pod 设置 iptables 规则，而是把对这些“规则”的处理放到了内核态，从而极大地降低了维护这些规则的代价。
>
> 这也正印证了我在前面提到过的，“将重要操作放入内核态”是提高性能的重要手段。

## 二. Service和DNS关系

在 Kubernetes 中，Service 和 Pod 都会被分配对应的 DNS A 记录（从域名解析 IP 的记录）

- ClusterIP 模式的 Service 来说，它的 A 记录的格式是：`..svc.cluster.local`。当你访问这条 A 记录的时候，它解析到的就是该 Service 的 VIP 地址. 

  > 它代理的 Pod 被自动分配的 A 记录的格式是：`..pod.cluster.local`。这条记录指向 Pod 的 IP 地址。

- 对于指定了`clusterIP=None` 的 Headless Service 来说，它的 A 记录的格式也是：`..svc.cluster.local`。但是，当你访问这条 A 记录的时候，它返回的是所有被代理的 Pod 的 IP 地址的集合。当然，如果你的客户端没办法解析这个集合的话，它可能会只会拿到第一个 Pod 的 IP 地址. 

  > 它代理的 Pod 被自动分配的 A 记录的格式是：`...svc.cluster.local`。这条记录也指向 Pod 的 IP 地址.
  >
  > 这个 DNS 记录，正是 Kubernetes 项目为 Pod 分配的唯一的“可解析身份”（Resolvable Identity）。
  >
  > `<Pod-name>.<Service-name>.<Namespace>.svc.cluster.local`

- 但如果你为 Pod 指定了 `Headless Service`，并且 Pod 本身声明了`hostname` 和 `subdomain` 字段，那么这时候 Pod 的 A 记录就会变成：`<pod 的 hostname>...svc.cluster.local`，比如：

```yaml
apiVersion: v1
kind: Service
metadata:
  name: default-subdomain
spec:
  selector:
    name: busybox
  clusterIP: None
  ports:
  - name: foo
    port: 1234
    targetPort: 1234
---
apiVersion: v1
kind: Pod
metadata:
  name: busybox1
  labels:
    name: busybox
spec:
  hostname: busybox-1
  subdomain: default-subdomain
  containers:
  - image: busybox
    command:
      - sleep
      - "3600"
    name: busybox
```

在上面这个 Service 和 Pod 被创建之后，你就可以通过`<Hostname>.<Subdomain>.<Namespace>.svc.cluster.local` 解析到这个 Pod 的 IP 地址了,即`busybox-1.default-subdomain.default.svc.cluster.local`

## 三. 外界连通Service

### a. 最常用的一种方式就是：NodePort

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-nginx
  labels:
    run: my-nginx
spec:
  type: NodePort
  ports:
  - nodePort: 8080
    targetPort: 80
    protocol: TCP
    name: http
  - nodePort: 443
    protocol: TCP
    name: https
  selector:
    run: my-nginx
```

> 在这个 Service 的定义里，我们声明它的类型是，`type=NodePort`。然后，我在 ports 字段里声明了 Service 的 8080 端口代理 Pod 的 80 端口，Service 的 443 端口代理 Pod 的 443 端口。
>
> 当然，如果你不显式地声明 nodePort 字段，Kubernetes 就会为你分配随机的可用端口来设置代理。这个端口的范围默认是 30000-32767，你可以通过 kube-apiserver 的–service-node-port-range 参数来修改它

### b. 从外部访问 Service 的第二种方式，适用于公有云上的 Kubernetes 服务。这时候，你可以指定一个 LoadBalancer 类型的 Service

```yaml
apiVersion: v1
kind: Service
metadata:
  name: example-service
spec:
  ports:
  - port: 8765
    targetPort: 9376
  selector:
    app: example
  type: LoadBalancer
```

> 在公有云提供的 Kubernetes 服务里，都使用了一个叫作 CloudProvider 的转接层，来跟公有云本身的 API 进行对接。
>
> 所以，在上述 LoadBalancer 类型的 Service 被提交后，Kubernetes 就会调用 CloudProvider 在公有云上为你创建一个负载均衡服务，并且把被代理的 Pod 的 IP 地址配置给负载均衡服务做后端。

### c. 第三种方式，是 Kubernetes 在 1.7 之后支持的一个新特性，叫作 ExternalName

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  type: ExternalName
  externalName: my.database.example.com
```

> `ExternalName` 类型的 Service，其实是在 kube-dns 里为你添加了一条 `CNAME` 记录。
>
> 这时，访问 `my-service.default.svc.cluster.local` 就和访问` my.database.example.com` 这个域名是一个效果了

Kubernetes 的 Service 还允许你为 Service 分配公有 IP 地址.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  selector:
    app: MyApp
  ports:
  - name: http
    protocol: TCP
    port: 80
    targetPort: 9376
  externalIPs:
  - 80.11.12.10
```

> 你就可以通过访问 80.11.12.10:80 访问到被代理的 Pod 了。不过，在这里 Kubernetes 要求 externalIPs 必须是至少能够路由到一个 Kubernetes 的节点







