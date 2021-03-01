[TOC]

# Protobuf(proto3)

> [官方文档](https://developers.google.cn/protocol-buffers)

## 一. 定义消息类型

`.proto`文件定义消息类型

```protobuf
syntax = "proto3";

/* 查询请求*/
message SearchRequest {
      reserved 4, 15, 9 to 11;
      string query = 1; // 查询
      int32 page_number = 2;
      int32 result_per_page = 3;
}

message SearchResponse {
      repeated Result results = 1;
}

message Result {
      string url = 1;
      string title = 2;
      repeated string snippets = 3;
}
```

- 第一行定义了使用的`protobuf`的协议的版本,如果不设置,则为proto2版本. 文件第一行必须非空,非注释行

- 采用C/C++风格的注释,即使`//`和`/**/`.

- `SearchRequest`定义了三个域(名称/值对),每个字段都有一个名称和一个类型

  - 每个字段都有对应的标量类型( [scalar types](#二. 标量类型(scalar types)))

  - 每一个字段都定有唯一数值编号. 这些字段用于标识二进制编码的域位置,一旦定义并使用后,不应该再修改.

    > - 字段数值编号**1-15**只使用一个字节进行编码,包括字段数值编号和字段类型.
    >
    > - 字段数值编号**16-2047**将使用两个字节进行编码
    >
    > - 最小的字段编号为1,最大2^29 - 1, or 536,870,911. 
    >
    > - **19000-19999** (**FieldDescriptor::kFirstReservedNumber**-**FieldDescriptor::kLastReservedNumber**)为`protobuf`保留字段,不可使用.
    >
    >   对于频繁出现的消息最好使用**1-15**,切记为将来可能添加的频繁出现的元素留出一些空间

  - 字段规则

    - `singular`: 字段为0或1个,这是默认规则.
    - `repeated`: 该字段可以在格式良好的消息中重复任意次数(包括0),重复值的顺序将保留. 在`proto3`中，默认情况下，标量数字类型的``repeated``字段使用打包编码

- 保留字段, 可以采用保留编号或保留字段名的方式,进行保留, 当删除一些旧的编号或字段时,可以防止后续使用,引起不必要的bug.

- 可以使用其它消息类型作为字段. 如`Result`在`SearchResponse`里使用

- 使用 [protocol buffer compiler](https://developers.google.cn/protocol-buffers/docs/proto3#generating) 编译将产生对应的代码

## 二. 标量类型(scalar types)

 [scalar types](https://developers.google.cn/protocol-buffers/docs/proto3#scalar)

| .proto     | Notes                                                       | C++    | Go      | Dart   |
| :--------- | :---------------------------------------------------------- | :----- | :------ | :----- |
| `double`   |                                                             | double | float64 | double |
| `float`    |                                                             | float  | float32 | double |
| `int32`    | 使用变长编码,负数编码效率低下,如果字段可能有负数,使用sint32 | int32  | int32   | int    |
| `int64`    | 使用变长编码,负数编码效率低下,如果字段可能有负数,使用sint64 | int64  | int64   | Int64  |
| `uint32`   | 使用变长编码                                                | uint32 | uint32  | int    |
| `uint64`   | 使用变长编码                                                | uint64 | uint64  | Int64  |
| `sint32`   | 使用变长编码。有符号的整型。它们比int32编码负数效率更高     | int32  | int32   | int    |
| `sint64`   | 使用变长编码。有符号的整型。它们比int64编码负数效率更高     | int64  | int64   | Int64  |
| `fixed32`  | 固定4字节编码,如果值大于2^28比uint32编码效率更高            | uint32 | uint32  | int    |
| `fixed64`  | 固定8字节编码,如果值大于2^68比uint32编码效率更高            | uint64 | uint64  | Int64  |
| `sfixed32` | 固定4字节                                                   | int32  | int32   | int    |
| `sfixed64` | 固定8字节                                                   | int64  | int64   | Int64  |
| `bool`     |                                                             | bool   | bool    | bool   |
| `string`   | utf-8或ASCII编码,长度不应超过2^32                           | string | string  | String |
| `bytes`    | 包含任意的字节,长度不应超过2^32                             | string | []byte  | List   |

## 三. 默认值

解析消息时，如果编码的消息不包含特定的单数元素，则已解析对象中的相应字段将设置为该字段的默认值。 这些默认值是特定于类型的：

- string: 空字符串
- bytes: 空字节流.
- bools: false.
- numeric types: 0
- enums: 枚举的第一个值,且必须为0.
- message fields: 取决于所用的语言(See [generated code guide](https://developers.google.cn/protocol-buffers/docs/reference/overview))

## 四. 枚举

```protobuf
message SearchRequest {
      string query = 1;
      int32 page_number = 2;
      int32 result_per_page = 3;
      enum Corpus {
            option allow_alias = true;
            UNIVERSAL = 0;
            WEB = 1;
            IMAGES = 2;
            LOCAL = 3;
            AliasLocal = 3,
      }
      Corpus corpus = 4;
}
```

如您所见，Corpus枚举的第一个常量映射为零：每个枚举定义必须包含一个映射为零的常量作为其第一个元素。 这是因为：

- 必须有一个零值，以便我们可以使用0作为数字默认值。
- 零值必须是第一个元素，以便与`proto2`语义兼容，其中第一个枚举值始终是默认值。
- 您可以通过将相同的值分配给不同的枚举常量来定义别名. 首先你得设置`allow_alias`为`true`
- 枚举值的范围为32位整型,采用 [varint encoding](https://developers.google.cn/protocol-buffers/docs/encoding) 编码,不建议采用负数.

## 五. 导入定义

```protobuf
import "myproject/other_protos.proto";
```

默认情况下，您只能使用直接导入的`.proto`文件中的定义。 但是，有时您可能需要将`.proto`文件移动到新位置。

现在，您可以直接在原始位置放置一个虚拟的`.proto`文件，而不是直接移动`.proto`文件并一次更改所有呼叫站点，而是使用导入`import public`将所有导入转发到新位置。 

任何导入包含导入`import public`的原型的人都可以可传递地依赖导入`import public`依赖项。 例如

```protobuf
// new.proto
// All definitions are moved here
```

```protobuf
// old.proto
// This is the proto that all clients are importing.
import public "new.proto";
import "other.proto";
```

```protobuf
// client.proto
import "old.proto";
// You use definitions from old.proto and new.proto, but not other.proto
```

协议编译器使用`-I /-proto_path`标志在协议编译器命令行中指定的一组目录中搜索导入的文件。 

如果未给出任何标志，它将在调用编译器的目录中查找。 通常，应将`--proto_path`标志设置为项目的根目录，并对所有导入使用完全限定的名称。

## 六. 其它内置类型定义

### 1. Any

`Any`消息类型使您可以将消息用作嵌入式类型，而无需定义它们的`.proto`。

 `Any`包含任意序列化消息（以字节为单位）以及URL，URL作为该消息的类型并解析为该消息的类型的全局唯一标识符。

```protobuf
import "google/protobuf/any.proto";

message ErrorStatus {
      string message = 1;
      repeated google.protobuf.Any details = 2;
}
```

### 2. Oneof

如果您有一则消息包含许多字段，并且最多可以同时设置一个字段，则可以使用oneof功能强制执行此行为并节省内存。

可以添加任何字段到`oneof`,除了`map`和`repeated`

```protobuf
message SampleMessage {
      oneof test_oneof {
            string name = 4;
            SubMessage sub_message = 9;
      }
}
```

### 3. Maps

如果要在数据定义中创建关联映射，则协议缓冲区提供了方便的快捷方式语法：

```protobuf
map<key_type, value_type> map_field = N;
```

- `key_type`可以是任何integral或string类型(除了float和bytes之外),`enum`不是有效的`key_type`
-  `value_type`可以是除`Maps`以外的任何类型。

```protobuf
map<string, Project> projects = 3;
```

- 映射字段不能重复。

- map值的编码顺序和迭代顺序是未定义的，因此您不能依赖于map处于特定的顺序。
- 当为`.proto`生成文本格式时，地图将按键排序。 数字键按数字排序。
- 从数据解析或合并时，如果存在重复的映射键，则使用最后看到的键。 从文本格式解析时，如果键重复，则解析可能会失败。
- 如果为映射字段提供键但没有值，则序列化字段时的行为取决于语言。 在C ++，Java和Python中，类型的默认值是序列化的，而在其他语言中，则没有序列化的值。

## 七. 包定义

可以在`.proto`文件中添加可选的包说明符，以防止协议消息类型之间的名称冲突。

```protobuf
package foo.bar;
message Open { ... }
```

在Go中，除非您在`.proto`文件中明确提供了`go_package`选项，否则该包将用作Go包名称

## 八. 定义服务

如果要将消息类型与RPC(远程过程调用)系统一起使用，则可以在`.proto`文件中定义RPC服务接口，并且协议protocolbuf编译器将以您选择的语言生成服务接口代码和存根。 

例如，如果要使用接收`SearchRequest`并返回`SearchResponse`的方法来定义RPC服务，则可以在`.proto`文件中定义它，如下所示：

```protobuf
service SearchService {
      rpc Search(SearchRequest) returns (SearchResponse);
}
```







