[TOC]

# yaml语法

## 格式数据类型
常量,对象,数据

## 格式要求
- `#`表示注释
- 大小写敏感
- 缩进表示层级关系
- 缩进只能使用空格,不能使用TAB,不要求空格个数,只需要相同层级左对齐,(2个或4个空格)

## 语法

### 对象
- 键值对: `key:value`
- 层级关系
```yaml
key:
    child-key: value
    child-key2: value2
```
- 流式(flow)语法,上面可表示
```yaml
key:{child-key: value,  child-key2: value2}
```
- 复杂对象格式，可使用问号加一个空格代表一个复杂的key，配合一个冒号加一个空格代表一个值
```yaml
?
  - complexkey1
  - complexkey2
:
  - complexvalue1
  - complexvalue2
```
### 数组

- 短横线加一个空格代表一个数组项
```yaml
hobby:
    - java
    - go
```
```yaml
-
  - java
  - go
# 理解为[[java,go]]
```
- 复杂
```yaml
companies:
  -
    id: 1
    name: company1
    price: 200W
  -
    id: 2
     name: company2
```
### 常量
- boolean 
  - TRUE,true,True均可以
  - FALSE,false,False均可以
- float
  - 3.14
  - 6.8523015e+5  #可以使用科学计数法
- 整数
  - 123
  - 0b1010_0111_0100_1010_1110    #二进制表
- string
  - 哈哈
  - 'Hello world'  #可以使用双引号或者单引号包裹特殊字符
  - 字符串可以拆成多行，每一行会被转化成一个空格
```yaml
  newline
  newline2
```
- date
  - 2018-07-17    #日期必须使用ISO 8601格式，即yyyy-MM-dd
- datetime
  -  2018-07-17T19:02:31+08:00    #时间使用ISO 8601格式，时间和日期之间使用T连接，最后使用+代表时区