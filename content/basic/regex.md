# 正则表达式

- 匹配速查表

| \b   | 匹配一个连字符. <br />匹配的是一个这样的位置,这个位置位于一个能够用来构成单词的字符(与`\w`相匹配的字符)  <br />和一个不能用来构成单词的字符(与`^\w`相匹配的非字符)之间 |
| ---- | :----------------------------------------------------------- |
| \B   | 不匹配一个前后都不是单词边界的连词符                         |
| \d   | 等价于`[0-9]`                                                |
| \D   | 等价于`[^0-9]`                                               |
| \w   | 等价于`[a-zA-Z0-9_]`                                         |
| \W   | 等价于`[^a-zA-Z0-9_]`                                        |
| \s   | 等价于`[\f\n\r\t\v]`                                         |
| \S   | 等价于`[^\f\n\r\t\v]`                                        |

- `.`字符可以匹配**任何单个的字符,字母,数字**甚至是`.`本身.如果你想需要一个`.`必须在前面加上一个`\`对它进行转义.

> .a.\\. 匹配

- 使用`[]`定义的字符集合,字符集合的匹配结果是能够与该集合里的任意一个成员相匹配的方本.

```
[ns]a.\.   表示仅匹配以n,s开头
[ns]a[0~9]\. 匹配a后面是数字的.
 [ns]a[A-Za-z0~9]\. 匹配a后面是字母和数字的.
[ns]a[^0~9]\.  匹配a后面是不是数字的.
```

- 使用元字符,需转义

  | \\.           | 点                                |
  | ------------- | :-------------------------------- |
  | \\[   和  \\] |                                   |
  | \\{   和  \\} | |
  | [\b]          | 回退(并删除)一个字符(Backspace键) |
  | \f            | 换页符                            |
  | \n            | 换行符                            |
  | \r            | 回车符                            |
  | \t            | 制表符(Tab键)                     |
  | \v            | 垂直制表符                        |
  | \\^           | 非匹配                            |
  | \\+ | 加号 |


- 重复匹配

    - 匹配**一个**或**多个**字符`+`,至少一个,但**不匹配零个**字符的情况. 如邮件\w+@\w+\.\w+
    - 匹配**零个**或**多个**字符`*`
    - 匹配**零个**或**一个**字符`?`
    - 匹配**重复**次数`{n}`.
    - 匹配**次数区间**设置`{n,m}`
    - 匹配**至少重复**多少次`{n,}`
    - 防止过度匹配,采用懒惰型元字符

| 贪婪型元字符 | 懒惰型元字符 |
| ------------ | ------------ |
| `*`          | `*?`         |
| `+`          | `+?`         |
| `{n,}`       | `{n,}?`      |

- 位置匹配
  - `^` 匹配一个字符串的开头位置.
  - `$`匹配一个字符串的结尾位置
- 子表达式,使用`()`括起来,是一个更大的表达式当成一个独立元素来使用. 如`(&nbsp;){2,}`
- 回溯引用,`\n` 代表模式里的第n个子表达式(用`()`括起来的子表达式).
- 前后查找
  - 向前查找: 采用以`?=`的子表达式,需要区配的文本跟在`?=`后面.
  - 向前查找: 采用以`?<=`的子表达式,需要区配的文本跟在`?<=`后面.

| (?=)  | 正向前查找 |
| ----- | ---------- |
| (?!)  | 负向前查找 |
| (?<=) | 正向后查找 |
| (?<!) | 负向后查找 |

- 嵌入条件 see 应知应会正则表达式
