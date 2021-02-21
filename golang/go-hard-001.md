[toc]

# golang 难度

### 1. len内置函数

**问题: 代码输出什么?** [原文](https://mp.weixin.qq.com/s?__biz=MzAxMTA4Njc0OQ==&mid=2651442060&idx=2&sn=29a3f39ec2d95d6b5177e53277c5f94c&chksm=80bb157eb7cc9c68f9b2574cb259678580b194cf20d83d84840818bae9712fe3e0246e249a97&mpshare=1&scene=24&srcid=1130fgz3Kg9VvJpRLR3OLUVS&sharer_sharetime=1606715319571&sharer_shareid=fbafc624aa53cd09857fb0861ac2a16d&exportkey=AZIxDLHvvkwjXPkmuEeWCtI%3D&pass_ticket=xSGb7TkoIuLZz7AFBdlYeR4qEQC4h9uTHgeYZjnzNlVCg1RDSSP3MJjeOxdI2wvs&wx_header=0#rd)
[代码](src/go-hard-c0001)
```go
package main

const s = "Go101.org"
// len(s) == 9
// 1 << 9 == 512
// 512 / 128 == 4

var a byte = 1 << len(s) / 128
var b byte = 1 << len(s[:]) / 128

func main() {
  println(a, b)
}
```

**解答**: 
```text
4 0
```

**解析**:
> **a. 常量与求值**  
> 当参数是字符串字面量和简单 array 表达式，len 函数返回值是常量.  
>> 内置函数 len 和 cap 获取各种类型的实参并返回一个 int 类型结果。实现会保证结果总是一个 int 值。
>> 如果 s 是一个字符串常量，那么 len(s) 是一个常量 。如果 s 类型是一个数组或到数组的指针且表达式 s 不包含 信道接收 或（非常量的） 函数调用的话， 那么表达式 len(s) 和 cap(s) 是常量；这种情况下， s 是不求值的。否则的话， len 和 cap 的调用结果不是常量且 s 会被求值
> 所以len(s)与len(s[:]) 前者返回是常量,后者是求值的值
>
> **b. 位移**
>> 在位移表达式的右侧的操作数必须为整数类型，或者可以被 uint 类型的值所表示的无类型的常量。如果一个非常量位移表达式的左侧的操作数是一个无类型常量，那么它会先被隐式地转换为假如位移表达式被其左侧操作数单独替换后的类型。
> 
>> 如果常量 位移表达式 的左侧操作数是一个无类型常量，那么其结果是一个整数常量；否则就是和左侧操作数同一类型的常量   
> 
> 因此对于 var a byte = 1 << len(s) / 128，因为 1 << len(s) 是一个常量位移表达式，因此它的结果也是一个整数常量，所以是 512，最后除以 128，最终结果就是 4。
> 
> 而对于 var b byte = 1 << len(s[:]) / 128，因为 1 << len(s[:]) 不是一个常量位移表达式，而做操作数是 1，一个无类型常量，根据规范定义它是 byte 类型（根据：如果一个非常量位移表达式的左侧的操作数是一个无类号常量，那么它会先被隐式地转换为假如位移表达式被其左侧操作数单独替换后的类型. 
> 即1为byte型,右移溢出,所以为0
### 2. 补码

**问题: 代码输出什么?** [原文](https://mp.weixin.qq.com/s?__biz=MzAxMTA4Njc0OQ==&mid=2651442141&idx=2&sn=1e565dd411fb82584a7093f40a750be2&chksm=80bb152fb7cc9c390add4b13d217984bd3334ea9bbb1b45357c6d979b9d37499fb8cf9e26004&mpshare=1&scene=24&srcid=1130xlWjBiMct2BMLtmpjm5S&sharer_sharetime=1606715340255&sharer_shareid=fbafc624aa53cd09857fb0861ac2a16d&exportkey=Aa%2Fz3pSgi%2B5meJijFHg1ppE%3D&pass_ticket=xSGb7TkoIuLZz7AFBdlYeR4qEQC4h9uTHgeYZjnzNlVCg1RDSSP3MJjeOxdI2wvs&wx_header=0#rd)
[代码](src/go-hard-c0002)
```go
package main

func main() {
    var a int8 = -1
    var b int8 = -128 / a
    
    println(b)
}
```

```go
package main

func main() {
    const a int8 = -1
    var b int8 = -128 / a

    println(b)
}
```

**解答**: 
```text
    题1: -128
    题2: 编译错误
```

**解析**:
> const隐式转换不允许溢出,所以编译错误

### 3.

**问题: 代码输出什么? **

```go

```

**解答**: 
```text

```

**解析**: