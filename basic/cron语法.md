# Cron语法

## 一.  linux下的表达式

```
┌─────────────  minute  (0  -  59)  
│  ┌────────────  hour  (0  -  23) 
│  │  ┌───────────  day  of  month  (1  -  31)  
│  │  │  ┌──────────  month  (1  -  12)  
│  │  │  │  ┌─────────  day  of  week  (0  -  6)  (Sunday  to  Saturday;   7  is  also  Sunday)  
│  │  │  │  │ 
│  │  │  │  │ 
 *   *    *    *    *  command  to  execute
```

## 二. 表达式详解

| Field        | Required | Allowed values  | Allowed special characters | Remarks                                 |
| ------------ | -------- | --------------- | -------------------------- | --------------------------------------- |
| Seconds      | Optional | 0-59            | `* , - /`                  | -                                       |
| Minutes      | Yes      | 0-59            | `* , - /`                  | -                                       |
| Hours        | Yes      | 0-23            | `* , - /`                  | -                                       |
| Day of month | Yes      | 1-31            | `* , - / ? L W`            | -                                       |
| Month        | Yes      | 1-12 or JAN-DEC | `* , - /`                  | -                                       |
| Day of week  | Yes      | 0-6 or SUN-SAT  | `* , - / ? L #`            | -                                       |
| Year         | Optional | 1970–2099       | `* , - /`                  | This field is not supported in standard |

Cron表达式在标准中,有5个字段, **Year**字段在不是标准支持,在Cron格式的某些使用中，模式的开头还有一个秒字段。 在这种情况下，CRON表达式是一个包含6或7个字段的字符串。

- **Asterisk(`*`)**: 星号表示cron表达式将匹配该字段的所有值. 在`Month`域中使用星号将表示每个月。

- **Comma(`,`)**: 逗号用于分隔列表中的项. "`MON,WED,FRI`"在第(day of week)域中表示Mondays,Wednesdays and Fridays.

- **Hyphen(`-`)**: 连字符定义范围。例如,`2000-2010`表示2000年至2010年(包括2010年)的每一年。
- **Percent(`％`)** : 除非使用反斜杠(`\`)进行转义，否则命令中的百分号（％）会更改为新行字符，并且将第一个％之后的所有数据作为标准输入发送至命令。[10]

- 非标准的字符

  - `L`:  代表“最后”, 

    > 在`Day-of-week`字段中使用时,它允许您指定诸如给定月份的“最后一个星期五”(“5L”)这样的结构。 
    >
    > 在“`Day-of-month`”字段中，它指定该月的最后一天。

  - `W`:  只在`Day-of-month`字段中允许使用`W`字符,此字符用于指定最接近给定日期的有效工作日(星期一至星期五)。

    > 例如，如果您要指定“ 15W”作为`Day-of-month`字段的值，则含义是：“离月15日最近的工作日”。
    >
    > 如果15号是星期六，那么触发器将在14号星期五触发。
    >
    > 如果15日是星期日，则触发器将在16日星期一触发。 
    >
    > 如果15号是星期二，那么它将在15号星期二触发。 
    >
    > 但是，如果您指定“ 1W”作为月份的值，并且第一个是星期六，则触发器将在第3个星期一触发，因为它不会“跳过”一个月日的边界。 仅当月份中的某天是一天，而不是范围或天数列表时，才可以指定“ W”字符

  - **Hash(`#`)**: 只能在`Day-of-week`字段中允许使用`＃`，并且后面必须跟一个1到5之间的数字,它允许您指定诸如给定月份的“第二个星期五”这样的结构. 例如，在`Day-of-week`字段中输入`6#3`表示每月的第三个星期五。

  - **Question(`?`)**:  在某些实现中,代替`*`来保留`Day-of-month`或`Day-of-week`域为空白. 其它某些的Cron实现用来匹配当时Cron的启动的时间, 例如,如果cron在上午8:25启动，则`? ? * * * *`将更新为`25 8 * * * *`，并且cron在每天的这个时间运行这个命令.

  - **Slash(`/`)**: 可以将斜线与范围组合以指定步长值. 例如: `Minutes`字段中的`*/5`表示每5分钟显示一次.

## 三. 非标准的预定义调度定义

| Entry                    | Description                                                | Equivalent to |
| ------------------------ | ---------------------------------------------------------- | ------------- |
| `@yearly (or @annually)` | Run once a year at midnight of 1 January                   | `0 0 1 1 *`   |
| `@monthly`               | Run once a month at midnight of the first day of the month | `0 0 1 * *`   |
| `@weekly`                | Run once a week at midnight on Sunday morning              | `0 0 * * 0`   |
| `@daily`                 | Run once a day at midnight                                 | `0 0 * * *`   |
| `@hourly`                | Run once an hour at the beginning of the hour              | `0 * * * *`   |
| `@reboot`                | Run at startup                                             | N/A           |

