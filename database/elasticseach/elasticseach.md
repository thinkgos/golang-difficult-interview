

[TOC]

# elasticsearch

> [influxdb中文](https://www.hellodemos.com/hello-influxdb/influxdb-demos.html)

## 一. 名词解释

> elasticsearch是面向文档.

| 名词        | 解释(关系型数据库对比) |
| ----------- | ---------------------- |
| `indices`   | 索引(数据库)           |
| `types`     | 类型(表)               |
| `documents` | 文档(行)               |
| `fields`    | 字段(列)               |

## 二. 索引

### 1.1 正向索引: 通过key找value

### 1.2 反向索引(倒排索引): 通过value找key,

### 1.3 倒排索引组成

主要由单词词典和倒排列表组成

- 记录所有文档的单词,记录单词到倒排列表的关联信息

- 单词词典: 一般用B+树实现,存储于内存

### 1.4 倒排列表

## 三. IK分词器

