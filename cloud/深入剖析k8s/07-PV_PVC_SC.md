[TOC]

# 容器持久化存储

>  **Persistent Volume**(`PV`)和 **Persistent Volume Claim**(`PVC`）持久化存储体系。
>
>  - **`PV` 描述的,是持久化存储数据卷**
>  - **`PVC` 描述的,则是 `Pod `所希望使用的持久化存储的属性.**

## 一. PV 描述的,是持久化存储数据卷.

`PV` 对象是由运维人员事先创建在 Kubernetes 集群里待用的

```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: nfs
spec:
  storageClassName: manual
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteMany
  nfs:
    server: 10.244.1.4
    path: "/"
```

## 二. PVC 描述的,则是 Pod 所希望使用的持久化存储的属性.

比如,Volume 存储的大小、可读写权限等等,`PVC` 对象通常由开发人员创建；

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: nfs
spec:
  accessModes:
    - ReadWriteMany
  storageClassName: manual
  resources:
    requests:
      storage: 1Gi
```

用户创建的 `PVC` 要真正被容器使用起来,就必须先和某个符合条件的 `PV` 进行绑定,要检查的条件,包括两部分：

1. 第一个条件,当然是 `PV` 和 `PVC` 的 spec 字段。比如,`PV` 的存储(storage）大小,就必须满足 `PVC` 的要求。

2. 而第二个条件,则是 `PV` 和 `PVC` 的 **storageClassName** 字段必须一样。

- `Pod`使用`PVC`.

```yaml
apiVersion: v1
kind: Pod
metadata:
  labels:
    role: web-frontend
spec:
  containers:
  - name: web
    image: nginx
    ports:
      - name: web
        containerPort: 80
    volumeMounts:
        - name: nfs
          mountPath: "/usr/share/nginx/html"
  volumes:
  - name: nfs
    persistentVolumeClaim:
      claimName: nfs
```

- `PVC` 和 `PV` 的设计,其实跟“面向对象”的思想完全一致。`PVC` 可以理解为持久化存储的“接口”,它提供了对某种持久化存储的描述,但不提供具体的实现；而这个持久化存储的实现部分则由 `PV` 负责完成。

## 三.  Dynamic Provisioning 

 `Dynamic Provisioning` 机制工作的核心,在于一个名叫 StorageClass 的 API 对象。而 StorageClass 对象的作用,其实就是创建 `PV` 的模板。

StorageClass 对象会定义如下两个部分内容：

- 第一，PV 的属性。比如，存储类型、Volume 的大小等等。
- 第二，创建这种 PV 需要用到的存储插件。比如，Ceph 等等。

```yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: block-service
provisioner: kubernetes.io/gce-pd
parameters:
  type: pd-ssd
```

```yaml
# lock-service 的 StorageClass,只不过它声明使的存储插件是由 Rook 项目。
apiVersion: ceph.rook.io/v1beta1
kind: Pool
metadata:
  name: replicapool
  namespace: rook-ceph
spec:
  replicated:
    size: 3
---
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: block-service
provisioner: ceph.rook.io/block
parameters:
  pool: replicapool
  #The value of "clusterNamespace" MUST be the same as the one in which your rook cluster exist
  clusterNamespace: rook-ceph
```

```yaml
# 在 `PV`C 里指定要使用的 StorageClass 名字即可
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: claim1
spec:
  accessModes:
    - ReadWriteOnce
  storageClassName: block-service
  resources:
    requests:
      storage: 30Gi
```

## 四. PV-PVC 总结

![pv-pvc](asserts/pv-pvc.png)



- PVC 描述的，是 Pod 想要使用的持久化存储的属性，比如存储的大小、读写权限等。
- PV 描述的，则是一个具体的 Volume 的属性，比如 Volume 的类型、挂载目录、远程存储服务器地址等。
- 而 StorageClass 的作用，则是充当 PV 的模板。并且，只有同属于一个 StorageClass 的 PV 和 PVC，才可以绑定在一起

> `StorageClass` 的另一个重要作用，是指定 PV 的 Provisioner（存储插件）。这时候，如果你的存储插件支持 `Dynamic Provisioning` 的话，Kubernetes 就可以自动为你创建 PV 了。









