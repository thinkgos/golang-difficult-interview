# RBAC

在 Kubernetes 项目中,负责完成授权(Authorization)工作的机制,就是 RBAC：基于角色的访问控制(Role-Based Access Control).

- **Role**：角色,它其实是一组规则,定义了一组对 Kubernetes API 对象的操作权限.
- **Subject**：主体,既可以是“人”,也可以是“机器”,也可以是你在 Kubernetes 里定义的“用户”.
- **RoleBinding**：定义了`Subject`和`Role`的绑定关系.

```yaml
# Role 本身就是一个 Kubernetes 的 API 对象
kind: Role
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  namespace: mynamespace
  name: example-role
rules:
- apiGroups: [""]  # 核心api对象
  resources: ["pods"]
  verbs: ["get", "watch", "list"]
```

> namespace定义命名空间 mynamespace
> rules定义了权限规则,此例含义: 允许`Subject`,对 mynamespace 下面的 Pod 对象,进行 `GET`、`WATCH`和`LIST`操作.
> 这个具体的`Subject`又是如何指定的呢？这就需要通过 RoleBinding 来帮定此角色.

```yaml
# RoleBinding 本身也是一个 Kubernetes 的 API 对象
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: example-rolebinding
  namespace: mynamespace
subjects: # 定义被作用者,类型 为
- kind: User   # Group 将作用于指定命名空间下所有ServiceAccount.
  name: example-user
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: example-role
  apiGroup: rbac.authorization.k8s.io
```

> roleRef 字段: RoleBinding 对象就可以直接通过name,来引用我们前面定义的 Role 对象(example-role),从而定义了"主体(Subject)"和"角色(Role)"之间的绑定关系.
> roleRef 也只能引用当前 Namespace 里的 Role 对象.
>
> 1. `Role` 和 `RoleBinding` 对象都是 `Namespaced` 对象(Namespaced Object),它们对权限的限制规则仅在它们自己的 Namespace 内有效,
>
> 2. 对于非 Namespaced(Non-namespaced)对象(比如：Node),或者,某一个 Role 想要作用于所有的 Namespace 的时候,我们又该如何去做授权呢？必须要使用 ClusterRole 和 ClusterRoleBinding 这两个组合.

```yaml
kind: ClusterRole
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: example-clusterrole
rules:
- apiGroups: [""]
  resources: ["pods"]
  verbs: ["get", "watch", "list"] # 拥有对所有namespace的Pod进行 get", "list", "watch", "create", "update", "patch", "delete"
```

```yaml
kind: ClusterRoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: example-clusterrolebinding
subjects:
- kind: User
  name: example-user
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: example-clusterrole
  apiGroup: rbac.authorization.k8s.io
```

## 实例:为 ServiceAccount 分配权限的过程,直接使用"内置用户"

#### 1. 我们要定义一个 ServiceAccount下的用户(只需提供name和Namespace)

```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  namespace: mynamespace # 命名空间
  name: example-sa  # 用户名
```

#### 2. 然后,我们通过编写 RoleBinding 的 YAML 文件,来为这个 ServiceAccount 分配权限

```yaml
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: example-rolebinding
  namespace: mynamespace
subjects:
- kind: ServiceAccount
  name: example-sa # 用户名
  namespace: mynamespace 
roleRef:
  kind: Role
  name: example-role
  apiGroup: rbac.authorization.k8s.io
```

#### 3. 接着,我们用 kubectl 命令创建这三个对象：

```shell
$ kubectl create -f svc-account.yaml # ServiceAccount下的用户
$ kubectl create -f role-binding.yaml # 绑定用户和角色
$ kubectl create -f role.yaml  # 用最上面的role对象
```

#### 4. 然后查看一下这个 ServiceAccount 的详细信息：

```shell
$ kubectl get sa -n mynamespace -o yaml
- apiVersion: v1
  kind: ServiceAccount
  metadata:
    creationTimestamp: 2018-09-08T12:59:17Z
    name: example-sa
    namespace: mynamespace
    resourceVersion: "409327"
    ...
  secrets:
  - name: example-sa-token-vmfg6
```

####  5. 使用

```yaml
apiVersion: v1
kind: Pod
metadata:
  namespace: mynamespace
  name: sa-token-test
spec:
  containers:
  - name: nginx
    image: nginx:1.7.9
  serviceAccountName: example-sa # 使用对应的用户名
```

等这个 Pod 运行起来之后,我们就可以看到,该 ServiceAccount 的 token,也就是一个 Secret 对象,被 Kubernetes 自动挂载到了容器的`/var/run/secrets/kubernetes.io/serviceaccount` 目录下,

```shell
$ kubectl describe pod sa-token-test -n mynamespace
Name:               sa-token-test
Namespace:          mynamespace
...
Containers:
  nginx:
    ...
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from example-sa-token-vmfg6 (ro)
 
$ kubectl exec -it sa-token-test -n mynamespace -- /bin/bash
root@sa-token-test:/# ls /var/run/secrets/kubernetes.io/serviceaccount
ca.crt namespace  token
```

- 如果一个 Pod 没有声明 serviceAccountName,Kubernetes 会自动在它的 `Namespace` 下创建一个名叫 `default` 的默认 ServiceAccount,然后分配给这个 Pod.
- 这个默认 ServiceAccount 并没有关联任何 Role.也就是说,此时它有访问 APIServer 的绝大多数权限.当然,这个访问所需要的 Token,还是默认 ServiceAccount 对应的 Secret 对象为它提供的
- 在生产环境中,我强烈建议你为所有 Namespace 下的默认 ServiceAccount,绑定一个只读权限的 Role.



一个 ServiceAccount,在 Kubernetes 里对应的“用户”的名字是:`system:serviceaccount:<Namespace名字>:<ServiceAccount名字>`

而它对应的内置“用户组”的名字: `system:serviceaccounts:<Namespace名字>`

比如:

```yaml
# 意味着作用真价整个命名空间.
subjects:
- kind: Group
  name: system:serviceaccounts:mynamespace
  apiGroup: rbac.authorization.k8s.io
```

在 Kubernetes 中已经内置了很多个为系统保留的 ClusterRole,它们的名字都以 system: 开头,可通过`kubectl get clusterroles cluster-admin -n kube-system` 查看它们.

Kubernetes 还提供了四个预先定义好的 ClusterRole 来供用户直接使用：

- cluster-admin；
- admin；
- edit；
- view.