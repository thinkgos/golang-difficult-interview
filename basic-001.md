[toc]

# golang基础

### 1. `defer` 和 `panic` 

#### 问题: 代码输出什么?  
[代码](src/basic-c0001)

```golang
package main

import "fmt"

func main() {
    defer_call()
}

func defer_call()  {
    defer func() {fmt.Println("打印前")}()
    defer func() {fmt.Println("打印中")}()
    defer func() {fmt.Println("打印后")}()

    panic("触发异常")
}
```
#### 解答:
```text 
打印后
打印中
打印前
panic: 触发异常
```
#### 解析:
> `defer` 的执行顺序是**先进后出,后进先出**的顺序执行.
> 出现panic语句的时候,会先按照`defer` 的后进先出顺序执行,最后才会执行`panic`.

### 2. `array`和`slice`

#### 问题: 以下代码只注释掉 ② 输出什么？如果只注释 ① 又输出什么?  
[代码](src/basic-c0002)

```golang
package main

import (
 "fmt"
)

func main() {
 a := [2]int{5, 6}
 b := [2]int{5, 6}
 
 // ①
 if a == b {
  fmt.Println("equal")
 } else {
  fmt.Println("not equal")
 }

 // ②
 if a[:] == b[:] {
  fmt.Println("equal")
 } else {
  fmt.Println("not equal")
 }
}
```

#### 解答: 
```text
  array是可以比较的,slice是不可以比较的.
  所以:
    ①为equal
    ②为编译不通过
```

### 解析:
> `array`是可以比较的,且len和cap是一样的.
> `slice`不可直接比较,只可以与nil比较.
    
