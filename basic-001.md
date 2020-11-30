[toc]

# golang基础

### 1. `defer` 和 `panic` 

#### 问题: 代码输出什么? @see

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

### 2. 