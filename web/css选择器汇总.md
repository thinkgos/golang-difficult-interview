[TOC]



# css选择器

![css_selector](/home/thinkgo/go/notes/doc/web/asserts/ct_css_selector.gif)

## 1. 元素选择器

文档的元素就是元素先择器,是最基本的选择器

```css
html {color:black;}
h1 {color:blue;}
h2 {color:silver;}
```

## 2. 选择器分组

可以对选择器进行分组(`以','分隔`)，这样，被分组的选择器就可以分享相同的声明。

```css
h1,h2,h3,h4,h5,h6 {
  color: green;
  }
```

## 3. 类选择器

类选择器允许以一种独立于文档元素的方式来指定样式。

```html
<h1 class="important">
This heading is very important.
</h1>
```

```css
.important {color:red;}
```

## 4. ID选择器

ID 选择器允许以一种独立于文档元素的方式来指定样式

```html
<p id="intro">This is a paragraph of introduction.</p>
```

```css
#intro {font-weight:bold;}
```

## 5. 属性选择器

属性选择器可以根据元素的属性及属性值来选择元素.

### a. 简单属性选择

如果您希望把包含标题（title）的所有元素变为红色，可以写作: 

```css
*[title] {color:red;}  // 把包含标题（title）的所有元素变为红色
a[href] {color:red;} // 只对有 href 属性的锚（a 元素）应用样式
a[href][title] {color:red;} // 将同时有 href 和 title 属性的 HTML 超链接的文本设置为红色
img[alt] {border: 5px solid red;} // 所有带有 alt 属性的图像应用样式，从而突出显示这些有效的图像
```

### b. 根据具体属性值选择

```css
a[href="http://www.w3school.com.cn/"][title="W3School"] {color: red;} // 把多个属性-值选择器链接在一起来选择一个文档
p[class="important warning"] {color: red;} // 根据具体属性值来选择该元素
```

| 选择器                                                       | 描述                                                         |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| [[*attribute*\]](https://www.w3school.com.cn/cssref/selector_attribute.asp) | 选取带有attribute属性的元素。                                |
| [[*attribute*=*value*\]](https://www.w3school.com.cn/cssref/selector_attribute_value.asp) | 选取attribute属性值为value的元素。                           |
| [[*attribute*~=*value*\]](https://www.w3school.com.cn/cssref/selector_attribute_value_contain.asp) | 选取attribute属性值中包含value的元素。                       |
| [[*attribute*\|=*value*\]](https://www.w3school.com.cn/cssref/selector_attribute_value_start.asp) | 选取attribute属性值等于value或value-开头的元素，该值必须是整个单词。 |
| [[*attribute*^=*value*\]](https://www.w3school.com.cn/cssref/selector_attr_begin.asp) | 选取attribute属性值value开头的每个元素。                     |
| [[*attribute*$=value]](https://www.w3school.com.cn/cssref/selector_attr_end.asp) | 选取attribute属性值value结尾的每个元素。                     |
| [[attribute*=value]](https://www.w3school.com.cn/cssref/selector_attr_contain.asp) | 选取attribute属性值包含value的每个元素。                     |

## 6. 后代选择器

后代选择器可以选择作为某元素后代的元素(`以空格分隔`)

```css
h1 em {color:red;}
```

## 7. 子元素选择器

与后代选择器相比，子元素选择器（Child selectors）只能选择作为某元素子元素的元素。

```css
h1 > strong {color:red;}
```

## 8. 相邻兄弟选择器

相邻兄弟选择器（Adjacent sibling selector）可选择紧接在另一元素后的元素，且二者有相同父元素。

```css
h1 + p {margin-top:50px;}
```

## 9. 伪类

伪类用于向某些选择器添加特殊的效果

```css
selector : pseudo-class {property: value}
```

### a. 锚伪类

```css
a:link {color: #FF0000}		/* 未访问的链接 */
a:visited {color: #00FF00}	/* 已访问的链接 */
a:hover {color: #FF00FF}	/* 鼠标移动到链接上 */
a:active {color: #0000FF}	/* 选定的链接 */
```

### b. :first-child 伪类

可以使用` :first-child` 伪类来选择元素的第一个子元素

```css
p:first-child {font-weight: bold;}
li:first-child {text-transform:uppercase;}
```

### c. :lang 伪类

`:lang `伪类使你有能力为不同的语言定义特殊的规则

```css
q:lang(no)   {
   quotes: "~" "~"
}
```

| 属性                                                         | 描述                                     | CSS  |
| :----------------------------------------------------------- | :--------------------------------------- | :--- |
| [:active](https://www.w3school.com.cn/cssref/pr_pseudo_active.asp) | 向被激活的元素添加样式。                 | 1    |
| [:focus](https://www.w3school.com.cn/cssref/pr_pseudo_focus.asp) | 向拥有键盘输入焦点的元素添加样式。       | 2    |
| [:hover](https://www.w3school.com.cn/cssref/pr_pseudo_hover.asp) | 当鼠标悬浮在元素上方时，向元素添加样式。 | 1    |
| [:link](https://www.w3school.com.cn/cssref/pr_pseudo_link.asp) | 向未被访问的链接添加样式。               | 1    |
| [:visited](https://www.w3school.com.cn/cssref/pr_pseudo_visited.asp) | 向已被访问的链接添加样式。               | 1    |
| [:first-child](https://www.w3school.com.cn/cssref/pr_pseudo_first-child.asp) | 向元素的第一个子元素添加样式。           | 2    |
| [:lang](https://www.w3school.com.cn/cssref/pr_pseudo_lang.asp) | 向带有指定 lang 属性的元素添加样式。     | 2    |

## 10. 伪元素

伪元素用于向某些选择器设置特殊效果

```
selector:pseudo-element {property:value;}
```

### a. "first-line" 伪元素

`"first-line"` 伪元素用于向文本的首行设置特殊样式。

```css
p:first-line  {
  color:#ff0000;
  font-variant:small-caps;
  }
```

**注释：**"first-line" 伪元素只能用于块级元素。

**注释：**下面的属性可应用于 "first-line" 伪元素：

- font
- color
- background
- word-spacing
- letter-spacing
- text-decoration
- vertical-align
- text-transform
- line-height
- clear

### b. :first-letter 伪元素

`first-letter` 伪元素用于向文本的首字母设置特殊样式：

```css
p:first-letter
  {
  color:#ff0000;
  font-size:xx-large;
  }
```

**注释：**"first-letter" 伪元素只能用于块级元素。

**注释：**下面的属性可应用于 "first-letter" 伪元素：

- font
- color
- background
- margin
- padding
- border
- text-decoration
- vertical-align (仅当 float 为 none 时)
- text-transform
- line-height
- float
- clear

### c.  :before 伪元素

`:before`伪元素可以在元素的内容前面插入新内容

```css
h1:before{
  content:url(logo.gif);
  }
```

d. after 伪元素

`:after` 伪元素可以在元素的内容之后插入新内容。

```css
h1:after{
  content:url(logo.gif);
  }
```

| 属性                                                         | 描述                             | CSS  |
| :----------------------------------------------------------- | :------------------------------- | :--- |
| [:first-letter](https://www.w3school.com.cn/cssref/pr_pseudo_first-letter.asp) | 向文本的第一个字母添加特殊样式。 | 1    |
| [:first-line](https://www.w3school.com.cn/cssref/pr_pseudo_first-line.asp) | 向文本的首行添加特殊样式。       | 1    |
| [:before](https://www.w3school.com.cn/cssref/pr_pseudo_before.asp) | 在元素之前添加内容。             | 2    |
| [:after](https://www.w3school.com.cn/cssref/pr_pseudo_after.asp) | 在元素之后添加内容。             | 2    |


