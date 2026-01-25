import { CourseChapter, CourseUnit, QuizModule, ReferenceCategory, InterviewItem, InterviewDifficulty, QuestionType, Difficulty } from './RustTypes';

export const DAILY_TIPS: string[] = [
  "在 Python 中，如果你不需要使用某个变量，可以在变量名前加下划线（如 _x）来忽略未使用的警告。",
  "使用 `python -m py_compile` 可以检查代码语法而不执行，比直接运行快得多。",
  "列表推导式 `[x for x in range(10)]` 比循环更简洁高效，是 Python 的优雅特性。",
  "Python 的字符串是 Unicode 编码的，可以直接通过索引访问字符（如 s[0]）。",
  "使用 `print(f'{x=}')` 可以在 Python 3.8+ 中打印变量名和值，调试神器！",
  "Python 的垃圾回收器自动管理内存，让你专注于业务逻辑，无需手动管理内存。",
  "使用 `match/case` 语句（Python 3.10+）可以优雅地处理多个条件分支。",
  "`try/except` 是 Python 的错误处理机制，比返回错误码更清晰。",
  "`list` 是 Python 中最常用的动态数组，使用 `[]` 可以快速创建。",
  "Python 的动态类型系统让代码更灵活，但要注意类型检查。",
  "`Exception` 类型强制你处理错误，这是 Python 错误处理的核心。",
  "使用 `if/else` 可以简洁地处理条件判断，Python 的语法非常直观。",
  "`str` 是不可变字符串，`list` 是可变列表，理解它们的区别很重要。",
  "`copy()` 和 `deepcopy()` 用于复制数据，`deepcopy()` 会递归复制所有嵌套对象。",
  "Python 的 GIL（全局解释器锁）限制了多线程性能，但多进程可以绕过。",
  "使用 `__str__` 和 `__repr__` 可以自定义对象的字符串表示，方便调试。",
  "`class` 用于定义类，可以定义实例方法和类方法（使用 `@classmethod`）。",
  "`abc.ABC` 和 `@abc.abstractmethod` 可以定义抽象基类，类似于接口。",
  "`None` 是 Python 的空值，`True` 和 `False` 是布尔值。",
  "使用 `black` 或 `autopep8` 可以自动格式化代码，保持代码风格一致。",
  "`list`、`dict`、`set` 等容器类型在堆上分配，Python 自动管理内存。",
  "`copy.copy()` 提供浅拷贝，`copy.deepcopy()` 提供深拷贝。",
  "`collections.deque` 允许高效的双端操作，比列表在两端操作更快。",
  "使用 `async/await` 可以编写异步代码，Python 的 `asyncio` 库非常强大。",
  "`asyncio` 是 Python 的异步运行时，提供了丰富的异步工具。",
  "`json` 是 Python 标准库，支持 JSON 序列化/反序列化，`yaml` 需要第三方库。",
  "使用 `unittest` 或 `pytest` 可以编写单元测试，`pytest` 更现代和强大。",
  "`help()` 函数可以查看任何对象的帮助文档，`dir()` 可以查看对象的属性。",
  "Python 的切片操作非常强大，`s[1:5:2]` 可以指定步长。",
  "`_` 是通配符，可以匹配任何值但不绑定变量，常用于忽略值。",
  "使用 `*args` 和 `**kwargs` 可以接受任意数量的位置参数和关键字参数。",
  "`@property` 装饰器可以将方法转换为属性，提供更优雅的接口。",
  "`__init__` 是构造函数，`__del__` 是析构函数，但通常不需要手动调用。",
  "`threading` 和 `multiprocessing` 提供多线程和多进程支持。",
  "使用 `threading.Thread` 可以创建新线程，但要注意 GIL 的限制。",
  "`threading.Lock` 和 `threading.RLock` 提供线程安全的锁机制。",
  "`collections.defaultdict` 可以避免 KeyError，自动创建默认值。",
  "使用生成器表达式 `(x for x in range(10))` 可以节省内存，延迟计算。",
  "`map`、`filter`、`reduce` 等函数式方法在 Python 中可用，但列表推导式更常用。",
  "`list()` 可以将迭代器转换为列表，`tuple()` 可以转换为元组。",
  "`dict.get(key, default)` 提供了安全的字典访问，避免 KeyError。",
  "使用 `with` 语句可以自动管理资源，确保资源正确释放。",
  "`__str__` 和 `__repr__` 提供了对象字符串表示的标准方式。",
  "`__getattr__` 和 `__setattr__` 允许自定义属性访问行为。",
  "使用 `if __name__ == '__main__'` 可以让代码既可以作为模块导入，也可以直接运行。",
  "`pylint` 和 `flake8` 是 Python 的 linter，可以帮助发现代码中的问题。",
  "Python 的装饰器非常强大，`@decorator` 可以修改函数行为。",
  "上下文管理器（`__enter__` 和 `__exit__`）可以实现资源管理。",
  "`typing` 模块提供了类型提示，虽然不影响运行，但有助于代码可读性。",
  "理解列表、字典、集合和生成器是掌握 Python 的关键，需要时间和实践。"
];

export const COURSE_UNITS: CourseUnit[] = [
  { id: 'unit1', name: 'Python 基础', description: '掌握 Python 的基本语法和核心概念', order: 1 } as CourseUnit,
  { id: 'unit2', name: '数据类型', description: '深入理解 Python 的数据类型和变量', order: 2 } as CourseUnit,
  { id: 'unit3', name: '控制结构', description: '学习条件语句、循环和函数', order: 3 } as CourseUnit,
  { id: 'unit4', name: '数据结构', description: '掌握列表、字典、集合和元组', order: 4 } as CourseUnit,
  { id: 'unit5', name: '面向对象', description: '学习 Python 的类和对象', order: 5 } as CourseUnit,
  { id: 'unit6', name: '模块与包', description: '理解 Python 的模块系统和包管理', order: 6 } as CourseUnit,
  { id: 'unit7', name: '异常处理', description: '掌握 Python 的异常处理机制', order: 7 } as CourseUnit,
  { id: 'unit8', name: '文件操作', description: '学习文件读写和数据处理', order: 8 } as CourseUnit,
  { id: 'unit9', name: '并发编程', description: '掌握 Python 的多线程和多进程', order: 9 } as CourseUnit,
  { id: 'unit10', name: '异步编程', description: '学习 async/await 和异步编程', order: 10 } as CourseUnit,
  { id: 'unit11', name: '高级特性', description: '探索装饰器、生成器和元编程', order: 11 } as CourseUnit,
  { id: 'unit12', name: '实战项目', description: '通过实际项目巩固所学知识', order: 12 } as CourseUnit
];

export const COURSE_CHAPTERS: CourseChapter[] = [
  {
    id: '0',
    unitId: 'unit1',
    title: 'Python 概述',
    description: '了解 Python 语言的基本概念、特点和优势，为学习 Python 打下基础。',
    difficulty: '入门' as Difficulty,
    content: `Python 是一门现代的高级编程语言，由 Guido van Rossum 开发，专注于简洁性、可读性和生产力。

## Python 的特点

1. **简洁优雅**：语法简洁，代码可读性强，适合快速开发
2. **动态类型**：无需声明变量类型，提高开发效率
3. **跨平台**：可在 Windows、Linux、macOS 等平台运行
4. **丰富的库**：拥有庞大的标准库和第三方库生态系统
5. **多范式**：支持面向对象、函数式、过程式等多种编程范式

## Python 的应用场景

- Web 开发（Django、Flask）
- 数据科学和机器学习（NumPy、Pandas、TensorFlow）
- 自动化脚本
- 网络爬虫
- 游戏开发
- 科学计算

## 为什么学习 Python？

Python 以其简洁的语法和强大的功能，成为最受欢迎的编程语言之一。它让你可以快速实现想法，专注于解决问题而不是语法细节。`,
    exampleCode: `# Python 的 Hello World 程序
print("Hello, Python!")

# Python 程序的基本特点
# 1. 无需声明变量类型
# 2. 使用缩进表示代码块
# 3. print() 是内置函数，用于打印输出
# 4. 使用 # 进行注释

# 运行程序
# 使用 python hello.py 运行程序
# 或使用 python -i hello.py 进入交互模式
# 使用 python -m py_compile hello.py 检查语法`,
    summary: [
      'Python 是一门现代高级编程语言，专注于简洁性和生产力。',
      '动态类型系统，语法简洁优雅，代码可读性强。',
      '拥有丰富的标准库和第三方库生态系统。',
      '适合 Web 开发、数据科学、自动化等多种应用场景。',
      '学习 Python 可以快速实现想法，提高开发效率。'
    ]
  } as CourseChapter,
  {
    id: '1',
    unitId: 'unit1',
    title: 'Python 变量与赋值',
    description: '理解 Python 的变量命名规则、赋值机制和变量作用域。',
    difficulty: '入门' as Difficulty,
    content: `在 Python 中，变量不需要声明类型，可以直接赋值使用。这是 Python 动态类型系统的核心特点。

## 变量赋值机制

### 基本赋值

Python 使用赋值运算符 = 来创建和修改变量：
- **动态类型**：变量的类型由赋值的值决定
- **类型可变**：同一个变量可以赋值不同类型的值
- **引用机制**：变量实际上是对象的引用（标签）

**示例：**
\`\`\`python
x = 5  # 整数
x = "hello"  # 现在 x 是字符串
x = [1, 2, 3]  # 现在 x 是列表
\`\`\`

### 多重赋值

Python 支持多种赋值方式：

1. **序列解包**：同时为多个变量赋值
2. **链式赋值**：为多个变量赋相同的值
3. **增量赋值**：简化运算赋值

**示例：**
\`\`\`python
# 序列解包
a, b, c = 1, 2, 3  # 同时赋值
x, y = y, x  # 交换变量值

# 链式赋值
a = b = c = 0  # 三个变量都指向 0

# 增量赋值
count = 5
count += 1  # 等价于 count = count + 1
count *= 2  # 等价于 count = count * 2
\`\`\`

## 变量命名规则

Python 对变量名有严格的规则：

1. **允许字符**：字母（a-z, A-Z）、数字（0-9）、下划线（_）
2. **开头限制**：不能以数字开头
3. **大小写敏感**：name 和 Name 是不同的变量
4. **保留字限制**：不能使用 Python 关键字（如 if、for、def 等）

**命名规范（PEP 8）：**
- 变量名使用 **snake_case**（小写字母和下划线）
- 常量使用 **UPPER_CASE**（全大写）
- 类名使用 **PascalCase**（首字母大写的驼峰）

**好的命名示例：**
\`\`\`python
user_name = "Alice"  # 变量
MAX_SIZE = 1000  # 常量
class UserProfile:  # 类
    pass
\`\`\`

## 变量的作用域

Python 中的变量作用域分为：
- **局部作用域**：函数内部定义的变量
- **全局作用域**：模块级别定义的变量
- **嵌套作用域**：闭包中的外部变量

**注意事项：**
- 函数内部可以读取全局变量
- 要修改全局变量需要使用 global 关键字
- 在函数内部使用与全局变量同名的变量会创建局部变量`,
    exampleCode: `# 1. 基本变量赋值
x = 5
print(f"x 的值是: {x}")

# 2. 修改变量值
y = 10
print(f"y 的初始值: {y}")
y = 20
print(f"y 修改后的值: {y}")

# 3. 多重赋值
a, b, c = 1, 2, 3
print(f"a={a}, b={b}, c={c}")

# 4. 变量类型可以改变
x = 5      # 整数
x = "hello"  # 字符串
print(f"x 现在是: {x}")`,
    summary: [
      '变量无需声明类型，直接赋值即可使用。',
      '变量名遵循命名规则：字母、数字、下划线，不能以数字开头。',
      '变量类型可以动态改变。',
      '支持多重赋值，提高代码简洁性。'
    ]
  } as CourseChapter,
  {
    id: '2',
    unitId: 'unit2',
    title: '数字类型',
    description: '学习 Python 的整数、浮点数和复数类型。',
    difficulty: '入门' as Difficulty,
    content: `Python 支持多种数字类型，每种类型都有其特定的用途和特点。

## 数字类型详解

### 1. 整数 (int)

Python 的整数类型非常强大：
- **无大小限制**：可以表示任意大的整数，不像其他语言有 int32、int64 的限制
- **自动处理**：Python 会自动处理大数运算，不会溢出
- **进制表示**：支持二进制（0b）、八进制（0o）、十六进制（0x）

**示例：**
\`\`\`python
x = 42  # 十进制
y = 0b1010  # 二进制，值为 10
z = 0o52  # 八进制，值为 42
w = 0x2A  # 十六进制，值为 42
big_num = 10**100  # 大整数，Python 自动处理
\`\`\`

### 2. 浮点数 (float)

浮点数用于表示小数：
- **精度限制**：浮点数有精度限制，可能产生精度误差
- **科学计数法**：支持科学计数法表示
- **特殊值**：支持 inf（无穷大）和 nan（非数字）

**示例：**
\`\`\`python
a = 3.14  # 普通浮点数
b = 1.23e-4  # 科学计数法，值为 0.000123
c = float('inf')  # 正无穷
d = float('nan')  # 非数字
\`\`\`

### 3. 复数 (complex)

复数由实部和虚部组成：
- **语法**：使用 j 表示虚部（如 3 + 4j）
- **应用**：常用于科学计算和信号处理
- **属性**：可以访问 real 和 imag 属性

**示例：**
\`\`\`python
z = 3 + 4j  # 复数
print(z.real)  # 3.0（实部）
print(z.imag)  # 4.0（虚部）
print(abs(z))  # 5.0（模）
\`\`\`

## 类型转换

Python 提供了类型转换函数：
- **int()**：转换为整数（会截断小数部分）
- **float()**：转换为浮点数
- **complex()**：创建复数

**注意事项：**
- 从浮点数转换为整数会截断，不是四舍五入
- 字符串转数字需要确保格式正确
- 转换失败会抛出 ValueError 异常

## 数学运算

Python 支持所有基本数学运算：
- 加法 (+)、减法 (-)、乘法 (*)、除法 (/)
- 整除 (//)、取余 (%)、幂运算 (**)
- 使用 math 模块可以进行更复杂的数学运算

**运算特点：**
- Python 3 中，除法 / 总是返回浮点数
- 使用 // 进行整除运算
- 支持链式比较（如 1 < x < 10）`,
    exampleCode: `# 整数类型
x = 42
y = -10
z = 1000000000000000000000000  # 大整数，Python 自动处理

# 浮点数类型
a = 3.14
b = -0.5
c = 1.23e-4  # 科学计数法

# 复数类型
d = 3 + 4j
e = complex(1, 2)  # 1 + 2j

# 类型转换
int_val = int(3.14)  # 3
float_val = float(42)  # 42.0

# 数学运算
print(f"x + y = {x + y}")
print(f"a * b = {a * b}")
print(f"d 的模: {abs(d)}")  # 5.0`,
    summary: [
      'Python 支持整数、浮点数和复数三种数字类型。',
      '整数没有大小限制，可以表示任意大的数。',
      '使用 int() 和 float() 进行类型转换。',
      '支持基本的数学运算和复数运算。'
    ]
  } as CourseChapter,
  {
    id: '3',
    unitId: 'unit3',
    title: '条件语句',
    description: '学习 if、elif、else 条件判断语句。',
    difficulty: '入门' as Difficulty,
    content: `Python 使用 if、elif 和 else 关键字进行条件判断，这是控制程序流程的基本结构。

## 条件语句结构

### 基本语法

Python 的条件语句结构：
- **if**：如果条件为真（True），执行代码块
- **elif**：如果前面的条件为假，检查这个条件（可以有多个）
- **else**：如果所有条件都为假，执行这个代码块（可选）

**重要特性：**
- Python 使用**缩进**（通常是 4 个空格）来表示代码块
- 缩进是 Python 语法的强制要求，不是可选的
- 条件表达式的真值判断：非零、非空、非 None 都被视为 True

### if 语句

最简单的条件判断：

**示例：**
\`\`\`python
age = 18
if age >= 18:
    print("你已经成年了")
\`\`\`

### if-else 语句

二选一的条件判断：

**示例：**
\`\`\`python
score = 85
if score >= 60:
    print("及格")
else:
    print("不及格")
\`\`\`

### if-elif-else 语句

多分支条件判断：

**示例：**
\`\`\`python
grade = 85
if grade >= 90:
    print("优秀")
elif grade >= 80:
    print("良好")
elif grade >= 60:
    print("及格")
else:
    print("不及格")
\`\`\`

## 条件表达式

Python 的条件表达式（三元运算符）：

**语法：** \`值1 if 条件 else 值2\`

**示例：**
\`\`\`python
result = "通过" if score >= 60 else "不通过"
max_value = x if x > y else y
\`\`\`

## 逻辑运算符

Python 支持逻辑运算：
- **and**：逻辑与，两个条件都为真时返回 True
- **or**：逻辑或，至少一个条件为真时返回 True
- **not**：逻辑非，反转布尔值

**示例：**
\`\`\`python
age = 25
has_license = True
if age >= 18 and has_license:
    print("可以开车")

if age < 18 or age > 65:
    print("特殊群体")

if not has_license:
    print("需要考取驾照")
\`\`\`

## 比较运算符

Python 支持多种比较运算符：
- **==**：等于
- **!=**：不等于
- **<**、**>**：小于、大于
- **<=**、**>=**：小于等于、大于等于
- **is**、**is not**：身份比较（检查是否是同一个对象）
- **in**、**not in**：成员资格测试

**注意事项：**
- \`==\` 比较值，\`is\` 比较对象身份
- 对于小整数和字符串，Python 会缓存，is 可能为 True
- 通常使用 == 比较值，is 比较 None`,
    exampleCode: `# 基本 if 语句
age = 18
if age >= 18:
    print("你已经成年了")

# if-else 语句
score = 85
if score >= 60:
    print("及格")
else:
    print("不及格")

# if-elif-else 语句
grade = 85
if grade >= 90:
    print("优秀")
elif grade >= 80:
    print("良好")
elif grade >= 60:
    print("及格")
else:
    print("不及格")

# 三元运算符
result = "通过" if score >= 60 else "不通过"
print(result)`,
    summary: [
      '使用 if、elif、else 进行条件判断。',
      'Python 使用缩进表示代码块。',
      '支持嵌套的条件语句。',
      '可以使用三元运算符简化简单的条件判断。'
    ]
  } as CourseChapter,
  {
    id: '4',
    unitId: 'unit3',
    title: '循环语句',
    description: '学习 for 和 while 循环，掌握循环控制。',
    difficulty: '入门' as Difficulty,
    content: `Python 提供了两种主要的循环语句，用于重复执行代码块。

## 循环语句类型

### 1. for 循环

for 循环用于遍历序列（列表、字符串、元组、字典等）：

**基本语法：**
\`\`\`python
for 变量 in 序列:
    代码块
\`\`\`

**特点：**
- 自动遍历序列中的每个元素
- 不需要手动管理索引
- 代码简洁易读
- 可以配合 range() 函数生成数字序列

**常用场景：**
- 遍历列表、字符串等序列
- 配合 range() 执行固定次数的循环
- 遍历字典的键、值或键值对

### 2. while 循环

while 循环在条件为真时重复执行：

**基本语法：**
\`\`\`python
while 条件:
    代码块
\`\`\`

**特点：**
- 条件为真时继续执行
- 需要在循环体内改变条件，避免无限循环
- 适合不确定循环次数的情况

**使用场景：**
- 需要满足某个条件时才执行的循环
- 处理用户输入（直到输入有效值）
- 监控状态变化

## 循环控制语句

Python 提供了三种循环控制语句：

### break 语句

**作用：** 立即跳出当前循环，不再执行后续迭代

**使用场景：**
- 找到目标元素后提前退出
- 满足某个条件时终止循环
- 避免不必要的迭代

### continue 语句

**作用：** 跳过当前迭代的剩余代码，继续下一次循环

**使用场景：**
- 跳过不符合条件的元素
- 处理异常情况但不终止循环
- 优化循环性能（提前跳过）

### else 子句

**特点：** 当循环正常结束时执行（不是通过 break 退出）

**使用场景：**
- 检查循环是否完整执行
- 循环未找到目标时的处理
- 清理工作或结果验证

**注意事项：**
- else 只在不使用 break 退出时执行
- 可以用于 for 和 while 循环

## 嵌套循环

Python 支持循环嵌套，可以在循环内部使用另一个循环：

**常见应用：**
- 处理二维数据结构
- 生成组合和排列
- 矩阵运算
- 多维度遍历

**性能考虑：**
- 嵌套循环的时间复杂度是 O(n²) 或更高
- 对于大数据集，考虑使用更高效的算法或工具（如 NumPy）`,
    exampleCode: `# for 循环遍历列表
fruits = ["苹果", "香蕉", "橙子"]
for fruit in fruits:
    print(fruit)

# for 循环配合 range
for i in range(5):
    print(i)  # 0, 1, 2, 3, 4

# while 循环
count = 0
while count < 5:
    print(count)
    count += 1

# break 和 continue
for i in range(10):
    if i == 3:
        continue  # 跳过 3
    if i == 7:
        break  # 在 7 时退出
    print(i)

# for-else
for i in range(5):
    if i == 10:
        break
else:
    print("循环正常结束")`,
    summary: [
      'for 循环用于遍历序列。',
      'while 循环在条件为真时重复执行。',
      'break 跳出循环，continue 跳过当前迭代。',
      'for-else 在循环正常结束时执行。'
    ]
  } as CourseChapter,
  // 单元1：Python 基础
  {
    id: '5',
    unitId: 'unit1',
    title: '字符串类型',
    description: '学习 Python 的字符串操作和格式化。',
    difficulty: '入门' as Difficulty,
    content: `Python 的字符串是不可变序列，是编程中最常用的数据类型之一。

## 字符串的定义

Python 提供了多种方式定义字符串：

### 1. 单引号和双引号

**特点：**
- 单引号和双引号功能相同
- 可以嵌套使用，避免转义
- 用于定义单行字符串

**示例：**
\`\`\`python
s1 = '单引号字符串'
s2 = "双引号字符串"
s3 = "It's a string"  # 使用双引号包含单引号
s4 = 'He said "Hello"'  # 使用单引号包含双引号
\`\`\`

### 2. 三引号

**特点：**
- 可以定义多行字符串
- 保留字符串中的换行和空格
- 常用于文档字符串（docstring）

**示例：**
\`\`\`python
s = """这是
一个多行
字符串"""
\`\`\`

### 3. 原始字符串（r-string）

**特点：**
- 使用 r 或 R 前缀
- 反斜杠不会被转义
- 常用于正则表达式和文件路径

**示例：**
\`\`\`python
path = r"C:\Users\Name\Documents"  # 不需要转义反斜杠
pattern = r"\\d+"  # 正则表达式
\`\`\`

### 4. 格式化字符串（f-string）

**特点：**
- Python 3.6+ 引入
- 使用 f 或 F 前缀
- 在字符串中直接嵌入表达式
- 性能好，可读性强（推荐使用）

**示例：**
\`\`\`python
name = "Python"
version = 3.11
info = f"语言: {name}, 版本: {version}"
\`\`\`

## 字符串操作

### 字符串拼接

Python 提供了多种拼接方式：

1. **+ 运算符**：连接两个字符串（不推荐大量拼接）
2. **join() 方法**：高效拼接多个字符串（推荐）
3. **格式化**：使用 f-string 或 format() 方法

**性能提示：**
- 大量字符串拼接使用 join() 方法
- + 运算符在循环中使用会产生多个临时对象，性能差

### 字符串切片

字符串支持索引和切片操作：

- **索引**：访问单个字符（从 0 开始，支持负数索引）
- **切片**：访问子字符串（语法：\`[start:stop:step]\`）

**示例：**
\`\`\`python
s = "Python"
print(s[0])      # P（第一个字符）
print(s[-1])     # n（最后一个字符）
print(s[1:4])    # yth（切片）
print(s[::-1])   # nohtyP（反转）
\`\`\`

## 字符串方法

Python 提供了丰富的字符串方法：

### 查找和替换

- **find() / index()**：查找子字符串位置
- **replace()**：替换子字符串
- **count()**：统计出现次数

### 大小写转换

- **upper() / lower()**：转换为大写/小写
- **title() / capitalize()**：首字母大写
- **swapcase()**：大小写互换

### 去除空白

- **strip()**：去除首尾空白字符
- **lstrip() / rstrip()**：去除左侧/右侧空白

### 分割和连接

- **split()**：按分隔符分割字符串
- **join()**：连接字符串序列
- **partition() / rpartition()**：分割为三部分

### 判断方法

- **startswith() / endswith()**：检查开头/结尾
- **isalpha() / isdigit() / isalnum()**：判断字符类型
- **isspace()**：判断是否全为空白

## 字符串格式化

### f-string（推荐）

Python 3.6+ 推荐使用的格式化方式：

**示例：**
\`\`\`python
name = "Alice"
age = 25
info = f"姓名: {name}, 年龄: {age}, 明年: {age + 1}"
\`\`\`

### format() 方法

Python 2.7+ 支持的方法：

**示例：**
\`\`\`python
"姓名: {}, 年龄: {}".format(name, age)
"姓名: {0}, 年龄: {1}".format(name, age)
"姓名: {name}, 年龄: {age}".format(name=name, age=age)
\`\`\`

### % 格式化（旧式）

Python 2 风格的格式化（不推荐，但兼容性最好）：

**示例：**
\`\`\`python
"姓名: %s, 年龄: %d" % (name, age)
\`\`\`

## 字符串的不可变性

**重要特性：**
- 字符串是不可变的，创建后不能修改
- 所有"修改"操作都返回新字符串
- 字符串可以作为字典的键（因为不可变）

**示例：**
\`\`\`python
s = "hello"
s.upper()  # 返回 "HELLO"，但 s 仍然是 "hello"
s = s.upper()  # 需要重新赋值
\`\`\``,
    exampleCode: `# 字符串定义
s1 = '单引号字符串'
s2 = "双引号字符串"
s3 = """多行
字符串"""
s4 = r"原始字符串\n不会转义"

# 字符串拼接
name = "Python"
greeting = "Hello, " + name

# 字符串格式化
age = 25
info = f"我今年{age}岁"  # f-string (Python 3.6+)
info2 = "我今年{}岁".format(age)  # format 方法

# 字符串方法
text = "  Hello World  "
print(text.strip())  # 去除首尾空格
print(text.upper())  # 转大写
print(text.lower())  # 转小写
print(text.split())  # 分割字符串

# 字符串切片
s = "Python"
print(s[0])  # P
print(s[1:4])  # yth
print(s[::-1])  # nohtyP (反转)`,
    summary: [
      'Python 字符串是不可变序列。',
      '支持单引号、双引号、三引号定义。',
      'f-string 是推荐的字符串格式化方式。',
      '提供了丰富的字符串操作方法。',
      '支持字符串切片和索引访问。'
    ]
  } as CourseChapter,
  {
    id: '6',
    unitId: 'unit3',
    title: '函数',
    description: '学习如何定义和调用函数，理解参数和返回值。',
    difficulty: '入门' as Difficulty,
    content: `函数是 Python 代码的基本构建块，用于组织和复用代码。

## 函数的定义

使用 \`def\` 关键字定义函数：

**基本语法：**
\`\`\`python
def 函数名(参数列表):
    """文档字符串（可选）"""
    函数体
    return 返回值（可选）
\`\`\`

**命名规范：**
- 函数名使用 **snake_case**（小写字母和下划线）
- 函数名应该清晰描述函数的功能
- 避免使用 Python 内置函数名

## 函数参数

Python 函数支持多种参数类型：

### 1. 位置参数

按顺序传递的参数：

**示例：**
\`\`\`python
def add(x, y):
    return x + y
result = add(3, 5)  # x=3, y=5
\`\`\`

### 2. 关键字参数

使用参数名传递，顺序可以改变：

**示例：**
\`\`\`python
def create_user(name, age, email):
    return {"name": name, "age": age, "email": email}
user = create_user(age=25, name="Alice", email="alice@example.com")
\`\`\`

### 3. 默认参数

参数有默认值，调用时可以省略：

**示例：**
\`\`\`python
def greet(name, greeting="Hello"):
    return f"{greeting}, {name}!"
print(greet("Python"))  # 使用默认值
print(greet("Python", "Hi"))  # 覆盖默认值
\`\`\`

**注意事项：**
- 默认参数必须是不可变对象（避免使用列表、字典等可变对象）
- 有默认值的参数必须在没有默认值的参数之后

### 4. 可变参数

#### *args（位置参数打包）

接收任意数量的位置参数，打包成元组：

**示例：**
\`\`\`python
def sum_all(*args):
    total = 0
    for num in args:
        total += num
    return total
print(sum_all(1, 2, 3, 4, 5))  # 15
\`\`\`

#### **kwargs（关键字参数打包）

接收任意数量的关键字参数，打包成字典：

**示例：**
\`\`\`python
def print_info(**kwargs):
    for key, value in kwargs.items():
        print(f"{key}: {value}")
print_info(name="Bob", age=30, city="Beijing")
\`\`\`

### 参数顺序

参数必须按以下顺序定义：
1. 位置参数
2. *args
3. 默认参数
4. **kwargs

## 返回值

### return 语句

- 使用 \`return\` 返回值
- 可以返回多个值（实际上是返回元组）
- 没有 return 或 return 后无值，函数返回 \`None\`

**示例：**
\`\`\`python
def divide(x, y):
    if y == 0:
        return None  # 或 raise ValueError
    return x / y

def get_name_and_age():
    return "Alice", 25  # 返回元组
name, age = get_name_and_age()  # 解包
\`\`\`

## 函数的作用域

- **局部变量**：函数内部定义的变量
- **全局变量**：模块级别定义的变量
- **global 关键字**：在函数内修改全局变量

**示例：**
\`\`\`python
count = 0  # 全局变量
def increment():
    global count  # 声明使用全局变量
    count += 1
\`\`\`

## 匿名函数（lambda）

Lambda 函数用于简单的单行函数：

**语法：** \`lambda 参数: 表达式\`

**示例：**
\`\`\`python
add = lambda x, y: x + y
square = lambda x: x ** 2
\`\`\`

**使用场景：**
- 作为参数传递给高阶函数（map、filter、sorted 等）
- 简单的函数定义
- 不推荐用于复杂逻辑`,
    exampleCode: `# 基本函数定义
def add(x, y):
    return x + y

result = add(5, 3)
print(f"5 + 3 = {result}")

# 带默认参数的函数
def greet(name, greeting="Hello"):
    return f"{greeting}, {name}!"

print(greet("Python"))
print(greet("Python", "Hi"))

# 关键字参数
def create_user(name, age, email):
    return {"name": name, "age": age, "email": email}

user = create_user(age=25, name="Alice", email="alice@example.com")

# 可变参数
def sum_all(*args):
    total = 0
    for num in args:
        total += num
    return total

print(sum_all(1, 2, 3, 4, 5))  # 15

# 关键字可变参数
def print_info(**kwargs):
    for key, value in kwargs.items():
        print(f"{key}: {value}")

print_info(name="Bob", age=30)

# 无返回值函数
def say_hello(name):
    print(f"Hello, {name}!")
    # 没有 return，默认返回 None`,
    summary: [
      '使用 def 关键字定义函数。',
      '函数参数可以有默认值。',
      '使用 return 返回值，没有 return 返回 None。',
      '支持 *args 和 **kwargs 可变参数。',
      '函数名使用 snake_case 命名。'
    ]
  } as CourseChapter,
  {
    id: '7',
    unitId: 'unit1',
    title: '注释',
    description: '学习如何在代码中添加注释，提高代码可读性。',
    difficulty: '入门' as Difficulty,
    content: `注释是代码中不会被执行的文本，用于解释代码的功能和逻辑。

## 注释的类型

Python 支持行注释和文档字符串两种注释方式：

### 1. 行注释

使用 \`#\` 符号创建行注释：
- 从 \`#\` 开始到行尾的所有内容都是注释
- 可以单独一行，也可以放在代码行的末尾
- 用于解释代码逻辑、临时禁用代码等

**示例：**
\`\`\`python
# 这是单独的行注释
x = 5  # 这是行尾注释

# 多行注释可以这样写
# 每一行都需要 # 符号
# Python 没有真正的块注释
\`\`\`

### 2. 文档字符串（Docstring）

文档字符串用于函数、类和模块的文档：
- 使用三重引号 \`"""\` 或 \`'''\` 包围
- 通常放在函数或类的第一行
- 可以使用工具（如 Sphinx）生成文档

**示例：**
\`\`\`python
def add(x, y):
    """
    计算两个数的和
    
    Args:
        x: 第一个数
        y: 第二个数
    
    Returns:
        两个数的和
    """
    return x + y
\`\`\`

## 注释的最佳实践

### 何时使用注释

1. **解释"为什么"**：解释代码的意图和设计决策
2. **复杂逻辑**：解释复杂的算法或业务逻辑
3. **TODO/FIXME**：标记待办事项和需要修复的问题
4. **参数说明**：在函数中说明参数的含义

### 注释的注意事项

- **不要过度注释**：代码应该自解释，避免注释显而易见的代码
- **保持更新**：修改代码时同步更新注释
- **使用清晰的语言**：注释应该清晰、简洁、准确
- **遵循规范**：使用 PEP 257 规范编写文档字符串

**好的注释示例：**
\`\`\`python
# 使用快速排序算法（时间复杂度 O(n log n)）
def quick_sort(arr):
    """快速排序实现"""
    # TODO: 添加对空列表的处理
    # FIXME: 处理包含重复元素的情况
    pass
\`\`\`

**避免的注释：**
\`\`\`python
# 设置 x 为 5（这是不好的注释，代码已经很清楚了）
x = 5
\`\`\``,
    exampleCode: `# 这是单独的行注释
x = 5  # 这是行尾注释

# 多行注释需要每一行都使用 #
# 这是第一行注释
# 这是第二行注释
# Python 没有真正的块注释语法

# 文档字符串示例
def add(x, y):
    """
    计算两个数的和
    
    Args:
        x: 第一个数
        y: 第二个数
    
    Returns:
        两个数的和
    """
    return x + y

class Person:
    """
    表示一个人的类
    
    这个类包含姓名和年龄信息
    """
    def __init__(self, name, age):
        self.name = name
        self.age = age

# TODO: 添加错误处理
# FIXME: 修复边界情况
# NOTE: 这是一个重要的实现细节`,
    summary: [
      '# 用于行注释，从 # 到行尾都是注释。',
      '使用三重引号 """ 或 \'\'\' 创建文档字符串。',
      '文档字符串应该放在函数、类和模块的第一行。',
      '注释应该解释"为什么"而不是"是什么"。',
      '使用 TODO/FIXME/NOTE 标记特殊的注释。'
    ]
  } as CourseChapter,
  {
    id: '8',
    unitId: 'unit1',
    title: '控制流：if/else',
    description: '学习使用条件语句控制程序执行流程。',
    difficulty: '入门' as Difficulty,
    content: `if 表达式允许根据条件执行不同的代码分支。

在 Python 中，if 是一个条件语句，用于控制程序流程。条件表达式会被求值为布尔值。`,
    exampleCode: `fn main() {
    let number = 6;
    
    // 基本的 if 语句
    if number < 5 {
        println!("数字小于 5");
    } else {
        println!("数字大于等于 5");
    }
    
    // if-else if-else
    if number % 4 == 0 {
        println!("数字能被 4 整除");
    } else if number % 3 == 0 {
        println!("数字能被 3 整除");
    } else if number % 2 == 0 {
        println!("数字能被 2 整除");
    } else {
        println!("数字不能被 2、3 或 4 整除");
    }
    
    // if 作为表达式
    let condition = true;
    let result = if condition {
        5  // 注意：没有分号
    } else {
        6
    };
    println!("结果是: {}", result);
    
    // 在 let 语句中使用 if
    let number = if true { 42 } else { 0 };
    println!("number = {}", number);
}`,
    summary: [
      'if 条件必须是 bool 类型。',
      'if 是表达式，可以返回值。',
      '使用 else if 处理多个条件。',
      'if 表达式中的分支必须返回相同类型。',
      '代码块的最后一行（无分号）作为返回值。'
    ]
  } as CourseChapter,
  {
    id: '9',
    unitId: 'unit1',
    title: '循环：loop、while、for',
    description: '学习三种循环方式，掌握如何重复执行代码。',
    difficulty: '入门' as Difficulty,
    content: `Python 提供了多种循环方式：
1. while：条件循环
2. for：遍历集合或范围
3. 嵌套循环和循环控制

Python 还支持循环的 else 子句，用于处理循环正常结束的情况。`,
    exampleCode: `# 1. while - 条件循环
number = 3
while number != 0:
    print(f"{number}!")
    number -= 1
print("发射！")

# 2. for - 遍历集合
my_list = [10, 20, 30, 40, 50]
for element in my_list:
    print(f"值是: {element}")

# for 遍历字符串
for char in "Python":
    print(char)

# for 遍历字典
person = {"name": "Alice", "age": 25}
for key, value in person.items():
    print(f"{key}: {value}")

# for 遍历范围（range）
for number in range(1, 4):  # 1, 2, 3 (不包含4)
    print(f"{number}!")

for number in range(1, 5):  # 1, 2, 3, 4 (包含4)
    print(f"{number}!")

# range() 的完整用法
range(10)        # 0, 1, 2, ..., 9
range(1, 10)     # 1, 2, 3, ..., 9
range(1, 10, 2)  # 1, 3, 5, 7, 9 (步长为2)

# 3. 循环控制
# break - 跳出循环
for i in range(10):
    if i == 5:
        break
    print(i)  # 0, 1, 2, 3, 4

# continue - 跳过当前迭代
for i in range(10):
    if i % 2 == 0:
        continue
    print(i)  # 1, 3, 5, 7, 9

# 4. 嵌套循环
for i in range(3):
    for j in range(3):
        print(f"({i}, {j})")

# 5. for-else 和 while-else
for i in range(5):
    if i == 10:
        break
else:
    print("循环正常结束")  # 会执行

for i in range(5):
    if i == 3:
        break
else:
    print("循环正常结束")  # 不会执行

# 6. enumerate() - 获取索引和值
items = ['a', 'b', 'c']
for index, value in enumerate(items):
    print(f"{index}: {value}")

# 7. zip() - 同时遍历多个序列
names = ['Alice', 'Bob', 'Charlie']
ages = [25, 30, 35]
for name, age in zip(names, ages):
    print(f"{name}: {age}")`,
    summary: [
      'while 根据条件重复执行代码块。',
      'for 用于遍历集合、字符串、字典或范围。',
      'range() 函数生成数字序列，常用于 for 循环。',
      'break 跳出循环，continue 跳过当前迭代。',
      '循环可以嵌套使用。',
      'for-else 和 while-else 在循环正常结束时执行。',
      '使用 enumerate() 获取索引和值，zip() 同时遍历多个序列。'
    ]
  } as CourseChapter,
  {
    id: '10',
    unitId: 'unit1',
    title: '对象引用和内存管理',
    description: '初步了解 Python 的对象引用和垃圾回收机制，理解作用域和变量的生命周期。',
    difficulty: '入门' as Difficulty,
    content: `Python 使用引用计数和垃圾回收来管理内存。对象在不再被引用时会被自动回收。

## Python 的内存管理机制

### 1. 引用计数

Python 使用引用计数（Reference Counting）作为主要的内存管理机制：
- 每个对象都有一个引用计数
- 当对象被引用时，计数增加
- 当引用被删除时，计数减少
- 当计数为 0 时，对象被回收

### 2. 垃圾回收

除了引用计数，Python 还使用循环垃圾回收器（Cycle Detector）来处理循环引用：
- 检测无法通过引用计数回收的对象
- 定期清理循环引用的对象

### 3. 对象和引用

在 Python 中，变量是对象的引用，而不是对象本身：
- 变量存储的是对象的引用（内存地址）
- 多个变量可以引用同一个对象
- 对象在不再被引用时会被自动回收

### 4. 可变和不可变对象

Python 中的对象分为可变和不可变两类：
- **不可变对象**：数字、字符串、元组等，创建后不能修改
- **可变对象**：列表、字典、集合等，可以修改内容

### 5. 作用域和生命周期

作用域是变量有效的代码范围：
- 变量从声明处开始有效
- 当变量离开作用域时，引用被删除
- 如果对象没有其他引用，会被垃圾回收`,
    exampleCode: `# 1. 引用计数示例
import sys

# 创建对象
x = [1, 2, 3]
print(f"引用计数: {sys.getrefcount(x)}")  # 注意：getrefcount 会临时增加一个引用

# 多个变量引用同一个对象
y = x
z = x
print(f"引用计数: {sys.getrefcount(x)}")  # 增加

# 删除引用
del y
del z
print(f"引用计数: {sys.getrefcount(x)}")  # 减少

# 2. 对象和引用的区别
# 不可变对象
a = "hello"
b = a  # a 和 b 引用同一个字符串对象
print(f"a is b: {a is b}")  # True（同一个对象）

# 可变对象
list1 = [1, 2, 3]
list2 = list1  # list1 和 list2 引用同一个列表对象
list2.append(4)
print(f"list1: {list1}")  # [1, 2, 3, 4]（被修改了！）
print(f"list2: {list2}")  # [1, 2, 3, 4]
print(f"list1 is list2: {list1 is list2}")  # True

# 3. 作用域和生命周期
def function():
    local_var = "局部变量"
    print(f"函数内部: {local_var}")
    # local_var 在这里有效

function()
# print(local_var)  # 错误！NameError: name 'local_var' is not defined

# 4. 不可变对象的行为
str1 = "hello"
str2 = str1
str2 = str2 + " world"  # 创建新对象，不修改原对象
print(f"str1: {str1}")  # "hello"（未改变）
print(f"str2: {str2}")  # "hello world"（新对象）
print(f"str1 is str2: {str1 is str2}")  # False（不同对象）

# 5. 可变对象的行为
list1 = [1, 2, 3]
list2 = list1
list2.append(4)  # 修改原对象
print(f"list1: {list1}")  # [1, 2, 3, 4]（被修改）
print(f"list2: {list2}")  # [1, 2, 3, 4]
print(f"list1 is list2: {list1 is list2}")  # True（同一对象）

# 6. 创建副本（避免共享）
list1 = [1, 2, 3]
list2 = list1.copy()  # 或 list2 = list1[:]
list2.append(4)
print(f"list1: {list1}")  # [1, 2, 3]（未改变）
print(f"list2: {list2}")  # [1, 2, 3, 4]
print(f"list1 is list2: {list1 is list2}")  # False（不同对象）`,
    summary: [
      'Python 使用引用计数和垃圾回收来管理内存。',
      '变量是对象的引用，多个变量可以引用同一个对象。',
      '不可变对象（如字符串）在修改时会创建新对象。',
      '可变对象（如列表）在修改时会修改原对象。',
      '作用域决定变量的生命周期，离开作用域时引用被删除。',
      '使用 copy() 或切片创建副本，避免共享可变对象。',
      '理解对象引用对于避免意外的副作用非常重要。'
    ]
  } as CourseChapter,
  {
    id: '11',
    unitId: 'unit1',
    title: '作用域',
    description: '深入理解作用域的概念，掌握变量的生命周期。',
    difficulty: '入门' as Difficulty,
    content: `作用域是变量有效的代码范围。变量从声明处开始有效，直到作用域结束。

理解作用域对于理解所有权和借用非常重要。`,
    exampleCode: `fn main() {
    // 外层作用域
    let outer = "outer";
    println!("外层: {}", outer);
    
    {
        // 内层作用域
        let inner = "inner";
        println!("内层: {}", inner);
        println!("外层（在内层中）: {}", outer);  // 可以访问外层变量
    }  // inner 在这里失效
    
    // println!("{}", inner);  // 错误！inner 已不在作用域中
    println!("外层（在外层中）: {}", outer);
    
    // 变量遮蔽（Shadowing）
    let x = 5;
    let x = x + 1;  // 遮蔽了之前的 x
    {
        let x = x * 2;  // 遮蔽了外层的 x
        println!("内层 x: {}", x);  // 12
    }
    println!("外层 x: {}", x);  // 6
}`,
    summary: [
      '作用域决定变量的生命周期。',
      '内层作用域可以访问外层变量。',
      '变量离开作用域后失效。',
      '可以使用 let 遮蔽同名变量。',
      '遮蔽创建新变量，不影响原变量。'
    ]
  } as CourseChapter,
  // 单元2：对象引用和内存管理
  {
    id: '12',
    unitId: 'unit2',
    title: '对象引用规则',
    description: '深入理解 Python 对象引用的基本规则和内存管理机制。',
    difficulty: '进阶' as Difficulty,
    content: `Python 对象引用的基本规则：

## 1. 对象引用规则

### 规则一：对象通过引用访问

在 Python 中，变量存储的是对象的引用（内存地址），而不是对象本身：
- 变量名绑定到对象
- 多个变量可以引用同一个对象
- 使用 \`is\` 运算符检查是否是同一个对象

### 规则二：引用计数管理内存

Python 使用引用计数来管理对象生命周期：
- 对象被引用时，计数增加
- 引用被删除时，计数减少
- 当计数为 0 时，对象被回收

### 规则三：作用域决定引用生命周期

变量的作用域决定引用的生命周期：
- 变量在作用域内有效
- 离开作用域时，引用被删除
- 如果对象没有其他引用，会被垃圾回收

## 2. 可变和不可变对象

### 不可变对象

不可变对象（如整数、字符串、元组）：
- 创建后不能修改
- 修改操作会创建新对象
- 多个变量可以安全地共享同一个不可变对象

### 可变对象

可变对象（如列表、字典、集合）：
- 可以修改内容
- 多个变量引用同一个可变对象时，修改会影响所有引用
- 需要小心处理，避免意外的副作用

## 3. 对象比较

Python 提供了两种比较方式：
- \`==\`：值相等比较（内容相同）
- \`is\`：身份比较（是否是同一个对象）

## 4. 内存管理最佳实践

1. **理解引用语义**：知道何时创建新对象，何时共享对象
2. **使用副本**：需要独立修改时，使用 \`copy()\` 或切片创建副本
3. **避免循环引用**：注意对象之间的循环引用，可能导致内存泄漏
4. **及时删除引用**：不再需要的大对象，及时删除引用以释放内存`,
    exampleCode: `# 1. 对象引用规则
# 规则一：变量存储对象的引用
x = [1, 2, 3]
y = x  # y 和 x 引用同一个对象
print(f"x is y: {x is y}")  # True
print(f"id(x): {id(x)}, id(y): {id(y)}")  # 相同的内存地址

# 规则二：引用计数管理
import sys
obj = [1, 2, 3]
print(f"引用计数: {sys.getrefcount(obj)}")
ref1 = obj
ref2 = obj
print(f"引用计数: {sys.getrefcount(obj)}")  # 增加
del ref1, ref2
print(f"引用计数: {sys.getrefcount(obj)}")  # 减少

# 规则三：作用域决定生命周期
def function():
    local_obj = [1, 2, 3]
    return local_obj  # 返回对象，引用被传递

result = function()  # 对象仍然存在，因为被 result 引用
print(f"result: {result}")

# 2. 不可变对象的行为
# 整数
a = 100
b = 100
print(f"a is b: {a is b}")  # True（小整数被缓存）

# 字符串
str1 = "hello"
str2 = str1
str2 = str2 + " world"  # 创建新对象
print(f"str1: {str1}")  # "hello"（未改变）
print(f"str1 is str2: {str1 is str2}")  # False

# 元组
tuple1 = (1, 2, 3)
tuple2 = tuple1
print(f"tuple1 is tuple2: {tuple1 is tuple2}")  # True

# 3. 可变对象的行为
# 列表
list1 = [1, 2, 3]
list2 = list1
list2.append(4)  # 修改原对象
print(f"list1: {list1}")  # [1, 2, 3, 4]（被修改！）
print(f"list1 is list2: {list1 is list2}")  # True

# 字典
dict1 = {"a": 1, "b": 2}
dict2 = dict1
dict2["c"] = 3  # 修改原对象
print(f"dict1: {dict1}")  # {"a": 1, "b": 2, "c": 3}（被修改！）

# 4. 创建副本避免共享
# 浅拷贝
list1 = [1, 2, 3]
list2 = list1.copy()  # 或 list1[:]
list2.append(4)
print(f"list1: {list1}")  # [1, 2, 3]（未改变）
print(f"list2: {list2}")  # [1, 2, 3, 4]

# 深拷贝（嵌套对象）
import copy
list1 = [[1, 2], [3, 4]]
list2 = copy.deepcopy(list1)
list2[0].append(5)
print(f"list1: {list1}")  # [[1, 2], [3, 4]]（未改变）
print(f"list2: {list2}")  # [[1, 2, 5], [3, 4]]

# 5. 对象比较
# == 比较值
list1 = [1, 2, 3]
list2 = [1, 2, 3]
print(f"list1 == list2: {list1 == list2}")  # True（值相等）
print(f"list1 is list2: {list1 is list2}")  # False（不同对象）

# is 比较身份
list3 = list1
print(f"list1 is list3: {list1 is list3}")  # True（同一对象）

# 6. 垃圾回收示例
class MyClass:
    def __init__(self, name):
        self.name = name
    def __del__(self):
        print(f"{self.name} 被回收")

obj1 = MyClass("对象1")
obj2 = MyClass("对象2")
obj1 = None  # 删除引用
# 对象1可能在这里被回收（取决于垃圾回收器）

# 7. 循环引用（需要循环垃圾回收器）
class Node:
    def __init__(self, value):
        self.value = value
        self.next = None

node1 = Node(1)
node2 = Node(2)
node1.next = node2
node2.next = node1  # 循环引用
# 即使删除外部引用，对象也不会被引用计数回收
# 需要循环垃圾回收器处理`,
    summary: [
      'Python 中变量存储对象的引用，而不是对象本身。',
      '多个变量可以引用同一个对象，使用 is 检查是否是同一对象。',
      '引用计数管理对象生命周期，计数为 0 时对象被回收。',
      '不可变对象修改时创建新对象，可变对象修改时修改原对象。',
      '作用域决定引用生命周期，离开作用域时引用被删除。',
      '使用 copy() 或 deepcopy() 创建副本，避免共享可变对象。',
      '理解对象引用对于避免意外的副作用和内存管理非常重要。'
    ]
  } as CourseChapter,
  {
    id: '13',
    unitId: 'unit2',
    title: '对象赋值和传递',
    description: '理解 Python 中对象赋值和函数参数传递的机制。',
    difficulty: '进阶' as Difficulty,
    content: `在 Python 中，赋值和函数参数传递都是传递对象的引用，而不是复制对象。

## 1. 赋值操作

### 不可变对象

对于不可变对象（如整数、字符串、元组）：
- 赋值操作传递引用
- 由于对象不可变，多个变量共享同一个对象是安全的
- 修改操作会创建新对象，不影响原对象

### 可变对象

对于可变对象（如列表、字典）：
- 赋值操作传递引用
- 多个变量引用同一个对象
- 通过任一引用修改对象，会影响所有引用

## 2. 函数参数传递

Python 的函数参数传递是"按引用传递"（Pass by Reference）：
- 传递的是对象的引用，不是对象的副本
- 对于不可变对象，函数内部无法修改原对象
- 对于可变对象，函数内部可以修改原对象

## 3. 返回值

函数返回值也是传递对象的引用：
- 返回的对象不会被复制
- 如果返回局部变量，对象仍然存在（因为被返回的引用持有）

## 4. 避免意外修改

如果需要避免修改原对象：
- 使用 \`copy()\` 创建浅拷贝
- 使用 \`deepcopy()\` 创建深拷贝
- 对于不可变对象，无需担心`,
    exampleCode: `# 1. 不可变对象的赋值
# 整数
x = 10
y = x  # y 和 x 引用同一个整数对象
print(f"x is y: {x is y}")  # True（小整数被缓存）
y = 20  # 创建新对象，不影响 x
print(f"x: {x}, y: {y}")  # x: 10, y: 20

# 字符串
str1 = "hello"
str2 = str1  # str2 和 str1 引用同一个字符串对象
str2 = str2 + " world"  # 创建新对象
print(f"str1: {str1}")  # "hello"（未改变）
print(f"str2: {str2}")  # "hello world"

# 2. 可变对象的赋值
list1 = [1, 2, 3]
list2 = list1  # list2 和 list1 引用同一个列表对象
list2.append(4)  # 修改原对象
print(f"list1: {list1}")  # [1, 2, 3, 4]（被修改！）
print(f"list2: {list2}")  # [1, 2, 3, 4]
print(f"list1 is list2: {list1 is list2}")  # True

# 3. 函数参数传递（不可变对象）
def modify_number(x):
    x = x + 1  # 创建新对象，不影响原变量
    print(f"函数内部 x: {x}")

num = 10
modify_number(num)
print(f"函数外部 num: {num}")  # 10（未改变）

# 4. 函数参数传递（可变对象）
def modify_list(lst):
    lst.append(4)  # 修改原对象
    print(f"函数内部 lst: {lst}")

my_list = [1, 2, 3]
modify_list(my_list)
print(f"函数外部 my_list: {my_list}")  # [1, 2, 3, 4]（被修改！）

# 5. 避免修改原对象
def safe_modify_list(lst):
    new_lst = lst.copy()  # 创建副本
    new_lst.append(4)
    return new_lst

my_list = [1, 2, 3]
result = safe_modify_list(my_list)
print(f"原列表: {my_list}")  # [1, 2, 3]（未改变）
print(f"新列表: {result}")  # [1, 2, 3, 4]

# 6. 返回值传递引用
def create_list():
    local_list = [1, 2, 3]  # 局部变量
    return local_list  # 返回引用，对象不会被销毁

result = create_list()
print(f"result: {result}")  # [1, 2, 3]

# 7. 多个返回值
def get_multiple():
    a = [1, 2, 3]
    b = {"x": 10}
    return a, b  # 返回多个引用

list_ref, dict_ref = get_multiple()
print(f"list_ref: {list_ref}")  # [1, 2, 3]
print(f"dict_ref: {dict_ref}")  # {"x": 10}

# 8. 深拷贝避免嵌套对象共享
import copy

original = [[1, 2], [3, 4]]
shallow = original.copy()  # 浅拷贝
deep = copy.deepcopy(original)  # 深拷贝

shallow[0].append(5)  # 修改嵌套对象
print(f"original: {original}")  # [[1, 2, 5], [3, 4]]（被修改！）
print(f"shallow: {shallow}")  # [[1, 2, 5], [3, 4]]

deep[0].append(6)  # 修改嵌套对象
print(f"original: {original}")  # [[1, 2, 5], [3, 4]]（未改变）
print(f"deep: {deep}")  # [[1, 2, 6], [3, 4]]

# 9. 默认参数陷阱
def add_item(item, my_list=[]):  # 危险！默认参数是可变对象
    my_list.append(item)
    return my_list

list1 = add_item(1)
list2 = add_item(2)
print(f"list1: {list1}")  # [1, 2]（意外！）
print(f"list2: {list2}")  # [1, 2]（意外！）

# 正确的做法
def add_item_safe(item, my_list=None):
    if my_list is None:
        my_list = []
    my_list.append(item)
    return my_list

list1 = add_item_safe(1)
list2 = add_item_safe(2)
print(f"list1: {list1}")  # [1]（正确）
print(f"list2: {list2}")  # [2]（正确）`,
    summary: [
      'Python 中赋值和函数参数传递都是传递对象的引用。',
      '不可变对象赋值后，修改操作会创建新对象，不影响原对象。',
      '可变对象赋值后，多个变量引用同一个对象，修改会影响所有引用。',
      '函数参数传递是"按引用传递"，可变对象可以在函数内部被修改。',
      '使用 copy() 创建浅拷贝，deepcopy() 创建深拷贝，避免修改原对象。',
      '函数返回值也是传递引用，返回的局部变量对象仍然存在。',
      '注意默认参数陷阱：不要使用可变对象作为默认参数。'
    ]
  } as CourseChapter,
  {
    id: '14',
    unitId: 'unit2',
    title: '对象复制',
    description: '学习如何创建对象的副本，避免共享可变对象。',
    difficulty: '进阶' as Difficulty,
    content: `在 Python 中，有时需要创建对象的副本而不是共享引用。Python 提供了多种复制方式。

## 1. 复制类型

### 浅拷贝（Shallow Copy）

浅拷贝创建新对象，但嵌套对象仍然共享：
- 只复制最外层对象
- 嵌套的可变对象仍然共享引用
- 使用 \`copy()\` 方法或切片 \`[:]\` 创建浅拷贝

### 深拷贝（Deep Copy）

深拷贝创建完全独立的副本：
- 递归复制所有嵌套对象
- 所有对象都是独立的
- 使用 \`copy.deepcopy()\` 创建深拷贝

## 2. 不可变对象

对于不可变对象（如字符串、元组）：
- 由于不可变，共享引用是安全的
- 修改操作会自动创建新对象
- 通常不需要显式复制

## 3. 复制方法

### 列表复制

- \`list.copy()\`：浅拷贝
- \`list[:]\`：切片浅拷贝
- \`copy.deepcopy(list)\`：深拷贝

### 字典复制

- \`dict.copy()\`：浅拷贝
- \`dict(**dict)\`：浅拷贝
- \`copy.deepcopy(dict)\`：深拷贝

## 4. 何时需要复制

- 需要独立修改可变对象时
- 避免函数参数修改原对象时
- 创建对象池或缓存时
- 需要序列化/反序列化时`,
    exampleCode: `import copy

# 1. 浅拷贝（列表）
original = [1, 2, 3]
shallow = original.copy()  # 或 original[:]
shallow.append(4)
print(f"original: {original}")  # [1, 2, 3]（未改变）
print(f"shallow: {shallow}")  # [1, 2, 3, 4]

# 2. 浅拷贝的局限性（嵌套对象）
original = [[1, 2], [3, 4]]
shallow = original.copy()
shallow[0].append(5)  # 修改嵌套对象
print(f"original: {original}")  # [[1, 2, 5], [3, 4]]（被修改！）
print(f"shallow: {shallow}")  # [[1, 2, 5], [3, 4]]
print(f"original[0] is shallow[0]: {original[0] is shallow[0]}")  # True

# 3. 深拷贝（嵌套对象）
original = [[1, 2], [3, 4]]
deep = copy.deepcopy(original)
deep[0].append(6)  # 修改嵌套对象
print(f"original: {original}")  # [[1, 2], [3, 4]]（未改变）
print(f"deep: {deep}")  # [[1, 2, 6], [3, 4]]
print(f"original[0] is deep[0]: {original[0] is deep[0]}")  # False

# 4. 字典复制
original_dict = {"a": 1, "b": [1, 2, 3]}
shallow_dict = original_dict.copy()
deep_dict = copy.deepcopy(original_dict)

shallow_dict["b"].append(4)
print(f"original_dict: {original_dict}")  # {"a": 1, "b": [1, 2, 3, 4]}（被修改！）
print(f"shallow_dict: {shallow_dict}")  # {"a": 1, "b": [1, 2, 3, 4]}

deep_dict["b"].append(5)
print(f"original_dict: {original_dict}")  # {"a": 1, "b": [1, 2, 3, 4]}（未改变）
print(f"deep_dict: {deep_dict}")  # {"a": 1, "b": [1, 2, 3, 4, 5]}

# 5. 切片复制（列表）
original = [1, 2, 3, 4, 5]
sliced = original[:]  # 浅拷贝
sliced.append(6)
print(f"original: {original}")  # [1, 2, 3, 4, 5]（未改变）
print(f"sliced: {sliced}")  # [1, 2, 3, 4, 5, 6]

# 6. 列表推导式复制
original = [1, 2, 3]
copied = [x for x in original]  # 浅拷贝
copied.append(4)
print(f"original: {original}")  # [1, 2, 3]（未改变）

# 7. 不可变对象（无需复制）
str1 = "hello"
str2 = str1  # 共享引用是安全的
str2 = str2 + " world"  # 创建新对象
print(f"str1: {str1}")  # "hello"（未改变）

tuple1 = (1, 2, 3)
tuple2 = tuple1  # 共享引用是安全的
print(f"tuple1 is tuple2: {tuple1 is tuple2}")  # True

# 8. 自定义类的复制
class MyClass:
    def __init__(self, value):
        self.value = value
        self.items = [1, 2, 3]
    
    def __copy__(self):
        # 自定义浅拷贝
        new_obj = MyClass(self.value)
        new_obj.items = self.items.copy()
        return new_obj
    
    def __deepcopy__(self, memo):
        # 自定义深拷贝
        import copy
        new_obj = MyClass(copy.deepcopy(self.value, memo))
        new_obj.items = copy.deepcopy(self.items, memo)
        return new_obj

obj1 = MyClass("test")
obj2 = copy.copy(obj1)  # 浅拷贝
obj3 = copy.deepcopy(obj1)  # 深拷贝

obj2.items.append(4)
print(f"obj1.items: {obj1.items}")  # [1, 2, 3, 4]（被修改！）
print(f"obj2.items: {obj2.items}")  # [1, 2, 3, 4]

obj3.items.append(5)
print(f"obj1.items: {obj1.items}")  # [1, 2, 3, 4]（未改变）
print(f"obj3.items: {obj3.items}")  # [1, 2, 3, 5]

# 9. 性能考虑
# 浅拷贝：快速，只复制最外层
# 深拷贝：较慢，递归复制所有嵌套对象
# 对于大型数据结构，深拷贝可能很昂贵

large_list = [[i] * 1000 for i in range(1000)]
# shallow_copy = large_list.copy()  # 快速
# deep_copy = copy.deepcopy(large_list)  # 较慢

# 10. 复制 vs 引用
original = [1, 2, 3]
reference = original  # 引用
shallow = original.copy()  # 浅拷贝
deep = copy.deepcopy(original)  # 深拷贝

original.append(4)
print(f"reference: {reference}")  # [1, 2, 3, 4]（被修改）
print(f"shallow: {shallow}")  # [1, 2, 3]（未改变）
print(f"deep: {deep}")  # [1, 2, 3]（未改变）
    let copy = large_string.clone();  // 复制所有数据
}`,
    summary: [
      '使用 copy() 创建浅拷贝，只复制最外层对象。',
      '使用 deepcopy() 创建深拷贝，递归复制所有嵌套对象。',
      '浅拷贝的嵌套对象仍然共享引用，修改会影响原对象。',
      '深拷贝创建完全独立的副本，所有对象都是独立的。',
      '对于不可变对象，共享引用是安全的，通常不需要复制。',
      '列表可以使用切片 [:] 创建浅拷贝。',
      '自定义类可以实现 __copy__ 和 __deepcopy__ 方法。',
      '深拷贝可能很昂贵，特别是对于大型数据结构，需要谨慎使用。'
    ]
  } as CourseChapter,
  {
    id: '15',
    unitId: 'unit2',
    title: '对象引用和共享',
    description: '学习如何使用对象引用，理解引用的行为。',
    difficulty: '进阶' as Difficulty,
    content: `在 Python 中，变量是对象的引用。多个变量可以引用同一个对象，这被称为对象共享。

## 1. 引用语义

Python 使用引用语义（Reference Semantics）：
- 变量存储的是对象的引用，不是对象本身
- 多个变量可以引用同一个对象
- 使用 \`is\` 运算符检查是否是同一个对象
- 使用 \`id()\` 函数获取对象的内存地址

## 2. 不可变对象的引用

对于不可变对象（如整数、字符串、元组）：
- 多个变量可以安全地共享同一个对象
- 修改操作会创建新对象，不影响原对象
- 由于对象不可变，共享引用不会导致问题

## 3. 可变对象的引用

对于可变对象（如列表、字典、集合）：
- 多个变量引用同一个对象时，修改会影响所有引用
- 需要小心处理，避免意外的副作用
- 使用 \`copy()\` 或 \`deepcopy()\` 创建副本避免共享

## 4. 函数参数传递

函数参数传递是传递对象的引用：
- 传递的是对象的引用，不是对象的副本
- 对于不可变对象，函数内部无法修改原对象
- 对于可变对象，函数内部可以修改原对象

## 5. 避免副作用

如果需要避免修改原对象：
- 使用 \`copy()\` 创建浅拷贝
- 使用 \`deepcopy()\` 创建深拷贝
- 对于不可变对象，无需担心`,
    exampleCode: `# 1. 引用语义
x = [1, 2, 3]
y = x  # y 和 x 引用同一个对象
print(f"x is y: {x is y}")  # True
print(f"id(x): {id(x)}, id(y): {id(y)}")  # 相同的内存地址

# 2. 不可变对象的引用
# 整数
a = 100
b = 100
print(f"a is b: {a is b}")  # True（小整数被缓存）

# 字符串
str1 = "hello"
str2 = str1  # str2 和 str1 引用同一个字符串对象
str2 = str2 + " world"  # 创建新对象
print(f"str1: {str1}")  # "hello"（未改变）
print(f"str2: {str2}")  # "hello world"
print(f"str1 is str2: {str1 is str2}")  # False

# 元组
tuple1 = (1, 2, 3)
tuple2 = tuple1
print(f"tuple1 is tuple2: {tuple1 is tuple2}")  # True

# 3. 可变对象的引用
# 列表
list1 = [1, 2, 3]
list2 = list1  # list2 和 list1 引用同一个列表对象
list2.append(4)  # 修改原对象
print(f"list1: {list1}")  # [1, 2, 3, 4]（被修改！）
print(f"list2: {list2}")  # [1, 2, 3, 4]
print(f"list1 is list2: {list1 is list2}")  # True

# 字典
dict1 = {"a": 1, "b": 2}
dict2 = dict1  # dict2 和 dict1 引用同一个字典对象
dict2["c"] = 3  # 修改原对象
print(f"dict1: {dict1}")  # {"a": 1, "b": 2, "c": 3}（被修改！）
print(f"dict2: {dict2}")  # {"a": 1, "b": 2, "c": 3}

# 4. 函数参数传递（不可变对象）
def process_string(s):
    s = s + " processed"  # 创建新对象，不影响原变量
    print(f"函数内部 s: {s}")

my_str = "hello"
process_string(my_str)
print(f"函数外部 my_str: {my_str}")  # "hello"（未改变）

# 5. 函数参数传递（可变对象）
def process_list(lst):
    lst.append(4)  # 修改原对象
    print(f"函数内部 lst: {lst}")

my_list = [1, 2, 3]
process_list(my_list)
print(f"函数外部 my_list: {my_list}")  # [1, 2, 3, 4]（被修改！）

# 6. 避免副作用
def safe_process_list(lst):
    new_lst = lst.copy()  # 创建副本
    new_lst.append(4)
    return new_lst

my_list = [1, 2, 3]
result = safe_process_list(my_list)
print(f"原列表: {my_list}")  # [1, 2, 3]（未改变）
print(f"新列表: {result}")  # [1, 2, 3, 4]

# 7. 对象比较
# == 比较值
list1 = [1, 2, 3]
list2 = [1, 2, 3]
print(f"list1 == list2: {list1 == list2}")  # True（值相等）
print(f"list1 is list2: {list1 is list2}")  # False（不同对象）

# is 比较身份
list3 = list1
print(f"list1 is list3: {list1 is list3}")  # True（同一对象）

# 8. 引用的生命周期
def create_object():
    local_obj = [1, 2, 3]  # 局部变量
    return local_obj  # 返回引用，对象不会被销毁

result = create_object()  # 对象仍然存在，因为被 result 引用
print(f"result: {result}")  # [1, 2, 3]

# 9. 删除引用
import sys

obj = [1, 2, 3]
print(f"引用计数: {sys.getrefcount(obj)}")
ref1 = obj
ref2 = obj
print(f"引用计数: {sys.getrefcount(obj)}")  # 增加

del ref1, ref2  # 删除引用
print(f"引用计数: {sys.getrefcount(obj)}")  # 减少

# 10. 循环引用
class Node:
    def __init__(self, value):
        self.value = value
        self.next = None

node1 = Node(1)
node2 = Node(2)
node1.next = node2
node2.next = node1  # 循环引用
# 即使删除外部引用，对象也不会被引用计数回收
# 需要循环垃圾回收器处理`,
    summary: [
      'Python 使用引用语义，变量存储对象的引用。',
      '多个变量可以引用同一个对象，使用 is 检查是否是同一对象。',
      '不可变对象的引用共享是安全的，修改会创建新对象。',
      '可变对象的引用共享需要小心，修改会影响所有引用。',
      '函数参数传递是传递对象的引用，不是对象的副本。',
      '使用 copy() 或 deepcopy() 创建副本，避免意外的副作用。',
      '使用 == 比较值，使用 is 比较身份（是否是同一个对象）。',
      '理解对象引用对于避免意外的副作用和内存管理非常重要。'
    ]
  } as CourseChapter,
  {
    id: '16',
    unitId: 'unit2',
    title: '可变对象的引用',
    description: '学习如何处理可变对象的引用，理解修改的影响。',
    difficulty: '进阶' as Difficulty,
    content: `在 Python 中，可变对象的引用允许修改对象。多个变量引用同一个可变对象时，修改会影响所有引用。

## 1. 可变对象的特性

可变对象（如列表、字典、集合）：
- 可以修改内容
- 多个变量可以引用同一个对象
- 通过任一引用修改对象，会影响所有引用

## 2. 共享可变对象的风险

当多个变量引用同一个可变对象时：
- 通过任一引用修改对象，会影响所有引用
- 可能导致意外的副作用
- 需要小心处理，避免修改不期望修改的对象

## 3. 避免副作用的方法

如果需要独立修改可变对象：
- 使用 \`copy()\` 创建浅拷贝
- 使用 \`deepcopy()\` 创建深拷贝
- 使用切片 \`[:]\` 创建浅拷贝

## 4. 函数参数传递

函数参数传递可变对象时：
- 传递的是对象的引用
- 函数内部可以修改原对象
- 如果需要避免修改原对象，传递副本

## 5. 最佳实践

1. **明确意图**：明确是否需要修改原对象
2. **使用副本**：不需要修改原对象时，使用副本
3. **文档说明**：函数是否会修改参数，应该在文档中说明
4. **避免共享**：尽可能避免共享可变对象`,
    exampleCode: `# 1. 可变对象的特性
# 列表
list1 = [1, 2, 3]
list2 = list1  # list2 和 list1 引用同一个列表对象
list2.append(4)  # 修改原对象
print(f"list1: {list1}")  # [1, 2, 3, 4]（被修改！）
print(f"list2: {list2}")  # [1, 2, 3, 4]
print(f"list1 is list2: {list1 is list2}")  # True

# 字典
dict1 = {"a": 1, "b": 2}
dict2 = dict1  # dict2 和 dict1 引用同一个字典对象
dict2["c"] = 3  # 修改原对象
print(f"dict1: {dict1}")  # {"a": 1, "b": 2, "c": 3}（被修改！）
print(f"dict2: {dict2}")  # {"a": 1, "b": 2, "c": 3}
print(f"dict1 is dict2: {dict1 is dict2}")  # True

# 2. 共享可变对象的风险
def modify_list(lst):
    lst.append(100)  # 修改原对象
    return lst

my_list = [1, 2, 3]
result = modify_list(my_list)
print(f"my_list: {my_list}")  # [1, 2, 3, 100]（被修改！）
print(f"result: {result}")  # [1, 2, 3, 100]
print(f"my_list is result: {my_list is result}")  # True

# 3. 避免副作用（使用副本）
def safe_modify_list(lst):
    new_lst = lst.copy()  # 创建副本
    new_lst.append(100)
    return new_lst

my_list = [1, 2, 3]
result = safe_modify_list(my_list)
print(f"my_list: {my_list}")  # [1, 2, 3]（未改变）
print(f"result: {result}")  # [1, 2, 3, 100]
print(f"my_list is result: {my_list is result}")  # False

# 4. 嵌套对象的共享
original = [[1, 2], [3, 4]]
shallow = original.copy()  # 浅拷贝
shallow[0].append(5)  # 修改嵌套对象
print(f"original: {original}")  # [[1, 2, 5], [3, 4]]（被修改！）
print(f"shallow: {shallow}")  # [[1, 2, 5], [3, 4]]

# 5. 深拷贝避免嵌套对象共享
import copy

original = [[1, 2], [3, 4]]
deep = copy.deepcopy(original)  # 深拷贝
deep[0].append(6)  # 修改嵌套对象
print(f"original: {original}")  # [[1, 2], [3, 4]]（未改变）
print(f"deep: {deep}")  # [[1, 2, 6], [3, 4]]

# 6. 多个引用修改
list1 = [1, 2, 3]
list2 = list1
list3 = list1

list2.append(4)  # 通过 list2 修改
print(f"list1: {list1}")  # [1, 2, 3, 4]（被修改）
print(f"list2: {list2}")  # [1, 2, 3, 4]
print(f"list3: {list3}")  # [1, 2, 3, 4]（也被修改！）

# 7. 函数参数传递（会修改）
def append_item(lst, item):
    lst.append(item)  # 修改原对象
    return lst

my_list = [1, 2, 3]
result = append_item(my_list, 4)
print(f"my_list: {my_list}")  # [1, 2, 3, 4]（被修改！）
print(f"result: {result}")  # [1, 2, 3, 4]

# 8. 函数参数传递（不修改）
def append_item_safe(lst, item):
    new_lst = lst.copy()  # 创建副本
    new_lst.append(item)
    return new_lst

my_list = [1, 2, 3]
result = append_item_safe(my_list, 4)
print(f"my_list: {my_list}")  # [1, 2, 3]（未改变）
print(f"result: {result}")  # [1, 2, 3, 4]

# 9. 使用切片创建副本
list1 = [1, 2, 3]
list2 = list1[:]  # 切片创建浅拷贝
list2.append(4)
print(f"list1: {list1}")  # [1, 2, 3]（未改变）
print(f"list2: {list2}")  # [1, 2, 3, 4]

# 10. 引用计数示例
import sys

obj = [1, 2, 3]
print(f"引用计数: {sys.getrefcount(obj)}")
ref1 = obj
ref2 = obj
print(f"引用计数: {sys.getrefcount(obj)}")  # 增加

ref1.append(4)  # 通过任一引用修改
print(f"obj: {obj}")  # [1, 2, 3, 4]（被修改）
print(f"ref2: {ref2}")  # [1, 2, 3, 4]（也被修改！）`,
    summary: [
      '可变对象的引用允许修改对象，修改会影响所有引用。',
      '多个变量引用同一个可变对象时，通过任一引用修改都会影响所有引用。',
      '共享可变对象可能导致意外的副作用，需要小心处理。',
      '使用 copy() 创建浅拷贝，使用 deepcopy() 创建深拷贝，避免副作用。',
      '函数参数传递可变对象时，函数内部可以修改原对象。',
      '如果需要避免修改原对象，传递副本而不是原对象。',
      '明确函数的意图：是否会修改参数应该在文档中说明。',
      '尽可能避免共享可变对象，以减少意外的副作用。'
    ]
  } as CourseChapter,
  {
    id: '17',
    unitId: 'unit2',
    title: '对象生命周期和垃圾回收',
    description: '理解 Python 的对象生命周期和垃圾回收机制。',
    difficulty: '进阶' as Difficulty,
    content: `Python 的垃圾回收器会自动管理内存，当对象不再被引用时会被回收。

## 1. 对象生命周期

对象的生命周期：
- 从对象被创建时开始
- 当对象不再被引用时结束
- 垃圾回收器会自动回收不再使用的对象

## 2. 引用计数

Python 使用引用计数作为主要的内存管理机制：
- 每个对象都有一个引用计数
- 对象被引用时，计数增加
- 引用被删除时，计数减少
- 当计数为 0 时，对象被回收

## 3. 垃圾回收

除了引用计数，Python 还使用循环垃圾回收器：
- 检测无法通过引用计数回收的对象
- 处理循环引用的情况
- 定期清理循环引用的对象

## 4. 对象销毁

当对象被回收时：
- 调用 \`__del__\` 方法（如果定义）
- 释放对象占用的内存
- 注意：\`__del__\` 的调用时机不确定

## 5. 最佳实践

1. **及时删除引用**：不再需要的大对象，及时删除引用
2. **避免循环引用**：注意对象之间的循环引用
3. **使用上下文管理器**：使用 \`with\` 语句确保资源释放
4. **不要依赖 \`__del__\`**：不要依赖 \`__del__\` 进行清理工作`,
    exampleCode: `import sys
import gc

# 1. 引用计数
class MyClass:
    def __init__(self, name):
        self.name = name
        print(f"{self.name} 被创建")
    
    def __del__(self):
        print(f"{self.name} 被回收")

obj = MyClass("对象1")
print(f"引用计数: {sys.getrefcount(obj)}")  # 注意：getrefcount 会临时增加一个引用

ref1 = obj
ref2 = obj
print(f"引用计数: {sys.getrefcount(obj)}")  # 增加

del ref1, ref2
print(f"引用计数: {sys.getrefcount(obj)}")  # 减少

del obj  # 删除最后一个引用，对象被回收
# 对象1 被回收

# 2. 对象生命周期
def create_object():
    local_obj = MyClass("局部对象")
    return local_obj  # 返回引用，对象不会被销毁

result = create_object()  # 对象仍然存在，因为被 result 引用
print(f"result: {result.name}")  # 局部对象

del result  # 删除引用，对象被回收
# 局部对象 被回收

# 3. 循环引用
class Node:
    def __init__(self, value):
        self.value = value
        self.next = None
        print(f"Node {value} 被创建")
    
    def __del__(self):
        print(f"Node {self.value} 被回收")

node1 = Node(1)
node2 = Node(2)
node1.next = node2
node2.next = node1  # 循环引用

del node1, node2  # 删除外部引用
# 对象不会被引用计数回收，因为存在循环引用

# 4. 强制垃圾回收
gc.collect()  # 强制垃圾回收
# Node 1 被回收
# Node 2 被回收

# 5. 弱引用（避免循环引用）
import weakref

class MyClass:
    def __init__(self, name):
        self.name = name
        print(f"{self.name} 被创建")
    
    def __del__(self):
        print(f"{self.name} 被回收")

obj = MyClass("对象")
weak_ref = weakref.ref(obj)  # 弱引用

print(f"对象存在: {weak_ref() is not None}")  # True
del obj  # 删除引用，对象被回收
# 对象 被回收
print(f"对象存在: {weak_ref() is not None}")  # False

# 6. 上下文管理器（确保资源释放）
class Resource:
    def __init__(self, name):
        self.name = name
        print(f"{self.name} 被创建")
    
    def __enter__(self):
        return self
    
    def __exit__(self, exc_type, exc_val, exc_tb):
        print(f"{self.name} 被释放")

with Resource("资源") as r:
    print(f"使用 {r.name}")
# 资源 被创建
# 使用 资源
# 资源 被释放

# 7. 对象引用链
class A:
    def __init__(self):
        self.b = None

class B:
    def __init__(self):
        self.a = None

a = A()
b = B()
a.b = b
b.a = a  # 循环引用

del a, b  # 删除外部引用
gc.collect()  # 需要循环垃圾回收器处理

# 8. 引用计数示例
x = [1, 2, 3]
print(f"x 的引用计数: {sys.getrefcount(x)}")

y = x
z = x
print(f"x 的引用计数: {sys.getrefcount(x)}")  # 增加

del y, z
print(f"x 的引用计数: {sys.getrefcount(x)}")  # 减少

# 9. 不可变对象的引用
str1 = "hello"
str2 = str1  # 共享引用是安全的
print(f"str1 的引用计数: {sys.getrefcount(str1)}")  # 可能很大（字符串缓存）

# 10. 对象池（缓存）
# Python 缓存小整数和短字符串
a = 100
b = 100
print(f"a is b: {a is b}")  # True（小整数被缓存）

c = 1000
d = 1000
print(f"c is d: {c is d}")  # 可能 False（大整数可能不缓存）`,
    summary: [
      'Python 使用引用计数和垃圾回收来管理内存。',
      '对象的生命周期从创建时开始，到不再被引用时结束。',
      '当对象的引用计数为 0 时，对象会被回收。',
      '循环引用需要循环垃圾回收器处理，无法通过引用计数回收。',
      '使用 `with` 语句和上下文管理器确保资源释放。',
      '使用 `weakref` 避免循环引用问题。',
      '及时删除不再需要的引用，特别是大对象。',
      '不要依赖 `__del__` 方法进行清理工作，其调用时机不确定。'
    ]
  } as CourseChapter,
  {
    id: '18',
    unitId: 'unit2',
    title: '作用域和对象生命周期',
    description: '深入理解作用域和对象生命周期的关系。',
    difficulty: '进阶' as Difficulty,
    content: `在 Python 中，作用域决定变量的可见性，对象的生命周期由引用计数和垃圾回收管理。

## 1. 作用域和变量

作用域是变量有效的代码范围：
- **局部作用域**：函数内部
- **全局作用域**：模块级别
- **嵌套作用域**：嵌套函数的外部函数
- **内置作用域**：Python 内置函数和异常

## 2. 对象生命周期

对象的生命周期：
- 从对象被创建时开始
- 当对象不再被引用时结束
- 垃圾回收器会自动回收不再使用的对象

## 3. 作用域和引用的关系

变量的作用域决定引用的生命周期：
- 变量在作用域内有效
- 离开作用域时，引用被删除
- 如果对象没有其他引用，会被垃圾回收

## 4. 局部对象和返回值

局部对象的生命周期：
- 在函数内部创建的对象
- 如果被返回，对象仍然存在（因为被返回的引用持有）
- 如果没有返回，对象会在函数结束时被回收（如果没有其他引用）

## 5. 嵌套作用域和闭包

嵌套作用域中的对象：
- 内层函数可以访问外层函数的变量
- 使用 \`nonlocal\` 关键字修改外层函数的变量
- 闭包会捕获外部作用域的变量`,
    exampleCode: `# 1. 作用域和变量生命周期
def function():
    local_var = "局部变量"
    print(f"函数内部: {local_var}")
    # local_var 在这里有效

function()
# print(local_var)  # 错误！NameError: name 'local_var' is not defined

# 2. 局部对象的生命周期
def create_local():
    local_list = [1, 2, 3]  # 局部变量
    print(f"函数内部: {local_list}")
    # local_list 在这里有效

create_local()
# print(local_list)  # 错误！NameError: name 'local_list' is not defined

# 3. 返回局部对象
def create_and_return():
    local_obj = [1, 2, 3]  # 局部变量
    return local_obj  # 返回引用，对象不会被销毁

result = create_and_return()  # 对象仍然存在，因为被 result 引用
print(f"result: {result}")  # [1, 2, 3]

# 4. 作用域嵌套
def outer():
    outer_var = "外层变量"
    
    def inner():
        inner_var = "内层变量"
        print(f"内层: {inner_var}")  # 可以访问内层变量
        print(f"外层: {outer_var}")  # 可以访问外层变量
    
    inner()
    # print(inner_var)  # 错误！NameError: name 'inner_var' is not defined

outer()

# 5. 闭包和对象生命周期
def outer_function(x):
    # x 被闭包捕获
    def inner_function(y):
        return x + y  # 可以访问外部变量 x
    return inner_function  # 返回内层函数，x 仍然有效

add_5 = outer_function(5)
print(f"add_5(10): {add_5(10)}")  # 15

# 6. nonlocal 关键字
def outer():
    count = 0
    
    def inner():
        nonlocal count  # 修改外层函数的变量
        count += 1
        return count
    
    return inner

counter = outer()
print(f"counter(): {counter()}")  # 1
print(f"counter(): {counter()}")  # 2

# 7. 全局变量和局部变量
global_var = "全局变量"

def function():
    global global_var  # 声明使用全局变量
    global_var = "修改后的全局变量"
    local_var = "局部变量"
    print(f"函数内部: {local_var}")

function()
print(f"函数外部: {global_var}")  # 修改后的全局变量

# 8. 对象引用和作用域
def function():
    obj = [1, 2, 3]  # 局部对象
    ref = obj  # 局部引用
    return ref  # 返回引用，对象仍然存在

result = function()  # 对象仍然存在，因为被 result 引用
print(f"result: {result}")  # [1, 2, 3]

# 9. 循环引用和作用域
class Node:
    def __init__(self, value):
        self.value = value
        self.next = None

def create_cycle():
    node1 = Node(1)
    node2 = Node(2)
    node1.next = node2
    node2.next = node1  # 循环引用
    return node1  # 返回 node1，两个节点都仍然存在

root = create_cycle()  # 循环引用的对象仍然存在
print(f"root.value: {root.value}")  # 1

# 10. 弱引用避免循环引用
import weakref

class Node:
    def __init__(self, value):
        self.value = value
        self.next = None

def create_weak_ref():
    node1 = Node(1)
    node2 = Node(2)
    node1.next = node2
    node2.next = weakref.ref(node1)  # 弱引用，不会增加引用计数
    return node1

root = create_weak_ref()
print(f"root.value: {root.value}")  # 1

# 11. 作用域链
x = "全局 x"

def outer():
    x = "外层 x"
    
    def inner():
        x = "内层 x"
        print(f"内层: {x}")  # 内层 x
    
    inner()
    print(f"外层: {x}")  # 外层 x

outer()
print(f"全局: {x}")  # 全局 x

# 12. 对象销毁时机
import sys

class MyClass:
    def __init__(self, name):
        self.name = name
        print(f"{self.name} 被创建")
    
    def __del__(self):
        print(f"{self.name} 被回收")

def create_temp():
    obj = MyClass("临时对象")
    return obj

result = create_temp()  # 临时对象 被创建
# 临时对象仍然存在，因为被 result 引用

del result  # 删除引用，对象被回收
# 临时对象 被回收`,
    summary: [
      '作用域决定变量的可见性，变量在作用域内有效。',
      '对象的生命周期由引用计数和垃圾回收管理。',
      '局部对象如果没有返回，会在函数结束时被回收。',
      '返回的对象仍然存在，因为被返回的引用持有。',
      '内层函数可以访问外层函数的变量，形成闭包。',
      '使用 nonlocal 关键字修改外层函数的变量。',
      '循环引用需要循环垃圾回收器处理。',
      '理解作用域和对象生命周期的关系对于内存管理非常重要。'
    ]
  } as CourseChapter,
  // 单元3：复合数据类型
  {
    id: '19',
    unitId: 'unit3',
    title: '元组',
    description: '学习元组类型，将多个不同类型的值组合在一起。',
    difficulty: '入门' as Difficulty,
    content: `元组（tuple）是 Python 中的不可变序列类型，用于存储多个元素。

## 元组的特点

元组具有以下特点：
- **不可变性**：元组是不可变的（immutable），创建后不能修改
- **有序性**：元组中的元素按顺序存储，保持顺序
- **异构性**：可以存储不同类型的元素
- **固定长度**：创建后长度不能改变
- **可作为字典键**：由于不可变，元组可以作为字典的键

## 创建元组

Python 提供了多种创建元组的方式：

### 1. 字面量创建

使用圆括号 \`()\` 创建元组：

**示例：**
\`\`\`python
empty_tuple = ()  # 空元组（注意：不是 (,)）
single_tuple = (1,)  # 单元素元组（注意逗号）
multi_tuple = (1, 2, 3)  # 多元素元组
mixed = (1, "hello", 3.14, True)  # 混合类型
\`\`\`

### 2. 省略括号

在大多数情况下可以省略圆括号：

**示例：**
\`\`\`python
tuple1 = 1, 2, 3  # 等价于 (1, 2, 3)
tuple2 = 1,  # 单元素元组
\`\`\`

### 3. tuple() 构造函数

使用 \`tuple()\` 构造函数创建元组：

**示例：**
\`\`\`python
tuple1 = tuple()  # 空元组
tuple2 = tuple([1, 2, 3])  # 从列表创建
tuple3 = tuple("hello")  # ('h', 'e', 'l', 'l', 'o')
\`\`\`

## 元组操作

### 访问元素

- **索引访问**：使用索引访问元素（从 0 开始）
- **负数索引**：-1 表示最后一个元素
- **切片**：使用切片获取子元组
- **解包**：将元组的值赋给多个变量

**示例：**
\`\`\`python
my_tuple = (10, 20, 30, 40, 50)
print(my_tuple[0])    # 10（第一个元素）
print(my_tuple[-1])   # 50（最后一个元素）
print(my_tuple[1:4])  # (20, 30, 40)（切片）

# 解包
x, y, z = (1, 2, 3)
a, *rest, b = (1, 2, 3, 4, 5)  # a=1, rest=[2,3,4], b=5
\`\`\`

### 元组方法

元组由于不可变，方法较少：
- **count()**：统计元素出现次数
- **index()**：查找元素第一次出现的索引

**示例：**
\`\`\`python
my_tuple = (1, 2, 2, 3, 2)
count = my_tuple.count(2)  # 3
index = my_tuple.index(3)  # 3
\`\`\`

## 元组 vs 列表

### 相同点
- 都是有序序列
- 都可以存储不同类型
- 都支持索引和切片
- 都可以嵌套

### 不同点
- **可变性**：列表可变，元组不可变
- **性能**：元组略快（但差异通常可忽略）
- **用途**：列表用于可变数据，元组用于固定数据
- **字典键**：元组可以作为字典键，列表不能

**使用建议：**
- 需要修改数据时使用列表
- 数据固定不变时使用元组
- 作为字典键时使用元组
- 函数返回多个值时使用元组

## 元组的应用场景

### 1. 函数返回多个值

**示例：**
\`\`\`python
def get_name_and_age():
    return "Alice", 25  # 返回元组

name, age = get_name_and_age()  # 解包
\`\`\`

### 2. 作为字典键

**示例：**
\`\`\`python
coordinates = {(0, 0): "原点", (1, 1): "点(1,1)"}
\`\`\`

### 3. 数据记录

**示例：**
\`\`\`python
person = ("Alice", 25, "Engineer")  # 姓名、年龄、职业
\`\`\`

### 4. 序列解包

**示例：**
\`\`\`python
x, y = 10, 20  # 交换变量
x, y = y, x  # 交换值
\`\`\`

## 命名元组（collections.namedtuple）

命名元组提供了更友好的访问方式：

**示例：**
\`\`\`python
from collections import namedtuple

Point = namedtuple('Point', ['x', 'y'])
p = Point(10, 20)
print(p.x)  # 10（可以通过名称访问）
print(p[0])  # 10（也可以通过索引访问）
\`\`\``,
    exampleCode: `fn main() {
    // 创建元组
    let tup: (i32, f64, u8) = (500, 6.4, 1);
    
    // 通过索引访问
    let five_hundred = tup.0;
    let six_point_four = tup.1;
    let one = tup.2;
    println!("{}, {}, {}", five_hundred, six_point_four, one);
    
    // 解构元组
    let (x, y, z) = tup;
    println!("x: {}, y: {}, z: {}", x, y, z);
    
    // 函数返回多个值
    let (sum, product) = calculate(5, 3);
    println!("和: {}, 积: {}", sum, product);
}

fn calculate(a: i32, b: i32) -> (i32, i32) {
    (a + b, a * b)
}`,
    summary: [
      '元组可以包含不同类型的值。',
      '元组长度固定，不能改变。',
      '使用 .索引 访问元组元素。',
      '可以使用解构获取元组值。',
      '函数可以返回元组（多个值）。'
    ]
  } as CourseChapter,
  {
    id: '20',
    unitId: 'unit3',
    title: '模式匹配（match/case）深入',
    description: '深入学习 match/case 表达式的各种用法和模式。',
    difficulty: '进阶' as Difficulty,
    content: `match/case 是 Python 3.10+ 中强大的控制流结构。它允许你将值与一系列模式进行比较，并根据匹配的模式执行代码。

## 1. 基本语法

\`\`\`python
match value:
    case pattern1:
        # 处理 pattern1
    case pattern2:
        # 处理 pattern2
    case _:  # 通配符，匹配所有其他值
        # 默认处理
\`\`\`

## 2. 匹配模式

### 字面量匹配

匹配具体的值（整数、字符串、布尔值等）。

### 变量绑定

使用变量捕获匹配的值。

### 序列模式

匹配列表、元组等序列类型。

### 映射模式

匹配字典类型。

### 类模式

匹配对象和类的实例。

### 守卫条件

使用 \`if\` 添加额外的条件。

## 3. 高级特性

- **OR 模式**：使用 \`|\` 匹配多个模式
- **AS 模式**：使用 \`as\` 绑定变量
- **通配符**：使用 \`_\` 匹配任意值
- **序列解包**：匹配并解包序列

## 4. 最佳实践

1. **使用通配符**：总是包含 \`case _:\` 作为默认情况
2. **顺序重要**：模式按顺序匹配，更具体的模式应该在前
3. **类型检查**：match/case 会进行类型检查
4. **可读性**：使用 match/case 让代码更清晰易读`,
    exampleCode: `# 1. 基本匹配
number = 5

match number:
    case 1:
        print("一")
    case 2:
        print("二")
    case 3:
        print("三")
    case _:  # 通配符，匹配所有其他值
        print("其他")

# 2. 匹配多个值（OR 模式）
match number:
    case 1 | 2:
        print("一或二")
    case 3 | 4 | 5:
        print("三到五")
    case _:
        print("其他")

# 3. 匹配并绑定值
point = (0, 5)

match point:
    case (0, y):
        print(f"在 y 轴上，y = {y}")
    case (x, 0):
        print(f"在 x 轴上，x = {x}")
    case (x, y):
        print(f"在 ({x}, {y})")

# 4. match 作为表达式（返回值的函数）
def classify_number(n):
    match n:
        case n if n < 5:
            return "小于5"
        case n if n == 5:
            return "等于5"
        case _:
            return "大于5"

result = classify_number(5)
print(result)  # "等于5"

# 5. 匹配列表
data = [1, 2, 3]

match data:
    case []:
        print("空列表")
    case [x]:
        print(f"单个元素: {x}")
    case [x, y]:
        print(f"两个元素: {x}, {y}")
    case [x, *rest]:
        print(f"第一个元素: {x}, 其余: {rest}")

# 6. 匹配字典
person = {"name": "Alice", "age": 25}

match person:
    case {"name": name, "age": age}:
        print(f"姓名: {name}, 年龄: {age}")
    case {"name": name}:
        print(f"姓名: {name}")
    case _:
        print("未知")

# 7. 匹配类实例
class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y

point = Point(0, 5)

match point:
    case Point(0, y):
        print(f"在 y 轴上，y = {y}")
    case Point(x, 0):
        print(f"在 x 轴上，x = {x}")
    case Point(x, y):
        print(f"在 ({x}, {y})")

# 8. 守卫条件
value = 10

match value:
    case x if x < 0:
        print("负数")
    case x if x == 0:
        print("零")
    case x if x > 0 and x < 10:
        print("正数，小于10")
    case _:
        print("大于等于10")

# 9. 匹配字符串
status = "success"

match status:
    case "success":
        print("成功")
    case "error" | "failure":
        print("失败")
    case _:
        print("未知状态")

# 10. 嵌套模式匹配
data = [{"type": "user", "name": "Alice"}, {"type": "admin", "name": "Bob"}]

for item in data:
    match item:
        case {"type": "user", "name": name}:
            print(f"用户: {name}")
        case {"type": "admin", "name": name}:
            print(f"管理员: {name}")
        case _:
            print("未知类型")

# 11. 使用 as 绑定
match (1, 2, 3):
    case (x, y, z) as point:
        print(f"点: {point}, x={x}, y={y}, z={z}")

# 12. 匹配类型
def process_value(value):
    match value:
        case int(x):
            return f"整数: {x}"
        case float(x):
            return f"浮点数: {x}"
        case str(x):
            return f"字符串: {x}"
        case list(x):
            return f"列表: {x}"
        case _:
            return f"其他类型: {type(value)}"

print(process_value(42))  # 整数: 42
print(process_value("hello"))  # 字符串: hello`,
    summary: [
      'match/case 是 Python 3.10+ 的强大控制流结构。',
      '使用 | 匹配多个值（OR 模式）。',
      '使用 _ 作为通配符匹配所有其他值。',
      '可以匹配并绑定变量值。',
      '支持序列模式、映射模式、类模式等。',
      '可以使用 if 添加守卫条件。',
      'match/case 会进行类型检查。',
      '模式按顺序匹配，更具体的模式应该在前。',
      '总是包含 case _: 作为默认情况。'
    ]
  } as CourseChapter,
  {
    id: '21',
    unitId: 'unit3',
    title: '条件表达式和模式匹配',
    description: '学习条件表达式、walrus运算符和循环中的模式匹配。',
    difficulty: '进阶' as Difficulty,
    content: `Python 提供了多种简洁的条件表达式和模式匹配方式，让代码更简洁易读。

## 条件表达式（三元运算符）

Python 使用 \`x if condition else y\` 语法实现条件表达式：

\`\`\`python
# 基本语法
value = "正数" if x > 0 else "非正数"

# 嵌套条件表达式
result = "大" if x > 100 else ("中" if x > 50 else "小")
\`\`\`

**优势：**
- 代码简洁，一行完成条件赋值
- 比 if-else 块更紧凑
- 适合简单的条件判断

**注意：**
- 不要过度嵌套，影响可读性
- 复杂逻辑应该使用 if-else 块

## Walrus 运算符（Python 3.8+）

Walrus 运算符（\`:=\`）允许在表达式中赋值，简化代码：

\`\`\`python
# 传统方式
value = get_value()
if value is not None:
    process(value)

# 使用 walrus 运算符
if (value := get_value()) is not None:
    process(value)

# 在循环中使用
while (line := file.readline()) != "":
    process(line)
\`\`\`

**常见用途：**
- 在条件判断中赋值
- 在循环中读取数据
- 避免重复调用函数

## 循环中的模式匹配

### for 循环解包

Python 的 for 循环支持解包：

\`\`\`python
# 解包元组
points = [(1, 2), (3, 4), (5, 6)]
for x, y in points:
    print(f"({x}, {y})")

# 解包字典
data = {"name": "Alice", "age": 25}
for key, value in data.items():
    print(f"{key}: {value}")

# 使用 enumerate 获取索引
items = ['a', 'b', 'c']
for index, value in enumerate(items):
    print(f"{index}: {value}")

# 解包嵌套结构
nested = [(1, (2, 3)), (4, (5, 6))]
for x, (y, z) in nested:
    print(f"x={x}, y={y}, z={z}")
\`\`\`

### while 循环中的条件

\`while\` 循环可以结合条件表达式使用：

\`\`\`python
# 从列表弹出元素直到为空
stack = [1, 2, 3]
while stack:
    item = stack.pop()
    print(item)

# 使用 walrus 运算符
while (line := file.readline()) != "":
    process(line)
\`\`\`

## 模式匹配（Python 3.10+）

Python 3.10 引入了 \`match/case\` 语句，提供模式匹配功能：

\`\`\`python
def handle_value(value):
    match value:
        case None:
            return "无值"
        case 0:
            return "零"
        case x if x > 0:
            return f"正数: {x}"
        case x if x < 0:
            return f"负数: {x}"
        case _:
            return "其他"

# 匹配多个值
match status:
    case "success" | "ok":
        print("成功")
    case "error" | "fail":
        print("失败")
\`\`\`

## 最佳实践

1. **条件表达式**：用于简单的条件赋值
2. **Walrus 运算符**：用于避免重复调用和简化循环
3. **解包**：充分利用 Python 的解包特性
4. **模式匹配**：Python 3.10+ 使用 match/case 处理复杂条件`,
    exampleCode: `# 条件表达式（三元运算符）
x = 10
result = "正数" if x > 0 else "非正数"
print(result)  # 正数

# 嵌套条件表达式
value = 75
size = "大" if value > 100 else ("中" if value > 50 else "小")
print(size)  # 中

# Walrus 运算符（Python 3.8+）
def get_value():
    return 42

# 传统方式
value = get_value()
if value is not None:
    print(f"值: {value}")

# 使用 walrus 运算符
if (value := get_value()) is not None:
    print(f"值: {value}")

# 在循环中使用 walrus 运算符
data = ["line1", "line2", "line3", ""]
i = 0
while (line := data[i] if i < len(data) else "") != "":
    print(line)
    i += 1

# for 循环解包
# 解包元组
points = [(1, 2), (3, 4), (5, 6)]
for x, y in points:
    print(f"点: ({x}, {y})")

# 解包字典
person = {"name": "Alice", "age": 25}
for key, value in person.items():
    print(f"{key}: {value}")

# 使用 enumerate 获取索引
items = ['a', 'b', 'c']
for index, value in enumerate(items):
    print(f"{index}: {value}")

# 解包嵌套结构
nested = [(1, (2, 3)), (4, (5, 6))]
for x, (y, z) in nested:
    print(f"x={x}, y={y}, z={z}")

# while 循环
stack = [1, 2, 3]
while stack:
    item = stack.pop()
    print(f"弹出: {item}")

# 模式匹配（Python 3.10+）
def handle_value(value):
    match value:
        case None:
            return "无值"
        case 0:
            return "零"
        case x if x > 0:
            return f"正数: {x}"
        case x if x < 0:
            return f"负数: {x}"
        case _:
            return "其他"

print(handle_value(10))  # 正数: 10
print(handle_value(-5))  # 负数: -5`,
    summary: [
      '使用 x if condition else y 实现条件表达式（三元运算符）。',
      'Walrus 运算符（:=）允许在表达式中赋值，简化代码。',
      'for 循环支持解包元组、字典和嵌套结构。',
      '使用 enumerate() 在循环中获取索引和值。',
      'while 循环可以结合条件表达式和 walrus 运算符使用。',
      'Python 3.10+ 支持 match/case 模式匹配。',
      '合理使用这些特性可以让代码更简洁，但不要过度使用影响可读性。'
    ]
  } as CourseChapter,
  {
    id: '22',
    unitId: 'unit3',
    title: 'None 和可选类型',
    description: '深入学习 None 和可选值，Python 中处理空值的方式。',
    difficulty: '进阶' as Difficulty,
    content: `Python 使用 \`None\` 和可选类型来处理可能为空的值。可以使用 \`Optional[T]\` 类型注解来表示可能为 \`None\` 的值。

## None 的概念

\`None\` 是 Python 中表示"无值"或"空值"的特殊对象：
- **唯一性**：\`None\` 是单例对象，所有 \`None\` 都是同一个对象
- **类型**：\`None\` 的类型是 \`NoneType\`
- **用途**：表示缺失值、未初始化、函数无返回值等

**示例：**
\`\`\`python
x = None  # 表示 x 没有值
print(x is None)  # True
print(type(None))  # <class 'NoneType'>
\`\`\`

## Optional 类型注解

使用 \`Optional[T]\` 或 \`T | None\`（Python 3.10+）表示可能为 \`None\` 的值：

\`\`\`python
from typing import Optional

def get_user_name(user_id: int) -> Optional[str]:
    # 可能返回字符串，也可能返回 None
    if user_id in users:
        return users[user_id]
    return None
\`\`\`

## 检查 None 值

### 使用 is 和 is not

**推荐方式**：使用 \`is\` 或 \`is not\` 检查 \`None\`（因为 \`None\` 是单例）：

\`\`\`python
value = get_value()

# 推荐：使用 is
if value is None:
    print("值为空")

# 不推荐：使用 ==
if value == None:  # 虽然可以，但不推荐
    print("值为空")
\`\`\`

### 使用 if 语句

Python 的 \`if\` 语句可以简洁地处理 \`None\`：

\`\`\`python
name = get_name()

# 方式1：显式检查
if name is not None:
    print(f"姓名: {name}")

# 方式2：利用真值测试（推荐）
if name:  # None 被视为 False
    print(f"姓名: {name}")
else:
    print("姓名为空")
\`\`\`

## 处理可选值

### 1. 提供默认值

使用 \`or\` 运算符提供默认值：

\`\`\`python
name = get_name() or "未知"  # 如果 name 是 None，使用"未知"
count = get_count() or 0  # 如果 count 是 None，使用 0
\`\`\`

**注意**：\`or\` 会返回第一个真值，所以如果值为 0 或空字符串，也会使用默认值。

### 2. 使用条件表达式

\`\`\`python
result = value if value is not None else default_value
\`\`\`

### 3. 使用 getattr 和字典的 get 方法

\`\`\`python
# 对象属性
name = getattr(obj, 'name', '默认值')

# 字典
value = my_dict.get('key', '默认值')
\`\`\`

## 函数返回 None

函数如果没有 \`return\` 语句或 \`return\` 没有值，默认返回 \`None\`：

\`\`\`python
def do_something():
    print("执行操作")
    # 没有 return，返回 None

result = do_something()  # result 是 None
\`\`\`

## 常见模式

### 1. 可选参数

\`\`\`python
def greet(name: Optional[str] = None):
    if name is None:
        print("Hello, Guest!")
    else:
        print(f"Hello, {name}!")
\`\`\`

### 2. 链式调用保护

\`\`\`python
# 避免 AttributeError
user = get_user()
if user is not None:
    name = user.name
else:
    name = "Unknown"
\`\`\`

### 3. 使用 walrus 运算符（Python 3.8+）

\`\`\`python
if (value := get_value()) is not None:
    # 使用 value
    process(value)
\`\`\`

## 注意事项

1. **不要使用 \`== None\`**：虽然可以工作，但 \`is None\` 更明确和高效
2. **None 的布尔值**：\`None\` 被视为 \`False\`，但显式检查更清晰
3. **类型检查**：使用类型注解和类型检查工具（如 mypy）来确保类型安全
4. **文档说明**：在函数文档中说明何时返回 \`None\``,
    exampleCode: `# None 的基本使用
x = None
print(x is None)  # True
print(type(None))  # <class 'NoneType'>

# Optional 类型注解
from typing import Optional

def divide(numerator: float, denominator: float) -> Optional[float]:
    """除法函数，如果除数为0返回None"""
    if denominator == 0.0:
        return None
    return numerator / denominator

# 使用函数
result = divide(10, 2)
if result is not None:
    print(f"结果: {result}")
else:
    print("除以零")

# 提供默认值
result = divide(10, 0) or 0  # 如果返回None，使用0
print(f"结果: {result}")

# 检查None的多种方式
value = get_value()

# 方式1：显式检查（推荐）
if value is not None:
    print(f"值: {value}")

# 方式2：利用真值测试
if value:
    print(f"值: {value}")
else:
    print("值为空")

# 可选参数
def greet(name: Optional[str] = None):
    if name is None:
        print("Hello, Guest!")
    else:
        print(f"Hello, {name}!")

greet()  # Hello, Guest!
greet("Alice")  # Hello, Alice!

# 使用 walrus 运算符（Python 3.8+）
if (value := get_value()) is not None:
    process(value)

# 字典和对象的默认值
my_dict = {"name": "Alice"}
age = my_dict.get("age", 0)  # 如果键不存在，返回0

# 函数默认返回None
def do_something():
    print("执行操作")
    # 没有return，返回None

result = do_something()  # result 是 None
print(result is None)  # True`,
    summary: [
      'None 是 Python 中表示空值的特殊对象，是单例。',
      '使用 Optional[T] 或 T | None 进行类型注解。',
      '使用 is None 或 is not None 检查 None（不要使用 ==）。',
      '使用 or 运算符提供默认值，但要注意 0 和空字符串的情况。',
      '函数没有 return 或 return 无值时默认返回 None。',
      '在函数文档中说明何时返回 None。'
    ]
  } as CourseChapter,
  {
    id: '23',
    unitId: 'unit3',
    title: '异常处理基础',
    description: '学习异常处理，Python 中处理错误的标准方式。',
    difficulty: '进阶' as Difficulty,
    content: `Python 使用异常（Exception）来处理可能失败的操作。使用 \`try/except\` 块来捕获和处理异常。

## 异常的概念

异常是程序运行时发生的错误或意外情况。Python 使用异常机制来处理错误，而不是返回错误码。

**异常的特点：**
- **自动传播**：异常会向上传播，直到被捕获或程序终止
- **类型化**：每种异常都有特定的类型（如 \`ValueError\`、\`TypeError\`）
- **可恢复**：可以通过 \`except\` 捕获并处理异常

## 基本语法

### try-except 块

\`\`\`python
try:
    # 可能抛出异常的代码
    result = 10 / 0
except ZeroDivisionError:
    # 处理特定异常
    print("除零错误")
\`\`\`

### 捕获多个异常

\`\`\`python
try:
    value = int(input("输入数字: "))
    result = 10 / value
except ValueError:
    print("输入的不是数字")
except ZeroDivisionError:
    print("不能除以零")
except Exception as e:
    # 捕获所有其他异常
    print(f"发生错误: {e}")
\`\`\`

## 抛出异常

使用 \`raise\` 语句抛出异常：

\`\`\`python
def validate_age(age):
    if age < 0:
        raise ValueError("年龄不能为负数")
    if age > 150:
        raise ValueError("年龄不能超过150")
    return True

# 使用
try:
    validate_age(-1)
except ValueError as e:
    print(f"验证失败: {e}")
\`\`\`

## 常见异常类型

Python 提供了多种内置异常类型：

### 基础异常

- **\`Exception\`**：所有异常的基类
- **\`BaseException\`**：所有异常的根类（包括系统退出异常）

### 常见异常

- **\`ValueError\`**：值错误（如 \`int("abc")\`）
- **\`TypeError\`**：类型错误（如对整数调用字符串方法）
- **\`IndexError\`**：索引错误（如访问不存在的列表索引）
- **\`KeyError\`**：键错误（如访问不存在的字典键）
- **\`AttributeError\`**：属性错误（如访问不存在的对象属性）
- **\`ZeroDivisionError\`**：除零错误
- **\`FileNotFoundError\`**：文件未找到错误

**示例：**
\`\`\`python
# ValueError
try:
    int("abc")
except ValueError:
    print("无法转换为整数")

# IndexError
try:
    items = [1, 2, 3]
    print(items[10])
except IndexError:
    print("索引超出范围")

# KeyError
try:
    data = {"name": "Alice"}
    print(data["age"])
except KeyError:
    print("键不存在")
\`\`\`

## 异常处理的最佳实践

### 1. 捕获具体异常

应该捕获具体的异常类型，而不是通用的 \`Exception\`：

\`\`\`python
# 好的做法
try:
    file = open("data.txt")
except FileNotFoundError:
    print("文件不存在")

# 不好的做法
try:
    file = open("data.txt")
except Exception:  # 太宽泛
    print("出错了")
\`\`\`

### 2. 不要忽略异常

至少记录异常信息：

\`\`\`python
try:
    risky_operation()
except Exception as e:
    print(f"操作失败: {e}")  # 记录错误
    # 或者重新抛出
    raise
\`\`\`

### 3. 使用异常链

使用 \`raise ... from ...\` 保留原始异常信息：

\`\`\`python
try:
    x = 1 / 0
except ZeroDivisionError as e:
    raise ValueError("无效输入") from e  # 保留原始异常
\`\`\``,
    exampleCode: `# 基本异常处理
try:
    result = 10 / 0
except ZeroDivisionError:
    print("除零错误")

# 捕获多个异常
try:
    value = int(input("输入数字: "))
    result = 10 / value
except ValueError:
    print("输入的不是数字")
except ZeroDivisionError:
    print("不能除以零")
except Exception as e:
    print(f"发生错误: {e}")

# 抛出异常
def validate_age(age):
    if age < 0:
        raise ValueError("年龄不能为负数")
    if age > 150:
        raise ValueError("年龄不能超过150")
    return True

try:
    validate_age(-1)
except ValueError as e:
    print(f"验证失败: {e}")

# 常见异常类型示例
# ValueError
try:
    int("abc")
except ValueError:
    print("无法转换为整数")

# IndexError
try:
    items = [1, 2, 3]
    print(items[10])
except IndexError:
    print("索引超出范围")

# KeyError
try:
    data = {"name": "Alice"}
    print(data["age"])
except KeyError:
    print("键不存在")

# 异常链
try:
    x = 1 / 0
except ZeroDivisionError as e:
    raise ValueError("无效输入") from e

# 获取异常信息
try:
    result = 10 / 0
except ZeroDivisionError as e:
    print(f"异常类型: {type(e).__name__}")
    print(f"异常消息: {str(e)}")`,
    summary: [
      '使用 try-except 处理可能失败的代码。',
      '捕获具体的异常类型，而不是通用的 Exception。',
      '使用 raise 语句抛出异常。',
      'Python 提供了多种内置异常类型（ValueError、TypeError 等）。',
      '异常会自动向上传播，直到被捕获或程序终止。',
      '不要完全忽略异常，至少要记录错误信息。',
      '使用 raise ... from ... 保留原始异常信息。'
    ]
  } as CourseChapter,
  {
    id: '24',
    unitId: 'unit3',
    title: '类和方法',
    description: '学习如何定义类和方法，理解面向对象编程基础。',
    difficulty: '入门' as Difficulty,
    content: `类是 Python 中面向对象编程的基础。类定义了对象的属性和方法。

## 定义类

使用 \`class\` 关键字定义类：

\`\`\`python
class Rectangle:
    def __init__(self, width, height):
        self.width = width
        self.height = height
\`\`\`

## 方法类型

### 1. 实例方法

实例方法接收 \`self\` 作为第一个参数，用于访问和修改实例属性：

\`\`\`python
class Rectangle:
    def __init__(self, width, height):
        self.width = width
        self.height = height
    
    def area(self):
        """计算面积"""
        return self.width * self.height
    
    def double_size(self):
        """将尺寸放大两倍"""
        self.width *= 2
        self.height *= 2
\`\`\`

### 2. 类方法

使用 \`@classmethod\` 装饰器定义类方法，第一个参数是 \`cls\`（类本身）：

\`\`\`python
class Rectangle:
    @classmethod
    def square(cls, size):
        """创建正方形（类方法）"""
        return cls(size, size)
\`\`\`

### 3. 静态方法

使用 \`@staticmethod\` 装饰器定义静态方法，不需要 \`self\` 或 \`cls\` 参数：

\`\`\`python
class Rectangle:
    @staticmethod
    def is_valid(width, height):
        """检查尺寸是否有效（静态方法）"""
        return width > 0 and height > 0
\`\`\`

## 特殊方法

Python 提供了许多特殊方法（魔术方法），用于自定义对象行为：

### __init__

构造函数，在创建对象时自动调用。

### __str__ 和 __repr__

定义对象的字符串表示。`,
    exampleCode: `# 定义类
class Rectangle:
    def __init__(self, width, height):
        """构造函数"""
        self.width = width
        self.height = height
    
    # 实例方法
    def area(self):
        """计算面积"""
        return self.width * self.height
    
    def double_size(self):
        """将尺寸放大两倍"""
        self.width *= 2
        self.height *= 2
    
    def can_hold(self, other):
        """检查是否能容纳另一个矩形"""
        return self.width > other.width and self.height > other.height
    
    # 类方法
    @classmethod
    def square(cls, size):
        """创建正方形"""
        return cls(size, size)
    
    # 静态方法
    @staticmethod
    def is_valid(width, height):
        """检查尺寸是否有效"""
        return width > 0 and height > 0
    
    # 特殊方法
    def __str__(self):
        """用户友好的字符串表示"""
        return f"Rectangle({self.width}x{self.height})"
    
    def __repr__(self):
        """开发者友好的字符串表示"""
        return f"Rectangle(width={self.width}, height={self.height})"

# 使用类
rect = Rectangle(30, 50)
print(f"面积: {rect.area()}")  # 1500

# 调用实例方法
rect.double_size()
print(f"放大后面积: {rect.area()}")  # 6000

# 调用类方法
square = Rectangle.square(10)
print(f"正方形面积: {square.area()}")  # 100

# 调用静态方法
print(Rectangle.is_valid(10, 20))  # True

# 方法之间的调用
rect2 = Rectangle(10, 20)
print(f"rect 能容纳 rect2: {rect.can_hold(rect2)}")  # True`,
    summary: [
      '使用 class 关键字定义类。',
      '__init__ 是构造函数，在创建对象时自动调用。',
      '实例方法的第一个参数是 self，用于访问实例属性。',
      '@classmethod 定义类方法，第一个参数是 cls。',
      '@staticmethod 定义静态方法，不需要 self 或 cls。',
      '__str__ 和 __repr__ 定义对象的字符串表示。',
      '方法可以调用同一个类的其他方法。'
    ]
  } as CourseChapter,
  // 单元4：集合类型
  {
    id: '25',
    unitId: 'unit4',
    title: '列表',
    description: '学习 list，Python 中的动态数组。',
    difficulty: '入门' as Difficulty,
    content: `列表（list）是 Python 中最常用的数据结构之一，是动态数组的实现。

## 列表的特点

列表具有以下特点：
- **可变性**：列表是可变的（mutable），可以修改、添加、删除元素
- **有序性**：列表中的元素按插入顺序存储，保持顺序
- **异构性**：可以存储不同类型的元素（整数、字符串、对象等）
- **动态大小**：列表长度可以动态改变，无需预先指定大小

## 创建列表

Python 提供了多种创建列表的方式：

### 1. 字面量创建

使用方括号 \`[]\` 创建列表：

**示例：**
\`\`\`python
empty_list = []  # 空列表
numbers = [1, 2, 3, 4, 5]  # 整数列表
mixed = [1, "hello", 3.14, True]  # 混合类型列表
\`\`\`

### 2. list() 构造函数

使用 \`list()\` 构造函数创建列表：

**示例：**
\`\`\`python
list1 = list()  # 空列表
list2 = list(range(5))  # [0, 1, 2, 3, 4]
list3 = list("hello")  # ['h', 'e', 'l', 'l', 'o']
\`\`\`

### 3. 列表推导式

使用列表推导式创建列表（推荐，简洁高效）：

**示例：**
\`\`\`python
squares = [x**2 for x in range(10)]  # [0, 1, 4, 9, ...]
evens = [x for x in range(20) if x % 2 == 0]  # 偶数列表
\`\`\`

## 列表操作

### 访问元素

- **索引访问**：使用索引访问元素（从 0 开始）
- **负数索引**：-1 表示最后一个元素
- **切片**：使用切片获取子列表

**示例：**
\`\`\`python
my_list = [10, 20, 30, 40, 50]
print(my_list[0])    # 10（第一个元素）
print(my_list[-1])   # 50（最后一个元素）
print(my_list[1:4])  # [20, 30, 40]（切片）
\`\`\`

### 修改列表

- **修改元素**：通过索引直接修改
- **添加元素**：\`append()\`（末尾）、\`insert()\`（指定位置）、\`extend()\`（扩展）
- **删除元素**：\`remove()\`（按值）、\`pop()\`（按索引）、\`del\` 语句、\`clear()\`（清空）

**示例：**
\`\`\`python
my_list = [1, 2, 3]
my_list[0] = 10  # 修改
my_list.append(4)  # 添加
my_list.insert(1, 5)  # 在索引1处插入5
my_list.remove(2)  # 删除值为2的元素
value = my_list.pop()  # 删除并返回最后一个元素
\`\`\`

### 列表方法

常用列表方法：
- **查找**：\`index()\`（查找索引）、\`count()\`（计数）
- **排序**：\`sort()\`（原地排序）、\`sorted()\`（返回新列表）
- **反转**：\`reverse()\`（原地反转）
- **复制**：\`copy()\`（浅拷贝）

**示例：**
\`\`\`python
my_list = [3, 1, 4, 1, 5]
index = my_list.index(4)  # 2
count = my_list.count(1)  # 2
my_list.sort()  # [1, 1, 3, 4, 5]
my_list.reverse()  # [5, 4, 3, 1, 1]
\`\`\`

## 列表推导式

列表推导式是创建列表的简洁方式：

**语法：** \`[表达式 for 变量 in 序列 if 条件]\`

**优势：**
- 代码简洁易读
- 性能通常比循环更好
- 可以嵌套使用

**示例：**
\`\`\`python
# 基本推导式
squares = [x**2 for x in range(10)]

# 带条件的推导式
evens = [x for x in range(20) if x % 2 == 0]

# 嵌套推导式
matrix = [[i*j for j in range(3)] for i in range(3)]
\`\`\`

## 列表的性能

- **访问**：O(1) - 通过索引访问很快
- **添加/删除末尾**：O(1) - append/pop 很快
- **插入/删除中间**：O(n) - 需要移动元素
- **查找**：O(n) - 需要遍历列表

**优化建议：**
- 大量插入/删除操作考虑使用 collections.deque
- 需要快速查找考虑使用集合（set）或字典（dict）`,
    exampleCode: `# 创建列表
my_list = []  # 空列表
my_list2 = [1, 2, 3]  # 直接创建

# 添加元素
my_list.append(1)  # 末尾添加
my_list.append(2)
my_list.append(3)
my_list.insert(1, 10)  # 在索引1处插入10
my_list.extend([4, 5])  # 扩展列表

# 访问元素
third = my_list[2]  # 索引访问，如果越界会抛出IndexError
print(f"第三个元素: {third}")

# 安全访问（使用try-except）
try:
    third = my_list[10]
except IndexError:
    print("索引超出范围")

# 遍历
for item in my_list:
    print(item)

# 遍历时修改
for i in range(len(my_list)):
    my_list[i] += 10

# 使用列表存储不同类型
row = [3, "blue", 10.12, True]  # Python列表可以存储不同类型

# 列表推导式
squares = [x**2 for x in range(10)]
evens = [x for x in range(20) if x % 2 == 0]

# 列表方法
my_list = [3, 1, 4, 1, 5]
index = my_list.index(4)  # 2
count = my_list.count(1)  # 2
my_list.sort()  # [1, 1, 3, 4, 5]
my_list.reverse()  # [5, 4, 3, 1, 1]`,
    summary: [
      '使用 [] 创建列表，可以存储不同类型的元素。',
      '使用 append() 在末尾添加元素，insert() 在指定位置插入。',
      '使用索引访问元素，如果越界会抛出 IndexError。',
      'Python 列表可以存储不同类型的数据。',
      '使用列表推导式可以简洁地创建列表。',
      '列表提供了丰富的方法（sort、reverse、index、count 等）。'
    ]
  } as CourseChapter,
  {
    id: '26',
    unitId: 'unit4',
    title: 'String 深入',
    description: '深入学习 String 类型，理解字符串的内部实现。',
    difficulty: '进阶' as Difficulty,
    content: `str 是 Python 中不可变的 Unicode 字符串类型，String 类型不存在（str 就是字符串）。

&str 是字符串切片，通常用于借用字符串数据。`,
    exampleCode: `fn main() {
    // 创建 String
    let mut s = String::new();
    let s2 = String::from("初始内容");
    let s3 = "初始内容".to_string();
    
    // 更新 String
    s.push_str("hello");
    s.push('!');  // 添加单个字符
    println!("{}", s);
    
    // 字符串连接
    let s1 = String::from("Hello, ");
    let s2 = String::from("world!");
    let s3 = s1 + &s2;  // s1 的所有权被移动
    // println!("{}", s1);  // 错误！
    
    // 使用 format! 宏
    let s1 = String::from("tic");
    let s2 = String::from("tac");
    let s3 = String::from("toe");
    let s = format!("{}-{}-{}", s1, s2, s3);
    println!("{}", s);
    
    // 字符串索引（不能直接索引）
    let hello = "Здравствуйте";
    // let c = hello[0];  // 错误！不能直接索引
    
    // 字符串切片
    let s = &hello[0..4];  // 获取前4个字节
    println!("{}", s);
    
    // 遍历字符串
    for c in "नमस्ते".chars() {
        println!("{}", c);
    }
    
    for b in "नमस्ते".bytes() {
        println!("{}", b);
    }
}`,
    summary: [
      'String 是可增长的 UTF-8 字符串。',
      '&str 是字符串切片。',
      '不能直接通过索引访问字符。',
      '使用 chars() 遍历字符。',
      '使用 bytes() 遍历字节。'
    ]
  } as CourseChapter,
  {
    id: '27',
    unitId: 'unit4',
    title: '字典',
    description: '学习 dict，Python 中的键值对集合。',
    difficulty: '进阶' as Difficulty,
    content: `字典（dict）是 Python 中最重要的数据结构之一，用于存储键值对映射。

## 字典的特点

字典具有以下特点：
- **键值对映射**：每个元素由键（key）和值（value）组成
- **键的唯一性**：字典中的键必须是唯一的，重复的键会覆盖旧值
- **键的不可变性**：键必须是不可变类型（字符串、数字、元组等），不能使用列表或字典作为键
- **无序性**：Python 3.7+ 字典保持插入顺序，但不应依赖顺序进行设计
- **可变性**：字典是可变的，可以添加、修改、删除键值对

## 创建字典

Python 提供了多种创建字典的方式：

### 1. 字面量创建

使用花括号 \`{}\` 创建字典：

**示例：**
\`\`\`python
empty_dict = {}  # 空字典
person = {"name": "Alice", "age": 25, "city": "Beijing"}
mixed = {1: "one", "two": 2, (1, 2): "tuple"}  # 混合键类型
\`\`\`

### 2. dict() 构造函数

使用 \`dict()\` 构造函数创建字典：

**示例：**
\`\`\`python
dict1 = dict()  # 空字典
dict2 = dict(name="Bob", age=30)  # 关键字参数
dict3 = dict([("a", 1), ("b", 2)])  # 从列表创建
\`\`\`

### 3. 字典推导式

使用字典推导式创建字典：

**示例：**
\`\`\`python
squares = {x: x**2 for x in range(5)}  # {0: 0, 1: 1, 2: 4, ...}
filtered = {k: v for k, v in dict.items() if v > 0}
\`\`\`

## 字典操作

### 访问元素

- **索引访问**：使用键访问值（键不存在会抛出 KeyError）
- **get() 方法**：安全访问，键不存在返回 None 或默认值
- **in 操作符**：检查键是否存在

**示例：**
\`\`\`python
person = {"name": "Alice", "age": 25}
name = person["name"]  # 直接访问
age = person.get("age")  # 使用 get
city = person.get("city", "Unknown")  # 带默认值
if "name" in person:  # 检查键是否存在
    print(person["name"])
\`\`\`

### 修改字典

- **添加/修改**：直接赋值
- **update() 方法**：批量更新
- **删除元素**：\`del\` 语句、\`pop()\`（返回并删除）、\`popitem()\`（删除最后一项）、\`clear()\`（清空）

**示例：**
\`\`\`python
person = {"name": "Alice"}
person["age"] = 25  # 添加
person["name"] = "Bob"  # 修改
person.update({"city": "Beijing", "country": "China"})  # 批量更新
age = person.pop("age")  # 删除并返回值
person.clear()  # 清空字典
\`\`\`

### 字典方法

常用字典方法：
- **keys()**：返回所有键的视图
- **values()**：返回所有值的视图
- **items()**：返回所有键值对的视图
- **copy()**：浅拷贝字典
- **fromkeys()**：从序列创建字典

**示例：**
\`\`\`python
person = {"name": "Alice", "age": 25, "city": "Beijing"}
keys = person.keys()  # dict_keys(['name', 'age', 'city'])
values = person.values()  # dict_values(['Alice', 25, 'Beijing'])
items = person.items()  # dict_items([('name', 'Alice'), ...])

# 遍历字典
for key in person:
    print(key, person[key])
for key, value in person.items():
    print(key, value)
\`\`\`

## 字典的性能

- **访问**：O(1) - 平均情况下很快
- **插入/删除**：O(1) - 平均情况下很快
- **查找键**：O(1) - 平均情况下很快

**底层实现：**
- Python 字典使用哈希表实现
- 平均时间复杂度为 O(1)
- 最坏情况下为 O(n)，但实际很少发生

## 字典的应用场景

- **数据映射**：存储键值对关系
- **计数器**：统计元素出现次数
- **缓存**：存储计算结果
- **配置管理**：存储配置信息
- **JSON 数据**：处理 JSON 格式数据`,
    exampleCode: `use std::collections::HashMap;

fn main() {
    // 创建 HashMap
    let mut scores = HashMap::new();
    
    // 插入值
    scores.insert(String::from("Blue"), 10);
    scores.insert(String::from("Yellow"), 50);
    
    // 访问值
    let team_name = String::from("Blue");
    let score = scores.get(&team_name);
    match score {
        Some(s) => println!("分数: {}", s),
        None => println!("没有找到"),
    }
    
    // 遍历
    for (key, value) in &scores {
        println!("{}: {}", key, value);
    }
    
    // 只在键不存在时插入
    scores.entry(String::from("Yellow")).or_insert(50);
    scores.entry(String::from("Blue")).or_insert(50);
    
    // 根据旧值更新
    let text = "hello world wonderful world";
    let mut map = HashMap::new();
    
    for word in text.split_whitespace() {
        let count = map.entry(word).or_insert(0);
        *count += 1;
    }
    
    println!("{:?}", map);
}`,
    summary: [
      'HashMap 存储键值对。',
      '所有键类型相同，所有值类型相同。',
      '使用 get 获取值，返回 Option。',
      '使用 entry 和 or_insert 只在不存在时插入。',
      'HashMap 使用哈希函数存储数据。'
    ]
  } as CourseChapter,
  {
    id: '28',
    unitId: 'unit4',
    title: '迭代器',
    description: '学习迭代器模式，Python 中处理集合的强大方式。',
      difficulty: '进阶' as Difficulty,
      content: `迭代器允许你依次处理序列中的每个元素。

Python 的迭代器是惰性的，只有在迭代时才会执行。迭代器提供了许多有用的方法。`,
    exampleCode: `fn main() {
    let v1 = vec![1, 2, 3];
    let v1_iter = v1.iter();
    
    // 使用 for 循环消费迭代器
    for val in v1_iter {
        println!("得到: {}", val);
    }
    
    // 迭代器适配器（不消费迭代器）
    let v1 = vec![1, 2, 3];
    let v2: Vec<_> = v1.iter().map(|x| x + 1).collect();
    println!("{:?}", v2);  // [2, 3, 4]
    
    // 常用迭代器方法
    let v = vec![1, 2, 3, 4, 5];
    
    // map - 转换每个元素
    let doubled: Vec<_> = v.iter().map(|x| x * 2).collect();
    
    // filter - 过滤元素
    let evens: Vec<_> = v.iter().filter(|x| *x % 2 == 0).collect();
    
    // fold - 累积
    let sum: i32 = v.iter().sum();
    let product: i32 = v.iter().product();
    
    // find - 查找元素
    let found = v.iter().find(|&&x| x > 3);
    
    // enumerate - 获取索引
    for (i, val) in v.iter().enumerate() {
        println!("索引 {}: {}", i, val);
    }
    
    // zip - 组合两个迭代器
    let v1 = vec![1, 2, 3];
    let v2 = vec![4, 5, 6];
    for (a, b) in v1.iter().zip(v2.iter()) {
        println!("({}, {})", a, b);
    }
}`,
    summary: [
      '迭代器是惰性的，需要消费才会执行。',
      'iter() 返回不可变引用。',
      'iter_mut() 返回可变引用。',
      'into_iter() 获取所有权。',
      'map、filter 等是迭代器适配器。'
    ]
  } as CourseChapter,
  {
    id: '29',
    unitId: 'unit4',
    title: '闭包',
    description: '学习 lambda 表达式（匿名函数），Python 中的函数式编程特性。',
    difficulty: '进阶' as Difficulty,
    content: `闭包是可以捕获其环境中变量的匿名函数。

闭包可以存储在变量中，可以作为参数传递，可以从函数返回。闭包可以捕获三种方式的值：不可变借用、可变借用和获取所有权。`,
    exampleCode: `fn main() {
    // 基本闭包
    let add_one = |x: i32| x + 1;
    println!("{}", add_one(5));
    
    // 闭包可以捕获环境变量
    let x = 4;
    let equal_to_x = |z| z == x;
    let y = 4;
    assert!(equal_to_x(y));
    
    // 闭包的三种捕获方式
    let list = vec![1, 2, 3];
    
    // 不可变借用
    let borrows = || println!("{:?}", list);
    borrows();
    println!("之后还能使用: {:?}", list);
    
    // 可变借用
    let mut list2 = vec![1, 2, 3];
    let mut borrows_mutably = || list2.push(7);
    borrows_mutably();
    // println!("{:?}", list2);  // 错误！仍有可变借用
    
    // 获取所有权
    let list3 = vec![1, 2, 3];
    let takes_ownership = move || println!("{:?}", list3);
    takes_ownership();
    // println!("{:?}", list3);  // 错误！所有权已移动
    
    // 作为函数参数
    let numbers = vec![1, 2, 3, 4, 5];
    let doubled: Vec<_> = numbers.iter().map(|x| x * 2).collect();
    println!("{:?}", doubled);
    
    // 存储闭包
    let expensive_closure = |num: u32| -> u32 {
        println!("计算中...");
        num
    };
}`,
    summary: [
      '闭包是匿名函数。',
      '闭包可以捕获环境变量。',
      '有三种捕获方式：不可变、可变、所有权。',
      '使用 move 关键字强制获取所有权。',
      '闭包类型可以存储在变量中。'
    ]
  } as CourseChapter,
  // 单元5：错误处理
  {
    id: '30',
    unitId: 'unit5',
    title: '异常和程序终止',
    description: '学习异常和程序终止，理解程序崩溃时的行为。',
    difficulty: '入门' as Difficulty,
    content: `在 Python 中，未处理的异常会导致程序终止。理解异常和程序终止的行为对于编写健壮的程序非常重要。

## 1. 异常和程序终止

当发生未处理的异常时：
- 程序会立即终止
- 打印异常信息和堆栈跟踪
- 退出码通常不为 0

## 2. 常见的程序终止情况

### 未处理的异常

未捕获的异常会导致程序终止。

### 系统错误

系统级别的错误（如内存不足）会导致程序终止。

### 手动终止

使用 \`sys.exit()\` 或 \`os._exit()\` 手动终止程序。

## 3. 异常处理

使用 try-except 捕获异常，避免程序意外终止：
- 捕获特定异常
- 捕获所有异常
- 使用 finally 确保清理工作

## 4. 最佳实践

1. **捕获异常**：总是捕获可能发生的异常
2. **提供默认值**：使用默认值而不是让程序崩溃
3. **记录错误**：记录错误信息以便调试
4. **优雅降级**：在错误发生时提供备用方案`,
    exampleCode: `import sys

# 1. 未处理的异常导致程序终止
def divide(a, b):
    return a / b

# divide(10, 0)  # ZeroDivisionError: division by zero
# 程序会终止

# 2. 捕获异常避免程序终止
def safe_divide(a, b):
    try:
        return a / b
    except ZeroDivisionError:
        print("除数不能为零")
        return None

result = safe_divide(10, 0)  # 不会终止程序
print(result)  # None

# 3. 索引越界
my_list = [1, 2, 3]

# my_list[99]  # IndexError: list index out of range
# 程序会终止

# 4. 安全访问列表
def safe_get_item(lst, index):
    try:
        return lst[index]
    except IndexError:
        print(f"索引 {index} 超出范围")
        return None

result = safe_get_item(my_list, 99)  # 不会终止程序
print(result)  # None

# 5. 字典键不存在
my_dict = {"a": 1, "b": 2}

# value = my_dict["c"]  # KeyError: 'c'
# 程序会终止

# 6. 安全访问字典
def safe_get_value(d, key):
    try:
        return d[key]
    except KeyError:
        print(f"键 '{key}' 不存在")
        return None

result = safe_get_value(my_dict, "c")  # 不会终止程序
print(result)  # None

# 或者使用 get 方法
value = my_dict.get("c", None)  # 安全，不会抛出异常
print(value)  # None

# 7. 类型错误
# result = "hello" + 5  # TypeError: can only concatenate str (not "int") to str
# 程序会终止

# 8. 安全类型转换
def safe_add(a, b):
    try:
        return a + b
    except TypeError:
        print("类型不匹配，无法相加")
        return None

result = safe_add("hello", 5)  # 不会终止程序
print(result)  # None

# 9. 手动终止程序
def check_condition(value):
    if value < 0:
        print("值不能为负数，程序终止")
        sys.exit(1)  # 手动终止，退出码为 1
    return value * 2

# check_condition(-1)  # 程序会终止

# 10. 使用 assert（开发时）
def process_positive_number(n):
    assert n > 0, "数字必须为正数"  # 如果条件为 False，会抛出 AssertionError
    return n * 2

# process_positive_number(-1)  # AssertionError: 数字必须为正数
# 程序会终止（如果未捕获）

# 11. 捕获所有异常
def robust_function(data):
    try:
        # 可能出错的代码
        result = data[0] / data[1]
        return result
    except Exception as e:
        print(f"发生错误: {type(e).__name__}: {e}")
        return None

result = robust_function([10, 0])  # 不会终止程序
print(result)  # None

# 12. 使用 finally 确保清理
def process_file(filename):
    try:
        file = open(filename, 'r')
        content = file.read()
        return content
    except FileNotFoundError:
        print(f"文件 {filename} 不存在")
        return None
    finally:
        # 无论是否发生异常，都会执行
        if 'file' in locals():
            file.close()

# 13. 自定义异常
class CustomError(Exception):
    pass

def raise_custom_error():
    raise CustomError("这是一个自定义错误")

# raise_custom_error()  # CustomError: 这是一个自定义错误
# 程序会终止（如果未捕获）

# 14. 异常链
try:
    try:
        raise ValueError("原始错误")
    except ValueError as e:
        raise RuntimeError("运行时错误") from e
except RuntimeError as e:
    print(f"捕获到: {e}")
    print(f"原因: {e.__cause__}")

# 15. 优雅的错误处理
def process_data(data):
    if not data:
        print("数据为空，使用默认值")
        return []
    
    try:
        result = [x * 2 for x in data]
        return result
    except TypeError:
        print("数据类型错误，返回空列表")
        return []
    except Exception as e:
        print(f"未知错误: {e}")
        return []`,
    summary: [
      '未处理的异常会导致程序立即终止。',
      '使用 try-except 捕获异常，避免程序意外终止。',
      '索引越界、键不存在、类型错误等都会抛出异常。',
      '使用 get() 方法安全访问字典，避免 KeyError。',
      '使用 sys.exit() 手动终止程序。',
      '使用 assert 进行断言（开发时）。',
      '使用 finally 确保清理工作。',
      '总是捕获可能发生的异常，提供优雅的错误处理。',
      '记录错误信息以便调试和问题定位。'
    ]
  } as CourseChapter,
  {
    id: '31',
    unitId: 'unit5',
    title: '异常处理深入',
    description: '深入学习异常处理，掌握错误处理的最佳实践。',
    difficulty: '进阶' as Difficulty,
    content: `异常处理是 Python 中处理可恢复错误的标准方式。

使用 try-except 可以让程序优雅地处理错误，而不是直接崩溃。

## try-except-else-finally 结构

Python 提供了完整的异常处理结构：

### 基本结构

\`\`\`python
try:
    # 可能抛出异常的代码
    result = 10 / 0
except ZeroDivisionError:
    # 处理特定异常
    print("除零错误")
except Exception as e:
    # 处理所有其他异常
    print(f"发生错误: {e}")
else:
    # 没有异常时执行
    print("操作成功")
finally:
    # 无论是否有异常都会执行
    print("清理资源")
\`\`\`

### 多个异常处理

可以捕获多个异常类型：

\`\`\`python
try:
    # 可能抛出多种异常
    value = int(input("输入数字: "))
    result = 10 / value
except ValueError:
    print("输入的不是数字")
except ZeroDivisionError:
    print("不能除以零")
except (TypeError, AttributeError) as e:
    # 同时捕获多种异常
    print(f"类型错误: {e}")
\`\`\`

## 异常的传播

异常会自动向上传播，直到被捕获或程序终止：

\`\`\`python
def divide(x, y):
    return x / y  # 如果 y 为 0，会抛出 ZeroDivisionError

def calculate(x, y):
    return divide(x, y)  # 异常会从这里向上传播

try:
    result = calculate(10, 0)
except ZeroDivisionError:
    print("捕获到除零错误")
\`\`\`

## 自定义异常

可以定义自己的异常类：

\`\`\`python
class CustomError(Exception):
    """自定义异常"""
    pass

class ValidationError(Exception):
    """验证错误"""
    def __init__(self, message, field):
        self.message = message
        self.field = field
        super().__init__(self.message)

# 使用自定义异常
def validate_age(age):
    if age < 0:
        raise ValidationError("年龄不能为负数", "age")
    if age > 150:
        raise ValidationError("年龄不能超过150", "age")
    return True
\`\`\`

## 异常处理的最佳实践

### 1. 具体异常类型

应该捕获具体的异常类型，而不是通用的 \`Exception\`：

\`\`\`python
# 好的做法
try:
    file = open("data.txt")
except FileNotFoundError:
    print("文件不存在")
except PermissionError:
    print("没有权限")

# 不好的做法
try:
    file = open("data.txt")
except Exception:  # 太宽泛
    print("出错了")
\`\`\`

### 2. 不要忽略异常

至少记录异常信息：

\`\`\`python
# 好的做法
try:
    risky_operation()
except Exception as e:
    logger.error(f"操作失败: {e}")  # 记录日志
    # 或者重新抛出
    raise

# 不好的做法
try:
    risky_operation()
except:
    pass  # 完全忽略异常
\`\`\`

### 3. 使用 finally 清理资源

确保资源被正确释放：

\`\`\`python
file = None
try:
    file = open("data.txt")
    # 处理文件
except IOError as e:
    print(f"文件操作失败: {e}")
finally:
    if file:
        file.close()  # 确保文件被关闭

# 更好的方式：使用 with 语句
with open("data.txt") as file:
    # 处理文件，自动关闭
    pass
\`\`\`

### 4. 异常链

使用 \`raise ... from ...\` 保留原始异常信息：

\`\`\`python
try:
    x = 1 / 0
except ZeroDivisionError as e:
    raise ValueError("无效输入") from e  # 保留原始异常
\`\`\``,
    exampleCode: `# 基本异常处理
try:
    result = 10 / 0
except ZeroDivisionError:
    print("除零错误")

# 多个异常处理
try:
    value = int(input("输入数字: "))
    result = 10 / value
except ValueError:
    print("输入的不是数字")
except ZeroDivisionError:
    print("不能除以零")

# try-except-else-finally
try:
    file = open("data.txt", "r")
    content = file.read()
except FileNotFoundError:
    print("文件不存在")
except IOError as e:
    print(f"文件操作失败: {e}")
else:
    print("文件读取成功")
finally:
    if 'file' in locals():
        file.close()

# 使用 with 语句（推荐）
try:
    with open("data.txt", "r") as file:
        content = file.read()
except FileNotFoundError:
    print("文件不存在")

# 自定义异常
class ValidationError(Exception):
    def __init__(self, message, field):
        self.message = message
        self.field = field
        super().__init__(self.message)

def validate_age(age):
    if age < 0:
        raise ValidationError("年龄不能为负数", "age")
    return True

try:
    validate_age(-1)
except ValidationError as e:
    print(f"验证失败 - {e.field}: {e.message}")

# 异常传播
def divide(x, y):
    return x / y

def calculate(x, y):
    return divide(x, y)

try:
    result = calculate(10, 0)
except ZeroDivisionError:
    print("捕获到除零错误")

# 重新抛出异常
def process_data(data):
    try:
        result = int(data)
    except ValueError as e:
        print(f"转换失败: {e}")
        raise  # 重新抛出异常`,
    summary: [
      '使用 try-except 处理异常，而不是让程序崩溃。',
      '捕获具体的异常类型，避免使用过于宽泛的 Exception。',
      '使用 else 子句处理没有异常的情况。',
      '使用 finally 子句确保资源被清理。',
      '优先使用 with 语句管理资源。',
      '可以定义自定义异常类来表示特定的错误情况。',
      '不要完全忽略异常，至少要记录日志。'
    ]
  } as CourseChapter,
  {
    id: '32',
    unitId: 'unit5',
    title: '异常传播',
    description: '学习异常如何在函数间传播，掌握异常处理的高级技巧。',
    difficulty: '进阶' as Difficulty,
    content: `异常会在函数调用链中自动向上传播，直到被捕获或程序终止。

## 异常的自动传播

Python 中，异常会自动向上传播：

\`\`\`python
def inner_function():
    raise ValueError("内部错误")

def middle_function():
    inner_function()  # 异常从这里向上传播

def outer_function():
    try:
        middle_function()
    except ValueError as e:
        print(f"捕获到错误: {e}")
\`\`\`

## 重新抛出异常

可以使用 \`raise\` 重新抛出异常：

\`\`\`python
def process_data(data):
    try:
        result = int(data)
    except ValueError as e:
        print(f"转换失败: {e}")
        raise  # 重新抛出原始异常
\`\`\`

## 转换异常类型

可以使用 \`raise ... from ...\` 转换异常类型并保留原始异常：

\`\`\`python
try:
    file = open("data.txt")
except FileNotFoundError as e:
    raise ValueError("数据文件不存在") from e  # 保留原始异常
\`\`\`

## 异常链

Python 会自动维护异常链，可以使用 \`__cause__\` 访问：

\`\`\`python
try:
    try:
        x = 1 / 0
    except ZeroDivisionError as e:
        raise ValueError("无效输入") from e
except ValueError as e:
    print(f"当前异常: {e}")
    print(f"原始异常: {e.__cause__}")
\`\`\`

## 上下文管理器和异常

使用 \`with\` 语句可以确保资源被正确清理，即使发生异常：

\`\`\`python
# 自动关闭文件，即使发生异常
with open("data.txt") as file:
    content = file.read()
    # 如果这里发生异常，文件仍然会被关闭
\`\`\`

## 异常处理的最佳实践

1. **让异常传播**：如果函数无法处理异常，让它继续传播
2. **具体异常**：捕获具体的异常类型，而不是通用的 \`Exception\`
3. **异常信息**：提供清晰的错误信息
4. **清理资源**：使用 \`with\` 语句或 \`finally\` 确保资源被清理`,
    exampleCode: `# 异常的自动传播
def inner_function():
    raise ValueError("内部错误")

def middle_function():
    inner_function()  # 异常从这里向上传播

def outer_function():
    try:
        middle_function()
    except ValueError as e:
        print(f"捕获到错误: {e}")

outer_function()  # 捕获到错误: 内部错误

# 重新抛出异常
def process_data(data):
    try:
        result = int(data)
        return result
    except ValueError as e:
        print(f"转换失败: {e}")
        raise  # 重新抛出原始异常

try:
    process_data("abc")
except ValueError as e:
    print(f"外层捕获: {e}")

# 转换异常类型
def read_config_file(filename):
    try:
        with open(filename) as file:
            return file.read()
    except FileNotFoundError as e:
        raise ValueError(f"配置文件不存在: {filename}") from e

try:
    config = read_config_file("missing.txt")
except ValueError as e:
    print(f"错误: {e}")
    print(f"原始异常: {e.__cause__}")

# 异常链
try:
    try:
        x = 1 / 0
    except ZeroDivisionError as e:
        raise ValueError("无效输入") from e
except ValueError as e:
    print(f"当前异常: {e}")
    print(f"原始异常: {e.__cause__}")

# 使用 with 语句处理资源
def process_file(filename):
    try:
        with open(filename) as file:
            content = file.read()
            # 模拟处理过程中的错误
            if len(content) == 0:
                raise ValueError("文件为空")
            return content
    except FileNotFoundError:
        print("文件不存在")
        raise
    except ValueError as e:
        print(f"处理失败: {e}")
        raise

# 多个异常处理
def complex_operation():
    try:
        result = int(input("输入数字: "))
        if result < 0:
            raise ValueError("数字不能为负")
        return result
    except ValueError as e:
        print(f"输入错误: {e}")
        raise
    except KeyboardInterrupt:
        print("操作被中断")
        raise`,
    summary: [
      '异常会自动向上传播，直到被捕获或程序终止。',
      '使用 raise 重新抛出异常。',
      '使用 raise ... from ... 转换异常类型并保留原始异常。',
      'Python 自动维护异常链，可以通过 __cause__ 访问原始异常。',
      '使用 with 语句确保资源被正确清理，即使发生异常。',
      '如果函数无法处理异常，应该让它继续传播。',
      '捕获具体的异常类型，而不是通用的 Exception。'
    ]
  } as CourseChapter,
  {
    id: '33',
    unitId: 'unit5',
    title: '自定义异常类',
    description: '学习如何定义和使用自定义异常类。',
    difficulty: '高阶' as Difficulty,
    content: `可以定义自己的异常类，创建更具体、更有用的错误信息。

## 定义自定义异常类

最简单的自定义异常类：

\`\`\`python
class MyCustomError(Exception):
    """自定义异常类"""
    pass

# 使用
raise MyCustomError("发生自定义错误")
\`\`\`

## 带消息的异常类

\`\`\`python
class ValidationError(Exception):
    """验证错误"""
    def __init__(self, message, field):
        self.message = message
        self.field = field
        super().__init__(self.message)
\`\`\`

## 异常类层次结构

可以创建异常类的层次结构：

\`\`\`python
class DatabaseError(Exception):
    """数据库错误基类"""
    pass

class ConnectionError(DatabaseError):
    """连接错误"""
    pass

class QueryError(DatabaseError):
    """查询错误"""
    pass
\`\`\`

## 组合异常

可以创建一个异常类来组合多种错误类型：

\`\`\`python
class ApplicationError(Exception):
    """应用错误，可以包含多种错误"""
    def __init__(self, message, errors=None):
        super().__init__(message)
        self.errors = errors or []
    
    def add_error(self, error):
        self.errors.append(error)
    
    def has_errors(self):
        return len(self.errors) > 0
\`\`\`

## 异常类的最佳实践

1. **继承 Exception**：所有自定义异常都应该继承自 \`Exception\`
2. **清晰的命名**：使用描述性的名称，通常以 \`Error\` 结尾
3. **文档字符串**：为异常类添加文档字符串
4. **错误信息**：提供清晰、有用的错误信息
5. **层次结构**：使用异常类层次结构组织相关错误`,
    exampleCode: `# 简单的自定义异常类
class MyCustomError(Exception):
    """自定义异常类"""
    pass

# 使用
try:
    raise MyCustomError("发生自定义错误")
except MyCustomError as e:
    print(f"捕获到自定义错误: {e}")

# 带消息的异常类
class ValidationError(Exception):
    """验证错误"""
    def __init__(self, message, field):
        self.message = message
        self.field = field
        super().__init__(f"{field}: {message}")

# 使用
def validate_age(age):
    if age < 0:
        raise ValidationError("年龄不能为负数", "age")
    if age > 150:
        raise ValidationError("年龄不能超过150", "age")
    return True

try:
    validate_age(-1)
except ValidationError as e:
    print(f"验证失败 - {e.field}: {e.message}")

# 异常类层次结构
class DatabaseError(Exception):
    """数据库错误基类"""
    pass

class ConnectionError(DatabaseError):
    """连接错误"""
    pass

class QueryError(DatabaseError):
    """查询错误"""
    pass

def connect_database():
    raise ConnectionError("无法连接到数据库")

try:
    connect_database()
except DatabaseError as e:
    print(f"数据库错误: {e}")  # 会捕获所有数据库错误

# 组合异常
class ApplicationError(Exception):
    """应用错误，可以包含多种错误"""
    def __init__(self, message, errors=None):
        super().__init__(message)
        self.errors = errors or []
    
    def add_error(self, error):
        self.errors.append(error)
    
    def has_errors(self):
        return len(self.errors) > 0

# 使用组合异常
def validate_user_data(data):
    errors = ApplicationError("验证失败")
    
    if not data.get("name"):
        errors.add_error("姓名不能为空")
    if not data.get("email"):
        errors.add_error("邮箱不能为空")
    
    if errors.has_errors():
        raise errors
    
    return True

try:
    validate_user_data({})
except ApplicationError as e:
    print(f"验证失败: {e}")
    for error in e.errors:
        print(f"  - {error}")

# 异常类继承内置异常
class FileNotFoundError(Exception):
    """文件未找到错误（自定义版本）"""
    def __init__(self, filename, path):
        self.filename = filename
        self.path = path
        super().__init__(f"文件未找到: {filename} (路径: {path})")

def find_file(filename):
    raise FileNotFoundError(filename, "/usr/local")

try:
    find_file("config.txt")
except FileNotFoundError as e:
    print(f"错误: {e}")
    print(f"文件名: {e.filename}, 路径: {e.path}")`,
    summary: [
      '可以定义自定义异常类，继承自 Exception。',
      '为异常类添加清晰的文档字符串。',
      '可以使用异常类层次结构组织相关错误。',
      '异常类可以包含额外的属性来提供更多上下文信息。',
      '使用描述性的名称，通常以 Error 结尾。',
      '提供清晰、有用的错误信息。',
      '可以创建组合异常来包含多个错误。'
    ]
  } as CourseChapter,
  // 单元6：模块系统
  {
    id: '34',
    unitId: 'unit6',
    title: '模块定义',
    description: '学习如何定义和使用模块，组织代码结构。',
    difficulty: '进阶' as Difficulty,
    content: `模块允许你将代码组织成逻辑单元，提高代码的可维护性和可重用性。

## 1. 什么是模块

模块是一个包含 Python 代码的文件，可以定义函数、类和变量。

## 2. 创建模块

创建一个 Python 文件（.py）就是一个模块：
- 文件名就是模块名
- 例如：\`math.py\` 就是 \`math\` 模块

## 3. 导入模块

使用 \`import\` 语句导入模块：
- \`import module_name\`：导入整个模块
- \`from module_name import item\`：从模块导入特定项
- \`from module_name import item as alias\`：导入并创建别名

## 4. 模块搜索路径

Python 按以下顺序搜索模块：
1. 当前目录
2. PYTHONPATH 环境变量指定的目录
3. Python 标准库目录
4. site-packages 目录

## 5. 包（Package）

包是包含多个模块的目录：
- 必须包含 \`__init__.py\` 文件（Python 3.3+ 可选）
- 可以嵌套，形成包层次结构

## 6. 模块的特殊属性

- \`__name__\`：模块名称
- \`__file__\`：模块文件路径
- \`__doc__\`：模块文档字符串`,
    exampleCode: `# 1. 创建模块（math_utils.py）
# math_utils.py
"""数学工具模块"""

def add(a, b):
    """加法函数"""
    return a + b

def multiply(a, b):
    """乘法函数"""
    return a * b

PI = 3.14159

# 2. 导入整个模块
import math_utils

result = math_utils.add(2, 3)
print(result)  # 5

# 3. 从模块导入特定项
from math_utils import add, multiply

result = add(2, 3)
print(result)  # 5

# 4. 导入并创建别名
import math_utils as mu

result = mu.multiply(2, 3)
print(result)  # 6

# 5. 导入所有项（不推荐）
from math_utils import *

result = add(2, 3)
print(result)  # 5

# 6. 模块的特殊属性
import math_utils

print(math_utils.__name__)  # math_utils
print(math_utils.__file__)  # /path/to/math_utils.py
print(math_utils.__doc__)  # 数学工具模块

# 7. 创建包
# mypackage/
#     __init__.py
#     module1.py
#     module2.py
#     subpackage/
#         __init__.py
#         module3.py

# mypackage/__init__.py
"""我的包"""
from . import module1
from . import module2

# mypackage/module1.py
def function1():
    return "Function 1"

# 8. 从包导入
from mypackage import module1
from mypackage.module2 import function2

# 9. 相对导入（在包内部）
# mypackage/subpackage/module3.py
from ..module1 import function1  # 从父包导入
from . import module4  # 从同级模块导入

# 10. 标准库模块
import os
import sys
import json
from datetime import datetime

# 11. 第三方模块
# 需要先安装：pip install requests
# import requests

# 12. 模块的命名空间
import math_utils

# 每个模块都有自己的命名空间
# math_utils.add 和 其他模块的 add 不会冲突

# 13. 条件导入
try:
    import optional_module
except ImportError:
    optional_module = None

if optional_module:
    optional_module.do_something()

# 14. 动态导入
import importlib

module = importlib.import_module('math_utils')
result = module.add(2, 3)

# 15. 重新加载模块
import importlib
importlib.reload(math_utils)  # Python 3.4+`,
    summary: [
      '模块是一个包含 Python 代码的文件。',
      '使用 import 语句导入模块。',
      '使用 from ... import ... 导入特定项。',
      '包是包含多个模块的目录，需要 __init__.py 文件。',
      'Python 按搜索路径查找模块。',
      '每个模块都有自己的命名空间。',
      '使用相对导入在包内部导入模块。',
      '模块有特殊属性如 __name__、__file__、__doc__。'
    ]
  } as CourseChapter,
  {
    id: '35',
    unitId: 'unit6',
    title: '模块导入和别名',
    description: '学习模块导入的各种方式，使用别名简化代码。',
    difficulty: '进阶' as Difficulty,
    content: `Python 提供了多种导入模块的方式，可以使用别名简化代码，提高可读性。

## 1. 基本导入

- \`import module\`：导入整个模块
- \`from module import item\`：从模块导入特定项
- \`from module import item1, item2\`：导入多个项

## 2. 使用别名

使用 \`as\` 关键字创建别名：
- \`import module as alias\`：为模块创建别名
- \`from module import item as alias\`：为导入的项创建别名

## 3. 导入所有项

使用 \`*\` 导入模块的所有公有项：
- \`from module import *\`：导入所有项（不推荐）

## 4. 嵌套导入

可以导入嵌套模块和子模块：
- \`from package.subpackage import module\`
- \`from package.subpackage.module import function\`

## 5. 相对导入

在包内部使用相对导入：
- \`from . import module\`：从当前包导入
- \`from .. import module\`：从父包导入
- \`from ... import module\`：从祖父包导入

## 6. 最佳实践

1. **明确导入**：明确导入需要的项，避免使用 \`*\`
2. **使用别名**：为长模块名创建简短别名
3. **组织导入**：按标准库、第三方库、本地模块的顺序组织导入
4. **避免循环导入**：注意避免模块之间的循环依赖`,
    exampleCode: `# 1. 基本导入
import math
import os
import sys

result = math.sqrt(16)
print(result)  # 4.0

# 2. 从模块导入特定项
from math import sqrt, pi

result = sqrt(16)
print(pi)  # 3.141592653589793

# 3. 导入多个项
from math import sqrt, pi, sin, cos

# 4. 使用别名（模块）
import math as m
import numpy as np
import pandas as pd

result = m.sqrt(16)
data = np.array([1, 2, 3])

# 5. 使用别名（项）
from math import sqrt as square_root
from datetime import datetime as dt

result = square_root(16)
now = dt.now()

# 6. 导入所有项（不推荐）
from math import *

result = sqrt(16)  # 不需要 math. 前缀
print(pi)

# 7. 嵌套导入
from collections.abc import Iterator
from urllib.request import urlopen

# 8. 从包导入
from mypackage import module1
from mypackage.module2 import function2

# 9. 相对导入（在包内部）
# mypackage/subpackage/module3.py
from ..module1 import function1  # 从父包导入
from . import module4  # 从同级模块导入
from ...parent import function  # 从祖父包导入

# 10. 条件导入
try:
    import optional_module
except ImportError:
    # 处理导入失败的情况
    optional_module = None

# 11. 导入并重命名避免冲突
from math import sqrt as math_sqrt
from mymodule import sqrt as my_sqrt

result1 = math_sqrt(16)
result2 = my_sqrt(16)

# 12. 导入类
from datetime import datetime, timedelta
from collections import defaultdict, Counter

now = datetime.now()
counter = Counter([1, 2, 2, 3, 3, 3])

# 13. 导入函数
from functools import reduce, partial
from itertools import chain, cycle

# 14. 导入常量
from math import pi, e
from sys import maxsize

# 15. 组织导入（推荐顺序）
# 1. 标准库
import os
import sys
from datetime import datetime

# 2. 第三方库
import numpy as np
import pandas as pd

# 3. 本地模块
from mypackage import module1
from mypackage.module2 import function2

# 16. 动态导入
import importlib

module_name = 'math'
module = importlib.import_module(module_name)
result = module.sqrt(16)

# 17. 检查模块是否已导入
import sys

if 'math' in sys.modules:
    print("math 模块已导入")

# 18. 获取导入的模块
import math
imported_module = sys.modules['math']
print(imported_module.__name__)  # math`,
    summary: [
      '使用 import 导入整个模块。',
      '使用 from ... import ... 导入特定项。',
      '使用 as 关键字创建别名，简化长模块名。',
      '可以导入多个项，用逗号分隔。',
      '使用 from ... import * 导入所有项（不推荐）。',
      '可以导入嵌套模块和子模块。',
      '在包内部使用相对导入（. 和 ..）。',
      '按标准库、第三方库、本地模块的顺序组织导入。',
      '避免使用 * 导入，明确导入需要的项。',
      '注意避免模块之间的循环依赖。'
    ]
  } as CourseChapter,
  {
    id: '36',
    unitId: 'unit6',
    title: '包和模块系统',
    description: '理解 Python 的模块（module）和包（package）的概念。',
    difficulty: '进阶' as Difficulty,
    content: `Python 使用模块和包来组织代码，提高代码的可维护性和可重用性。

## 1. 模块（Module）

模块是一个包含 Python 代码的文件：
- 文件扩展名为 \`.py\`
- 文件名就是模块名
- 可以包含函数、类、变量等

## 2. 包（Package）

包是包含多个模块的目录：
- 必须包含 \`__init__.py\` 文件（Python 3.3+ 可选，但推荐）
- 可以嵌套，形成包层次结构
- 可以包含子包和模块

## 3. 包的结构

\`\`\`
mypackage/
    __init__.py
    module1.py
    module2.py
    subpackage/
        __init__.py
        module3.py
\`\`\`

## 4. __init__.py 文件

\`__init__.py\` 文件的作用：
- 标识目录为 Python 包
- 可以包含包的初始化代码
- 可以控制包的导入行为

## 5. 可执行脚本

- 直接运行的脚本有 \`__name__ == "__main__"\`
- 可以作为模块导入，也可以作为脚本运行
- 使用 \`if __name__ == "__main__":\` 区分

## 6. 包管理器

- \`pip\`：Python 的包管理器
- \`pip install package\`：安装包
- \`pip list\`：列出已安装的包
- \`requirements.txt\`：记录项目依赖`,
    exampleCode: `# 1. 模块示例（math_utils.py）
# math_utils.py
"""数学工具模块"""

def add(a, b):
    return a + b

def multiply(a, b):
    return a * b

# 2. 包的结构
# mypackage/
#     __init__.py
#     module1.py
#     module2.py
#     subpackage/
#         __init__.py
#         module3.py

# 3. __init__.py 文件
# mypackage/__init__.py
"""我的包"""

# 可以导入子模块
from . import module1
from . import module2

# 可以定义包的公共接口
__all__ = ['module1', 'module2']

# 可以定义包级别的变量
VERSION = '1.0.0'

# 4. 从包导入
from mypackage import module1
from mypackage.module2 import function2

# 5. 可执行脚本
# script.py
def main():
    print("这是主函数")

if __name__ == "__main__":
    main()

# 6. 作为模块导入
# 可以导入 script.py 并使用其中的函数
# import script
# script.main()

# 7. 包管理器 pip
# 安装包
# pip install requests

# 安装特定版本
# pip install requests==2.28.0

# 从 requirements.txt 安装
# pip install -r requirements.txt

# 8. requirements.txt 示例
# requests==2.28.0
# numpy>=1.20.0
# pandas<2.0.0

# 9. 创建可安装的包
# setup.py
from setuptools import setup, find_packages

setup(
    name="mypackage",
    version="1.0.0",
    packages=find_packages(),
    install_requires=[
        "requests>=2.28.0",
    ],
)

# 安装开发模式
# pip install -e .

# 10. 包的命名空间
# 包提供命名空间，避免名称冲突
from mypackage import module1
from otherpackage import module1  # 不会冲突

# 11. 相对导入（在包内部）
# mypackage/subpackage/module3.py
from ..module1 import function1  # 从父包导入
from . import module4  # 从同级模块导入

# 12. 包的初始化
# mypackage/__init__.py
def initialize():
    """包的初始化函数"""
    print("包已初始化")

# 在导入时自动执行
initialize()

# 13. 包的公共接口
# mypackage/__init__.py
from .module1 import public_function
from .module2 import AnotherClass

__all__ = ['public_function', 'AnotherClass']

# 14. 检查包是否已安装
try:
    import mypackage
    print("包已安装")
except ImportError:
    print("包未安装")

# 15. 包的版本信息
# mypackage/__init__.py
__version__ = '1.0.0'
__author__ = 'Your Name'

# 16. 包的文档
# mypackage/__init__.py
"""我的包

这是一个示例包，用于演示 Python 包的结构。
"""

# 17. 包的测试
# mypackage/tests/
#     __init__.py
#     test_module1.py

# 运行测试
# python -m pytest mypackage/tests/`,
    summary: [
      '模块是一个包含 Python 代码的文件。',
      '包是包含多个模块的目录，需要 __init__.py 文件。',
      '__init__.py 文件标识目录为 Python 包。',
      '包可以嵌套，形成包层次结构。',
      '可执行脚本有 __name__ == "__main__"。',
      'pip 是 Python 的包管理器。',
      '使用 requirements.txt 记录项目依赖。',
      '包提供命名空间，避免名称冲突。',
      '在包内部使用相对导入。',
      '使用 __all__ 定义包的公共接口。'
    ]
  } as CourseChapter,
  {
    id: '37',
    unitId: 'unit6',
    title: '可见性和命名约定',
    description: '学习 Python 的可见性规则，理解公有和私有（通过命名约定）。',
    difficulty: '进阶' as Difficulty,
    content: `Python 的可见性规则通过命名约定控制哪些项可以在哪些地方被访问。

## 1. Python 的可见性规则

Python 没有真正的私有成员，而是通过命名约定来表示可见性：
- **公有（Public）**：默认情况下，所有项都是公有的
- **内部使用（Protected）**：单下划线前缀 \`_name\` 表示内部使用
- **私有（Private）**：双下划线前缀 \`__name\` 表示私有（名称修饰）

## 2. 单下划线前缀（_name）

单下划线前缀表示：
- 这是内部使用的成员
- 不应该从模块外部直接访问
- 只是一种约定，不是强制的

## 3. 双下划线前缀（__name）

双下划线前缀表示：
- 这是私有成员
- Python 会进行名称修饰（Name Mangling）
- 在类外部更难访问

## 4. 模块级别的可见性

- \`__all__\` 列表控制 \`from module import *\` 的行为
- 单下划线开头的项不会被 \`import *\` 导入

## 5. 类的可见性

- 公有属性：直接定义，如 \`self.name\`
- 内部属性：单下划线前缀，如 \`self._name\`
- 私有属性：双下划线前缀，如 \`self.__name\``,
    exampleCode: `# 1. 默认公有（没有下划线）
class MyClass:
    def __init__(self):
        self.public_attr = "公有属性"  # 可以自由访问
        self._internal_attr = "内部属性"  # 约定：内部使用
        self.__private_attr = "私有属性"  # 名称修饰

# 创建实例
obj = MyClass()
print(obj.public_attr)  # 公有属性
print(obj._internal_attr)  # 内部属性（可以访问，但不推荐）
# print(obj.__private_attr)  # 错误！AttributeError

# 2. 私有属性的名称修饰
print(obj._MyClass__private_attr)  # 私有属性（可以访问，但不推荐）

# 3. 模块级别的可见性
# module.py
def public_function():
    """公有函数"""
    return "公有函数"

def _internal_function():
    """内部函数"""
    return "内部函数"

def __private_function():
    """私有函数"""
    return "私有函数"

__all__ = ['public_function']  # 控制 import * 的行为

# 4. 从模块导入
# from module import *
# public_function()  # 可用
# _internal_function()  # 不可用（不会被导入）
# __private_function()  # 不可用

# 5. 类的公有方法
class Calculator:
    def __init__(self):
        self._result = 0  # 内部属性
    
    def add(self, value):
        """公有方法"""
        self._result += value
        return self
    
    def _validate(self, value):
        """内部方法（约定）"""
        if not isinstance(value, (int, float)):
            raise TypeError("值必须是数字")
    
    def __calculate(self, operation, value):
        """私有方法（名称修饰）"""
        self._validate(value)
        if operation == 'add':
            self._result += value
        elif operation == 'multiply':
            self._result *= value

calc = Calculator()
calc.add(10)  # 公有方法，可以调用
# calc._validate(10)  # 内部方法，可以调用但不推荐
# calc.__calculate('add', 5)  # 私有方法，不能直接调用

# 6. 属性装饰器（推荐方式）
class Person:
    def __init__(self, name):
        self._name = name  # 内部属性
    
    @property
    def name(self):
        """公有属性（只读）"""
        return self._name
    
    @name.setter
    def name(self, value):
        """属性设置器"""
        if not value:
            raise ValueError("姓名不能为空")
        self._name = value

person = Person("Alice")
print(person.name)  # Alice（通过属性访问）
person.name = "Bob"  # 通过属性设置器
print(person.name)  # Bob

# 7. 模块常量
# 单下划线：内部常量
_INTERNAL_CONSTANT = "内部常量"

# 双下划线：私有常量
__PRIVATE_CONSTANT = "私有常量"

# 无下划线：公有常量
PUBLIC_CONSTANT = "公有常量"

# 8. __all__ 控制导入
# mymodule.py
def public_func():
    pass

def _internal_func():
    pass

__all__ = ['public_func']  # 只导出 public_func

# 9. 名称修饰示例
class Test:
    def __init__(self):
        self.__private = "私有"
        self._internal = "内部"
        self.public = "公有"

obj = Test()
print(obj.public)  # 公有
print(obj._internal)  # 内部
# print(obj.__private)  # 错误！
print(obj._Test__private)  # 私有（通过名称修饰访问）

# 10. 最佳实践
class BankAccount:
    def __init__(self, balance):
        self.__balance = balance  # 私有属性
    
    def get_balance(self):
        """获取余额（公有方法）"""
        return self.__balance
    
    def deposit(self, amount):
        """存款（公有方法）"""
        if amount > 0:
            self.__balance += amount
        else:
            raise ValueError("存款金额必须大于0")
    
    def _validate_amount(self, amount):
        """验证金额（内部方法）"""
        if amount < 0:
            raise ValueError("金额不能为负")

account = BankAccount(1000)
print(account.get_balance())  # 1000
account.deposit(500)
print(account.get_balance())  # 1500
# print(account.__balance)  # 错误！私有属性不能直接访问`,
    summary: [
      'Python 通过命名约定控制可见性，没有真正的私有成员。',
      '默认情况下，所有项都是公有的。',
      '单下划线前缀（_name）表示内部使用，只是一种约定。',
      '双下划线前缀（__name）表示私有，Python 会进行名称修饰。',
      '使用 __all__ 控制模块的导入行为。',
      '使用 @property 装饰器定义属性，提供更好的封装。',
      '私有属性可以通过名称修饰访问（不推荐）。',
      '遵循命名约定，明确代码的意图。',
      '对于真正的封装，使用属性和方法而不是直接访问。'
    ]
  } as CourseChapter,
  // 单元7：泛型与 Trait
  {
    id: '38',
    unitId: 'unit7',
    title: '类型提示和泛型',
    description: '学习如何使用类型提示和泛型，提高代码的可读性和类型安全。',
    difficulty: '进阶' as Difficulty,
    content: `Python 3.5+ 支持类型提示（Type Hints），允许你标注函数参数和返回值的类型。

## 1. 类型提示基础

类型提示通过标注变量、函数参数和返回值来提供类型信息：
- 使用 \`typing\` 模块定义类型
- 使用冒号 \`:\` 标注变量类型
- 使用 \`->\` 标注返回类型

## 2. 泛型类型

Python 使用 \`TypeVar\` 和 \`Generic\` 实现泛型：
- \`TypeVar\`：定义类型变量
- \`Generic\`：定义泛型类
- 可以约束类型变量

## 3. 常用泛型类型

- \`List[T]\`：列表类型
- \`Dict[K, V]\`：字典类型
- \`Tuple[T, ...]\`：元组类型
- \`Optional[T]\`：可选类型
- \`Union[T, U]\`：联合类型

## 4. 类型约束

可以使用类型约束限制泛型类型：
- \`T: Comparable\`：要求类型可比较
- \`T: Number\`：要求类型是数字
- \`T: Sequence\`：要求类型是序列

## 5. 最佳实践

1. **使用类型提示**：为函数添加类型提示
2. **使用泛型**：编写可复用的类型安全代码
3. **类型检查工具**：使用 \`mypy\` 进行类型检查
4. **渐进式类型**：逐步添加类型提示`,
    exampleCode: `from typing import TypeVar, Generic, List, Dict, Optional, Union
from typing_extensions import Protocol  # Python 3.8+

# 1. 基本类型提示
def add(a: int, b: int) -> int:
    """返回两个整数的和"""
    return a + b

result = add(2, 3)
print(result)  # 5

# 2. 类型变量
T = TypeVar('T')

def identity(x: T) -> T:
    """返回相同的值"""
    return x

result = identity(42)  # int
result2 = identity("hello")  # str

# 3. 泛型函数
def get_first(items: List[T]) -> Optional[T]:
    """返回列表的第一个元素"""
    if items:
        return items[0]
    return None

numbers = [1, 2, 3]
first = get_first(numbers)  # Optional[int]

words = ["hello", "world"]
first_word = get_first(words)  # Optional[str]

# 4. 多个类型参数
K = TypeVar('K')
V = TypeVar('V')

def get_value(d: Dict[K, V], key: K, default: V) -> V:
    """从字典获取值，如果不存在返回默认值"""
    return d.get(key, default)

my_dict = {"a": 1, "b": 2}
value = get_value(my_dict, "a", 0)  # int

# 5. 类型约束
from typing import Protocol

class Comparable(Protocol):
    def __lt__(self, other) -> bool: ...
    def __gt__(self, other) -> bool: ...

T = TypeVar('T', bound=Comparable)

def max_value(items: List[T]) -> Optional[T]:
    """返回列表中的最大值"""
    if not items:
        return None
    return max(items)

numbers = [3, 1, 4, 1, 5, 9]
max_num = max_value(numbers)  # Optional[int]

# 6. 联合类型
def process(value: Union[int, str]) -> str:
    """处理整数或字符串"""
    if isinstance(value, int):
        return str(value)
    return value.upper()

result = process(42)  # "42"
result2 = process("hello")  # "HELLO"

# 7. 可选类型
def find_item(items: List[T], predicate) -> Optional[T]:
    """查找满足条件的项"""
    for item in items:
        if predicate(item):
            return item
    return None

numbers = [1, 2, 3, 4, 5]
found = find_item(numbers, lambda x: x > 3)  # Optional[int]

# 8. 泛型类
class Stack(Generic[T]):
    def __init__(self):
        self._items: List[T] = []
    
    def push(self, item: T) -> None:
        """压入元素"""
        self._items.append(item)
    
    def pop(self) -> Optional[T]:
        """弹出元素"""
        if self._items:
            return self._items.pop()
        return None

int_stack = Stack[int]()
int_stack.push(1)
int_stack.push(2)
value = int_stack.pop()  # Optional[int]

# 9. 元组类型
def get_coordinates() -> Tuple[int, int]:
    """返回坐标"""
    return (10, 20)

x, y = get_coordinates()

# 10. 类型别名
from typing import Tuple

Point = Tuple[int, int]

def distance(p1: Point, p2: Point) -> float:
    """计算两点之间的距离"""
    x1, y1 = p1
    x2, y2 = p2
    return ((x2 - x1) ** 2 + (y2 - y1) ** 2) ** 0.5

p1: Point = (0, 0)
p2: Point = (3, 4)
dist = distance(p1, p2)

# 11. 可调用类型
from typing import Callable

def apply(func: Callable[[int, int], int], a: int, b: int) -> int:
    """应用函数"""
    return func(a, b)

result = apply(lambda x, y: x + y, 2, 3)

# 12. 类型检查（运行时）
from typing import get_type_hints

hints = get_type_hints(add)
print(hints)  # {'a': <class 'int'>, 'b': <class 'int'>, 'return': <class 'int'>}`,
    summary: [
      'Python 使用类型提示提供类型信息。',
      '使用 TypeVar 定义类型变量。',
      '使用 Generic 定义泛型类。',
      '可以使用类型约束限制泛型类型。',
      'List[T]、Dict[K, V] 等是常用的泛型类型。',
      'Optional[T] 表示可选类型，Union[T, U] 表示联合类型。',
      '使用 mypy 等工具进行类型检查。',
      '类型提示是渐进式的，不影响运行时行为。',
      '使用类型别名提高代码可读性。'
    ]
  } as CourseChapter,
  {
    id: '39',
    unitId: 'unit7',
    title: '泛型类',
    description: '学习如何使用 TypeVar 定义泛型类，让一个类可以处理多种类型。',
    difficulty: '进阶' as Difficulty,
    content: `Python 使用 TypeVar 和 Generic 来实现泛型类，让一个类可以处理多种类型。

泛型类可以在类定义中使用类型变量，使类具有类型安全性。可以通过类型约束限制泛型类型。`,
    exampleCode: `from typing import TypeVar, Generic

# 定义类型变量
T = TypeVar('T')
U = TypeVar('U')
V = TypeVar('V')
W = TypeVar('W')

# 泛型类
class Point(Generic[T]):
    def __init__(self, x: T, y: T) -> None:
        self.x: T = x
        self.y: T = y
    
    def get_x(self) -> T:
        return self.x
    
    def get_y(self) -> T:
        return self.y

# 多个类型参数
class Point2(Generic[T, U]):
    def __init__(self, x: T, y: U) -> None:
        self.x: T = x
        self.y: U = y
    
    def mixup(self, other: 'Point2[V, W]') -> 'Point2[T, W]':
        return Point2(self.x, other.y)

# 使用泛型类
if __name__ == '__main__':
    # 整数点
    integer_point = Point[int](5, 10)
    print(f"整数点: x={integer_point.get_x()}, y={integer_point.get_y()}")
    
    # 浮点数点
    float_point = Point[float](1.0, 4.0)
    print(f"浮点数点: x={float_point.get_x()}, y={float_point.get_y()}")
    
    # 多个类型参数
    p1 = Point2[int, float](5, 10.4)
    p2 = Point2[str, str]("Hello", "World")
    p3 = p1.mixup(p2)
    print(f"混合点: x={p3.x}, y={p3.y}")

# 类型约束示例
from typing import Protocol

class Comparable(Protocol):
    def __lt__(self, other) -> bool: ...
    def __gt__(self, other) -> bool: ...

ComparableT = TypeVar('ComparableT', bound=Comparable)

class MaxValue(Generic[ComparableT]):
    def __init__(self, value: ComparableT) -> None:
        self.value = value
    
    def compare(self, other: ComparableT) -> bool:
        return self.value > other`,
    summary: [
      '使用 TypeVar 定义类型变量。',
      '使用 Generic[T] 创建泛型类。',
      '可以在类定义中使用类型变量。',
      '可以有多个类型参数：Generic[T, U]。',
      '可以使用 bound 约束类型参数。',
      '类型参数在运行时会被擦除（类型提示不影响运行时）。',
      '可以使用 Protocol 定义类型约束。'
    ]
  } as CourseChapter,
  {
    id: '40',
    unitId: 'unit7',
    title: '抽象基类（ABC）',
    description: '学习如何定义抽象基类（ABC），Python 中的接口概念。',
    difficulty: '进阶' as Difficulty,
    content: `抽象基类（Abstract Base Class，ABC）定义了类必须实现的共享行为。

ABC 类似于其他语言中的接口。使用 @abstractmethod 装饰器定义抽象方法，子类必须实现这些方法。抽象基类可以定义具体方法作为默认实现。`,
    exampleCode: `from abc import ABC, abstractmethod

# 定义抽象基类
class Summary(ABC):
    @abstractmethod
    def summarize(self) -> str:
        """子类必须实现此方法"""
        pass
    
    # 默认实现（具体方法）
    def summarize_author(self) -> str:
        """提供默认实现"""
        return "(阅读更多...)"

# 实现抽象基类
class NewsArticle(Summary):
    def __init__(self, headline: str, location: str, author: str, content: str) -> None:
        self.headline = headline
        self.location = location
        self.author = author
        self.content = content
    
    def summarize(self) -> str:
        """实现抽象方法"""
        return f"{self.headline}, by {self.author} ({self.location})"

class Tweet(Summary):
    def __init__(self, username: str, content: str, reply: bool = False, retweet: bool = False) -> None:
        self.username = username
        self.content = content
        self.reply = reply
        self.retweet = retweet
    
    def summarize(self) -> str:
        """实现抽象方法"""
        return f"{self.username}: {self.content}"
    
    # 覆盖默认实现
    def summarize_author(self) -> str:
        """覆盖父类的默认实现"""
        return f"@{self.username}"

# 使用
if __name__ == '__main__':
    tweet = Tweet(
        username="horse_ebooks",
        content="当然，你知道，就像...",
        reply=False,
        retweet=False
    )
    
    print(f"1 条新推文: {tweet.summarize()}")
    print(f"作者: {tweet.summarize_author()}")
    
    article = NewsArticle(
        headline="Python 3.12 发布",
        location="北京",
        author="Python 团队",
        content="Python 3.12 带来了许多新特性..."
    )
    
    print(f"新闻: {article.summarize()}")
    print(f"作者信息: {article.summarize_author()}")  # 使用默认实现

# 使用 Protocol 作为接口（Python 3.8+）
from typing import Protocol

class SummaryProtocol(Protocol):
    def summarize(self) -> str: ...
    def summarize_author(self) -> str: ...

# Protocol 不需要显式继承，只要实现了相应方法即可
class BlogPost:
    def __init__(self, title: str, author: str) -> None:
        self.title = title
        self.author = author
    
    def summarize(self) -> str:
        return f"博客: {self.title}"
    
    def summarize_author(self) -> str:
        return f"作者: {self.author}"

def print_summary(item: SummaryProtocol) -> None:
    """接受任何实现了 SummaryProtocol 的对象"""
    print(item.summarize())

# BlogPost 自动满足 SummaryProtocol
post = BlogPost("Python 教程", "张三")
print_summary(post)`,
    summary: [
      '使用 ABC 和 @abstractmethod 定义抽象基类。',
      '抽象方法必须由子类实现。',
      '可以定义具体方法作为默认实现。',
      '子类可以覆盖父类的默认实现。',
      '不能实例化包含未实现抽象方法的类。',
      'Python 3.8+ 可以使用 Protocol 作为接口（结构子类型）。',
      'Protocol 不需要显式继承，只要实现了相应方法即可。'
    ]
  } as CourseChapter,
  {
    id: '41',
    unitId: 'unit7',
    title: '协议和类型提示',
    description: '学习如何使用 Protocol 和类型提示作为函数参数，实现多态。',
    difficulty: '进阶' as Difficulty,
    content: `Python 使用类型提示和 Protocol 来实现多态，允许函数接受实现了特定协议的任何类型。

这实现了鸭子类型（duck typing）的多态，让代码更灵活。Protocol 提供了结构子类型（structural subtyping），不需要显式继承。`,
    exampleCode: `from typing import Protocol, TypeVar
from abc import ABC, abstractmethod

# 方法 1: 使用 Protocol（Python 3.8+）
class Summary(Protocol):
    def summarize(self) -> str:
        """必须实现此方法"""
        ...

class NewsArticle:
    def __init__(self, headline: str, author: str) -> None:
        self.headline = headline
        self.author = author
    
    def summarize(self) -> str:
        return f"{self.headline}, by {self.author}"

class Tweet:
    def __init__(self, username: str, content: str) -> None:
        self.username = username
        self.content = content
    
    def summarize(self) -> str:
        return f"{self.username}: {self.content}"

# 使用 Protocol 作为参数类型
def notify(item: Summary) -> None:
    """接受任何实现了 Summary 协议的对象"""
    print(f"突发新闻! {item.summarize()}")

# 方法 2: 使用抽象基类
class SummaryABC(ABC):
    @abstractmethod
    def summarize(self) -> str:
        pass

class NewsArticle2(SummaryABC):
    def __init__(self, headline: str, author: str) -> None:
        self.headline = headline
        self.author = author
    
    def summarize(self) -> str:
        return f"{self.headline}, by {self.author}"

def notify2(item: SummaryABC) -> None:
    """接受任何 SummaryABC 的子类"""
    print(f"新闻: {item.summarize()}")

# 多个协议约束
class Display(Protocol):
    def __str__(self) -> str: ...

class SummaryAndDisplay(Protocol):
    def summarize(self) -> str: ...
    def __str__(self) -> str: ...

class EnhancedArticle:
    def __init__(self, headline: str, author: str) -> None:
        self.headline = headline
        self.author = author
    
    def summarize(self) -> str:
        return f"{self.headline}, by {self.author}"
    
    def __str__(self) -> str:
        return self.summarize()

def notify3(item: SummaryAndDisplay) -> None:
    """接受同时实现 Summary 和 Display 的对象"""
    print(f"摘要: {item.summarize()}")
    print(f"显示: {item}")

# 使用类型变量
T = TypeVar('T', bound=Summary)

def process_items(items: list[T]) -> list[str]:
    """处理实现了 Summary 协议的列表"""
    return [item.summarize() for item in items]

# 泛型函数
def find_largest(items: list[T]) -> T | None:
    """找到最大的项（需要 T 实现比较方法）"""
    if not items:
        return None
    return max(items)

if __name__ == '__main__':
    article = NewsArticle("标题", "作者")
    tweet = Tweet("user123", "这是推文内容")
    
    # Protocol 类型提示
    notify(article)
    notify(tweet)
    
    # ABC 类型提示
    article2 = NewsArticle2("标题2", "作者2")
    notify2(article2)
    
    # 多个协议
    enhanced = EnhancedArticle("增强标题", "增强作者")
    notify3(enhanced)
    
    # 列表处理
    items: list[Summary] = [article, tweet]
    summaries = process_items(items)
    print(summaries)`,
    summary: [
      '使用 Protocol 定义结构子类型接口。',
      'Protocol 不需要显式继承，只要实现了相应方法即可。',
      '可以使用 ABC 和抽象方法定义名义子类型。',
      '类型提示提供了类型安全性，但运行时是鸭子类型。',
      '可以使用 TypeVar 和 bound 约束泛型类型。',
      '可以组合多个 Protocol 作为类型约束。',
      'Protocol 更灵活，ABC 更严格。'
    ]
  } as CourseChapter,
  {
    id: '42',
    unitId: 'unit7',
    title: '类型约束和 bound',
    description: '深入学习 TypeVar 的 bound 参数，约束泛型类型。',
    difficulty: '进阶' as Difficulty,
    content: `TypeVar 的 bound 参数指定泛型类型必须满足的约束条件。

这允许你在泛型代码中使用特定协议或基类的方法。可以使用 Protocol 或 ABC 来定义约束。`,
    exampleCode: `from typing import TypeVar, Protocol, Generic
from abc import ABC, abstractmethod

# 使用 Protocol 定义约束
class Comparable(Protocol):
    def __lt__(self, other) -> bool: ...
    def __gt__(self, other) -> bool: ...
    def __le__(self, other) -> bool: ...
    def __ge__(self, other) -> bool: ...

# 使用 bound 约束类型变量
ComparableT = TypeVar('ComparableT', bound=Comparable)

def largest(items: list[ComparableT]) -> ComparableT | None:
    """找到列表中最大的元素"""
    if not items:
        return None
    
    largest_item = items[0]
    for item in items[1:]:
        if item > largest_item:
            largest_item = item
    
    return largest_item

# 使用 ABC 定义约束
class Display(ABC):
    @abstractmethod
    def display(self) -> str:
        pass

class Clone(Protocol):
    def __copy__(self) -> object: ...

DisplayT = TypeVar('DisplayT', bound=Display)
CloneableT = TypeVar('CloneableT', bound=Clone)

def process_item(item: DisplayT) -> str:
    """处理实现了 Display 的对象"""
    return item.display()

# 多个约束（通过 Protocol 组合）
class Displayable(Protocol):
    def __str__(self) -> str: ...

class ComparableAndDisplay(Protocol):
    def __lt__(self, other) -> bool: ...
    def __str__(self) -> str: ...

ComparableDisplayT = TypeVar('ComparableDisplayT', bound=ComparableAndDisplay)

def find_and_print(items: list[ComparableDisplayT]) -> None:
    """找到最大元素并打印"""
    if items:
        max_item = largest(items)
        if max_item:
            print(f"最大元素: {max_item}")

# 泛型类中的类型约束
class Pair(Generic[ComparableT]):
    def __init__(self, x: ComparableT, y: ComparableT) -> None:
        self.x: ComparableT = x
        self.y: ComparableT = y
    
    def get_max(self) -> ComparableT:
        """返回较大的元素"""
        return self.x if self.x > self.y else self.y
    
    def cmp_display(self) -> None:
        """比较并显示结果"""
        if self.x >= self.y:
            print(f"最大的成员是 x = {self.x}")
        else:
            print(f"最大的成员是 y = {self.y}")

# 使用约束的泛型函数
T = TypeVar('T')
U = TypeVar('U')

def some_function(t: T, u: U) -> str:
    """处理两个不同类型的对象"""
    # 如果 T 实现了 __str__，可以使用 str(t)
    return f"处理: {t!r}, {u!r}"

# 实际使用
if __name__ == '__main__':
    # 整数列表（int 实现了 Comparable）
    numbers = [3, 1, 4, 1, 5, 9, 2, 6]
    max_num = largest(numbers)
    print(f"最大数字: {max_num}")
    
    # 字符串列表（str 实现了 Comparable）
    words = ["apple", "banana", "cherry"]
    max_word = largest(words)
    print(f"最大单词: {max_word}")
    
    # Pair 使用
    pair = Pair(10, 20)
    print(f"较大值: {pair.get_max()}")
    pair.cmp_display()`,
    summary: [
      '使用 TypeVar 的 bound 参数约束泛型类型。',
      'bound 可以是 Protocol、ABC 或具体类。',
      'Protocol 提供结构子类型约束。',
      'ABC 提供名义子类型约束。',
      '可以通过组合 Protocol 定义多个约束。',
      '类型约束在运行时不会检查（类型提示不影响运行时）。',
      '可以使用 mypy 等工具进行静态类型检查。',
      '约束让泛型代码更安全、更可读。'
    ]
  } as CourseChapter,
  {
    id: '43',
    unitId: 'unit7',
    title: '关联类型',
    description: '学习 Trait 中的关联类型，更灵活的 Trait 设计。',
    difficulty: '高阶' as Difficulty,
    content: `关联类型是 Trait 定义中的占位符类型。

它们允许 Trait 方法的返回类型依赖于实现类型，而不需要泛型参数。`,
    exampleCode: `// 使用关联类型
pub trait Iterator {
    type Item;  // 关联类型
    
    fn next(&mut self) -> Option<Self::Item>;
}

// 实现 Iterator
struct Counter {
    count: u32,
}

impl Iterator for Counter {
    type Item = u32;  // 指定关联类型
    
    fn next(&mut self) -> Option<Self::Item> {
        self.count += 1;
        if self.count < 6 {
            Some(self.count)
        } else {
            None
        }
    }
}

// 对比：使用泛型参数
pub trait Iterator2<T> {
    fn next(&mut self) -> Option<T>;
}

// 关联类型的优势
pub trait Add<Rhs = Self> {
    type Output;
    
    fn add(self, rhs: Rhs) -> Self::Output;
}

impl Add for Point {
    type Output = Point;
    
    fn add(self, other: Point) -> Point {
        Point {
            x: self.x + other.x,
            y: self.y + other.y,
        }
    }
}

// 使用
let p1 = Point { x: 1, y: 0 };
let p2 = Point { x: 2, y: 3 };
let p3 = p1 + p2;`,
    summary: [
      '关联类型是 Trait 中的占位符类型。',
      '使用 type 关键字定义。',
      '实现时指定具体类型。',
      '比泛型参数更简洁。',
      '常用于 Iterator 等标准 Trait。'
    ]
  } as CourseChapter,
  {
    id: '44',
    unitId: 'unit7',
    title: '默认实现',
    description: '学习 Trait 的默认实现，减少代码重复。',
    difficulty: '进阶' as Difficulty,
    content: `Trait 方法可以有默认实现。

实现 Trait 的类型可以使用默认实现，也可以覆盖它。默认实现可以调用其他方法。`,
    exampleCode: `pub trait Summary {
    fn summarize_author(&self) -> String;
    
    // 默认实现，可以调用其他方法
    fn summarize(&self) -> String {
        format!("(从 {} 阅读更多...)", self.summarize_author())
    }
}

pub struct Tweet {
    pub username: String,
    pub content: String,
}

impl Summary for Tweet {
    fn summarize_author(&self) -> String {
        format!("@{}", self.username)
    }
    
    // 可以不实现 summarize，使用默认实现
    // 也可以覆盖默认实现
    // fn summarize(&self) -> String {
    //     format!("{}: {}", self.username, self.content)
    // }
}

pub struct NewsArticle {
    pub headline: String,
    pub author: String,
}

impl Summary for NewsArticle {
    fn summarize_author(&self) -> String {
        self.author.clone()
    }
    
    // 覆盖默认实现
    fn summarize(&self) -> String {
        format!("{}, by {}", self.headline, self.author)
    }
}

fn main() {
    let tweet = Tweet {
        username: String::from("horse_ebooks"),
        content: String::from("当然..."),
    };
    
    println!("{}", tweet.summarize());  // 使用默认实现
}`,
    summary: [
      'Trait 方法可以有默认实现。',
      '实现类型可以使用或覆盖默认实现。',
      '默认实现可以调用其他方法。',
      '减少代码重复。',
      '提供合理的默认行为。'
    ]
  } as CourseChapter,
  // 单元8：智能指针
  {
    id: '45',
    unitId: 'unit8',
    title: 'Box<T>',
    description: '学习 Box 智能指针，在堆上分配数据。',
    difficulty: '进阶' as Difficulty,
    content: `Box<T> 是最简单的智能指针，允许你在堆上存储数据。

Box 拥有数据的所有权，当 Box 离开作用域时，数据会被自动释放。`,
    exampleCode: `fn main() {
    // 在堆上分配一个 i32
    let b = Box::new(5);
    println!("b = {}", b);
    
    // Box 用于递归数据结构
    let list = Cons(1, Box::new(Cons(2, Box::new(Cons(3, Box::new(Nil))))));
}

// 递归类型需要使用 Box
enum List {
    Cons(i32, Box<List>),
    Nil,
}

use List::{Cons, Nil};

// Box 实现 Deref trait，可以自动解引用
fn example() {
    let x = 5;
    let y = Box::new(x);
    
    assert_eq!(5, x);
    assert_eq!(5, *y);  // 解引用 Box
}`,
    summary: [
      'Box<T> 在堆上分配数据。',
      'Box 拥有数据的所有权。',
      '用于递归数据结构。',
      '实现 Deref trait。',
      '离开作用域时自动释放。'
    ]
  } as CourseChapter,
  {
    id: '46',
    unitId: 'unit8',
    title: 'Rc<T>',
    description: '学习引用计数智能指针，实现多所有权。',
    difficulty: '高阶' as Difficulty,
    content: `Rc<T> 是引用计数智能指针，允许多个所有者共享数据。

Rc 只能用于单线程场景。当最后一个 Rc 离开作用域时，数据会被释放。`,
    exampleCode: `use std::rc::Rc;

enum List {
    Cons(i32, Rc<List>),
    Nil,
}

use List::{Cons, Nil};

fn main() {
    let a = Rc::new(Cons(5, Rc::new(Cons(10, Rc::new(Nil)))));
    println!("创建 a 后，a 的引用计数 = {}", Rc::strong_count(&a));
    
    let b = Cons(3, Rc::clone(&a));  // 克隆 Rc，增加引用计数
    println!("创建 b 后，a 的引用计数 = {}", Rc::strong_count(&a));
    
    {
        let c = Cons(4, Rc::clone(&a));
        println!("创建 c 后，a 的引用计数 = {}", Rc::strong_count(&a));
    }  // c 离开作用域，引用计数减 1
    
    println!("c 离开作用域后，a 的引用计数 = {}", Rc::strong_count(&a));
}

// Rc 只能用于单线程
// 多线程应使用 Arc<T>`,
    summary: [
      'Rc<T> 允许多个所有者。',
      '使用引用计数跟踪所有者数量。',
      '只能用于单线程。',
      'Rc::clone 增加引用计数。',
      '最后一个 Rc 离开作用域时释放数据。'
    ]
  } as CourseChapter,
  {
    id: '47',
    unitId: 'unit8',
    title: 'RefCell<T>',
    description: '学习 RefCell，实现内部可变性。',
    difficulty: '高阶' as Difficulty,
    content: `RefCell<T> 提供内部可变性，允许在不可变引用的情况下修改数据。

RefCell 在运行时检查借用规则，违反规则会导致 panic。`,
    exampleCode: `use std::cell::RefCell;

fn main() {
    let data = RefCell::new(5);
    
    // 不可变借用
    {
        let r1 = data.borrow();
        let r2 = data.borrow();  // 可以有多个不可变借用
        println!("r1: {}, r2: {}", r1, r2);
    }  // r1 和 r2 离开作用域
    
    // 可变借用
    {
        let mut r = data.borrow_mut();
        *r += 1;
    }  // r 离开作用域
    
    println!("data: {}", data.borrow());
}

// 结合 Rc 和 RefCell
use std::rc::Rc;
use std::cell::RefCell;

#[derive(Debug)]
enum List {
    Cons(Rc<RefCell<i32>>, Rc<List>),
    Nil,
}

use List::{Cons, Nil};

fn example() {
    let value = Rc::new(RefCell::new(5));
    
    let a = Rc::new(Cons(Rc::clone(&value), Rc::new(Nil)));
    let b = Cons(Rc::new(RefCell::new(3)), Rc::clone(&a));
    let c = Cons(Rc::new(RefCell::new(4)), Rc::clone(&a));
    
    *value.borrow_mut() += 10;
    
    println!("a after = {:?}", a);
    println!("b after = {:?}", b);
    println!("c after = {:?}", c);
}`,
    summary: [
      'RefCell 提供内部可变性。',
      '在运行时检查借用规则。',
      '可以有多个不可变借用。',
      '只能有一个可变借用。',
      '违反规则会导致 panic。'
    ]
  } as CourseChapter,
  {
    id: '48',
    unitId: 'unit8',
    title: '引用循环',
    description: '理解引用循环问题，学习如何避免内存泄漏。',
    difficulty: '高阶' as Difficulty,
    content: `使用 Rc 和 RefCell 可能创建引用循环，导致内存泄漏。

可以使用 Weak<T> 来打破循环，Weak 不会增加引用计数。`,
    exampleCode: `use std::rc::{Rc, Weak};
use std::cell::RefCell;

#[derive(Debug)]
struct Node {
    value: i32,
    parent: RefCell<Weak<Node>>,
    children: RefCell<Vec<Rc<Node>>>,
}

fn main() {
    let leaf = Rc::new(Node {
        value: 3,
        parent: RefCell::new(Weak::new()),
        children: RefCell::new(vec![]),
    });
    
    println!("leaf parent = {:?}", leaf.parent.borrow().upgrade());
    
    let branch = Rc::new(Node {
        value: 5,
        parent: RefCell::new(Weak::new()),
        children: RefCell::new(vec![Rc::clone(&leaf)]),
    });
    
    *leaf.parent.borrow_mut() = Rc::downgrade(&branch);
    
    println!("leaf parent = {:?}", leaf.parent.borrow().upgrade());
}

// 使用 Weak 避免循环
// Weak 不会增加引用计数
// 使用 upgrade() 获取 Option<Rc<T>>`,
    summary: [
      'Rc 和 RefCell 可能创建引用循环。',
      '引用循环会导致内存泄漏。',
      'Weak<T> 可以打破循环。',
      'Weak 不增加引用计数。',
      '使用 upgrade() 获取 Rc。'
    ]
  } as CourseChapter,
  // 单元9：并发编程
  {
    id: '49',
    unitId: 'unit9',
    title: '线程创建',
    description: '学习如何使用线程，实现并发执行。',
    difficulty: '进阶' as Difficulty,
    content: `Python 标准库提供了线程支持，可以使用 threading.Thread 创建新线程。

线程可以并发执行，提高程序性能。`,
    exampleCode: `use std::thread;
use std::time::Duration;

fn main() {
    // 创建线程
    let handle = thread::spawn(|| {
        for i in 1..10 {
            println!("线程中的数字: {}", i);
            thread::sleep(Duration::from_millis(1));
        }
    });
    
    // 主线程继续执行
    for i in 1..5 {
        println!("主线程中的数字: {}", i);
        thread::sleep(Duration::from_millis(1));
    }
    
    // 等待线程完成
    handle.join().unwrap();
    
    // 使用 move 闭包获取所有权
    let v = vec![1, 2, 3];
    
    let handle = thread::spawn(move || {
        println!("这是向量: {:?}", v);
    });
    
    handle.join().unwrap();
}`,
    summary: [
      '使用 thread::spawn 创建线程。',
      '线程可以并发执行。',
      '使用 join() 等待线程完成。',
      'move 闭包获取所有权。',
      'Python 的 GIL 确保线程安全。'
    ]
  } as CourseChapter,
  {
    id: '50',
    unitId: 'unit9',
    title: '消息传递（Channel）',
    description: '学习使用通道在线程间传递消息。',
    difficulty: '进阶' as Difficulty,
    content: `通道允许线程间通过发送消息进行通信。

Python 的队列和进程间通信遵循"通过消息传递来共享数据"的理念。`,
    exampleCode: `use std::sync::mpsc;
use std::thread;

fn main() {
    // 创建通道
    let (tx, rx) = mpsc::channel();
    
    // 在另一个线程中发送消息
    thread::spawn(move || {
        let val = String::from("hi");
        tx.send(val).unwrap();
        // val 的所有权已移动，不能再使用
    });
    
    // 接收消息
    let received = rx.recv().unwrap();
    println!("收到: {}", received);
    
    // 发送多个值
    let (tx, rx) = mpsc::channel();
    
    thread::spawn(move || {
        let vals = vec![
            String::from("hi"),
            String::from("from"),
            String::from("the"),
            String::from("thread"),
        ];
        
        for val in vals {
            tx.send(val).unwrap();
            thread::sleep(Duration::from_secs(1));
        }
    });
    
    for received in rx {
        println!("收到: {}", received);
    }
    
    // 多个发送者
    let (tx, rx) = mpsc::channel();
    let tx1 = mpsc::Sender::clone(&tx);
    
    thread::spawn(move || {
        tx.send(String::from("hi")).unwrap();
    });
    
    thread::spawn(move || {
        tx1.send(String::from("hello")).unwrap();
    });
    
    for received in rx {
        println!("收到: {}", received);
    }
}`,
    summary: [
      '通道用于线程间通信。',
      'mpsc 表示多生产者单消费者。',
      'send 发送消息，recv 接收消息。',
      '可以克隆发送者实现多生产者。',
      '通道保证线程安全。'
    ]
  } as CourseChapter,
  {
    id: '51',
    unitId: 'unit9',
    title: '共享状态（Mutex）',
    description: '学习使用 Mutex 实现线程间共享数据。',
    difficulty: '进阶' as Difficulty,
    content: `Mutex（互斥锁）允许线程间共享可变数据。

Mutex 确保同一时间只有一个线程可以访问数据。`,
    exampleCode: `use std::sync::Mutex;

fn main() {
    let m = Mutex::new(5);
    
    {
        let mut num = m.lock().unwrap();
        *num = 6;
    }  // 锁在这里自动释放
    
    println!("m = {:?}", m);
}

// 在多线程间共享 Mutex
use std::sync::{Arc, Mutex};
use std::thread;

fn main2() {
    let counter = Arc::new(Mutex::new(0));
    let mut handles = vec![];
    
    for _ in 0..10 {
        let counter = Arc::clone(&counter);
        let handle = thread::spawn(move || {
            let mut num = counter.lock().unwrap();
            *num += 1;
        });
        handles.push(handle);
    }
    
    for handle in handles {
        handle.join().unwrap();
    }
    
    println!("结果: {}", *counter.lock().unwrap());
}

// Mutex 的注意事项
// - lock() 返回 LockResult<MutexGuard<T>>
// - 如果另一个线程持有锁并 panic，lock() 会返回 Err
// - MutexGuard 实现了 Deref 和 Drop
// - 离开作用域时自动释放锁`,
    summary: [
      'Mutex 提供互斥访问。',
      'lock() 获取锁。',
      '需要配合 Arc 在多线程间共享。',
      'MutexGuard 自动释放锁。',
      '避免死锁需要小心设计。'
    ]
  } as CourseChapter,
  {
    id: '52',
    unitId: 'unit9',
    title: 'Arc<T>',
    description: '学习原子引用计数，用于多线程场景。',
    difficulty: '高阶' as Difficulty,
    content: `Arc<T> 是原子引用计数智能指针，用于多线程场景。

Arc 类似于 Rc，但是线程安全的。性能略低于 Rc。`,
    exampleCode: `use std::sync::Arc;
use std::thread;

fn main() {
    let data = Arc::new(vec![1, 2, 3]);
    let mut handles = vec![];
    
    for i in 0..3 {
        let data = Arc::clone(&data);
        let handle = thread::spawn(move || {
            println!("线程 {}: {:?}", i, data);
        });
        handles.push(handle);
    }
    
    for handle in handles {
        handle.join().unwrap();
    }
}

// Arc 通常与 Mutex 结合使用
use std::sync::{Arc, Mutex};

fn example() {
    let data = Arc::new(Mutex::new(0));
    let mut handles = vec![];
    
    for _ in 0..10 {
        let data = Arc::clone(&data);
        let handle = thread::spawn(move || {
            let mut num = data.lock().unwrap();
            *num += 1;
        });
        handles.push(handle);
    }
    
    for handle in handles {
        handle.join().unwrap();
    }
    
    println!("结果: {}", *data.lock().unwrap());
}`,
    summary: [
      'Arc 是原子引用计数。',
      '用于多线程场景。',
      '线程安全但性能略低。',
      '通常与 Mutex 结合使用。',
      'Arc::clone 增加引用计数。'
    ]
  } as CourseChapter,
  {
    id: '53',
    unitId: 'unit9',
    title: 'Send 和 Sync',
    description: '理解 GIL 和线程安全，Python 并发编程的基础。',
    difficulty: '高阶' as Difficulty,
    content: `Send 和 Sync 是标记 trait，用于保证线程安全。

- Send：类型的所有权可以在线程间转移
- Sync：类型可以在多线程间通过引用共享

大多数类型自动实现了这两个 trait。`,
    exampleCode: `// Send trait
// 如果一个类型实现了 Send，它的所有权可以在线程间转移
// 大多数类型都实现了 Send

// Sync trait
// 如果一个类型实现了 Sync，它可以在多线程间通过引用共享
// &T 是 Send 的，当且仅当 T 是 Sync 的

use std::thread;

// Rc<T> 不是 Send 也不是 Sync
// 因为它的引用计数不是原子的

// Arc<T> 是 Send 和 Sync 的
// 因为它的引用计数是原子的

// Mutex<T> 是 Send 的
// 但只有当 T 是 Send 的时，Mutex<T> 才是 Send 的

fn example() {
    let data = Arc::new(Mutex::new(0));
    
    // data 是 Send 和 Sync 的，可以在线程间共享
    thread::spawn(move || {
        let mut num = data.lock().unwrap();
        *num += 1;
    });
}

// 自定义类型实现 Send
struct MyStruct {
    data: i32,
}

// MyStruct 自动实现 Send（因为 i32 是 Send 的）
// 如果包含非 Send 类型，需要手动实现或标记为 !Send`,
    summary: [
      'Send 允许在线程间转移所有权。',
      'Sync 允许在多线程间共享引用。',
      '大多数类型自动实现这两个 trait。',
      'Rc 不是 Send 也不是 Sync。',
      'Arc 和 Mutex 是 Send 和 Sync 的。'
    ]
  } as CourseChapter,
  // 单元10：异步编程
  {
    id: '54',
    unitId: 'unit10',
    title: 'async/await',
    description: '学习 Python 的异步编程，使用 async/await 语法。',
    difficulty: '高阶' as Difficulty,
    content: `async/await 是 Python 3.5+ 中编写异步代码的语法。

async 函数返回 Future，await 等待 Future 完成。`,
    exampleCode: `// 异步函数
async fn hello_world() {
    println!("hello, world!");
}

// 调用异步函数
fn main() {
    // 需要运行时执行 Future
    // 这里只是示例，实际需要 tokio 或 async-std
    // let future = hello_world();
}

// 使用 async/await
async fn learn_song() -> String {
    String::from("歌曲")
}

async fn sing_song(song: String) {
    println!("唱: {}", song);
}

async fn dance() {
    println!("跳舞");
}

async fn learn_and_sing() {
    let song = learn_song().await;  // 等待 learn_song 完成
    sing_song(song).await;  // 等待 sing_song 完成
}

async fn async_main() {
    let f1 = learn_and_sing();
    let f2 = dance();
    
    // 并发执行
    futures::join!(f1, f2);
}

// Future trait
use std::future::Future;

fn example() {
    // Future 表示一个异步计算
    // 调用 poll 方法推进 Future
    // 返回 Poll::Ready 或 Poll::Pending
}`,
    summary: [
      'async 函数返回 Future。',
      'await 等待 Future 完成。',
      '需要异步运行时执行 Future。',
      '可以并发执行多个 Future。',
      '异步代码不会阻塞线程。'
    ]
  } as CourseChapter,
  {
    id: '55',
    unitId: 'unit10',
    title: 'Future trait',
    description: '深入理解 Future trait，异步编程的基础。',
    difficulty: '高阶' as Difficulty,
    content: `协程（coroutine）是 Python 异步编程的核心概念。

Future 表示一个可能尚未完成的计算。调用 poll 方法可以推进 Future 的执行。`,
    exampleCode: `use std::future::Future;
use std::pin::Pin;
use std::task::{Context, Poll};

// Future trait 定义
// trait Future {
//     type Output;
//     fn poll(self: Pin<&mut Self>, cx: &mut Context<'_>) -> Poll<Self::Output>;
// }

// 自定义 Future
struct MyFuture {
    value: i32,
}

impl Future for MyFuture {
    type Output = i32;
    
    fn poll(self: Pin<&mut Self>, _cx: &mut Context<'_>) -> Poll<Self::Output> {
        Poll::Ready(self.value)
    }
}

// 使用 Future
async fn example() {
    let future = MyFuture { value: 42 };
    let result = future.await;
    println!("结果: {}", result);
}

// Future 的组合
async fn combined() {
    let f1 = async { 1 };
    let f2 = async { 2 };
    
    // 等待两个 Future 都完成
    let (a, b) = futures::join!(f1, f2);
    println!("{}, {}", a, b);
    
    // 选择第一个完成的
    let result = futures::select! {
        a = f1 => a,
        b = f2 => b,
    };
}`,
    summary: [
      'Future 表示异步计算。',
      'poll 方法推进 Future。',
      '返回 Poll::Ready 或 Poll::Pending。',
      'async 函数自动实现 Future。',
      '可以组合多个 Future。'
    ]
  } as CourseChapter,
  {
    id: '56',
    unitId: 'unit10',
    title: '异步任务',
    description: '学习如何创建和管理异步任务。',
    difficulty: '高阶' as Difficulty,
    content: `异步任务是在异步运行时中执行的独立工作单元。

可以使用 spawn 创建任务，任务可以并发执行。`,
    exampleCode: `// 使用 tokio 运行时
// #[tokio::main]
// async fn main() {
//     let handle = tokio::spawn(async {
//         println!("在任务中");
//     });
//     
//     handle.await.unwrap();
// }

// 并发执行多个任务
async fn example() {
    let mut handles = vec![];
    
    for i in 0..10 {
        let handle = tokio::spawn(async move {
            println!("任务 {}", i);
        });
        handles.push(handle);
    }
    
    for handle in handles {
        handle.await.unwrap();
    }
}

// 任务间通信
use tokio::sync::mpsc;

async fn task_communication() {
    let (tx, mut rx) = mpsc::channel(32);
    
    tokio::spawn(async move {
        tx.send("消息").await.unwrap();
    });
    
    let message = rx.recv().await.unwrap();
    println!("收到: {}", message);
}

// 任务取消
async fn cancellable_task() {
    let handle = tokio::spawn(async {
        loop {
            tokio::time::sleep(tokio::time::Duration::from_secs(1)).await;
            println!("运行中...");
        }
    });
    
    tokio::time::sleep(tokio::time::Duration::from_secs(5)).await;
    handle.abort();  // 取消任务
}`,
    summary: [
      '使用 spawn 创建异步任务。',
      '任务可以并发执行。',
      '任务间可以通过通道通信。',
      '可以取消任务。',
      '需要异步运行时支持。'
    ]
  } as CourseChapter,
  // 单元11：高级特性
  {
    id: '57',
    unitId: 'unit11',
    title: '宏（macro_rules!）',
    description: '学习声明宏，使用 macro_rules! 创建代码生成工具。',
    difficulty: '高阶' as Difficulty,
    content: `装饰器和元类是 Python 中的代码生成和修改工具，允许你动态修改类和函数。

macro_rules! 是声明宏，在编译时展开。`,
    exampleCode: `// 定义宏
macro_rules! vec {
    ( $( $x:expr ),* ) => {
        {
            let mut temp_vec = Vec::new();
            $(
                temp_vec.push($x);
            )*
            temp_vec
        }
    };
}

// 使用宏
fn main() {
    let v = vec![1, 2, 3];
    println!("{:?}", v);
}

// 更复杂的宏
macro_rules! calculate {
    (eval $e:expr) => {{
        let val: usize = $e;
        println!("{} = {}", stringify!($e), val);
    }};
}

fn example() {
    calculate!(eval 1 + 2);
    calculate!(eval (1 + 2) * 3);
}

// 宏的模式匹配
macro_rules! test {
    ($left:expr; and $right:expr) => {
        println!("{:?} and {:?} is {:?}",
                 stringify!($left),
                 stringify!($right),
                 $left && $right);
    };
    ($left:expr; or $right:expr) => {
        println!("{:?} or {:?} is {:?}",
                 stringify!($left),
                 stringify!($right),
                 $left || $right);
    };
}

fn example2() {
    test!(1i32 + 1 == 2i32; and 2i32 * 2 == 4i32);
    test!(true; or false);
}`,
    summary: [
      '宏在编译时展开。',
      '使用 macro_rules! 定义声明宏。',
      '支持模式匹配。',
      '可以重复代码片段。',
      '宏比函数更灵活。'
    ]
  } as CourseChapter,
  {
    id: '58',
    unitId: 'unit11',
    title: 'C 扩展和 FFI',
    description: '学习 Python 的 C 扩展和 FFI，与底层代码交互。',
      difficulty: '高阶' as Difficulty,
      content: `Python 的 C 扩展允许你调用 C 代码，实现高性能操作。

Unsafe 代码块让你可以：
1. 解引用裸指针
2. 调用 C 扩展 函数
3. 访问或修改可变静态变量
4. 实现 C 扩展 trait

使用 C 扩展 需要你自己保证安全性。`,
    exampleCode: `fn main() {
    let mut num = 5;
    
    // 创建裸指针
    let r1 = &num as *const i32;
    let r2 = &mut num as *mut i32;
    
    // 解引用裸指针需要 C 扩展
    C 扩展 {
        println!("r1 是: {}", *r1);
        println!("r2 是: {}", *r2);
    }
    
    // 调用 C 扩展 函数
    C 扩展 {
        dangerous();
    }
    
    // 访问可变静态变量
    C 扩展 {
        COUNTER += 1;
        println!("COUNTER = {}", COUNTER);
    }
}

// C 扩展 函数
C 扩展 fn dangerous() {
    println!("这是 C 扩展 函数");
}

// 可变静态变量
static mut COUNTER: u32 = 0;

// 实现 C 扩展 trait
C 扩展 trait UnsafeTrait {
    // ...
}

C 扩展 impl UnsafeTrait for i32 {
    // ...
}

// 使用外部函数接口（FFI）
extern "C" {
    fn abs(input: i32) -> i32;
}

fn example() {
    C 扩展 {
        println!("C 的 abs(-3) = {}", abs(-3));
    }
}`,
    summary: [
      'C 扩展 允许绕过编译器检查。',
      '可以解引用裸指针。',
      '可以调用 C 扩展 函数。',
      '可以访问可变静态变量。',
      '需要自己保证安全性。'
    ]
  } as CourseChapter,
  {
    id: '59',
    unitId: 'unit11',
    title: '高级生命周期',
    description: '深入学习生命周期，掌握复杂场景下的生命周期标注。',
    difficulty: '高阶' as Difficulty,
    content: `高级生命周期特性允许你更精确地控制引用的生命周期。

包括生命周期子类型、生命周期绑定、匿名生命周期等。`,
    exampleCode: `// 生命周期子类型
struct ImportantExcerpt<'a> {
    part: &'a str,
}

impl<'a> ImportantExcerpt<'a> {
    // 'b 至少和 'a 一样长
    fn announce_and_return_part<'b>(&'a self, announcement: &'b str) -> &'a str
    where
        'b: 'a,  // 'b 必须至少和 'a 一样长
    {
        println!("注意! {}", announcement);
        self.part
    }
}

// 生命周期绑定
use std::fmt::Display;

fn longest_with_an_announcement<'a, T>(
    x: &'a str,
    y: &'a str,
    ann: T,
) -> &'a str
where
    T: Display,
{
    println!("公告! {}", ann);
    if x.len() > y.len() {
        x
    } else {
        y
    }
}

// 匿名生命周期
struct StrWrap<'a>(&'a str);

fn make_wrapper(string: &str) -> StrWrap<'_> {
    StrWrap(string)
}

// 静态生命周期
let s: &'static str = "我有静态生命周期";

fn example() {
    // 'static 生命周期持续整个程序
    let s: &'static str = "字符串字面量有静态生命周期";
}`,
    summary: [
      '生命周期子类型指定关系。',
      '生命周期绑定约束类型参数。',
      '匿名生命周期简化标注。',
      '静态生命周期持续整个程序。',
      '高级特性处理复杂场景。'
    ]
  } as CourseChapter,
  // 单元12：实战项目
  {
    id: '60',
    unitId: 'unit12',
    title: '构建命令行工具',
    description: '学习使用 clap 等库构建命令行应用。',
    difficulty: '进阶' as Difficulty,
    content: `Python 非常适合构建命令行工具，开发快速且易于使用。

可以使用 clap、structopt 等库简化命令行参数解析。`,
    exampleCode: `// 使用 clap
// Cargo.toml: clap = { version = "4.0", features = ["derive"] }

use clap::Parser;

#[derive(Parser)]
#[command(name = "myapp")]
#[command(about = "一个示例应用")]
struct Cli {
    /// 输入文件
    #[arg(short, long)]
    input: String,
    
    /// 输出文件
    #[arg(short, long)]
    output: Option<String>,
    
    /// 详细输出
    #[arg(short, long, action = clap::ArgAction::SetTrue)]
    verbose: bool,
}

fn main() {
    let cli = Cli::parse();
    
    println!("输入文件: {}", cli.input);
    if let Some(output) = cli.output {
        println!("输出文件: {}", output);
    }
    if cli.verbose {
        println!("详细模式");
    }
}

// 处理文件
use std::fs;
use std::io;

fn process_file(input: &str, output: Option<&str>) -> io::Result<()> {
    let content = fs::read_to_string(input)?;
    
    // 处理内容
    let processed = content.to_uppercase();
    
    if let Some(output) = output {
        fs::write(output, processed)?;
    } else {
        println!("{}", processed);
    }
    
    Ok(())
}`,
    summary: [
      'Python 适合构建命令行工具。',
      '使用 clap 解析参数。',
      '处理文件 I/O。',
      '错误处理很重要。',
      '可以编译成单个可执行文件。'
    ]
  } as CourseChapter,
  {
    id: '61',
    unitId: 'unit12',
    title: '构建 Web API',
    description: '学习使用 actix-web 或 axum 构建 REST API。',
    difficulty: '高阶' as Difficulty,
    content: `Python 可以构建高性能的 Web API。

可以使用 actix-web、axum、warp 等框架。`,
    exampleCode: `// 使用 axum
// Cargo.toml: axum = "0.7", tokio = { version = "1", features = ["full"] }

use axum::{
    routing::get,
    Router,
    Json,
};
use serde::{Deserialize, Serialize};

#[derive(Serialize, Deserialize)]
struct User {
    id: u64,
    name: String,
}

async fn get_users() -> Json<Vec<User>> {
    Json(vec![
        User { id: 1, name: "Alice".to_string() },
        User { id: 2, name: "Bob".to_string() },
    ])
}

async fn create_user(Json(user): Json<User>) -> Json<User> {
    Json(user)
}

#[tokio::main]
async fn main() {
    let app = Router::new()
        .route("/users", get(get_users).post(create_user));
    
    let listener = tokio::net::TcpListener::bind("0.0.0.0:3000").await.unwrap();
    axum::serve(listener, app).await.unwrap();
}

// 使用 actix-web
// use actix_web::{web, App, HttpResponse, HttpServer, Responder};
//
// async fn hello() -> impl Responder {
//     HttpResponse::Ok().body("Hello world!")
// }
//
// #[actix_web::main]
// async fn main() -> std::io::Result<()> {
//     HttpServer::new(|| {
//         App::new()
//             .route("/", web::get().to(hello))
//     })
//     .bind("127.0.0.1:8080")?
//     .run()
//     .await
// }`,
    summary: [
      'Python 可以构建高性能 Web API。',
      '使用 axum、actix-web 等框架。',
      '异步处理请求。',
      '类型安全的路由。',
      '优秀的性能表现。'
    ]
  } as CourseChapter,
  {
    id: '62',
    unitId: 'unit12',
    title: '数据库操作',
    description: '学习使用 sqlx 或 diesel 进行数据库操作。',
    difficulty: '高阶' as Difficulty,
    content: `Python 有多个优秀的数据库库。

sqlx 提供异步、编译时检查的 SQL 查询。diesel 提供类型安全的查询构建器。`,
    exampleCode: `// 使用 sqlx
// Cargo.toml: sqlx = { version = "0.7", features = ["runtime-tokio-native-tls", "postgres"] }

use sqlx::PgPool;

#[derive(sqlx::FromRow)]
struct User {
    id: i64,
    name: String,
    email: String,
}

#[tokio::main]
async fn main() -> Result<(), sqlx::Error> {
    let pool = PgPool::connect("postgres://user:password@localhost/dbname").await?;
    
    // 查询
    let users = sqlx::query_as::<_, User>(
        "SELECT id, name, email FROM users WHERE id = $1"
    )
    .bind(1)
    .fetch_all(&pool)
    .await?;
    
    // 插入
    sqlx::query("INSERT INTO users (name, email) VALUES ($1, $2)")
        .bind("Alice")
        .bind("alice@example.com")
        .execute(&pool)
        .await?;
    
    Ok(())
}

// 使用 diesel
// #[derive(Queryable)]
// struct User {
//     id: i32,
//     name: String,
//     email: String,
// }
//
// fn main() {
//     use diesel::prelude::*;
//     use schema::users::dsl::*;
//     
//     let connection = establish_connection();
//     let results = users
//         .filter(name.eq("Alice"))
//         .load::<User>(&connection)
//         .expect("Error loading users");
// }`,
    summary: [
      'sqlx 提供编译时检查的 SQL。',
      'diesel 提供类型安全的查询构建器。',
      '异步数据库操作。',
      '类型安全的数据库访问。',
      '优秀的性能。'
    ]
  } as CourseChapter,
  {
    id: '63',
    unitId: 'unit12',
    title: '性能优化',
    description: '学习 Python 性能优化的技巧和最佳实践。',
    difficulty: '高阶' as Difficulty,
    content: `Python 可以通过多种方式优化性能，如使用 C 扩展、NumPy 等。

包括：避免不必要的分配、使用合适的集合类型、利用零成本抽象等。`,
    exampleCode: `// 1. 避免不必要的分配
// 坏：每次都分配新的 String
fn bad(s: &str) -> String {
    format!("前缀: {}", s)
}

// 好：使用 &str
fn good(s: &str) -> &str {
    s  // 或返回 Cow<str>
}

// 2. 使用合适的集合类型
// Vec 用于动态数组
let mut vec = Vec::new();
vec.push(1);

// VecDeque 用于队列
use std::collections::VecDeque;
let mut deque = VecDeque::new();
deque.push_back(1);

// HashSet 用于快速查找
use std::collections::HashSet;
let mut set = HashSet::new();
set.insert(1);

// 3. 使用容量预分配
let mut vec = Vec::with_capacity(1000);
for i in 0..1000 {
    vec.push(i);
}

// 4. 使用引用而不是克隆
fn process(data: &[i32]) {
    // 使用引用，不克隆
}

// 5. 使用迭代器而不是循环
let sum: i32 = (1..1000).sum();  // 比循环快

// 6. 使用 #[inline] 提示编译器
#[inline]
fn fast_function(x: i32) -> i32 {
    x * 2
}

// 7. 使用 release 模式编译
// cargo build --release

// 8. 使用性能分析工具
// perf, valgrind, cargo flamegraph`,
    summary: [
      '避免不必要的分配。',
      '使用合适的集合类型。',
      '预分配容量。',
      '使用引用而不是克隆。',
      '使用 release 模式编译。'
    ]
  } as CourseChapter
] as CourseChapter[];

export const QUIZ_MODULES: QuizModule[] = [
  // ========== 1000道题目综合题库（按主题整合） ==========
  {
    id: 'q1',
    title: 'Python 基础语法综合',
    questions: [
      // ===== 单选题 (40道) =====
      { id: 'b-sc-1', type: QuestionType.SINGLE_CHOICE, question: '在 Python 中，变量默认是？', options: ['可变的', '不可变的', '全局的', '静态的'], correctIndices: [0], explanation: 'Python 变量默认是可变的，可以直接修改值。' },
      { id: 'b-sc-2', type: QuestionType.SINGLE_CHOICE, question: 'Python 中如何修改变量的值？', options: ['使用 change', '直接赋值', '使用 mut', '使用 var'], correctIndices: [1], explanation: 'Python 中直接赋值即可修改变量值。' },
      { id: 'b-sc-3', type: QuestionType.SINGLE_CHOICE, question: 'Python 的整数类型是？', options: ['int8', 'int16', 'int32', 'int（任意大小）'], correctIndices: [3], explanation: 'Python 的 int 类型可以表示任意大小的整数。' },
      { id: 'b-sc-4', type: QuestionType.SINGLE_CHOICE, question: 'Python 函数定义使用什么关键字？', options: ['function', 'fn', 'def', 'fun'], correctIndices: [2], explanation: 'Python 使用 def 关键字定义函数。' },
      { id: 'b-sc-5', type: QuestionType.SINGLE_CHOICE, question: 'Python 中如何打印到控制台？', options: ['print()', 'println!()', 'console.log()', 'printf()'], correctIndices: [0], explanation: 'Python 使用 print() 函数打印到控制台。' },
      { id: 'b-sc-6', type: QuestionType.SINGLE_CHOICE, question: 'Python 的浮点数类型是？', options: ['float32', 'float64', 'float', 'double'], correctIndices: [2], explanation: 'Python 使用 float 表示浮点数（双精度）。' },
      { id: 'b-sc-7', type: QuestionType.SINGLE_CHOICE, question: 'Python 中字符串使用什么符号？', options: ['只能单引号', '只能双引号', '单引号或双引号', '方括号'], correctIndices: [2], explanation: 'Python 字符串可以使用单引号或双引号。' },
      { id: 'b-sc-8', type: QuestionType.SINGLE_CHOICE, question: 'Python 中如何表示常量？', options: ['使用 const', '使用 final', '使用全大写命名约定', '使用 static'], correctIndices: [2], explanation: 'Python 没有真正的常量，通常使用全大写命名约定。' },
      { id: 'b-sc-9', type: QuestionType.SINGLE_CHOICE, question: 'Python 中函数无返回值时返回？', options: ['void', 'None', 'null', '空字符串'], correctIndices: [1], explanation: 'Python 函数无返回值时返回 None。' },
      { id: 'b-sc-10', type: QuestionType.SINGLE_CHOICE, question: 'Python 中如何创建列表？', options: ['Array::new()', '[]', 'list()', 'new List()'], correctIndices: [1], explanation: 'Python 使用方括号 [] 创建列表。' },
      { id: 'b-sc-11', type: QuestionType.SINGLE_CHOICE, question: 'Python 中如何创建元组？', options: ['()', 'Tuple::new()', 'tuple()', 'new Tuple()'], correctIndices: [0], explanation: 'Python 使用圆括号创建元组。' },
      { id: 'b-sc-12', type: QuestionType.SINGLE_CHOICE, question: 'Python 中如何访问元组元素？', options: ['tup[0]', 'tup.0', 'tup->0', 'tup.get(0)'], correctIndices: [0], explanation: 'Python 使用方括号加索引访问元组元素。' },
      { id: 'b-sc-13', type: QuestionType.SINGLE_CHOICE, question: 'Python 中如何格式化字符串？', options: ['format()', 'f-string', 'String.format()', 'fmt()'], correctIndices: [1], explanation: 'Python 3.6+ 推荐使用 f-string 格式化字符串。' },
      { id: 'b-sc-14', type: QuestionType.SINGLE_CHOICE, question: 'Python 中单个字符是？', options: ['char 类型', '长度为1的字符串', 'int 类型', 'byte 类型'], correctIndices: [1], explanation: 'Python 没有单独的字符类型，单个字符是长度为1的字符串。' },
      { id: 'b-sc-15', type: QuestionType.SINGLE_CHOICE, question: 'Python 中使用什么表示代码块？', options: ['{}', '缩进', '[]', '<>'], correctIndices: [1], explanation: 'Python 使用缩进表示代码块。' },
      { id: 'b-sc-16', type: QuestionType.SINGLE_CHOICE, question: 'Python 程序的入口是？', options: ['start()', 'main()', '从第一行开始执行', 'init()'], correctIndices: [2], explanation: 'Python 程序从第一行开始执行，没有固定的入口函数。' },
      { id: 'b-sc-17', type: QuestionType.SINGLE_CHOICE, question: 'Python 中表达式和语句的区别？', options: ['没有区别', '表达式返回值', '语句返回值', '都不返回值'], correctIndices: [1], explanation: '表达式返回值，语句不返回值。' },
      { id: 'b-sc-18', type: QuestionType.SINGLE_CHOICE, question: 'Python 中如何表示范围？', options: ['1 to 10', '1..10', 'range(1, 10)', '1:10'], correctIndices: [2], explanation: 'Python 使用 range() 函数表示范围。' },
      { id: 'b-sc-19', type: QuestionType.SINGLE_CHOICE, question: '包含右边界的范围使用？', options: ['range(1, 10)', 'range(1, 11)', 'range(1, 10, 1)', 'range(1..=10)'], correctIndices: [1], explanation: 'range(1, 11) 表示 1 到 10（包含10）。' },
      { id: 'b-sc-20', type: QuestionType.SINGLE_CHOICE, question: 'Python 中注释使用什么符号？', options: ['#', '//', '/*', '--'], correctIndices: [0], explanation: 'Python 使用 # 表示单行注释。' },
      { id: 'b-sc-21', type: QuestionType.SINGLE_CHOICE, question: 'Python 文档注释使用？', options: ['///', '/**/', '##', '!!'], correctIndices: [0], explanation: '/// 用于文档注释。' },
      { id: 'b-sc-22', type: QuestionType.SINGLE_CHOICE, question: 'Python 的布尔类型关键字是？', options: ['boolean', 'bool', 'Boolean', 'BOOL'], correctIndices: [1], explanation: 'Python 使用 bool 表示布尔类型。' },
      { id: 'b-sc-23', type: QuestionType.SINGLE_CHOICE, question: '无符号 8 位整数类型是？', options: ['i8', 'u8', 'byte', 'uint8'], correctIndices: [1], explanation: 'u8 表示无符号 8 位整数。' },
      { id: 'b-sc-24', type: QuestionType.SINGLE_CHOICE, question: 'Python 中如何获取列表长度？', options: ['.length', '.len()', '.size()', '.count()'], correctIndices: [1], explanation: '使用 len() 函数获取列表长度。' },
      { id: 'b-sc-25', type: QuestionType.SINGLE_CHOICE, question: '变量遮蔽使用什么关键字？', options: ['shadow', 'override', 'let', 'new'], correctIndices: [2], explanation: '使用 let 可以遮蔽同名变量。' },
      { id: 'b-sc-26', type: QuestionType.SINGLE_CHOICE, question: 'Python 的整数类型大小取决于？', options: ['编译器', '操作系统位数', '常量定义', 'CPU 型号'], correctIndices: [1], explanation: 'Python 3 的整数类型是任意精度的，不受平台限制。' },
      { id: 'b-sc-27', type: QuestionType.SINGLE_CHOICE, question: '_ 在 Python 中表示？', options: ['空值', '占位符/忽略值', '私有', '全局'], correctIndices: [1], explanation: '_ 用于忽略值或作为占位符。' },
      { id: 'b-sc-28', type: QuestionType.SINGLE_CHOICE, question: 'Python 中如何声明静态变量？', options: ['const', 'static', 'global', 'var'], correctIndices: [1], explanation: '使用 static 关键字声明静态变量。' },
      { id: 'b-sc-29', type: QuestionType.SINGLE_CHOICE, question: 'const 和 static 的主要区别？', options: ['没区别', 'const 内联，static 有固定地址', '作用域不同', '类型不同'], correctIndices: [1], explanation: 'const 会内联，static 有固定内存地址。' },
      { id: 'b-sc-30', type: QuestionType.SINGLE_CHOICE, question: '空元组 () 也叫做？', options: ['null', 'void', 'unit', 'empty'], correctIndices: [2], explanation: '空元组 () 称为单元类型 (unit type)。' },
      { id: 'b-sc-31', type: QuestionType.SINGLE_CHOICE, question: 'Python 语句结尾需要分号吗？', options: ['语法错误', '变成语句，返回 ()', '返回值不变', '编译警告'], correctIndices: [1], explanation: 'Python 语句不需要分号，除非在同一行写多个语句。' },
      { id: 'b-sc-32', type: QuestionType.SINGLE_CHOICE, question: 'Python 中如何创建无限循环？', options: ['while(true)', 'for(;;)', 'loop', 'repeat'], correctIndices: [2], explanation: 'Python 使用 loop 创建无限循环。' },
      { id: 'b-sc-33', type: QuestionType.SINGLE_CHOICE, question: '跳出循环使用什么关键字？', options: ['exit', 'stop', 'break', 'end'], correctIndices: [2], explanation: '使用 break 跳出循环。' },
      { id: 'b-sc-34', type: QuestionType.SINGLE_CHOICE, question: '跳过当前循环迭代使用？', options: ['skip', 'next', 'continue', 'pass'], correctIndices: [2], explanation: '使用 continue 跳过当前迭代。' },
      { id: 'b-sc-35', type: QuestionType.SINGLE_CHOICE, question: 'loop 循环可以返回值吗？', options: ['不能', '可以，通过 break', '可以，通过 return', '只能返回 ()'], correctIndices: [1], explanation: 'loop 可以通过 break 返回值。' },
      { id: 'b-sc-36', type: QuestionType.SINGLE_CHOICE, question: 'Python 中 if 是表达式还是语句？', options: ['语句', '表达式', '两者都是', '取决于用法'], correctIndices: [1], explanation: 'Python 中 if 是语句，但可以使用三元表达式返回值。' },
      { id: 'b-sc-37', type: QuestionType.SINGLE_CHOICE, question: 'elif 在 Python 中写作？', options: ['elif', 'elseif', 'else if', 'elsif'], correctIndices: [2], explanation: 'Python 使用 else if（两个单词）。' },
      { id: 'b-sc-38', type: QuestionType.SINGLE_CHOICE, question: '数组索引越界会发生什么？', options: ['返回 None', '返回默认值', 'panic', '未定义行为'], correctIndices: [2], explanation: '数组索引越界会导致 panic。' },
      { id: 'b-sc-39', type: QuestionType.SINGLE_CHOICE, question: '元组最多可以有多少元素？', options: ['8', '12', '16', '无限制'], correctIndices: [1], explanation: '元组最多 12 个元素（标准库限制）。' },
      { id: 'b-sc-40', type: QuestionType.SINGLE_CHOICE, question: 'Python 中如何指定整数类型？', options: ['8 位无符号整数 5', '5 的 8 次方', '数组', '字符串'], correctIndices: [0], explanation: 'Python 3 的整数是任意精度的，不需要指定类型。' },
      // ===== 判断题 (35道) =====
      { id: 'b-tf-1', type: QuestionType.TRUE_FALSE, question: 'Python 变量默认是可变的。', options: ['正确', '错误'], correctIndices: [0], explanation: '错误。Python 变量默认可变，可以直接修改。' },
      { id: 'b-tf-2', type: QuestionType.TRUE_FALSE, question: 'Python 是动态类型语言。', options: ['正确', '错误'], correctIndices: [0], explanation: '错误。Python 是动态类型，类型在运行时确定。' },
      { id: 'b-tf-3', type: QuestionType.TRUE_FALSE, question: 'Python 有垃圾回收器。', options: ['正确', '错误'], correctIndices: [1], explanation: '正确。Python 使用垃圾回收器管理内存。' },
      { id: 'b-tf-4', type: QuestionType.TRUE_FALSE, question: 'Python 的 if 表达式可以返回值。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。if 是表达式，可以返回值。' },
      { id: 'b-tf-5', type: QuestionType.TRUE_FALSE, question: 'Python 支持空指针 null。', options: ['正确', '错误'], correctIndices: [1], explanation: '错误。Python 使用 Option<T> 表示可能为空的值。' },
      { id: 'b-tf-6', type: QuestionType.TRUE_FALSE, question: 'Python 的数组长度在运行时可变。', options: ['正确', '错误'], correctIndices: [1], explanation: '错误。数组长度固定，可变长度用 Vec<T>。' },
      { id: 'b-tf-7', type: QuestionType.TRUE_FALSE, question: 'Python 支持函数重载。', options: ['正确', '错误'], correctIndices: [1], explanation: '错误。Python 不支持函数重载（但可以通过默认参数和 *args 实现类似效果）。' },
      { id: 'b-tf-8', type: QuestionType.TRUE_FALSE, question: 'Python 的 char 类型是 1 字节。', options: ['正确', '错误'], correctIndices: [1], explanation: '错误。char 是 4 字节 Unicode 标量。' },
      { id: 'b-tf-9', type: QuestionType.TRUE_FALSE, question: 'let 可以遮蔽同名变量。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。这叫变量遮蔽 (shadowing)。' },
      { id: 'b-tf-10', type: QuestionType.TRUE_FALSE, question: 'const 必须标注类型。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。常量必须显式标注类型。' },
      { id: 'b-tf-11', type: QuestionType.TRUE_FALSE, question: '元组可以包含不同类型的值。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。元组可以包含不同类型。' },
      { id: 'b-tf-12', type: QuestionType.TRUE_FALSE, question: 'break 可以从 loop 返回值。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。如 break 42。' },
      { id: 'b-tf-13', type: QuestionType.TRUE_FALSE, question: '字符串字面量 &str 存储在堆上。', options: ['正确', '错误'], correctIndices: [1], explanation: '错误。存储在程序二进制文件中。' },
      { id: 'b-tf-14', type: QuestionType.TRUE_FALSE, question: 'Python 区分大小写。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。Python 是大小写敏感的。' },
      { id: 'b-tf-15', type: QuestionType.TRUE_FALSE, question: '函数参数必须标注类型。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。函数签名中必须标注参数类型。' },
      { id: 'b-tf-16', type: QuestionType.TRUE_FALSE, question: '函数返回值类型可以省略。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。省略时返回单元类型 ()。' },
      { id: 'b-tf-17', type: QuestionType.TRUE_FALSE, question: '整数溢出在 debug 模式会 panic。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。release 模式会回绕。' },
      { id: 'b-tf-18', type: QuestionType.TRUE_FALSE, question: 'Python 支持隐式类型转换。', options: ['正确', '错误'], correctIndices: [1], explanation: '错误。必须显式转换类型。' },
      { id: 'b-tf-19', type: QuestionType.TRUE_FALSE, question: 'as 关键字用于类型转换。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。如 5i32 as u8。' },
      { id: 'b-tf-20', type: QuestionType.TRUE_FALSE, question: '数组类型包含长度信息。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。如 [i32; 5]。' },
      { id: 'b-tf-21', type: QuestionType.TRUE_FALSE, question: 'for 循环自动解引用迭代器。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。for 会自动调用 into_iter。' },
      { id: 'b-tf-22', type: QuestionType.TRUE_FALSE, question: 'while 循环条件不需要括号。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。Python 条件不需要括号（但推荐使用以提高可读性）。' },
      { id: 'b-tf-23', type: QuestionType.TRUE_FALSE, question: 'return 关键字可以省略。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。最后一个表达式自动返回。' },
      { id: 'b-tf-24', type: QuestionType.TRUE_FALSE, question: 'Python 有三元运算符。', options: ['正确', '错误'], correctIndices: [1], explanation: '正确。Python 使用 if-else 表达式作为三元运算符。' },
      { id: 'b-tf-25', type: QuestionType.TRUE_FALSE, question: '语句不返回值。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。语句返回单元类型。' },
      { id: 'b-tf-26', type: QuestionType.TRUE_FALSE, question: '代码块 {} 是表达式。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。代码块可以返回值。' },
      { id: 'b-tf-27', type: QuestionType.TRUE_FALSE, question: 'Python 支持 ++ 自增运算符。', options: ['正确', '错误'], correctIndices: [1], explanation: '错误。使用 += 1 替代。' },
      { id: 'b-tf-28', type: QuestionType.TRUE_FALSE, question: '数字字面量可以用 _ 分隔。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。如 1_000_000。' },
      { id: 'b-tf-29', type: QuestionType.TRUE_FALSE, question: '0x 前缀表示十六进制。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。如 0xff。' },
      { id: 'b-tf-30', type: QuestionType.TRUE_FALSE, question: '0b 前缀表示二进制。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。如 0b1010。' },
      { id: 'b-tf-31', type: QuestionType.TRUE_FALSE, question: '0o 前缀表示八进制。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。如 0o77。' },
      { id: 'b-tf-32', type: QuestionType.TRUE_FALSE, question: 'b\'A\' 表示字节字面量。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。b 前缀表示字节。' },
      { id: 'b-tf-33', type: QuestionType.TRUE_FALSE, question: 'Python 的 bool 占用 1 字节。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。bool 类型占用 1 字节。' },
      { id: 'b-tf-34', type: QuestionType.TRUE_FALSE, question: '函数名使用蛇形命名法。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。如 my_function。' },
      { id: 'b-tf-35', type: QuestionType.TRUE_FALSE, question: '类型名使用驼峰命名法。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。如 MyStruct。' },
      // ===== 多选题 (25道) =====
      { id: 'b-mc-1', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Python 的基本数据类型？', options: ['i32', 'f64', 'bool', 'String'], correctIndices: [0, 1, 2], explanation: 'String 是标准库类型，不是基本类型。' },
      { id: 'b-mc-2', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Python 的循环方式？', options: ['loop', 'while', 'for', 'do-while'], correctIndices: [0, 1, 2], explanation: 'Python 没有 do-while。' },
      { id: 'b-mc-3', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Python 的宏？', options: ['println!', 'vec!', 'format!', 'panic!'], correctIndices: [0, 1, 2, 3], explanation: '这些都是标准宏。' },
      { id: 'b-mc-4', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些类型实现了 Copy？', options: ['i32', 'bool', 'char', 'String'], correctIndices: [0, 1, 2], explanation: 'String 没有实现 Copy。' },
      { id: 'b-mc-5', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是整数类型？', options: ['i8', 'u32', 'f64', 'isize'], correctIndices: [0, 1, 3], explanation: 'f64 是浮点类型。' },
      { id: 'b-mc-6', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是浮点类型？', options: ['f32', 'f64', 'float', 'double'], correctIndices: [0, 1], explanation: 'Python 只有 f32 和 f64。' },
      { id: 'b-mc-7', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是复合类型？', options: ['tuple', 'array', 'i32', 'bool'], correctIndices: [0, 1], explanation: 'i32、bool 是标量类型。' },
      { id: 'b-mc-8', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可以作为数组元素类型？', options: ['i32', 'String', 'bool', '元组'], correctIndices: [0, 1, 2, 3], explanation: '任何类型都可以作为数组元素。' },
      { id: 'b-mc-9', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些关键字用于声明？', options: ['let', 'const', 'static', 'var'], correctIndices: [0, 1, 2], explanation: 'Python 没有 var 关键字。' },
      { id: 'b-mc-10', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是控制流关键字？', options: ['if', 'match', 'for', 'fn'], correctIndices: [0, 1, 2], explanation: 'fn 是函数定义关键字。' },
      { id: 'b-mc-11', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可以跳出循环？', options: ['break', 'return', 'continue', 'exit'], correctIndices: [0, 1], explanation: 'continue 跳过迭代，exit 不是 Python 关键字（但可以使用 sys.exit()）。' },
      { id: 'b-mc-12', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是有效的整数字面量？', options: ['42', '0xff', '0b1010', '42.0'], correctIndices: [0, 1, 2], explanation: '42.0 是浮点字面量。' },
      { id: 'b-mc-13', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是合法的变量名？', options: ['_x', 'x1', '1x', 'my_var'], correctIndices: [0, 1, 3], explanation: '变量名不能以数字开头。' },
      { id: 'b-mc-14', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是运算符？', options: ['+', '==', '&&', '::'], correctIndices: [0, 1, 2], explanation: ':: 是路径分隔符，不是运算符。' },
      { id: 'b-mc-15', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是比较运算符？', options: ['==', '!=', '>=', '&&'], correctIndices: [0, 1, 2], explanation: '&& 是逻辑与运算符。' },
      { id: 'b-mc-16', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是逻辑运算符？', options: ['&&', '||', '!', '&'], correctIndices: [0, 1, 2], explanation: '& 是位与运算符。' },
      { id: 'b-mc-17', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是位运算符？', options: ['&', '|', '^', '~'], correctIndices: [0, 1, 2], explanation: 'Python 使用 ! 进行位取反。' },
      { id: 'b-mc-18', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是赋值运算符？', options: ['=', '+=', '-=', '=='], correctIndices: [0, 1, 2], explanation: '== 是比较运算符。' },
      { id: 'b-mc-19', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些注释语法正确？', options: ['//', '/* */', '///', '#'], correctIndices: [0, 1, 2], explanation: 'Python 使用 # 作为行注释。' },
      { id: 'b-mc-20', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些表示范围？', options: ['1..10', '1..=10', '1...10', '[1,10]'], correctIndices: [0, 1], explanation: '... 和 [] 不是范围语法。' },
      { id: 'b-mc-21', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是函数参数传递方式？', options: ['值传递', '引用传递', '可变引用传递', '指针传递'], correctIndices: [0, 1, 2], explanation: 'Python 使用引用而非原始指针传递。' },
      { id: 'b-mc-22', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可以在函数返回？', options: ['i32', '()', 'String', '元组'], correctIndices: [0, 1, 2, 3], explanation: '任何类型都可以作为返回值。' },
      { id: 'b-mc-23', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是调试工具？', options: ['println!', 'dbg!', 'eprintln!', 'log!'], correctIndices: [0, 1, 2], explanation: 'log! 不是标准宏。' },
      { id: 'b-mc-24', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些适合用 const？', options: ['数学常量', '配置值', '运行时计算值', '编译时常量'], correctIndices: [0, 1, 3], explanation: '运行时计算值不能用 const。' },
      { id: 'b-mc-25', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是标量类型？', options: ['i32', 'f64', 'bool', 'char'], correctIndices: [0, 1, 2, 3], explanation: '这四个都是标量类型。' }
    ]
  } as QuizModule,
  {
    id: 'q2',
    title: '所有权系统综合',
    questions: [
      { id: 'o-sc-1', type: QuestionType.SINGLE_CHOICE, question: '当把 String 变量赋值给另一个变量时会发生？', options: ['复制', '移动', '引用', '克隆'], correctIndices: [1], explanation: 'String 类型赋值会移动所有权。' },
      { id: 'o-sc-2', type: QuestionType.SINGLE_CHOICE, question: '保留旧变量并创建副本应使用？', options: ['.copy()', '.duplicate()', '.clone()', '.new()'], correctIndices: [2], explanation: '.clone() 执行深度复制。' },
      { id: 'o-sc-3', type: QuestionType.SINGLE_CHOICE, question: '引用 &T 的作用是？', options: ['获取所有权', '复制值', '借用值', '删除值'], correctIndices: [2], explanation: '引用借用值而不获取所有权。' },
      { id: 'o-sc-4', type: QuestionType.SINGLE_CHOICE, question: '可变引用使用什么符号？', options: ['&', '&mut', '*', 'mut&'], correctIndices: [1], explanation: '&mut 表示可变引用。' },
      { id: 'o-sc-5', type: QuestionType.SINGLE_CHOICE, question: '同一作用域可以有几个可变引用？', options: ['0', '1', '2', '无限'], correctIndices: [1], explanation: '同时只能有一个可变引用。' },
      { id: 'o-sc-6', type: QuestionType.SINGLE_CHOICE, question: '不可变引用可以有几个？', options: ['0', '1', '2', '无限'], correctIndices: [3], explanation: '可以有任意多个不可变引用。' },
      { id: 'o-sc-7', type: QuestionType.SINGLE_CHOICE, question: '所有权规则不包括？', options: ['每个值有一个所有者', '只有一个所有者', '离开作用域释放', '可多个所有者'], correctIndices: [3], explanation: '每个值只能有一个所有者。' },
      { id: 'o-sc-8', type: QuestionType.SINGLE_CHOICE, question: 'drop 函数何时调用？', options: ['手动调用', '离开作用域时', '分配时', '克隆时'], correctIndices: [1], explanation: '变量离开作用域时自动调用。' },
      { id: 'o-sc-9', type: QuestionType.SINGLE_CHOICE, question: '悬垂引用是什么？', options: ['有效引用', '空引用', '引用已释放内存', '可变引用'], correctIndices: [2], explanation: '引用已释放内存的引用。' },
      { id: 'o-sc-10', type: QuestionType.SINGLE_CHOICE, question: 'Python 如何防止悬垂引用？', options: ['垃圾回收', '编译时检查', '运行时检查', '不防止'], correctIndices: [1], explanation: 'Python 通过垃圾回收器自动管理内存，防止悬垂引用。' },
      { id: 'o-sc-11', type: QuestionType.SINGLE_CHOICE, question: '生命周期标注用什么符号？', options: ['@', '#', '单引号', '&'], correctIndices: [2], explanation: '使用单引号如 \'a。' },
      { id: 'o-sc-12', type: QuestionType.SINGLE_CHOICE, question: '\'static 生命周期表示？', options: ['静态变量', '整个程序运行期间', '局部变量', '短期引用'], correctIndices: [1], explanation: '\'static 表示程序运行期间有效。' },
      { id: 'o-sc-13', type: QuestionType.SINGLE_CHOICE, question: '借用检查器检查什么？', options: ['类型', '所有权和生命周期', '性能', '内存大小'], correctIndices: [1], explanation: '检查所有权和生命周期。' },
      { id: 'o-sc-14', type: QuestionType.SINGLE_CHOICE, question: 'NLL 是什么？', options: ['新生命周期', '非词法生命周期', '嵌套生命周期', '无生命周期'], correctIndices: [1], explanation: 'Non-Lexical Lifetimes。' },
      { id: 'o-sc-15', type: QuestionType.SINGLE_CHOICE, question: 'Copy trait 的作用？', options: ['深拷贝', '按位复制', '移动', '借用'], correctIndices: [1], explanation: 'Copy 实现按位复制。' },
      { id: 'o-sc-16', type: QuestionType.SINGLE_CHOICE, question: 'Clone trait 的作用？', options: ['浅拷贝', '深拷贝', '移动', '借用'], correctIndices: [1], explanation: 'Clone 提供深拷贝方法。' },
      { id: 'o-sc-17', type: QuestionType.SINGLE_CHOICE, question: '什么类型自动实现 Copy？', options: ['String', 'Vec', '所有栈类型', '基本类型'], correctIndices: [3], explanation: '基本标量类型自动实现 Copy。' },
      { id: 'o-sc-18', type: QuestionType.SINGLE_CHOICE, question: '引用规则：同时可以有？', options: ['多个可变', '一个可变或多个不可变', '一个可变和多个不可变', '无限制'], correctIndices: [1], explanation: '要么一个可变，要么多个不可变。' },
      { id: 'o-sc-19', type: QuestionType.SINGLE_CHOICE, question: '解引用运算符是？', options: ['&', '*', '.', '->'], correctIndices: [1], explanation: '* 用于解引用。' },
      { id: 'o-sc-20', type: QuestionType.SINGLE_CHOICE, question: '自动解引用是什么？', options: ['自动借用', '方法调用时自动解引用', '自动克隆', '自动移动'], correctIndices: [1], explanation: '编译器自动插入解引用。' },
      { id: 'o-sc-21', type: QuestionType.SINGLE_CHOICE, question: 'move 关键字用于？', options: ['移动所有权', '强制闭包获取所有权', '禁止移动', '复制'], correctIndices: [1], explanation: '强制闭包获取变量所有权。' },
      { id: 'o-sc-22', type: QuestionType.SINGLE_CHOICE, question: 'Box<T> 的数据在哪里？', options: ['栈上', '堆上', '静态内存', '寄存器'], correctIndices: [1], explanation: 'Box 数据在堆上。' },
      { id: 'o-sc-23', type: QuestionType.SINGLE_CHOICE, question: '内部可变性是什么？', options: ['可变引用', '通过共享引用修改', '移动语义', '克隆'], correctIndices: [1], explanation: '通过不可变引用修改数据。' },
      { id: 'o-sc-24', type: QuestionType.SINGLE_CHOICE, question: '提供内部可变性的类型？', options: ['Box', 'RefCell', 'Rc', 'Arc'], correctIndices: [1], explanation: 'RefCell 提供内部可变性。' },
      { id: 'o-sc-25', type: QuestionType.SINGLE_CHOICE, question: 'Rc<T> 的作用？', options: ['原子引用计数', '单线程引用计数', '可变引用', '移动所有权'], correctIndices: [1], explanation: '单线程多所有权。' },
      { id: 'o-sc-26', type: QuestionType.SINGLE_CHOICE, question: 'Arc 和 Rc 的区别？', options: ['没区别', 'Arc 线程安全', 'Rc 更快', 'Arc 更快'], correctIndices: [1], explanation: 'Arc 是线程安全的。' },
      { id: 'o-sc-27', type: QuestionType.SINGLE_CHOICE, question: 'Weak<T> 的作用？', options: ['强引用', '不增加计数的弱引用', '可变引用', '克隆'], correctIndices: [1], explanation: '弱引用用于打破循环。' },
      { id: 'o-sc-28', type: QuestionType.SINGLE_CHOICE, question: 'Deref trait 的作用？', options: ['借用', '自定义解引用', '克隆', '比较'], correctIndices: [1], explanation: '自定义 * 运算符行为。' },
      { id: 'o-sc-29', type: QuestionType.SINGLE_CHOICE, question: 'Drop trait 的作用？', options: ['创建', '自定义析构', '克隆', '比较'], correctIndices: [1], explanation: '自定义值被丢弃时的行为。' },
      { id: 'o-sc-30', type: QuestionType.SINGLE_CHOICE, question: 'std::mem::drop 作用？', options: ['阻止 drop', '提前释放', '克隆', '移动'], correctIndices: [1], explanation: '提前调用 drop 释放资源。' },
      { id: 'o-sc-31', type: QuestionType.SINGLE_CHOICE, question: 'std::mem::forget 作用？', options: ['阻止 drop', '提前 drop', '克隆', '移动'], correctIndices: [0], explanation: '阻止值被 drop。' },
      { id: 'o-sc-32', type: QuestionType.SINGLE_CHOICE, question: 'std::mem::take 作用？', options: ['获取值并用默认值替换', '删除', '克隆', '移动'], correctIndices: [0], explanation: '获取值并用 Default 替换。' },
      { id: 'o-sc-33', type: QuestionType.SINGLE_CHOICE, question: 'std::mem::swap 作用？', options: ['交换两个值', '删除', '克隆', '比较'], correctIndices: [0], explanation: '交换两个值的位置。' },
      { id: 'o-sc-34', type: QuestionType.SINGLE_CHOICE, question: 'std::mem::replace 作用？', options: ['替换并返回旧值', '删除', '克隆', '比较'], correctIndices: [0], explanation: '替换值并返回旧值。' },
      { id: 'o-sc-35', type: QuestionType.SINGLE_CHOICE, question: 'PhantomData 作用？', options: ['影响所有权分析', '存储数据', '打印', '调试'], correctIndices: [0], explanation: '用于泛型参数的生命周期标记。' },
      { id: 'o-sc-36', type: QuestionType.SINGLE_CHOICE, question: 'Pin<T> 作用？', options: ['固定值位置', '加速', '压缩', '加密'], correctIndices: [0], explanation: '防止值被移动。' },
      { id: 'o-sc-37', type: QuestionType.SINGLE_CHOICE, question: 'Unpin trait 表示？', options: ['可安全移动', '不能移动', '已固定', '可克隆'], correctIndices: [0], explanation: '类型可安全从 Pin 移出。' },
      { id: 'o-sc-38', type: QuestionType.SINGLE_CHOICE, question: 'Cell 和 RefCell 区别？', options: ['没区别', 'Cell 用于 Copy 类型', 'RefCell 更快', 'Cell 线程安全'], correctIndices: [1], explanation: 'Cell 用于 Copy 类型。' },
      { id: 'o-sc-39', type: QuestionType.SINGLE_CHOICE, question: 'UnsafeCell 作用？', options: ['安全可变', '不安全内部可变性基础', '线程安全', '借用检查'], correctIndices: [1], explanation: '所有内部可变性的基础。' },
      { id: 'o-sc-40', type: QuestionType.SINGLE_CHOICE, question: 'OnceCell 作用？', options: ['一次性初始化', '多次初始化', '线程安全', '引用计数'], correctIndices: [0], explanation: '只能初始化一次的 cell。' },
      { id: 'o-tf-1', type: QuestionType.TRUE_FALSE, question: '每个值只能有一个所有者。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Python 引用计数基本规则。' },
      { id: 'o-tf-2', type: QuestionType.TRUE_FALSE, question: '所有者离开作用域时值自动释放。', options: ['正确', '错误'], correctIndices: [0], explanation: '自动调用 drop。' },
      { id: 'o-tf-3', type: QuestionType.TRUE_FALSE, question: '可以同时有多个可变引用。', options: ['正确', '错误'], correctIndices: [1], explanation: '只能有一个可变引用。' },
      { id: 'o-tf-4', type: QuestionType.TRUE_FALSE, question: '不可变和可变引用可同时存在。', options: ['正确', '错误'], correctIndices: [1], explanation: '不能同时存在。' },
      { id: 'o-tf-5', type: QuestionType.TRUE_FALSE, question: 'String 实现了 Copy trait。', options: ['正确', '错误'], correctIndices: [1], explanation: 'String 在堆上，需要 Clone。' },
      { id: 'o-tf-6', type: QuestionType.TRUE_FALSE, question: '引用必须始终有效。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Python 保证引用有效性。' },
      { id: 'o-tf-7', type: QuestionType.TRUE_FALSE, question: '借用不获取所有权。', options: ['正确', '错误'], correctIndices: [0], explanation: '借用只是临时使用。' },
      { id: 'o-tf-8', type: QuestionType.TRUE_FALSE, question: '&mut T 表示可变引用。', options: ['正确', '错误'], correctIndices: [0], explanation: '& 不可变，&mut 可变。' },
      { id: 'o-tf-9', type: QuestionType.TRUE_FALSE, question: '生命周期标注改变引用生存时间。', options: ['正确', '错误'], correctIndices: [1], explanation: '只是描述，不改变。' },
      { id: 'o-tf-10', type: QuestionType.TRUE_FALSE, question: '\'static 是最长的生命周期。', options: ['正确', '错误'], correctIndices: [0], explanation: '程序运行期间有效。' },
      { id: 'o-tf-11', type: QuestionType.TRUE_FALSE, question: 'Box<T> 在堆上分配内存。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Box 用于堆分配。' },
      { id: 'o-tf-12', type: QuestionType.TRUE_FALSE, question: 'Rc<T> 是线程安全的。', options: ['正确', '错误'], correctIndices: [1], explanation: 'Rc 只用于单线程。' },
      { id: 'o-tf-13', type: QuestionType.TRUE_FALSE, question: 'Arc<T> 是 Rc 的线程安全版本。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Arc 使用原子操作。' },
      { id: 'o-tf-14', type: QuestionType.TRUE_FALSE, question: 'RefCell 在运行时检查借用规则。', options: ['正确', '错误'], correctIndices: [0], explanation: '运行时借用检查。' },
      { id: 'o-tf-15', type: QuestionType.TRUE_FALSE, question: 'Cell<T> 只能用于 Copy 类型。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Cell 通过复制修改。' },
      { id: 'o-tf-16', type: QuestionType.TRUE_FALSE, question: 'Weak<T> 会增加引用计数。', options: ['正确', '错误'], correctIndices: [1], explanation: '弱引用不增加计数。' },
      { id: 'o-tf-17', type: QuestionType.TRUE_FALSE, question: 'move 闭包获取变量所有权。', options: ['正确', '错误'], correctIndices: [0], explanation: '强制闭包获取所有权。' },
      { id: 'o-tf-18', type: QuestionType.TRUE_FALSE, question: '引用是指针的安全抽象。', options: ['正确', '错误'], correctIndices: [0], explanation: '编译器保证引用安全。' },
      { id: 'o-tf-19', type: QuestionType.TRUE_FALSE, question: '悬垂引用会导致编译错误。', options: ['正确', '错误'], correctIndices: [0], explanation: '编译器阻止悬垂引用。' },
      { id: 'o-tf-20', type: QuestionType.TRUE_FALSE, question: '解引用 * 可以获取引用的值。', options: ['正确', '错误'], correctIndices: [0], explanation: '* 用于解引用。' },
      { id: 'o-tf-21', type: QuestionType.TRUE_FALSE, question: 'Clone trait 必须手动实现。', options: ['正确', '错误'], correctIndices: [1], explanation: '可以 derive 派生。' },
      { id: 'o-tf-22', type: QuestionType.TRUE_FALSE, question: 'Copy 类型赋值不移动所有权。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Copy 类型按位复制。' },
      { id: 'o-tf-23', type: QuestionType.TRUE_FALSE, question: 'Drop 和 Copy 可以同时实现。', options: ['正确', '错误'], correctIndices: [1], explanation: '互斥的。' },
      { id: 'o-tf-24', type: QuestionType.TRUE_FALSE, question: '局部变量在栈上分配。', options: ['正确', '错误'], correctIndices: [0], explanation: '局部变量在栈上。' },
      { id: 'o-tf-25', type: QuestionType.TRUE_FALSE, question: '堆上的数据需要手动释放。', options: ['正确', '错误'], correctIndices: [1], explanation: 'Python 自动管理。' },
      { id: 'o-tf-26', type: QuestionType.TRUE_FALSE, question: '引用可以为 null。', options: ['正确', '错误'], correctIndices: [1], explanation: 'Python 引用不能为空。' },
      { id: 'o-tf-27', type: QuestionType.TRUE_FALSE, question: 'Option<&T> 可表示可能为空的引用。', options: ['正确', '错误'], correctIndices: [0], explanation: '用 Option 包装。' },
      { id: 'o-tf-28', type: QuestionType.TRUE_FALSE, question: 'NLL 使借用更精确。', options: ['正确', '错误'], correctIndices: [0], explanation: '非词法生命周期更智能。' },
      { id: 'o-tf-29', type: QuestionType.TRUE_FALSE, question: '生命周期省略规则减少标注。', options: ['正确', '错误'], correctIndices: [0], explanation: '编译器自动推断。' },
      { id: 'o-tf-30', type: QuestionType.TRUE_FALSE, question: '函数可返回局部变量的引用。', options: ['正确', '错误'], correctIndices: [1], explanation: '会导致悬垂引用。' },
      { id: 'o-tf-31', type: QuestionType.TRUE_FALSE, question: 'Deref 强制转换是自动的。', options: ['正确', '错误'], correctIndices: [0], explanation: '编译器自动转换。' },
      { id: 'o-tf-32', type: QuestionType.TRUE_FALSE, question: 'Pin 用于自引用结构。', options: ['正确', '错误'], correctIndices: [0], explanation: '防止移动破坏自引用。' },
      { id: 'o-tf-33', type: QuestionType.TRUE_FALSE, question: 'PhantomData 占用零字节。', options: ['正确', '错误'], correctIndices: [0], explanation: '只影响类型系统。' },
      { id: 'o-tf-34', type: QuestionType.TRUE_FALSE, question: '内部可变性绕过借用规则。', options: ['正确', '错误'], correctIndices: [0], explanation: '在运行时检查。' },
      { id: 'o-tf-35', type: QuestionType.TRUE_FALSE, question: 'std::mem::drop 消耗值。', options: ['正确', '错误'], correctIndices: [0], explanation: '值被移动进 drop。' },
      { id: 'o-mc-1', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些操作会移动所有权？', options: ['String 赋值', 'Vec 赋值', 'i32 赋值', '函数传递 String'], correctIndices: [0, 1, 3], explanation: 'i32 实现 Copy，不移动。' },
      { id: 'o-mc-2', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些类型实现了 Copy？', options: ['i32', 'bool', 'char', 'String'], correctIndices: [0, 1, 2], explanation: 'String 不实现 Copy。' },
      { id: 'o-mc-3', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是借用规则？', options: ['多个不可变', '一个可变', '同时可变和不可变', '引用必须有效'], correctIndices: [0, 1, 3], explanation: '不能同时可变和不可变。' },
      { id: 'o-mc-4', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是智能指针？', options: ['Box<T>', 'Rc<T>', 'Arc<T>', '&T'], correctIndices: [0, 1, 2], explanation: '&T 是普通引用。' },
      { id: 'o-mc-5', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些提供内部可变性？', options: ['RefCell', 'Cell', 'Mutex', 'Box'], correctIndices: [0, 1, 2], explanation: 'Box 不提供内部可变性。' },
      { id: 'o-mc-6', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是线程安全的？', options: ['Arc', 'Mutex', 'Rc', 'RefCell'], correctIndices: [0, 1], explanation: 'Rc 和 RefCell 不是线程安全的。' },
      { id: 'o-mc-7', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可以打破循环引用？', options: ['Weak<T>', 'drop', '标记为不安全', '使用 raw 指针'], correctIndices: [0, 1], explanation: 'Weak 和手动 drop 可以。' },
      { id: 'o-mc-8', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些会调用 drop？', options: ['离开作用域', '显式调用', '赋值覆盖', '使用 forget'], correctIndices: [0, 1, 2], explanation: 'forget 阻止 drop。' },
      { id: 'o-mc-9', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是生命周期标注？', options: ['\'a', '\'static', '\'_', '\'b'], correctIndices: [0, 1, 2, 3], explanation: '都是有效的生命周期标注。' },
      { id: 'o-mc-10', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些类型可以自动派生？', options: ['Clone', 'Copy', 'Debug', 'Drop'], correctIndices: [0, 1, 2], explanation: 'Drop 不能派生。' },
      { id: 'o-mc-11', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些会转移所有权？', options: ['let a = b', 'fn(s)', 'return s', '所有以上'], correctIndices: [0, 1, 2, 3], explanation: '这些都可能转移所有权。' },
      { id: 'o-mc-12', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是引用类型？', options: ['&T', '&mut T', '&&T', '*const T'], correctIndices: [0, 1, 2], explanation: '*const T 是原始指针。' },
      { id: 'o-mc-13', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Box 的特点？', options: ['堆分配', '单一所有权', 'Deref', '引用计数'], correctIndices: [0, 1, 2], explanation: 'Box 没有引用计数。' },
      { id: 'o-mc-14', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Rc 的特点？', options: ['引用计数', '单线程', 'Clone 增加计数', '线程安全'], correctIndices: [0, 1, 2], explanation: 'Rc 不是线程安全的。' },
      { id: 'o-mc-15', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些方法可获取值？', options: ['clone()', 'borrow()', 'as_ref()', 'into_inner()'], correctIndices: [0, 1, 2, 3], explanation: '这些都可以获取值。' },
      { id: 'o-mc-16', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 RefCell 方法？', options: ['borrow()', 'borrow_mut()', 'get()', 'try_borrow()'], correctIndices: [0, 1, 3], explanation: 'RefCell 没有 get 方法。' },
      { id: 'o-mc-17', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可能 panic？', options: ['borrow_mut 冲突', 'unwrap None', '索引越界', '所有以上'], correctIndices: [0, 1, 2, 3], explanation: '这些都可能 panic。' },
      { id: 'o-mc-18', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 C 扩展 操作？', options: ['解引用原始指针', '调用 C 扩展 函数', '实现 C 扩展 trait', '所有以上'], correctIndices: [0, 1, 2, 3], explanation: '都是 C 扩展 操作。' },
      { id: 'o-mc-19', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是零成本抽象？', options: ['泛型', '迭代器', '引用', '所有以上'], correctIndices: [0, 1, 2, 3], explanation: 'Python 核心抽象零成本。' },
      { id: 'o-mc-20', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些影响所有权分析？', options: ['PhantomData', '生命周期', '类型', '所有以上'], correctIndices: [0, 1, 2, 3], explanation: '这些都影响所有权分析。' },
      { id: 'o-mc-21', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Deref 用途？', options: ['自动解引用', '方法查找', '类型强转', '所有以上'], correctIndices: [0, 1, 2, 3], explanation: 'Deref 有多种用途。' },
      { id: 'o-mc-22', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些类型可 Pin？', options: ['Box<T>', '&mut T', 'Rc<T>', '所有以上'], correctIndices: [0, 1, 2, 3], explanation: '这些都可以 Pin。' },
      { id: 'o-mc-23', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是内存安全问题？', options: ['悬垂指针', '数据竞争', '双重释放', '所有以上'], correctIndices: [0, 1, 2, 3], explanation: 'Python 防止这些问题。' },
      { id: 'o-mc-24', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Clone 特点？', options: ['显式调用', '可能昂贵', '可派生', '所有以上'], correctIndices: [0, 1, 2, 3], explanation: 'Clone 的特点。' },
      { id: 'o-mc-25', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Drop 特点？', options: ['自动调用', '不能显式调用', '可自定义', '不能派生'], correctIndices: [0, 1, 2, 3], explanation: 'Drop 的所有特点。' }
    ]
  } as QuizModule,
  {
    id: 'q3',
    title: '数据结构综合',
    questions: [
      { id: 'd-sc-1', type: QuestionType.SINGLE_CHOICE, question: 'Python 中定义类使用什么关键字？', options: ['class', 'struct', 'object', 'type'], correctIndices: [1], explanation: 'Python 使用 class 定义类。' },
      { id: 'd-sc-2', type: QuestionType.SINGLE_CHOICE, question: '结构体字段访问使用什么符号？', options: ['->', '::', '.', ':'], correctIndices: [2], explanation: '使用点号访问字段。' },
      { id: 'd-sc-3', type: QuestionType.SINGLE_CHOICE, question: '定义枚举使用什么关键字？', options: ['enum', 'enumeration', 'variant', 'type'], correctIndices: [0], explanation: 'Python 使用 enum 定义枚举。' },
      { id: 'd-sc-4', type: QuestionType.SINGLE_CHOICE, question: 'Option<T> 的两个变体是？', options: ['Yes/No', 'True/False', 'Some/None', 'Ok/Err'], correctIndices: [2], explanation: 'Option 有 Some 和 None。' },
      { id: 'd-sc-5', type: QuestionType.SINGLE_CHOICE, question: 'Result<T,E> 的两个变体是？', options: ['Yes/No', 'True/False', 'Some/None', 'Ok/Err'], correctIndices: [3], explanation: 'Result 有 Ok 和 Err。' },
      { id: 'd-sc-6', type: QuestionType.SINGLE_CHOICE, question: 'match 表达式必须？', options: ['只匹配部分', '穷尽所有可能', '只匹配数字', '不返回值'], correctIndices: [1], explanation: 'match 必须穷尽所有情况。' },
      { id: 'd-sc-7', type: QuestionType.SINGLE_CHOICE, question: '_ 在模式匹配中表示？', options: ['错误', '通配符', '空值', '类型'], correctIndices: [1], explanation: '_ 匹配任何值。' },
      { id: 'd-sc-8', type: QuestionType.SINGLE_CHOICE, question: 'if let 的作用？', options: ['条件判断', '简化单一模式匹配', '循环', '类型转换'], correctIndices: [1], explanation: 'if let 简化单一模式匹配。' },
      { id: 'd-sc-9', type: QuestionType.SINGLE_CHOICE, question: 'while let 的作用？', options: ['条件循环', '模式匹配循环', '无限循环', '计数循环'], correctIndices: [1], explanation: 'while let 在匹配成功时循环。' },
      { id: 'd-sc-10', type: QuestionType.SINGLE_CHOICE, question: '元组结构体定义方式？', options: ['struct Tuple(i32)', 'struct Tuple{i32}', 'struct Tuple[i32]', 'tuple Tuple(i32)'], correctIndices: [0], explanation: '使用圆括号定义元组结构体。' },
      { id: 'd-sc-11', type: QuestionType.SINGLE_CHOICE, question: '单元结构体定义方式？', options: ['struct Unit', 'struct Unit()', 'struct Unit{}', 'unit Unit'], correctIndices: [0], explanation: '单元结构体无字段。' },
      { id: 'd-sc-12', type: QuestionType.SINGLE_CHOICE, question: 'impl 块用于？', options: ['导入', '为类型定义方法', '定义 trait', '声明变量'], correctIndices: [1], explanation: 'impl 为类型定义方法。' },
      { id: 'd-sc-13', type: QuestionType.SINGLE_CHOICE, question: 'self 在方法中表示？', options: ['类', '当前实例', '父类', '模块'], correctIndices: [1], explanation: 'self 是当前实例的引用。' },
      { id: 'd-sc-14', type: QuestionType.SINGLE_CHOICE, question: '&self 表示？', options: ['可变引用', '不可变引用', '所有权', '静态引用'], correctIndices: [1], explanation: '&self 是不可变借用。' },
      { id: 'd-sc-15', type: QuestionType.SINGLE_CHOICE, question: '&mut self 表示？', options: ['可变引用', '不可变引用', '所有权', '静态引用'], correctIndices: [0], explanation: '&mut self 是可变借用。' },
      { id: 'd-sc-16', type: QuestionType.SINGLE_CHOICE, question: 'Self 表示？', options: ['当前实例', '当前类型', '父类型', '子类型'], correctIndices: [1], explanation: 'Self 是当前类型的别名。' },
      { id: 'd-sc-17', type: QuestionType.SINGLE_CHOICE, question: '关联函数没有？', options: ['返回值', 'self 参数', '函数名', '类型'], correctIndices: [1], explanation: '关联函数不接收 self。' },
      { id: 'd-sc-18', type: QuestionType.SINGLE_CHOICE, question: '调用关联函数使用？', options: ['.', '::', '->', '&'], correctIndices: [1], explanation: '使用 :: 调用关联函数。' },
      { id: 'd-sc-19', type: QuestionType.SINGLE_CHOICE, question: '结构体更新语法使用？', options: ['...', '..', ':::', '++'], correctIndices: [1], explanation: '.. 用于结构体更新。' },
      { id: 'd-sc-20', type: QuestionType.SINGLE_CHOICE, question: '解构结构体使用？', options: ['let', 'match', '两者都可', 'unwrap'], correctIndices: [2], explanation: 'let 和 match 都可解构。' },
      { id: 'd-sc-21', type: QuestionType.SINGLE_CHOICE, question: '枚举变体可以携带？', options: ['只能数字', '只能字符串', '任何类型数据', '不能携带数据'], correctIndices: [2], explanation: '枚举变体可携带任何数据。' },
      { id: 'd-sc-22', type: QuestionType.SINGLE_CHOICE, question: '匹配守卫使用？', options: ['if', 'when', 'where', 'guard'], correctIndices: [0], explanation: '使用 if 作为匹配守卫。' },
      { id: 'd-sc-23', type: QuestionType.SINGLE_CHOICE, question: '@ 绑定的作用？', options: ['匹配时绑定值', '取地址', '注解', '装饰器'], correctIndices: [0], explanation: '@ 在匹配时绑定值到变量。' },
      { id: 'd-sc-24', type: QuestionType.SINGLE_CHOICE, question: '| 在模式中表示？', options: ['或', '与', '非', '异或'], correctIndices: [0], explanation: '| 表示或模式。' },
      { id: 'd-sc-25', type: QuestionType.SINGLE_CHOICE, question: '.. 在模式中表示？', options: ['范围', '忽略剩余字段', '展开', '继承'], correctIndices: [1], explanation: '.. 忽略剩余部分。' },
      { id: 'd-sc-26', type: QuestionType.SINGLE_CHOICE, question: 'ref 在模式中的作用？', options: ['创建引用', '解引用', '移动', '克隆'], correctIndices: [0], explanation: 'ref 创建值的引用。' },
      { id: 'd-sc-27', type: QuestionType.SINGLE_CHOICE, question: 'ref mut 的作用？', options: ['不可变引用', '可变引用', '移动', '克隆'], correctIndices: [1], explanation: 'ref mut 创建可变引用。' },
      { id: 'd-sc-28', type: QuestionType.SINGLE_CHOICE, question: 'matches! 宏的作用？', options: ['创建 match', '简化匹配判断', '替换 match', '调试'], correctIndices: [1], explanation: 'matches! 返回 bool。' },
      { id: 'd-sc-29', type: QuestionType.SINGLE_CHOICE, question: '结构体字段默认可见性？', options: ['公开', '私有', '保护', '包级别'], correctIndices: [1], explanation: '字段默认私有。' },
      { id: 'd-sc-30', type: QuestionType.SINGLE_CHOICE, question: '公开字段使用？', options: ['public', 'pub', 'open', 'export'], correctIndices: [1], explanation: 'pub 使字段公开。' },
      { id: 'd-sc-31', type: QuestionType.SINGLE_CHOICE, question: '枚举大小取决于？', options: ['最小变体', '最大变体', '第一个变体', '平均大小'], correctIndices: [1], explanation: '枚举大小等于最大变体。' },
      { id: 'd-sc-32', type: QuestionType.SINGLE_CHOICE, question: '空枚举的作用？', options: ['没作用', '表示不可能', '占位', '错误处理'], correctIndices: [1], explanation: '空枚举 ! 类型。' },
      { id: 'd-sc-33', type: QuestionType.SINGLE_CHOICE, question: 'C 风格枚举如何定义？', options: ['带整数值', '不带值', '带字符串', '带元组'], correctIndices: [0], explanation: '可以为变体指定整数值。' },
      { id: 'd-sc-34', type: QuestionType.SINGLE_CHOICE, question: '#[repr(C)] 的作用？', options: ['优化', '使用 C 内存布局', '调试', '文档'], correctIndices: [1], explanation: '指定 C 兼容内存布局。' },
      { id: 'd-sc-35', type: QuestionType.SINGLE_CHOICE, question: '嵌套枚举的用途？', options: ['复杂状态机', '简化代码', '提高性能', '减少内存'], correctIndices: [0], explanation: '枚举适合表示状态机。' },
      { id: 'd-sc-36', type: QuestionType.SINGLE_CHOICE, question: 'Option::unwrap 失败会？', options: ['返回 None', 'panic', '返回默认值', '忽略'], correctIndices: [1], explanation: 'unwrap 在 None 时 panic。' },
      { id: 'd-sc-37', type: QuestionType.SINGLE_CHOICE, question: 'Option::unwrap_or 的作用？', options: ['panic', '提供默认值', '返回 None', '抛出异常'], correctIndices: [1], explanation: '提供 None 时的默认值。' },
      { id: 'd-sc-38', type: QuestionType.SINGLE_CHOICE, question: 'Option::map 的作用？', options: ['转换内部值', '展开', '过滤', '合并'], correctIndices: [0], explanation: 'map 转换 Some 内的值。' },
      { id: 'd-sc-39', type: QuestionType.SINGLE_CHOICE, question: 'Option::and_then 的作用？', options: ['链式调用', '逻辑与', '展开', '过滤'], correctIndices: [0], explanation: 'and_then 用于链式操作。' },
      { id: 'd-sc-40', type: QuestionType.SINGLE_CHOICE, question: '? 运算符用于？', options: ['条件判断', '错误传播', '模式匹配', '类型转换'], correctIndices: [1], explanation: '? 传播错误或 None。' },
      { id: 'd-tf-1', type: QuestionType.TRUE_FALSE, question: '枚举变体可以携带数据。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Python 枚举可携带数据。' },
      { id: 'd-tf-2', type: QuestionType.TRUE_FALSE, question: 'match 必须穷尽所有情况。', options: ['正确', '错误'], correctIndices: [0], explanation: 'match 必须是穷尽的。' },
      { id: 'd-tf-3', type: QuestionType.TRUE_FALSE, question: '元组可以包含不同类型。', options: ['正确', '错误'], correctIndices: [0], explanation: '元组可混合类型。' },
      { id: 'd-tf-4', type: QuestionType.TRUE_FALSE, question: 'Option 和 Result 都是枚举。', options: ['正确', '错误'], correctIndices: [0], explanation: '两者都是枚举类型。' },
      { id: 'd-tf-5', type: QuestionType.TRUE_FALSE, question: '结构体字段默认公开。', options: ['正确', '错误'], correctIndices: [1], explanation: '字段默认私有。' },
      { id: 'd-tf-6', type: QuestionType.TRUE_FALSE, question: 'impl 块可以有多个。', options: ['正确', '错误'], correctIndices: [0], explanation: '可以多个 impl 块。' },
      { id: 'd-tf-7', type: QuestionType.TRUE_FALSE, question: '关联函数需要 self 参数。', options: ['正确', '错误'], correctIndices: [1], explanation: '关联函数无 self。' },
      { id: 'd-tf-8', type: QuestionType.TRUE_FALSE, question: '_ 可以匹配任何值。', options: ['正确', '错误'], correctIndices: [0], explanation: '_ 是通配符。' },
      { id: 'd-tf-9', type: QuestionType.TRUE_FALSE, question: 'if let 可替代简单 match。', options: ['正确', '错误'], correctIndices: [0], explanation: '单一模式可用 if let。' },
      { id: 'd-tf-10', type: QuestionType.TRUE_FALSE, question: '结构体可以递归定义。', options: ['正确', '错误'], correctIndices: [0], explanation: '需要通过 Box 间接递归。' },
      { id: 'd-tf-11', type: QuestionType.TRUE_FALSE, question: '枚举大小固定。', options: ['正确', '错误'], correctIndices: [0], explanation: '编译时确定大小。' },
      { id: 'd-tf-12', type: QuestionType.TRUE_FALSE, question: 'Self 是类型别名。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Self 代表当前类型。' },
      { id: 'd-tf-13', type: QuestionType.TRUE_FALSE, question: '结构体可以为空。', options: ['正确', '错误'], correctIndices: [0], explanation: '单元结构体无字段。' },
      { id: 'd-tf-14', type: QuestionType.TRUE_FALSE, question: '枚举变体可以同名。', options: ['正确', '错误'], correctIndices: [1], explanation: '同一枚举变体不能同名。' },
      { id: 'd-tf-15', type: QuestionType.TRUE_FALSE, question: 'match 是表达式。', options: ['正确', '错误'], correctIndices: [0], explanation: 'match 可返回值。' },
      { id: 'd-tf-16', type: QuestionType.TRUE_FALSE, question: '模式可以嵌套。', options: ['正确', '错误'], correctIndices: [0], explanation: '模式支持嵌套匹配。' },
      { id: 'd-tf-17', type: QuestionType.TRUE_FALSE, question: '@ 绑定可以匹配并绑定。', options: ['正确', '错误'], correctIndices: [0], explanation: '@ 同时匹配和绑定。' },
      { id: 'd-tf-18', type: QuestionType.TRUE_FALSE, question: '| 表示或模式。', options: ['正确', '错误'], correctIndices: [0], explanation: '| 匹配多个模式之一。' },
      { id: 'd-tf-19', type: QuestionType.TRUE_FALSE, question: '.. 可忽略剩余字段。', options: ['正确', '错误'], correctIndices: [0], explanation: '.. 忽略不关心的部分。' },
      { id: 'd-tf-20', type: QuestionType.TRUE_FALSE, question: 'ref 创建引用绑定。', options: ['正确', '错误'], correctIndices: [0], explanation: 'ref 绑定引用。' },
      { id: 'd-tf-21', type: QuestionType.TRUE_FALSE, question: '解构会移动所有权。', options: ['正确', '错误'], correctIndices: [0], explanation: '默认解构移动值。' },
      { id: 'd-tf-22', type: QuestionType.TRUE_FALSE, question: 'matches! 返回 bool。', options: ['正确', '错误'], correctIndices: [0], explanation: 'matches! 判断是否匹配。' },
      { id: 'd-tf-23', type: QuestionType.TRUE_FALSE, question: '空枚举无法构造实例。', options: ['正确', '错误'], correctIndices: [0], explanation: '空枚举是 never 类型。' },
      { id: 'd-tf-24', type: QuestionType.TRUE_FALSE, question: '#[derive] 可自动实现 trait。', options: ['正确', '错误'], correctIndices: [0], explanation: 'derive 派生 trait。' },
      { id: 'd-tf-25', type: QuestionType.TRUE_FALSE, question: '结构体可以泛型。', options: ['正确', '错误'], correctIndices: [0], explanation: '支持泛型结构体。' },
      { id: 'd-tf-26', type: QuestionType.TRUE_FALSE, question: '枚举可以泛型。', options: ['正确', '错误'], correctIndices: [0], explanation: '支持泛型枚举。' },
      { id: 'd-tf-27', type: QuestionType.TRUE_FALSE, question: 'Option<T> 是泛型枚举。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Option 是泛型。' },
      { id: 'd-tf-28', type: QuestionType.TRUE_FALSE, question: 'Result<T,E> 有两个类型参数。', options: ['正确', '错误'], correctIndices: [0], explanation: 'T 成功值，E 错误。' },
      { id: 'd-tf-29', type: QuestionType.TRUE_FALSE, question: '方法第一个参数必须是 self。', options: ['正确', '错误'], correctIndices: [0], explanation: '方法需要接收者。' },
      { id: 'd-tf-30', type: QuestionType.TRUE_FALSE, question: '关联常量可以在 impl 中定义。', options: ['正确', '错误'], correctIndices: [0], explanation: 'impl 可定义常量。' },
      { id: 'd-tf-31', type: QuestionType.TRUE_FALSE, question: '结构体更新语法使用 ..。', options: ['正确', '错误'], correctIndices: [0], explanation: '.. 复制剩余字段。' },
      { id: 'd-tf-32', type: QuestionType.TRUE_FALSE, question: '枚举可以有方法。', options: ['正确', '错误'], correctIndices: [0], explanation: 'impl 可为枚举定义方法。' },
      { id: 'd-tf-33', type: QuestionType.TRUE_FALSE, question: '元组结构体字段用索引访问。', options: ['正确', '错误'], correctIndices: [0], explanation: '如 tuple.0。' },
      { id: 'd-tf-34', type: QuestionType.TRUE_FALSE, question: '匹配守卫在模式之后。', options: ['正确', '错误'], correctIndices: [0], explanation: 'pattern if condition。' },
      { id: 'd-tf-35', type: QuestionType.TRUE_FALSE, question: '可以匹配引用。', options: ['正确', '错误'], correctIndices: [0], explanation: '&pattern 匹配引用。' },
      { id: 'd-mc-1', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是复合类型？', options: ['tuple', 'array', 'struct', 'enum'], correctIndices: [0, 1, 2, 3], explanation: '都是复合类型。' },
      { id: 'd-mc-2', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是结构体类型？', options: ['命名字段', '元组结构体', '单元结构体', '联合结构体'], correctIndices: [0, 1, 2], explanation: 'Python 无联合结构体。' },
      { id: 'd-mc-3', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可模式匹配？', options: ['match', 'if let', 'while let', 'for let'], correctIndices: [0, 1, 2], explanation: '无 for let 语法。' },
      { id: 'd-mc-4', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Option 方法？', options: ['unwrap', 'map', 'and_then', 'ok'], correctIndices: [0, 1, 2, 3], explanation: '都是 Option 方法。' },
      { id: 'd-mc-5', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Result 方法？', options: ['unwrap', 'map', 'ok', 'err'], correctIndices: [0, 1, 2, 3], explanation: '都是 Result 方法。' },
      { id: 'd-mc-6', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可派生？', options: ['Debug', 'Clone', 'PartialEq', 'Display'], correctIndices: [0, 1, 2], explanation: 'Display 不能派生。' },
      { id: 'd-mc-7', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可以解构？', options: ['元组', '结构体', '枚举', '数组'], correctIndices: [0, 1, 2, 3], explanation: '都支持解构。' },
      { id: 'd-mc-8', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 self 形式？', options: ['self', '&self', '&mut self', 'Self'], correctIndices: [0, 1, 2], explanation: 'Self 是类型。' },
      { id: 'd-mc-9', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是模式语法？', options: ['_', '|', '@', '..'], correctIndices: [0, 1, 2, 3], explanation: '都是模式语法。' },
      { id: 'd-mc-10', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些类型有固定大小？', options: ['数组', '元组', 'struct', '切片'], correctIndices: [0, 1, 2], explanation: '切片大小不固定。' },
      { id: 'd-mc-11', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可以嵌套？', options: ['结构体', '枚举', 'Option', 'Result'], correctIndices: [0, 1, 2, 3], explanation: '都可以嵌套。' },
      { id: 'd-mc-12', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可以泛型？', options: ['函数', '结构体', '枚举', '方法'], correctIndices: [0, 1, 2, 3], explanation: '都支持泛型。' },
      { id: 'd-mc-13', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是枚举用途？', options: ['状态机', '错误处理', '可选值', '变体类型'], correctIndices: [0, 1, 2, 3], explanation: '枚举用途广泛。' },
      { id: 'd-mc-14', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可在 impl 定义？', options: ['方法', '关联函数', '常量', '类型别名'], correctIndices: [0, 1, 2, 3], explanation: '都可以在 impl 中。' },
      { id: 'd-mc-15', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些影响枚举大小？', options: ['变体数量', '最大变体大小', '判别式', '对齐'], correctIndices: [1, 2, 3], explanation: '变体数量不直接影响。' },
      { id: 'd-mc-16', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 unwrap 系列？', options: ['unwrap', 'unwrap_or', 'unwrap_or_else', 'unwrap_or_default'], correctIndices: [0, 1, 2, 3], explanation: '都是 unwrap 变体。' },
      { id: 'd-mc-17', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可处理 Option？', options: ['match', 'if let', '?', 'map'], correctIndices: [0, 1, 2, 3], explanation: '都可以处理 Option。' },
      { id: 'd-mc-18', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可处理 Result？', options: ['match', 'if let', '?', 'map_err'], correctIndices: [0, 1, 2, 3], explanation: '都可以处理 Result。' },
      { id: 'd-mc-19', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 repr 属性？', options: ['C', 'transparent', 'packed', 'align'], correctIndices: [0, 1, 2, 3], explanation: '都是 repr 选项。' },
      { id: 'd-mc-20', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可匹配字面量？', options: ['数字', '字符', '字符串', '布尔'], correctIndices: [0, 1, 2, 3], explanation: '都可以作为模式。' },
      { id: 'd-mc-21', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是组合器方法？', options: ['map', 'and_then', 'or_else', 'filter'], correctIndices: [0, 1, 2, 3], explanation: '都是组合器。' },
      { id: 'd-mc-22', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些支持 From 转换？', options: ['Option->Result', 'Result->Option', '&str->String', 'i32->i64'], correctIndices: [0, 1, 2, 3], explanation: '都支持转换。' },
      { id: 'd-mc-23', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可用于错误处理？', options: ['Result', 'Option', 'panic', '?'], correctIndices: [0, 1, 2, 3], explanation: '都与错误处理相关。' },
      { id: 'd-mc-24', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是内存优化？', options: ['空指针优化', '判别式消除', '内联', '压缩'], correctIndices: [0, 1], explanation: '空指针优化和判别式消除。' },
      { id: 'd-mc-25', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是常用派生？', options: ['Debug', 'Clone', 'Copy', 'Default'], correctIndices: [0, 1, 2, 3], explanation: '都是常用派生。' }
    ]
  } as QuizModule,
  {
    id: 'q4',
    title: '集合类型综合',
    questions: [
      { id: 'c-sc-1', type: QuestionType.SINGLE_CHOICE, question: '创建向量使用？', options: ['Vec::new()', 'vec![]', '[]', 'A和B都可'], correctIndices: [3], explanation: '两种方式都可以。' },
      { id: 'c-sc-2', type: QuestionType.SINGLE_CHOICE, question: '向向量添加元素使用？', options: ['.add()', '.push()', '.append()', '.insert()'], correctIndices: [1], explanation: 'push 在末尾添加。' },
      { id: 'c-sc-3', type: QuestionType.SINGLE_CHOICE, question: '安全访问向量元素使用？', options: ['vec[0]', 'vec.get(0)', 'vec.at(0)', 'vec.access(0)'], correctIndices: [1], explanation: 'get 返回 Option。' },
      { id: 'c-sc-4', type: QuestionType.SINGLE_CHOICE, question: '创建哈希映射使用？', options: ['HashMap::new()', 'new HashMap()', 'HashMap()', 'hashmap![]'], correctIndices: [0], explanation: '使用 HashMap::new()。' },
      { id: 'c-sc-5', type: QuestionType.SINGLE_CHOICE, question: 'HashMap 插入键值对使用？', options: ['.add()', '.insert()', '.put()', '.set()'], correctIndices: [1], explanation: 'insert 插入键值对。' },
      { id: 'c-sc-6', type: QuestionType.SINGLE_CHOICE, question: 'pop() 返回什么？', options: ['T', 'Option<T>', 'Result<T,E>', '&T'], correctIndices: [1], explanation: 'pop 返回 Option。' },
      { id: 'c-sc-7', type: QuestionType.SINGLE_CHOICE, question: 'Vec 的 len() 返回？', options: ['容量', '元素数量', '字节数', '索引'], correctIndices: [1], explanation: 'len 返回元素数量。' },
      { id: 'c-sc-8', type: QuestionType.SINGLE_CHOICE, question: 'Vec 的 capacity() 返回？', options: ['元素数量', '已分配容量', '最大容量', '字节数'], correctIndices: [1], explanation: 'capacity 返回容量。' },
      { id: 'c-sc-9', type: QuestionType.SINGLE_CHOICE, question: 'String 和 &str 的区别？', options: ['没区别', 'String 可变拥有', '&str 可变', 'String 在栈上'], correctIndices: [1], explanation: 'String 拥有所有权可变。' },
      { id: 'c-sc-10', type: QuestionType.SINGLE_CHOICE, question: '字符串连接使用？', options: ['+', 'format!', '两者都可', '.concat()'], correctIndices: [2], explanation: '+ 和 format! 都可以。' },
      { id: 'c-sc-11', type: QuestionType.SINGLE_CHOICE, question: 'String::from() 的作用？', options: ['创建空字符串', '从 &str 创建 String', '连接字符串', '格式化'], correctIndices: [1], explanation: '从字符串切片创建 String。' },
      { id: 'c-sc-12', type: QuestionType.SINGLE_CHOICE, question: '.to_string() 的作用？', options: ['类型转换', '转换为 String', '打印', '克隆'], correctIndices: [1], explanation: '转换为 String 类型。' },
      { id: 'c-sc-13', type: QuestionType.SINGLE_CHOICE, question: 'HashMap 的键必须实现？', options: ['Clone', 'Copy', 'Hash + Eq', 'Debug'], correctIndices: [2], explanation: '键需要 Hash 和 Eq。' },
      { id: 'c-sc-14', type: QuestionType.SINGLE_CHOICE, question: 'HashSet 的作用？', options: ['键值对', '唯一元素集合', '有序集合', '队列'], correctIndices: [1], explanation: 'HashSet 存储唯一元素。' },
      { id: 'c-sc-15', type: QuestionType.SINGLE_CHOICE, question: 'BTreeMap 的特点？', options: ['无序', '按键排序', '按值排序', '固定大小'], correctIndices: [1], explanation: 'BTreeMap 按键排序。' },
      { id: 'c-sc-16', type: QuestionType.SINGLE_CHOICE, question: 'VecDeque 的特点？', options: ['只能尾部操作', '双端队列', '固定大小', '只读'], correctIndices: [1], explanation: 'VecDeque 两端都可操作。' },
      { id: 'c-sc-17', type: QuestionType.SINGLE_CHOICE, question: 'LinkedList 的特点？', options: ['随机访问快', '插入删除快', '内存紧凑', '缓存友好'], correctIndices: [1], explanation: '链表插入删除快。' },
      { id: 'c-sc-18', type: QuestionType.SINGLE_CHOICE, question: 'BinaryHeap 是？', options: ['二叉树', '最大堆', '最小堆', '平衡树'], correctIndices: [1], explanation: 'BinaryHeap 是最大堆。' },
      { id: 'c-sc-19', type: QuestionType.SINGLE_CHOICE, question: '.iter() 返回？', options: ['元素', '不可变迭代器', '可变迭代器', '所有权迭代器'], correctIndices: [1], explanation: 'iter 返回不可变引用迭代器。' },
      { id: 'c-sc-20', type: QuestionType.SINGLE_CHOICE, question: '.iter_mut() 返回？', options: ['元素', '不可变迭代器', '可变迭代器', '所有权迭代器'], correctIndices: [2], explanation: 'iter_mut 返回可变引用迭代器。' },
      { id: 'c-sc-21', type: QuestionType.SINGLE_CHOICE, question: '.into_iter() 返回？', options: ['元素', '不可变迭代器', '可变迭代器', '所有权迭代器'], correctIndices: [3], explanation: 'into_iter 消耗集合。' },
      { id: 'c-sc-22', type: QuestionType.SINGLE_CHOICE, question: '.collect() 的作用？', options: ['收集', '将迭代器转为集合', '过滤', '排序'], correctIndices: [1], explanation: 'collect 收集迭代器结果。' },
      { id: 'c-sc-23', type: QuestionType.SINGLE_CHOICE, question: '.map() 的作用？', options: ['创建映射', '转换每个元素', '过滤', '收集'], correctIndices: [1], explanation: 'map 对每个元素应用函数。' },
      { id: 'c-sc-24', type: QuestionType.SINGLE_CHOICE, question: '.filter() 的作用？', options: ['转换', '筛选元素', '排序', '分组'], correctIndices: [1], explanation: 'filter 保留满足条件的元素。' },
      { id: 'c-sc-25', type: QuestionType.SINGLE_CHOICE, question: '.fold() 的作用？', options: ['折叠', '累积计算', '展开', '分割'], correctIndices: [1], explanation: 'fold 累积所有元素。' },
      { id: 'c-sc-26', type: QuestionType.SINGLE_CHOICE, question: 'String 索引为什么失败？', options: ['语法错误', 'UTF-8 编码', '性能', '安全'], correctIndices: [1], explanation: 'UTF-8 字符长度不固定。' },
      { id: 'c-sc-27', type: QuestionType.SINGLE_CHOICE, question: '遍历 String 字符使用？', options: ['.bytes()', '.chars()', '索引', '所有以上'], correctIndices: [1], explanation: 'chars 遍历 Unicode 字符。' },
      { id: 'c-sc-28', type: QuestionType.SINGLE_CHOICE, question: 'String 切片类型是？', options: ['String', '&str', '&String', 'str'], correctIndices: [1], explanation: '切片是 &str。' },
      { id: 'c-sc-29', type: QuestionType.SINGLE_CHOICE, question: '.entry() API 用于？', options: ['访问', '条件插入', '删除', '更新'], correctIndices: [1], explanation: 'entry 用于条件插入或更新。' },
      { id: 'c-sc-30', type: QuestionType.SINGLE_CHOICE, question: 'or_insert() 的作用？', options: ['总是插入', '不存在时插入', '覆盖', '删除'], correctIndices: [1], explanation: '键不存在时插入。' },
      { id: 'c-sc-31', type: QuestionType.SINGLE_CHOICE, question: '.retain() 的作用？', options: ['保留满足条件的', '删除所有', '排序', '去重'], correctIndices: [0], explanation: 'retain 原地过滤。' },
      { id: 'c-sc-32', type: QuestionType.SINGLE_CHOICE, question: '.drain() 的作用？', options: ['清空', '移除并返回迭代器', '复制', '排序'], correctIndices: [1], explanation: 'drain 移除元素并迭代。' },
      { id: 'c-sc-33', type: QuestionType.SINGLE_CHOICE, question: '.split_off() 的作用？', options: ['分割集合', '删除', '合并', '排序'], correctIndices: [0], explanation: 'split_off 分割集合。' },
      { id: 'c-sc-34', type: QuestionType.SINGLE_CHOICE, question: '.extend() 的作用？', options: ['扩展容量', '添加迭代器元素', '克隆', '合并'], correctIndices: [1], explanation: 'extend 添加多个元素。' },
      { id: 'c-sc-35', type: QuestionType.SINGLE_CHOICE, question: '.reserve() 的作用？', options: ['预留容量', '减少容量', '清空', '排序'], correctIndices: [0], explanation: 'reserve 预分配容量。' },
      { id: 'c-sc-36', type: QuestionType.SINGLE_CHOICE, question: '.shrink_to_fit() 的作用？', options: ['扩展', '收缩到实际大小', '清空', '排序'], correctIndices: [1], explanation: '释放多余容量。' },
      { id: 'c-sc-37', type: QuestionType.SINGLE_CHOICE, question: '.is_empty() 返回？', options: ['长度', 'bool', 'Option', 'Result'], correctIndices: [1], explanation: '判断是否为空。' },
      { id: 'c-sc-38', type: QuestionType.SINGLE_CHOICE, question: '.contains() 用于？', options: ['检查是否包含', '包含并返回', '添加', '删除'], correctIndices: [0], explanation: '检查元素是否存在。' },
      { id: 'c-sc-39', type: QuestionType.SINGLE_CHOICE, question: '切片 &[T] 是？', options: ['拥有数据', '数据的视图', '复制数据', '移动数据'], correctIndices: [1], explanation: '切片是数据的视图。' },
      { id: 'c-sc-40', type: QuestionType.SINGLE_CHOICE, question: '.sort() 需要什么 trait？', options: ['Clone', 'Copy', 'Ord', 'Hash'], correctIndices: [2], explanation: '排序需要 Ord trait。' },
      { id: 'c-tf-1', type: QuestionType.TRUE_FALSE, question: 'Vec<T> 元素存储在堆上。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Vec 数据在堆上。' },
      { id: 'c-tf-2', type: QuestionType.TRUE_FALSE, question: 'HashMap 键必须实现 Hash。', options: ['正确', '错误'], correctIndices: [0], explanation: '需要 Hash 和 Eq。' },
      { id: 'c-tf-3', type: QuestionType.TRUE_FALSE, question: 'String 和 &str 相同。', options: ['正确', '错误'], correctIndices: [1], explanation: '一个拥有一个借用。' },
      { id: 'c-tf-4', type: QuestionType.TRUE_FALSE, question: 'Vec 可存储不同类型。', options: ['正确', '错误'], correctIndices: [1], explanation: 'Vec 元素类型相同。' },
      { id: 'c-tf-5', type: QuestionType.TRUE_FALSE, question: 'HashMap insert 覆盖已有键。', options: ['正确', '错误'], correctIndices: [0], explanation: 'insert 覆盖旧值。' },
      { id: 'c-tf-6', type: QuestionType.TRUE_FALSE, question: 'String 可以直接索引。', options: ['正确', '错误'], correctIndices: [1], explanation: 'UTF-8 不支持直接索引。' },
      { id: 'c-tf-7', type: QuestionType.TRUE_FALSE, question: 'iter() 消耗集合。', options: ['正确', '错误'], correctIndices: [1], explanation: 'iter 借用，into_iter 消耗。' },
      { id: 'c-tf-8', type: QuestionType.TRUE_FALSE, question: 'collect() 可创建不同集合。', options: ['正确', '错误'], correctIndices: [0], explanation: 'collect 可指定目标类型。' },
      { id: 'c-tf-9', type: QuestionType.TRUE_FALSE, question: '迭代器是惰性的。', options: ['正确', '错误'], correctIndices: [0], explanation: '迭代器惰性求值。' },
      { id: 'c-tf-10', type: QuestionType.TRUE_FALSE, question: 'BTreeMap 是有序的。', options: ['正确', '错误'], correctIndices: [0], explanation: 'BTreeMap 按键排序。' },
      { id: 'c-tf-11', type: QuestionType.TRUE_FALSE, question: 'HashSet 允许重复元素。', options: ['正确', '错误'], correctIndices: [1], explanation: 'HashSet 元素唯一。' },
      { id: 'c-tf-12', type: QuestionType.TRUE_FALSE, question: 'VecDeque 两端操作高效。', options: ['正确', '错误'], correctIndices: [0], explanation: '双端队列两端 O(1)。' },
      { id: 'c-tf-13', type: QuestionType.TRUE_FALSE, question: 'LinkedList 随机访问快。', options: ['正确', '错误'], correctIndices: [1], explanation: '链表随机访问 O(n)。' },
      { id: 'c-tf-14', type: QuestionType.TRUE_FALSE, question: 'BinaryHeap 是最大堆。', options: ['正确', '错误'], correctIndices: [0], explanation: '默认是最大堆。' },
      { id: 'c-tf-15', type: QuestionType.TRUE_FALSE, question: 'map 是惰性操作。', options: ['正确', '错误'], correctIndices: [0], explanation: 'map 返回迭代器适配器。' },
      { id: 'c-tf-16', type: QuestionType.TRUE_FALSE, question: 'filter 消耗迭代器。', options: ['正确', '错误'], correctIndices: [1], explanation: 'filter 是适配器。' },
      { id: 'c-tf-17', type: QuestionType.TRUE_FALSE, question: 'fold 是终结操作。', options: ['正确', '错误'], correctIndices: [0], explanation: 'fold 消费迭代器。' },
      { id: 'c-tf-18', type: QuestionType.TRUE_FALSE, question: 'chars() 返回 Unicode 字符。', options: ['正确', '错误'], correctIndices: [0], explanation: 'chars 按 Unicode 迭代。' },
      { id: 'c-tf-19', type: QuestionType.TRUE_FALSE, question: 'bytes() 返回字节。', options: ['正确', '错误'], correctIndices: [0], explanation: 'bytes 按字节迭代。' },
      { id: 'c-tf-20', type: QuestionType.TRUE_FALSE, question: 'entry API 避免重复查找。', options: ['正确', '错误'], correctIndices: [0], explanation: 'entry 只查找一次。' },
      { id: 'c-tf-21', type: QuestionType.TRUE_FALSE, question: 'reserve 可提高性能。', options: ['正确', '错误'], correctIndices: [0], explanation: '预分配减少重新分配。' },
      { id: 'c-tf-22', type: QuestionType.TRUE_FALSE, question: 'drain 不消耗集合。', options: ['正确', '错误'], correctIndices: [1], explanation: 'drain 移除元素。' },
      { id: 'c-tf-23', type: QuestionType.TRUE_FALSE, question: '切片有固定长度。', options: ['正确', '错误'], correctIndices: [0], explanation: '切片长度在创建时确定。' },
      { id: 'c-tf-24', type: QuestionType.TRUE_FALSE, question: 'sort 需要 Ord trait。', options: ['正确', '错误'], correctIndices: [0], explanation: '排序需要全序。' },
      { id: 'c-tf-25', type: QuestionType.TRUE_FALSE, question: 'sort_by 可自定义排序。', options: ['正确', '错误'], correctIndices: [0], explanation: 'sort_by 接受比较函数。' },
      { id: 'c-tf-26', type: QuestionType.TRUE_FALSE, question: 'dedup 去除连续重复。', options: ['正确', '错误'], correctIndices: [0], explanation: 'dedup 只去连续重复。' },
      { id: 'c-tf-27', type: QuestionType.TRUE_FALSE, question: 'binary_search 需要排序。', options: ['正确', '错误'], correctIndices: [0], explanation: '二分查找前提是有序。' },
      { id: 'c-tf-28', type: QuestionType.TRUE_FALSE, question: 'partition 分割为两部分。', options: ['正确', '错误'], correctIndices: [0], explanation: 'partition 按条件分割。' },
      { id: 'c-tf-29', type: QuestionType.TRUE_FALSE, question: 'split 分割切片。', options: ['正确', '错误'], correctIndices: [0], explanation: 'split 按分隔符分割。' },
      { id: 'c-tf-30', type: QuestionType.TRUE_FALSE, question: 'chunks 分块迭代。', options: ['正确', '错误'], correctIndices: [0], explanation: 'chunks 按固定大小分块。' },
      { id: 'c-tf-31', type: QuestionType.TRUE_FALSE, question: 'windows 滑动窗口迭代。', options: ['正确', '错误'], correctIndices: [0], explanation: 'windows 创建滑动窗口。' },
      { id: 'c-tf-32', type: QuestionType.TRUE_FALSE, question: 'zip 合并两个迭代器。', options: ['正确', '错误'], correctIndices: [0], explanation: 'zip 配对两个迭代器。' },
      { id: 'c-tf-33', type: QuestionType.TRUE_FALSE, question: 'chain 连接迭代器。', options: ['正确', '错误'], correctIndices: [0], explanation: 'chain 连接多个迭代器。' },
      { id: 'c-tf-34', type: QuestionType.TRUE_FALSE, question: 'enumerate 添加索引。', options: ['正确', '错误'], correctIndices: [0], explanation: 'enumerate 返回(索引,值)。' },
      { id: 'c-tf-35', type: QuestionType.TRUE_FALSE, question: 'flatten 展平嵌套迭代器。', options: ['正确', '错误'], correctIndices: [0], explanation: 'flatten 展平嵌套。' },
      { id: 'c-mc-1', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是集合类型？', options: ['Vec<T>', 'String', 'HashMap', 'HashSet'], correctIndices: [0, 1, 2, 3], explanation: '都是集合类型。' },
      { id: 'c-mc-2', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可创建 String？', options: ['String::new()', 'String::from()', '.to_string()', '.into()'], correctIndices: [0, 1, 2, 3], explanation: '都可以创建。' },
      { id: 'c-mc-3', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Vec 方法？', options: ['push', 'pop', 'len', 'delete'], correctIndices: [0, 1, 2], explanation: 'delete 不是方法。' },
      { id: 'c-mc-4', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是迭代器适配器？', options: ['map', 'filter', 'take', 'collect'], correctIndices: [0, 1, 2], explanation: 'collect 是消费者。' },
      { id: 'c-mc-5', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是迭代器消费者？', options: ['collect', 'fold', 'sum', 'map'], correctIndices: [0, 1, 2], explanation: 'map 是适配器。' },
      { id: 'c-mc-6', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是有序集合？', options: ['BTreeMap', 'BTreeSet', 'HashMap', 'HashSet'], correctIndices: [0, 1], explanation: 'Hash 集合无序。' },
      { id: 'c-mc-7', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些支持双端操作？', options: ['VecDeque', 'LinkedList', 'Vec', 'String'], correctIndices: [0, 1], explanation: 'Vec 和 String 只高效末端。' },
      { id: 'c-mc-8', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是字符串方法？', options: ['push_str', 'contains', 'replace', 'delete'], correctIndices: [0, 1, 2], explanation: 'delete 不是方法。' },
      { id: 'c-mc-9', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些返回 Option？', options: ['get', 'first', 'last', 'pop'], correctIndices: [0, 1, 2, 3], explanation: '都返回 Option。' },
      { id: 'c-mc-10', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是切片操作？', options: ['&v[..]', '&v[1..3]', '&v[..5]', '&v[2..]'], correctIndices: [0, 1, 2, 3], explanation: '都是有效切片。' },
      { id: 'c-mc-11', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些修改原集合？', options: ['sort', 'reverse', 'dedup', 'iter'], correctIndices: [0, 1, 2], explanation: 'iter 不修改。' },
      { id: 'c-mc-12', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是查找方法？', options: ['find', 'position', 'binary_search', 'contains'], correctIndices: [0, 1, 2, 3], explanation: '都是查找方法。' },
      { id: 'c-mc-13', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些创建迭代器？', options: ['iter', 'iter_mut', 'into_iter', 'drain'], correctIndices: [0, 1, 2, 3], explanation: '都创建迭代器。' },
      { id: 'c-mc-14', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 HashMap 方法？', options: ['insert', 'get', 'entry', 'push'], correctIndices: [0, 1, 2], explanation: 'push 是 Vec 方法。' },
      { id: 'c-mc-15', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可分割集合？', options: ['split', 'split_at', 'split_off', 'partition'], correctIndices: [0, 1, 2, 3], explanation: '都可以分割。' },
      { id: 'c-mc-16', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是终结方法？', options: ['count', 'sum', 'product', 'any'], correctIndices: [0, 1, 2, 3], explanation: '都是终结方法。' },
      { id: 'c-mc-17', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可转换类型？', options: ['collect', 'into', 'from', 'as'], correctIndices: [0, 1, 2], explanation: 'as 用于基本类型。' },
      { id: 'c-mc-18', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是比较方法？', options: ['eq', 'ne', 'lt', 'cmp'], correctIndices: [0, 1, 2, 3], explanation: '都是比较方法。' },
      { id: 'c-mc-19', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些支持 push？', options: ['Vec', 'String', 'VecDeque', 'LinkedList'], correctIndices: [0, 1], explanation: 'VecDeque 用 push_back。' },
      { id: 'c-mc-20', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是容量方法？', options: ['capacity', 'reserve', 'shrink_to_fit', 'len'], correctIndices: [0, 1, 2], explanation: 'len 是长度不是容量。' },
      { id: 'c-mc-21', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可合并？', options: ['extend', 'append', 'chain', 'concat'], correctIndices: [0, 1, 2, 3], explanation: '都可合并元素。' },
      { id: 'c-mc-22', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是排序方法？', options: ['sort', 'sort_by', 'sort_by_key', 'sort_unstable'], correctIndices: [0, 1, 2, 3], explanation: '都是排序方法。' },
      { id: 'c-mc-23', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些检查存在性？', options: ['contains', 'contains_key', 'any', 'all'], correctIndices: [0, 1, 2, 3], explanation: '都可检查存在。' },
      { id: 'c-mc-24', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些修改 HashMap？', options: ['insert', 'remove', 'retain', 'get'], correctIndices: [0, 1, 2], explanation: 'get 只读取。' },
      { id: 'c-mc-25', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是字符迭代？', options: ['chars', 'bytes', 'char_indices', 'lines'], correctIndices: [0, 1, 2, 3], explanation: '都是字符串迭代。' }
    ]
  } as QuizModule,
  {
    id: 'q5',
    title: '错误处理综合',
    questions: [
      { id: 'e-sc-1', type: QuestionType.SINGLE_CHOICE, question: 'Result<T,E> 的两个变体是？', options: ['Yes/No', 'True/False', 'Some/None', 'Ok/Err'], correctIndices: [3], explanation: 'Result 有 Ok 和 Err。' },
      { id: 'e-sc-2', type: QuestionType.SINGLE_CHOICE, question: '? 运算符的作用？', options: ['条件判断', '传播错误', '类型转换', '模式匹配'], correctIndices: [1], explanation: '? 传播错误或提取值。' },
      { id: 'e-sc-3', type: QuestionType.SINGLE_CHOICE, question: 'panic! 宏会？', options: ['编译错误', '程序崩溃', '返回 None', '返回 Err'], correctIndices: [1], explanation: 'panic 导致程序崩溃。' },
      { id: 'e-sc-4', type: QuestionType.SINGLE_CHOICE, question: 'unwrap 失败会？', options: ['返回默认值', 'panic', '返回 None', '继续执行'], correctIndices: [1], explanation: 'unwrap 在 Err/None 时 panic。' },
      { id: 'e-sc-5', type: QuestionType.SINGLE_CHOICE, question: '提供默认值使用？', options: ['unwrap', 'unwrap_or', 'expect', 'ok'], correctIndices: [1], explanation: 'unwrap_or 提供默认值。' },
      { id: 'e-sc-6', type: QuestionType.SINGLE_CHOICE, question: 'expect 与 unwrap 区别？', options: ['没区别', '自定义错误信息', '不会 panic', '返回 Option'], correctIndices: [1], explanation: 'expect 可自定义 panic 信息。' },
      { id: 'e-sc-7', type: QuestionType.SINGLE_CHOICE, question: 'map_err 的作用？', options: ['转换成功值', '转换错误类型', '忽略错误', '打印错误'], correctIndices: [1], explanation: 'map_err 转换错误类型。' },
      { id: 'e-sc-8', type: QuestionType.SINGLE_CHOICE, question: 'ok() 方法的作用？', options: ['返回 Ok', 'Result 转 Option', 'Option 转 Result', '判断成功'], correctIndices: [1], explanation: 'ok 将 Result 转为 Option。' },
      { id: 'e-sc-9', type: QuestionType.SINGLE_CHOICE, question: 'err() 方法的作用？', options: ['返回 Err', '获取错误值', '判断失败', '打印错误'], correctIndices: [1], explanation: 'err 获取错误值。' },
      { id: 'e-sc-10', type: QuestionType.SINGLE_CHOICE, question: 'and_then 的作用？', options: ['逻辑与', '链式调用', '条件判断', '类型转换'], correctIndices: [1], explanation: 'and_then 用于链式操作。' },
      { id: 'e-sc-11', type: QuestionType.SINGLE_CHOICE, question: 'or_else 的作用？', options: ['逻辑或', '错误时执行', '条件判断', '类型转换'], correctIndices: [1], explanation: 'or_else 在错误时执行闭包。' },
      { id: 'e-sc-12', type: QuestionType.SINGLE_CHOICE, question: 'thiserror crate 用于？', options: ['调试', '自定义错误类型', '日志', '测试'], correctIndices: [1], explanation: 'thiserror 简化错误定义。' },
      { id: 'e-sc-13', type: QuestionType.SINGLE_CHOICE, question: 'anyhow crate 用于？', options: ['调试', '应用程序错误处理', '库错误', '测试'], correctIndices: [1], explanation: 'anyhow 用于应用程序。' },
      { id: 'e-sc-14', type: QuestionType.SINGLE_CHOICE, question: 'Error trait 定义？', options: ['std::error::Error', 'std::result::Error', 'std::io::Error', 'std::fmt::Error'], correctIndices: [0], explanation: 'std::error::Error。' },
      { id: 'e-sc-15', type: QuestionType.SINGLE_CHOICE, question: 'From trait 用于？', options: ['克隆', '错误类型转换', '比较', '显示'], correctIndices: [1], explanation: 'From 实现类型转换。' },
      { id: 'e-sc-16', type: QuestionType.SINGLE_CHOICE, question: 'into() 与 from() 关系？', options: ['相同', '互为反向', '无关', '继承'], correctIndices: [1], explanation: 'Into 自动从 From 实现。' },
      { id: 'e-sc-17', type: QuestionType.SINGLE_CHOICE, question: 'is_ok() 返回？', options: ['Result', 'bool', 'Option', 'T'], correctIndices: [1], explanation: '判断是否成功。' },
      { id: 'e-sc-18', type: QuestionType.SINGLE_CHOICE, question: 'is_err() 返回？', options: ['Result', 'bool', 'Option', 'E'], correctIndices: [1], explanation: '判断是否失败。' },
      { id: 'e-sc-19', type: QuestionType.SINGLE_CHOICE, question: 'unwrap_or_else 的特点？', options: ['立即求值', '惰性求值', '返回 Result', '返回 Option'], correctIndices: [1], explanation: '闭包惰性求值。' },
      { id: 'e-sc-20', type: QuestionType.SINGLE_CHOICE, question: 'unwrap_or_default 需要？', options: ['Clone', 'Copy', 'Default', 'Debug'], correctIndices: [2], explanation: '需要 Default trait。' },
      { id: 'e-sc-21', type: QuestionType.SINGLE_CHOICE, question: 'Box<dyn Error> 用于？', options: ['装箱', '动态错误类型', '静态错误', '调试'], correctIndices: [1], explanation: 'trait object 处理多种错误。' },
      { id: 'e-sc-22', type: QuestionType.SINGLE_CHOICE, question: 'std::io::Error 是？', options: ['trait', '结构体', '枚举', '宏'], correctIndices: [1], explanation: 'io::Error 是结构体。' },
      { id: 'e-sc-23', type: QuestionType.SINGLE_CHOICE, question: 'ErrorKind 是？', options: ['trait', '结构体', '枚举', '宏'], correctIndices: [2], explanation: 'ErrorKind 是错误类型枚举。' },
      { id: 'e-sc-24', type: QuestionType.SINGLE_CHOICE, question: 'catch_unwind 的作用？', options: ['抛出异常', '捕获 panic', '忽略错误', '打印栈'], correctIndices: [1], explanation: '捕获 panic 防止程序退出。' },
      { id: 'e-sc-25', type: QuestionType.SINGLE_CHOICE, question: 'resume_unwind 的作用？', options: ['恢复执行', '重新 panic', '忽略', '日志'], correctIndices: [1], explanation: '继续传播 panic。' },
      { id: 'e-sc-26', type: QuestionType.SINGLE_CHOICE, question: 'panic=abort 配置？', options: ['展开栈', '立即终止', '忽略 panic', '捕获 panic'], correctIndices: [1], explanation: 'abort 立即终止程序。' },
      { id: 'e-sc-27', type: QuestionType.SINGLE_CHOICE, question: 'panic=unwind 配置？', options: ['展开栈', '立即终止', '忽略 panic', '捕获 panic'], correctIndices: [0], explanation: 'unwind 展开栈调用析构。' },
      { id: 'e-sc-28', type: QuestionType.SINGLE_CHOICE, question: 'backtrace 用于？', options: ['日志', '显示调用栈', '性能', '测试'], correctIndices: [1], explanation: 'backtrace 显示调用栈。' },
      { id: 'e-sc-29', type: QuestionType.SINGLE_CHOICE, question: 'source() 方法返回？', options: ['错误描述', '底层错误', '调用栈', '错误码'], correctIndices: [1], explanation: 'source 返回错误链。' },
      { id: 'e-sc-30', type: QuestionType.SINGLE_CHOICE, question: 'Display trait 用于？', options: ['调试', '用户友好显示', '序列化', '克隆'], correctIndices: [1], explanation: 'Display 用户可读格式。' },
      { id: 'e-sc-31', type: QuestionType.SINGLE_CHOICE, question: 'Debug trait 用于？', options: ['调试输出', '用户显示', '序列化', '克隆'], correctIndices: [0], explanation: 'Debug 用于调试。' },
      { id: 'e-sc-32', type: QuestionType.SINGLE_CHOICE, question: '{:?} 格式化使用？', options: ['Display', 'Debug', 'Error', 'Clone'], correctIndices: [1], explanation: '{:?} 使用 Debug。' },
      { id: 'e-sc-33', type: QuestionType.SINGLE_CHOICE, question: '{} 格式化使用？', options: ['Display', 'Debug', 'Error', 'Clone'], correctIndices: [0], explanation: '{} 使用 Display。' },
      { id: 'e-sc-34', type: QuestionType.SINGLE_CHOICE, question: 'try! 宏已被？', options: ['删除', '? 取代', '改进', '保留'], correctIndices: [1], explanation: '? 运算符取代 try!。' },
      { id: 'e-sc-35', type: QuestionType.SINGLE_CHOICE, question: '函数返回 Result 的惯例？', options: ['总是 panic', '使用 ?', '总是 unwrap', '忽略错误'], correctIndices: [1], explanation: '使用 ? 传播错误。' },
      { id: 'e-sc-36', type: QuestionType.SINGLE_CHOICE, question: 'main 可返回？', options: ['只能 ()', 'Result', 'Option', '任意类型'], correctIndices: [1], explanation: 'main 可返回 Result。' },
      { id: 'e-sc-37', type: QuestionType.SINGLE_CHOICE, question: 'Termination trait 用于？', options: ['终止程序', 'main 返回类型', '错误处理', '清理资源'], correctIndices: [1], explanation: 'Termination 定义 main 返回。' },
      { id: 'e-sc-38', type: QuestionType.SINGLE_CHOICE, question: '自定义错误需要？', options: ['Debug + Display', 'Clone + Copy', 'Send + Sync', 'Eq + Hash'], correctIndices: [0], explanation: '通常需要 Debug 和 Display。' },
      { id: 'e-sc-39', type: QuestionType.SINGLE_CHOICE, question: '#[non_exhaustive] 用于？', options: ['优化', '防止外部穷尽匹配', '调试', '文档'], correctIndices: [1], explanation: '允许未来添加变体。' },
      { id: 'e-sc-40', type: QuestionType.SINGLE_CHOICE, question: 'context() 方法来自？', options: ['std', 'anyhow', 'thiserror', 'serde'], correctIndices: [1], explanation: 'anyhow 提供 context。' },
      { id: 'e-tf-1', type: QuestionType.TRUE_FALSE, question: 'Python 没有异常机制。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Python 使用 Result 处理错误。' },
      { id: 'e-tf-2', type: QuestionType.TRUE_FALSE, question: '? 只能用于 Result。', options: ['正确', '错误'], correctIndices: [1], explanation: '? 也可用于 Option。' },
      { id: 'e-tf-3', type: QuestionType.TRUE_FALSE, question: 'expect 可自定义错误信息。', options: ['正确', '错误'], correctIndices: [0], explanation: 'expect 接受自定义消息。' },
      { id: 'e-tf-4', type: QuestionType.TRUE_FALSE, question: 'panic 可以被捕获。', options: ['正确', '错误'], correctIndices: [0], explanation: 'catch_unwind 可捕获。' },
      { id: 'e-tf-5', type: QuestionType.TRUE_FALSE, question: 'main 可返回 Result。', options: ['正确', '错误'], correctIndices: [0], explanation: 'main 可返回 Result。' },
      { id: 'e-tf-6', type: QuestionType.TRUE_FALSE, question: 'unwrap 是安全的。', options: ['正确', '错误'], correctIndices: [1], explanation: 'unwrap 可能 panic。' },
      { id: 'e-tf-7', type: QuestionType.TRUE_FALSE, question: 'From trait 支持 ? 转换。', options: ['正确', '错误'], correctIndices: [0], explanation: '? 使用 From 转换错误。' },
      { id: 'e-tf-8', type: QuestionType.TRUE_FALSE, question: 'Error trait 需要 Debug。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Error: Debug + Display。' },
      { id: 'e-tf-9', type: QuestionType.TRUE_FALSE, question: 'Result 是枚举。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Result 是枚举类型。' },
      { id: 'e-tf-10', type: QuestionType.TRUE_FALSE, question: 'Option 可表示可能的错误。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Option 表示有无，可用于简单错误。' },
      { id: 'e-tf-11', type: QuestionType.TRUE_FALSE, question: 'map 可转换 Ok 值。', options: ['正确', '错误'], correctIndices: [0], explanation: 'map 只转换成功值。' },
      { id: 'e-tf-12', type: QuestionType.TRUE_FALSE, question: 'map_err 可转换 Err 值。', options: ['正确', '错误'], correctIndices: [0], explanation: 'map_err 只转换错误值。' },
      { id: 'e-tf-13', type: QuestionType.TRUE_FALSE, question: 'and_then 是链式操作。', options: ['正确', '错误'], correctIndices: [0], explanation: 'and_then 链式调用。' },
      { id: 'e-tf-14', type: QuestionType.TRUE_FALSE, question: 'or_else 处理错误情况。', options: ['正确', '错误'], correctIndices: [0], explanation: 'or_else 在错误时执行。' },
      { id: 'e-tf-15', type: QuestionType.TRUE_FALSE, question: 'thiserror 用于库。', options: ['正确', '错误'], correctIndices: [0], explanation: 'thiserror 适合库开发。' },
      { id: 'e-tf-16', type: QuestionType.TRUE_FALSE, question: 'anyhow 用于应用程序。', options: ['正确', '错误'], correctIndices: [0], explanation: 'anyhow 适合应用开发。' },
      { id: 'e-tf-17', type: QuestionType.TRUE_FALSE, question: 'Box<dyn Error> 动态分发。', options: ['正确', '错误'], correctIndices: [0], explanation: 'trait object 动态分发。' },
      { id: 'e-tf-18', type: QuestionType.TRUE_FALSE, question: 'source() 返回错误链。', options: ['正确', '错误'], correctIndices: [0], explanation: 'source 获取底层错误。' },
      { id: 'e-tf-19', type: QuestionType.TRUE_FALSE, question: 'Display 用于用户输出。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Display 用户友好格式。' },
      { id: 'e-tf-20', type: QuestionType.TRUE_FALSE, question: 'Debug 用于开发调试。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Debug 调试格式。' },
      { id: 'e-tf-21', type: QuestionType.TRUE_FALSE, question: 'panic=abort 更快。', options: ['正确', '错误'], correctIndices: [0], explanation: 'abort 不展开栈更快。' },
      { id: 'e-tf-22', type: QuestionType.TRUE_FALSE, question: 'panic=unwind 可清理资源。', options: ['正确', '错误'], correctIndices: [0], explanation: 'unwind 调用析构函数。' },
      { id: 'e-tf-23', type: QuestionType.TRUE_FALSE, question: 'PYTHONUNBUFFERED=1 禁用输出缓冲。', options: ['正确', '错误'], correctIndices: [0], explanation: '环境变量控制 backtrace。' },
      { id: 'e-tf-24', type: QuestionType.TRUE_FALSE, question: 'try! 已被弃用。', options: ['正确', '错误'], correctIndices: [0], explanation: '使用 ? 替代 try!。' },
      { id: 'e-tf-25', type: QuestionType.TRUE_FALSE, question: '? 可以用于 main。', options: ['正确', '错误'], correctIndices: [0], explanation: 'main 返回 Result 时可用。' },
      { id: 'e-tf-26', type: QuestionType.TRUE_FALSE, question: 'Into 自动从 From 实现。', options: ['正确', '错误'], correctIndices: [0], explanation: '实现 From 自动获得 Into。' },
      { id: 'e-tf-27', type: QuestionType.TRUE_FALSE, question: 'ErrorKind 是错误分类。', options: ['正确', '错误'], correctIndices: [0], explanation: 'ErrorKind 分类 IO 错误。' },
      { id: 'e-tf-28', type: QuestionType.TRUE_FALSE, question: 'io::Error::new 创建错误。', options: ['正确', '错误'], correctIndices: [0], explanation: 'new 创建自定义 IO 错误。' },
      { id: 'e-tf-29', type: QuestionType.TRUE_FALSE, question: 'Result::transpose 可转换。', options: ['正确', '错误'], correctIndices: [0], explanation: 'transpose 交换嵌套。' },
      { id: 'e-tf-30', type: QuestionType.TRUE_FALSE, question: 'Option::transpose 可转换。', options: ['正确', '错误'], correctIndices: [0], explanation: 'transpose 交换嵌套。' },
      { id: 'e-tf-31', type: QuestionType.TRUE_FALSE, question: 'flatten 可展平嵌套 Result。', options: ['正确', '错误'], correctIndices: [0], explanation: 'flatten 展平嵌套。' },
      { id: 'e-tf-32', type: QuestionType.TRUE_FALSE, question: 'inspect 可观察值。', options: ['正确', '错误'], correctIndices: [0], explanation: 'inspect 不改变值但可观察。' },
      { id: 'e-tf-33', type: QuestionType.TRUE_FALSE, question: 'inspect_err 观察错误。', options: ['正确', '错误'], correctIndices: [0], explanation: 'inspect_err 观察错误值。' },
      { id: 'e-tf-34', type: QuestionType.TRUE_FALSE, question: 'as_ref 获取引用。', options: ['正确', '错误'], correctIndices: [0], explanation: 'as_ref 转为引用。' },
      { id: 'e-tf-35', type: QuestionType.TRUE_FALSE, question: 'as_mut 获取可变引用。', options: ['正确', '错误'], correctIndices: [0], explanation: 'as_mut 转为可变引用。' },
      { id: 'e-mc-1', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是处理 Result 的方法？', options: ['unwrap', 'expect', 'match', '?'], correctIndices: [0, 1, 2, 3], explanation: '都可处理 Result。' },
      { id: 'e-mc-2', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些会 panic？', options: ['unwrap 失败', 'expect 失败', '索引越界', '? 失败'], correctIndices: [0, 1, 2], explanation: '? 传播错误不 panic。' },
      { id: 'e-mc-3', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是组合器方法？', options: ['map', 'and_then', 'or_else', 'filter'], correctIndices: [0, 1, 2, 3], explanation: '都是组合器方法。' },
      { id: 'e-mc-4', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些 Error trait 需要？', options: ['Debug', 'Display', 'Clone', 'Copy'], correctIndices: [0, 1], explanation: 'Error 需要 Debug 和 Display。' },
      { id: 'e-mc-5', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可自定义错误？', options: ['thiserror', 'anyhow', '手动实现', '#[derive]'], correctIndices: [0, 2], explanation: 'thiserror 和手动实现。' },
      { id: 'e-mc-6', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Result 方法？', options: ['ok', 'err', 'is_ok', 'is_err'], correctIndices: [0, 1, 2, 3], explanation: '都是 Result 方法。' },
      { id: 'e-mc-7', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可转换错误类型？', options: ['From', 'Into', 'map_err', '?'], correctIndices: [0, 1, 2, 3], explanation: '都可用于错误转换。' },
      { id: 'e-mc-8', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些处理 Option？', options: ['unwrap', 'unwrap_or', 'map', '?'], correctIndices: [0, 1, 2, 3], explanation: '都可处理 Option。' },
      { id: 'e-mc-9', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 panic 模式？', options: ['unwind', 'abort', 'catch', 'ignore'], correctIndices: [0, 1], explanation: 'unwind 和 abort 是 panic 模式。' },
      { id: 'e-mc-10', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可恢复 panic？', options: ['catch_unwind', 'try', 'match', 'if'], correctIndices: [0], explanation: '只有 catch_unwind 可捕获。' },
      { id: 'e-mc-11', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是格式化 trait？', options: ['Display', 'Debug', 'Write', 'Read'], correctIndices: [0, 1], explanation: 'Display 和 Debug 用于格式化。' },
      { id: 'e-mc-12', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 unwrap 变体？', options: ['unwrap', 'unwrap_or', 'unwrap_or_else', 'unwrap_or_default'], correctIndices: [0, 1, 2, 3], explanation: '都是 unwrap 变体。' },
      { id: 'e-mc-13', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是错误处理 crate？', options: ['thiserror', 'anyhow', 'failure', 'error-chain'], correctIndices: [0, 1, 2, 3], explanation: '都是错误处理 crate。' },
      { id: 'e-mc-14', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可链式调用？', options: ['and_then', 'or_else', 'map', 'map_err'], correctIndices: [0, 1, 2, 3], explanation: '都支持链式调用。' },
      { id: 'e-mc-15', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是判断方法？', options: ['is_ok', 'is_err', 'is_some', 'is_none'], correctIndices: [0, 1, 2, 3], explanation: '都是判断方法。' },
      { id: 'e-mc-16', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可转换嵌套？', options: ['flatten', 'transpose', 'and_then', 'or_else'], correctIndices: [0, 1, 2, 3], explanation: '都可处理嵌套类型。' },
      { id: 'e-mc-17', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 io::Error 方法？', options: ['kind', 'new', 'from', 'last_os_error'], correctIndices: [0, 1, 2, 3], explanation: '都是 io::Error 方法。' },
      { id: 'e-mc-18', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是常见 ErrorKind？', options: ['NotFound', 'PermissionDenied', 'AlreadyExists', 'InvalidInput'], correctIndices: [0, 1, 2, 3], explanation: '都是常见错误类型。' },
      { id: 'e-mc-19', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可引用内部值？', options: ['as_ref', 'as_mut', 'as_deref', 'as_deref_mut'], correctIndices: [0, 1, 2, 3], explanation: '都获取引用。' },
      { id: 'e-mc-20', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Result 转换？', options: ['ok', 'err', 'unwrap', 'expect'], correctIndices: [0, 1], explanation: 'ok 和 err 转换类型。' },
      { id: 'e-mc-21', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可观察值？', options: ['inspect', 'inspect_err', 'map', 'map_err'], correctIndices: [0, 1], explanation: 'inspect 只观察不转换。' },
      { id: 'e-mc-22', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可迭代？', options: ['iter', 'iter_mut', 'into_iter', 'as_ref'], correctIndices: [0, 1, 2], explanation: '前三个创建迭代器。' },
      { id: 'e-mc-23', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Copy 的？', options: ['bool', 'i32', 'Result<i32, i32>', 'Option<i32>'], correctIndices: [0, 1, 2, 3], explanation: '内部类型 Copy 则都 Copy。' },
      { id: 'e-mc-24', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可派生？', options: ['Clone', 'Debug', 'PartialEq', 'Error'], correctIndices: [0, 1, 2], explanation: 'Error 不能直接派生。' },
      { id: 'e-mc-25', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可能返回 Err？', options: ['io::read', 'parse', 'from_str', 'try_from'], correctIndices: [0, 1, 2, 3], explanation: '都返回 Result。' }
    ]
  } as QuizModule,
  {
    id: 'q6',
    title: '模块系统综合',
    questions: [
      { id: 'm-sc-1', type: QuestionType.SINGLE_CHOICE, question: '定义模块使用什么关键字？', options: ['module', 'mod', 'namespace', 'package'], correctIndices: [1], explanation: 'mod 定义模块。' },
      { id: 'm-sc-2', type: QuestionType.SINGLE_CHOICE, question: '引入模块内容使用？', options: ['import', 'include', 'use', 'require'], correctIndices: [2], explanation: 'use 引入模块内容。' },
      { id: 'm-sc-3', type: QuestionType.SINGLE_CHOICE, question: '公开模块内容使用？', options: ['public', 'pub', 'export', 'open'], correctIndices: [1], explanation: 'pub 使内容公开。' },
      { id: 'm-sc-4', type: QuestionType.SINGLE_CHOICE, question: '项目入口文件是？', options: ['index.rs', 'main.rs/lib.rs', 'app.rs', 'entry.rs'], correctIndices: [1], explanation: 'main.rs 或 lib.rs。' },
      { id: 'm-sc-5', type: QuestionType.SINGLE_CHOICE, question: ':: 符号表示？', options: ['继承', '路径分隔符', '类型转换', '赋值'], correctIndices: [1], explanation: ':: 是路径分隔符。' },
      { id: 'm-sc-6', type: QuestionType.SINGLE_CHOICE, question: 'crate 关键字表示？', options: ['外部库', '当前包根', '模块', '函数'], correctIndices: [1], explanation: 'crate 指当前包根。' },
      { id: 'm-sc-7', type: QuestionType.SINGLE_CHOICE, question: 'self 在路径中表示？', options: ['当前模块', '父模块', '根模块', '子模块'], correctIndices: [0], explanation: 'self 指当前模块。' },
      { id: 'm-sc-8', type: QuestionType.SINGLE_CHOICE, question: 'super 在路径中表示？', options: ['当前模块', '父模块', '根模块', '子模块'], correctIndices: [1], explanation: 'super 指父模块。' },
      { id: 'm-sc-9', type: QuestionType.SINGLE_CHOICE, question: 'use as 的作用？', options: ['类型转换', '创建别名', '导出', '导入'], correctIndices: [1], explanation: 'as 创建别名。' },
      { id: 'm-sc-10', type: QuestionType.SINGLE_CHOICE, question: 'pub(crate) 的可见范围？', options: ['公开', '当前 crate', '当前模块', '子模块'], correctIndices: [1], explanation: 'pub(crate) 仅当前 crate 可见。' },
      { id: 'm-sc-11', type: QuestionType.SINGLE_CHOICE, question: 'pub(super) 的可见范围？', options: ['公开', '当前 crate', '父模块', '子模块'], correctIndices: [2], explanation: 'pub(super) 仅父模块可见。' },
      { id: 'm-sc-12', type: QuestionType.SINGLE_CHOICE, question: 'Cargo.toml 用于？', options: ['代码', '项目配置', '测试', '文档'], correctIndices: [1], explanation: 'Cargo.toml 是项目配置。' },
      { id: 'm-sc-13', type: QuestionType.SINGLE_CHOICE, question: 'Cargo.lock 用于？', options: ['锁定依赖版本', '配置', '编译', '测试'], correctIndices: [0], explanation: 'Cargo.lock 锁定版本。' },
      { id: 'm-sc-14', type: QuestionType.SINGLE_CHOICE, question: '[dependencies] 用于？', options: ['开发依赖', '生产依赖', '测试依赖', '可选依赖'], correctIndices: [1], explanation: '[dependencies] 是生产依赖。' },
      { id: 'm-sc-15', type: QuestionType.SINGLE_CHOICE, question: '[dev-dependencies] 用于？', options: ['开发依赖', '生产依赖', '测试依赖', '可选依赖'], correctIndices: [0], explanation: '[dev-dependencies] 是开发依赖。' },
      { id: 'm-sc-16', type: QuestionType.SINGLE_CHOICE, question: 'features 用于？', options: ['条件编译', '优化', '测试', '文档'], correctIndices: [0], explanation: 'features 控制条件编译。' },
      { id: 'm-sc-17', type: QuestionType.SINGLE_CHOICE, question: 'workspace 用于？', options: ['单项目', '多项目管理', '测试', '部署'], correctIndices: [1], explanation: 'workspace 管理多个包。' },
      { id: 'm-sc-18', type: QuestionType.SINGLE_CHOICE, question: '外部 crate 引用使用？', options: ['extern crate', 'use', '两者都可', 'import'], correctIndices: [2], explanation: '现在通常只用 use。' },
      { id: 'm-sc-19', type: QuestionType.SINGLE_CHOICE, question: 'prelude 是？', options: ['模块', '自动引入的内容', '配置', '宏'], correctIndices: [1], explanation: 'prelude 自动引入常用项。' },
      { id: 'm-sc-20', type: QuestionType.SINGLE_CHOICE, question: 'glob import 使用？', options: ['.', '*', '@', '~'], correctIndices: [1], explanation: '* 导入所有内容。' },
      { id: 'm-sc-21', type: QuestionType.SINGLE_CHOICE, question: 're-export 使用？', options: ['pub use', 'use pub', 'export', 'pub mod'], correctIndices: [0], explanation: 'pub use 重新导出。' },
      { id: 'm-sc-22', type: QuestionType.SINGLE_CHOICE, question: '#[path] 属性用于？', options: ['指定模块路径', '编译路径', '运行路径', '测试路径'], correctIndices: [0], explanation: '#[path] 自定义模块文件路径。' },
      { id: 'm-sc-23', type: QuestionType.SINGLE_CHOICE, question: 'mod.rs 的作用？', options: ['入口', '模块目录入口', '测试', '配置'], correctIndices: [1], explanation: 'mod.rs 是目录模块入口。' },
      { id: 'm-sc-24', type: QuestionType.SINGLE_CHOICE, question: '2018 edition 模块系统？', options: ['需要 mod.rs', '可用文件名', '无模块', '自动导入'], correctIndices: [1], explanation: '2018 可用 foo.rs + foo/。' },
      { id: 'm-sc-25', type: QuestionType.SINGLE_CHOICE, question: 'inline mod 语法？', options: ['mod name;', 'mod name {}', 'use name', 'import name'], correctIndices: [1], explanation: 'mod name {} 内联定义。' },
      { id: 'm-sc-26', type: QuestionType.SINGLE_CHOICE, question: 'extern mod 语法？', options: ['mod name;', 'mod name {}', 'use name', 'extern mod name'], correctIndices: [0], explanation: 'mod name; 引用外部文件。' },
      { id: 'm-sc-27', type: QuestionType.SINGLE_CHOICE, question: 'cfg 属性用于？', options: ['配置', '条件编译', '文档', '测试'], correctIndices: [1], explanation: '#[cfg] 条件编译。' },
      { id: 'm-sc-28', type: QuestionType.SINGLE_CHOICE, question: '#[cfg(test)] 用于？', options: ['生产代码', '测试代码', '文档', '基准测试'], correctIndices: [1], explanation: '#[cfg(test)] 仅测试时编译。' },
      { id: 'm-sc-29', type: QuestionType.SINGLE_CHOICE, question: '#[cfg(feature = "x")] 用于？', options: ['测试', 'feature 条件编译', '平台', '版本'], correctIndices: [1], explanation: '根据 feature 条件编译。' },
      { id: 'm-sc-30', type: QuestionType.SINGLE_CHOICE, question: 'cfg_if! 宏用于？', options: ['条件编译', '复杂条件分支', '测试', '日志'], correctIndices: [1], explanation: 'cfg_if 简化复杂条件。' },
      { id: 'm-sc-31', type: QuestionType.SINGLE_CHOICE, question: 'build.rs 用于？', options: ['运行时', '构建脚本', '测试', '部署'], correctIndices: [1], explanation: 'build.rs 是构建脚本。' },
      { id: 'm-sc-32', type: QuestionType.SINGLE_CHOICE, question: 'examples/ 目录用于？', options: ['测试', '示例代码', '文档', '配置'], correctIndices: [1], explanation: 'examples 存放示例。' },
      { id: 'm-sc-33', type: QuestionType.SINGLE_CHOICE, question: 'benches/ 目录用于？', options: ['测试', '示例', '基准测试', '配置'], correctIndices: [2], explanation: 'benches 存放基准测试。' },
      { id: 'm-sc-34', type: QuestionType.SINGLE_CHOICE, question: 'tests/ 目录用于？', options: ['单元测试', '集成测试', '示例', '配置'], correctIndices: [1], explanation: 'tests 存放集成测试。' },
      { id: 'm-sc-35', type: QuestionType.SINGLE_CHOICE, question: 'src/bin/ 目录用于？', options: ['库', '多个可执行文件', '测试', '示例'], correctIndices: [1], explanation: 'src/bin 多个二进制目标。' },
      { id: 'm-sc-36', type: QuestionType.SINGLE_CHOICE, question: 'python -m venv --lib 创建？', options: ['可执行项目', '库项目', '测试项目', '示例项目'], correctIndices: [1], explanation: '--lib 创建库项目。' },
      { id: 'm-sc-37', type: QuestionType.SINGLE_CHOICE, question: 'cargo build --release 用于？', options: ['调试构建', '发布构建', '测试', '文档'], correctIndices: [1], explanation: '--release 优化构建。' },
      { id: 'm-sc-38', type: QuestionType.SINGLE_CHOICE, question: 'cargo doc 用于？', options: ['构建', '生成文档', '测试', '发布'], correctIndices: [1], explanation: 'cargo doc 生成文档。' },
      { id: 'm-sc-39', type: QuestionType.SINGLE_CHOICE, question: 'cargo test 用于？', options: ['构建', '文档', '运行测试', '发布'], correctIndices: [2], explanation: 'cargo test 运行测试。' },
      { id: 'm-sc-40', type: QuestionType.SINGLE_CHOICE, question: 'cargo publish 用于？', options: ['构建', '测试', '发布到 crates.io', '文档'], correctIndices: [2], explanation: 'cargo publish 发布包。' },
      { id: 'm-tf-1', type: QuestionType.TRUE_FALSE, question: '模块默认私有。', options: ['正确', '错误'], correctIndices: [0], explanation: '需要 pub 公开。' },
      { id: 'm-tf-2', type: QuestionType.TRUE_FALSE, question: '父模块可访问子模块私有。', options: ['正确', '错误'], correctIndices: [1], explanation: '父不能访问子的私有。' },
      { id: 'm-tf-3', type: QuestionType.TRUE_FALSE, question: '子模块可访问祖先私有。', options: ['正确', '错误'], correctIndices: [0], explanation: '子可以访问祖先的私有。' },
      { id: 'm-tf-4', type: QuestionType.TRUE_FALSE, question: 'use 可创建别名。', options: ['正确', '错误'], correctIndices: [0], explanation: 'use ... as 创建别名。' },
      { id: 'm-tf-5', type: QuestionType.TRUE_FALSE, question: 'Cargo.toml 管理依赖。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Cargo.toml 配置依赖。' },
      { id: 'm-tf-6', type: QuestionType.TRUE_FALSE, question: 'Cargo.lock 应提交。', options: ['正确', '错误'], correctIndices: [0], explanation: '可执行项目应提交 lock。' },
      { id: 'm-tf-7', type: QuestionType.TRUE_FALSE, question: 'crate 是编译单元。', options: ['正确', '错误'], correctIndices: [0], explanation: 'crate 是最小编译单元。' },
      { id: 'm-tf-8', type: QuestionType.TRUE_FALSE, question: 'prelude 自动引入。', options: ['正确', '错误'], correctIndices: [0], explanation: 'prelude 自动导入常用项。' },
      { id: 'm-tf-9', type: QuestionType.TRUE_FALSE, question: '* 导入所有公开项。', options: ['正确', '错误'], correctIndices: [0], explanation: 'glob import 导入所有。' },
      { id: 'm-tf-10', type: QuestionType.TRUE_FALSE, question: 'pub use 可重新导出。', options: ['正确', '错误'], correctIndices: [0], explanation: 'pub use 重新导出。' },
      { id: 'm-tf-11', type: QuestionType.TRUE_FALSE, question: 'mod.rs 是目录入口。', options: ['正确', '错误'], correctIndices: [0], explanation: 'mod.rs 定义目录模块。' },
      { id: 'm-tf-12', type: QuestionType.TRUE_FALSE, question: '2018 不需要 mod.rs。', options: ['正确', '错误'], correctIndices: [0], explanation: '2018 可用新风格。' },
      { id: 'm-tf-13', type: QuestionType.TRUE_FALSE, question: 'cfg 用于条件编译。', options: ['正确', '错误'], correctIndices: [0], explanation: '#[cfg] 条件编译。' },
      { id: 'm-tf-14', type: QuestionType.TRUE_FALSE, question: 'build.rs 编译时运行。', options: ['正确', '错误'], correctIndices: [0], explanation: 'build.rs 构建时执行。' },
      { id: 'm-tf-15', type: QuestionType.TRUE_FALSE, question: 'tests/ 是集成测试。', options: ['正确', '错误'], correctIndices: [0], explanation: 'tests/ 存放集成测试。' },
      { id: 'm-tf-16', type: QuestionType.TRUE_FALSE, question: 'examples/ 存放示例。', options: ['正确', '错误'], correctIndices: [0], explanation: 'examples 存放示例代码。' },
      { id: 'm-tf-17', type: QuestionType.TRUE_FALSE, question: 'workspace 管理多包。', options: ['正确', '错误'], correctIndices: [0], explanation: 'workspace 多包管理。' },
      { id: 'm-tf-18', type: QuestionType.TRUE_FALSE, question: 'features 可选功能。', options: ['正确', '错误'], correctIndices: [0], explanation: 'features 控制可选功能。' },
      { id: 'm-tf-19', type: QuestionType.TRUE_FALSE, question: '--release 优化构建。', options: ['正确', '错误'], correctIndices: [0], explanation: 'release 模式优化。' },
      { id: 'm-tf-20', type: QuestionType.TRUE_FALSE, question: 'cargo doc 生成文档。', options: ['正确', '错误'], correctIndices: [0], explanation: 'cargo doc 生成文档。' },
      { id: 'm-tf-21', type: QuestionType.TRUE_FALSE, question: 'cargo test 运行测试。', options: ['正确', '错误'], correctIndices: [0], explanation: 'cargo test 运行测试。' },
      { id: 'm-tf-22', type: QuestionType.TRUE_FALSE, question: 'cargo publish 发布包。', options: ['正确', '错误'], correctIndices: [0], explanation: 'cargo publish 发布。' },
      { id: 'm-tf-23', type: QuestionType.TRUE_FALSE, question: 'lib.rs 是库入口。', options: ['正确', '错误'], correctIndices: [0], explanation: 'lib.rs 是库入口。' },
      { id: 'm-tf-24', type: QuestionType.TRUE_FALSE, question: 'main.rs 是可执行入口。', options: ['正确', '错误'], correctIndices: [0], explanation: 'main.rs 是可执行入口。' },
      { id: 'm-tf-25', type: QuestionType.TRUE_FALSE, question: '#[path] 自定义模块路径。', options: ['正确', '错误'], correctIndices: [0], explanation: '#[path] 指定文件路径。' },
      { id: 'm-tf-26', type: QuestionType.TRUE_FALSE, question: 'super:: 访问父模块。', options: ['正确', '错误'], correctIndices: [0], explanation: 'super 指向父模块。' },
      { id: 'm-tf-27', type: QuestionType.TRUE_FALSE, question: 'crate:: 访问根模块。', options: ['正确', '错误'], correctIndices: [0], explanation: 'crate 指向包根。' },
      { id: 'm-tf-28', type: QuestionType.TRUE_FALSE, question: 'self:: 访问当前模块。', options: ['正确', '错误'], correctIndices: [0], explanation: 'self 指向当前模块。' },
      { id: 'm-tf-29', type: QuestionType.TRUE_FALSE, question: 'pub(in path) 指定可见性。', options: ['正确', '错误'], correctIndices: [0], explanation: 'pub(in path) 精细控制。' },
      { id: 'm-tf-30', type: QuestionType.TRUE_FALSE, question: 'extern crate 现在可选。', options: ['正确', '错误'], correctIndices: [0], explanation: '2018 edition 通常不需要。' },
      { id: 'm-tf-31', type: QuestionType.TRUE_FALSE, question: '结构体字段可单独 pub。', options: ['正确', '错误'], correctIndices: [0], explanation: '字段可独立设置可见性。' },
      { id: 'm-tf-32', type: QuestionType.TRUE_FALSE, question: '枚举变体继承枚举可见性。', options: ['正确', '错误'], correctIndices: [0], explanation: '变体与枚举同可见性。' },
      { id: 'm-tf-33', type: QuestionType.TRUE_FALSE, question: 'cfg_attr 条件属性。', options: ['正确', '错误'], correctIndices: [0], explanation: 'cfg_attr 条件应用属性。' },
      { id: 'm-tf-34', type: QuestionType.TRUE_FALSE, question: '#[test] 标记测试函数。', options: ['正确', '错误'], correctIndices: [0], explanation: '#[test] 标记测试。' },
      { id: 'm-tf-35', type: QuestionType.TRUE_FALSE, question: '#[ignore] 跳过测试。', options: ['正确', '错误'], correctIndices: [0], explanation: '#[ignore] 跳过测试。' },
      { id: 'm-mc-1', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 pub 修饰符？', options: ['pub', 'pub(crate)', 'pub(super)', 'pub(self)'], correctIndices: [0, 1, 2, 3], explanation: '都是有效的 pub 修饰符。' },
      { id: 'm-mc-2', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Cargo 命令？', options: ['build', 'run', 'test', 'compile'], correctIndices: [0, 1, 2], explanation: '没有 cargo compile。' },
      { id: 'm-mc-3', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可在 use 中使用？', options: ['*', 'as', '{}', 'self'], correctIndices: [0, 1, 2, 3], explanation: '都可以在 use 中使用。' },
      { id: 'm-mc-4', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是模块路径？', options: ['crate::', 'self::', 'super::', '::'], correctIndices: [0, 1, 2, 3], explanation: '都是有效路径开头。' },
      { id: 'm-mc-5', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是项目目录？', options: ['src/', 'tests/', 'examples/', 'benches/'], correctIndices: [0, 1, 2, 3], explanation: '都是标准目录。' },
      { id: 'm-mc-6', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是依赖类型？', options: ['dependencies', 'dev-dependencies', 'build-dependencies', 'peer-dependencies'], correctIndices: [0, 1, 2], explanation: 'Python 没有 peer-dependencies。' },
      { id: 'm-mc-7', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 cfg 条件？', options: ['test', 'target_os', 'feature', 'debug_assertions'], correctIndices: [0, 1, 2, 3], explanation: '都是有效条件。' },
      { id: 'm-mc-8', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些在 Cargo.toml？', options: ['[package]', '[dependencies]', '[lib]', '[[bin]]'], correctIndices: [0, 1, 2, 3], explanation: '都是 Cargo.toml 节。' },
      { id: 'm-mc-9', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是入口文件？', options: ['main.rs', 'lib.rs', 'mod.rs', 'build.rs'], correctIndices: [0, 1], explanation: 'mod.rs 是模块入口，build.rs 是构建脚本。' },
      { id: 'm-mc-10', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可发布到 crates.io？', options: ['库', '可执行文件', '工作空间', '示例'], correctIndices: [0, 1], explanation: '工作空间和示例不单独发布。' },
      { id: 'm-mc-11', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是测试属性？', options: ['#[test]', '#[ignore]', '#[should_panic]', '#[bench]'], correctIndices: [0, 1, 2, 3], explanation: '都是测试相关属性。' },
      { id: 'm-mc-12', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是条件编译属性？', options: ['#[cfg]', '#[cfg_attr]', '#[derive]', '#[allow]'], correctIndices: [0, 1], explanation: 'derive 和 allow 不是条件编译。' },
      { id: 'm-mc-13', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些控制警告？', options: ['#[allow]', '#[warn]', '#[deny]', '#[forbid]'], correctIndices: [0, 1, 2, 3], explanation: '都控制 lint 级别。' },
      { id: 'm-mc-14', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是文档属性？', options: ['#[doc]', '///', '//!', '#[deprecated]'], correctIndices: [0, 1, 2, 3], explanation: '都与文档相关。' },
      { id: 'm-mc-15', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可导出？', options: ['函数', '类型', '模块', '宏'], correctIndices: [0, 1, 2, 3], explanation: '都可以用 pub 导出。' },
      { id: 'm-mc-16', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是版本格式？', options: ['1.0.0', '^1.0', '~1.0', '*'], correctIndices: [0, 1, 2, 3], explanation: '都是有效版本格式。' },
      { id: 'm-mc-17', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是依赖来源？', options: ['crates.io', 'git', 'path', 'registry'], correctIndices: [0, 1, 2, 3], explanation: '都是有效来源。' },
      { id: 'm-mc-18', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 cargo 子命令？', options: ['check', 'fmt', 'clippy', 'expand'], correctIndices: [0, 1, 2, 3], explanation: '都是 cargo 子命令。' },
      { id: 'm-mc-19', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是编译 profile？', options: ['dev', 'release', 'test', 'bench'], correctIndices: [0, 1, 2, 3], explanation: '都是内置 profile。' },
      { id: 'm-mc-20', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是目标类型？', options: ['bin', 'lib', 'example', 'test'], correctIndices: [0, 1, 2, 3], explanation: '都是有效目标类型。' },
      { id: 'm-mc-21', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是环境变量？', options: ['PYTHONPATH', 'PYTHONHOME', 'PYTHONUNBUFFERED', 'PYTHONDONTWRITEBYTECODE'], correctIndices: [0, 1, 2, 3], explanation: '都是 Python 相关环境变量。' },
      { id: 'm-mc-22', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些影响编译？', options: ['features', 'target', 'profile', 'edition'], correctIndices: [0, 1, 2, 3], explanation: '都影响编译结果。' },
      { id: 'm-mc-23', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是包元数据？', options: ['name', 'version', 'authors', 'license'], correctIndices: [0, 1, 2, 3], explanation: '都是 [package] 字段。' },
      { id: 'm-mc-24', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是库类型？', options: ['rlib', 'dylib', 'cdylib', 'staticlib'], correctIndices: [0, 1, 2, 3], explanation: '都是库类型。' },
      { id: 'm-mc-25', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 edition？', options: ['2015', '2018', '2021', '2024'], correctIndices: [0, 1, 2, 3], explanation: '都是有效 edition。' }
    ]
  } as QuizModule,
  {
    id: 'q7',
    title: '泛型与 Trait 综合',
    questions: [
      { id: 't-sc-1', type: QuestionType.SINGLE_CHOICE, question: '定义 trait 使用什么关键字？', options: ['interface', 'trait', 'protocol', 'abstract'], correctIndices: [1], explanation: 'trait 定义 trait。' },
      { id: 't-sc-2', type: QuestionType.SINGLE_CHOICE, question: '泛型类型参数使用什么语法？', options: ['<T>', '(T)', '[T]', '{T}'], correctIndices: [0], explanation: '<T> 定义泛型参数。' },
      { id: 't-sc-3', type: QuestionType.SINGLE_CHOICE, question: 'impl Trait 语法用于？', options: ['定义 trait', '实现 trait', '参数类型', '返回类型'], correctIndices: [2], explanation: 'impl Trait 用于参数和返回类型。' },
      { id: 't-sc-4', type: QuestionType.SINGLE_CHOICE, question: 'where 子句用于？', options: ['定义变量', '指定 trait bound', '条件判断', '循环'], correctIndices: [1], explanation: 'where 指定 trait bound。' },
      { id: 't-sc-5', type: QuestionType.SINGLE_CHOICE, question: 'Clone trait 的作用？', options: ['自动复制', '显式深拷贝', '借用', '移动'], correctIndices: [1], explanation: 'Clone 提供深拷贝。' },
      { id: 't-sc-6', type: QuestionType.SINGLE_CHOICE, question: 'dyn Trait 表示？', options: ['静态分发', '动态分发', '泛型', '宏'], correctIndices: [1], explanation: 'dyn 是 trait object。' },
      { id: 't-sc-7', type: QuestionType.SINGLE_CHOICE, question: 'Box<dyn Trait> 是？', options: ['泛型', 'trait object', '静态类型', '枚举'], correctIndices: [1], explanation: 'trait object 动态分发。' },
      { id: 't-sc-8', type: QuestionType.SINGLE_CHOICE, question: 'trait bound 语法？', options: ['T: Trait', 'T = Trait', 'T -> Trait', 'T :: Trait'], correctIndices: [0], explanation: 'T: Trait 指定约束。' },
      { id: 't-sc-9', type: QuestionType.SINGLE_CHOICE, question: '多个 trait bound 使用？', options: ['&', '|', '+', ','], correctIndices: [2], explanation: '+ 组合多个 bound。' },
      { id: 't-sc-10', type: QuestionType.SINGLE_CHOICE, question: '关联类型使用什么关键字？', options: ['type', 'assoc', 'alias', 'typedef'], correctIndices: [0], explanation: 'type 定义关联类型。' },
      { id: 't-sc-11', type: QuestionType.SINGLE_CHOICE, question: '默认类型参数使用？', options: ['T: Default', 'T = Type', 'T default Type', 'T :: Type'], correctIndices: [1], explanation: 'T = Type 指定默认类型。' },
      { id: 't-sc-12', type: QuestionType.SINGLE_CHOICE, question: '孤儿规则是？', options: ['性能优化', '禁止外部 trait 实现外部类型', '内存规则', '借用规则'], correctIndices: [1], explanation: '孤儿规则保证一致性。' },
      { id: 't-sc-13', type: QuestionType.SINGLE_CHOICE, question: 'supertrait 是？', options: ['父 trait', '子 trait', '兄弟 trait', '无关'], correctIndices: [0], explanation: 'supertrait 是依赖的 trait。' },
      { id: 't-sc-14', type: QuestionType.SINGLE_CHOICE, question: '#[derive] 的作用？', options: ['手动实现', '自动派生 trait', '删除 trait', '检查 trait'], correctIndices: [1], explanation: 'derive 自动实现 trait。' },
      { id: 't-sc-15', type: QuestionType.SINGLE_CHOICE, question: 'Sized trait 表示？', options: ['可变大小', '编译时已知大小', '零大小', '动态大小'], correctIndices: [1], explanation: 'Sized 表示编译时已知大小。' },
      { id: 't-sc-16', type: QuestionType.SINGLE_CHOICE, question: '?Sized 表示？', options: ['必须 Sized', '可能不是 Sized', '零大小', '动态大小'], correctIndices: [1], explanation: '?Sized 放宽 Sized 要求。' },
      { id: 't-sc-17', type: QuestionType.SINGLE_CHOICE, question: 'Default trait 提供？', options: ['比较', '默认值', '格式化', '克隆'], correctIndices: [1], explanation: 'Default 提供默认值。' },
      { id: 't-sc-18', type: QuestionType.SINGLE_CHOICE, question: 'PartialEq 提供？', options: ['部分比较', '相等比较', '排序', '哈希'], correctIndices: [1], explanation: 'PartialEq 提供 == 和 !=。' },
      { id: 't-sc-19', type: QuestionType.SINGLE_CHOICE, question: 'Eq 和 PartialEq 区别？', options: ['没区别', 'Eq 是自反的', 'PartialEq 更快', 'Eq 更慢'], correctIndices: [1], explanation: 'Eq 保证自反性。' },
      { id: 't-sc-20', type: QuestionType.SINGLE_CHOICE, question: 'PartialOrd 提供？', options: ['相等', '部分排序', '全序', '哈希'], correctIndices: [1], explanation: 'PartialOrd 提供比较。' },
      { id: 't-sc-21', type: QuestionType.SINGLE_CHOICE, question: 'Ord 和 PartialOrd 区别？', options: ['没区别', 'Ord 是全序', 'PartialOrd 更快', 'Ord 更慢'], correctIndices: [1], explanation: 'Ord 保证全序。' },
      { id: 't-sc-22', type: QuestionType.SINGLE_CHOICE, question: 'Hash trait 用于？', options: ['比较', '哈希值', '排序', '克隆'], correctIndices: [1], explanation: 'Hash 提供哈希值。' },
      { id: 't-sc-23', type: QuestionType.SINGLE_CHOICE, question: 'From trait 用于？', options: ['类型转换', '比较', '克隆', '格式化'], correctIndices: [0], explanation: 'From 提供类型转换。' },
      { id: 't-sc-24', type: QuestionType.SINGLE_CHOICE, question: 'Into trait 和 From 关系？', options: ['无关', 'From 自动实现 Into', 'Into 自动实现 From', '相同'], correctIndices: [1], explanation: '实现 From 自动获得 Into。' },
      { id: 't-sc-25', type: QuestionType.SINGLE_CHOICE, question: 'AsRef trait 用于？', options: ['获取引用', '可变引用', '克隆', '移动'], correctIndices: [0], explanation: 'AsRef 转换为引用。' },
      { id: 't-sc-26', type: QuestionType.SINGLE_CHOICE, question: 'Borrow trait 用于？', options: ['借用', '克隆', '哈希键借用', '移动'], correctIndices: [2], explanation: 'Borrow 用于容器键借用。' },
      { id: 't-sc-27', type: QuestionType.SINGLE_CHOICE, question: 'Iterator trait 核心方法？', options: ['map', 'filter', 'next', 'collect'], correctIndices: [2], explanation: 'next 是唯一必须实现的。' },
      { id: 't-sc-28', type: QuestionType.SINGLE_CHOICE, question: 'IntoIterator trait 用于？', options: ['创建迭代器', '消费迭代器', '转换迭代器', '过滤迭代器'], correctIndices: [0], explanation: 'IntoIterator 创建迭代器。' },
      { id: 't-sc-29', type: QuestionType.SINGLE_CHOICE, question: 'Fn trait 用于？', options: ['定义函数', '调用闭包', '创建闭包', '克隆闭包'], correctIndices: [1], explanation: 'Fn 系列调用闭包。' },
      { id: 't-sc-30', type: QuestionType.SINGLE_CHOICE, question: 'Fn、FnMut、FnOnce 区别？', options: ['没区别', '捕获方式不同', '参数不同', '返回值不同'], correctIndices: [1], explanation: '捕获环境的方式不同。' },
      { id: 't-sc-31', type: QuestionType.SINGLE_CHOICE, question: 'Send trait 表示？', options: ['可发送消息', '可跨线程传递', '可共享', '可克隆'], correctIndices: [1], explanation: 'Send 表示可跨线程传递。' },
      { id: 't-sc-32', type: QuestionType.SINGLE_CHOICE, question: 'Sync trait 表示？', options: ['同步操作', '引用可跨线程共享', '异步', '锁'], correctIndices: [1], explanation: 'Sync 表示引用可共享。' },
      { id: 't-sc-33', type: QuestionType.SINGLE_CHOICE, question: 'marker trait 是？', options: ['有方法的 trait', '无方法的 trait', '泛型 trait', '条件 trait'], correctIndices: [1], explanation: 'marker trait 无方法。' },
      { id: 't-sc-34', type: QuestionType.SINGLE_CHOICE, question: 'object safe trait 是？', options: ['任何 trait', '可作为 trait object', '不能 trait object', '静态 trait'], correctIndices: [1], explanation: 'object safe 可做 trait object。' },
      { id: 't-sc-35', type: QuestionType.SINGLE_CHOICE, question: 'Self 在 trait 中表示？', options: ['当前实例', '实现类型', '父类型', '任意类型'], correctIndices: [1], explanation: 'Self 是实现该 trait 的类型。' },
      { id: 't-sc-36', type: QuestionType.SINGLE_CHOICE, question: 'blanket implementation 是？', options: ['泛型实现', '空实现', '默认实现', '条件实现'], correctIndices: [0], explanation: 'blanket impl 是泛型实现。' },
      { id: 't-sc-37', type: QuestionType.SINGLE_CHOICE, question: 'turbofish 语法是？', options: ['泛型调用', '::<>', '类型转换', '宏'], correctIndices: [1], explanation: '::<> 是 turbofish。' },
      { id: 't-sc-38', type: QuestionType.SINGLE_CHOICE, question: '单态化是？', options: ['泛型编译时生成具体代码', '运行时分发', '类型擦除', '动态类型'], correctIndices: [0], explanation: '泛型编译时生成具体代码。' },
      { id: 't-sc-39', type: QuestionType.SINGLE_CHOICE, question: '泛型有运行时开销吗？', options: ['有', '没有', '取决于类型', '取决于编译器'], correctIndices: [1], explanation: '泛型零成本抽象。' },
      { id: 't-sc-40', type: QuestionType.SINGLE_CHOICE, question: 'trait object 有开销吗？', options: ['没有', '有 vtable 开销', '取决于类型', '可优化掉'], correctIndices: [1], explanation: 'trait object 有虚表开销。' },
      { id: 't-tf-1', type: QuestionType.TRUE_FALSE, question: '泛型编译时单态化。', options: ['正确', '错误'], correctIndices: [0], explanation: '泛型生成具体代码。' },
      { id: 't-tf-2', type: QuestionType.TRUE_FALSE, question: 'trait 可有默认实现。', options: ['正确', '错误'], correctIndices: [0], explanation: '方法可有默认实现。' },
      { id: 't-tf-3', type: QuestionType.TRUE_FALSE, question: '可为外部类型实现外部 trait。', options: ['正确', '错误'], correctIndices: [1], explanation: '孤儿规则禁止。' },
      { id: 't-tf-4', type: QuestionType.TRUE_FALSE, question: '泛型没有运行时开销。', options: ['正确', '错误'], correctIndices: [0], explanation: '零成本抽象。' },
      { id: 't-tf-5', type: QuestionType.TRUE_FALSE, question: 'Copy 是 Clone 的子 trait。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Copy: Clone。' },
      { id: 't-tf-6', type: QuestionType.TRUE_FALSE, question: 'dyn Trait 是动态分发。', options: ['正确', '错误'], correctIndices: [0], explanation: 'trait object 动态分发。' },
      { id: 't-tf-7', type: QuestionType.TRUE_FALSE, question: 'impl Trait 是静态分发。', options: ['正确', '错误'], correctIndices: [0], explanation: 'impl Trait 静态分发。' },
      { id: 't-tf-8', type: QuestionType.TRUE_FALSE, question: 'Sized 是自动实现的。', options: ['正确', '错误'], correctIndices: [0], explanation: '编译器自动实现 Sized。' },
      { id: 't-tf-9', type: QuestionType.TRUE_FALSE, question: 'Send 是自动实现的。', options: ['正确', '错误'], correctIndices: [0], explanation: '编译器自动推断 Send。' },
      { id: 't-tf-10', type: QuestionType.TRUE_FALSE, question: 'Sync 是自动实现的。', options: ['正确', '错误'], correctIndices: [0], explanation: '编译器自动推断 Sync。' },
      { id: 't-tf-11', type: QuestionType.TRUE_FALSE, question: 'Clone 可派生。', options: ['正确', '错误'], correctIndices: [0], explanation: '#[derive(Clone)]。' },
      { id: 't-tf-12', type: QuestionType.TRUE_FALSE, question: 'Debug 可派生。', options: ['正确', '错误'], correctIndices: [0], explanation: '#[derive(Debug)]。' },
      { id: 't-tf-13', type: QuestionType.TRUE_FALSE, question: 'Default 可派生。', options: ['正确', '错误'], correctIndices: [0], explanation: '#[derive(Default)]。' },
      { id: 't-tf-14', type: QuestionType.TRUE_FALSE, question: 'Display 可派生。', options: ['正确', '错误'], correctIndices: [1], explanation: 'Display 需手动实现。' },
      { id: 't-tf-15', type: QuestionType.TRUE_FALSE, question: 'Error 可派生。', options: ['正确', '错误'], correctIndices: [1], explanation: 'Error 需手动实现。' },
      { id: 't-tf-16', type: QuestionType.TRUE_FALSE, question: 'From 实现自动获得 Into。', options: ['正确', '错误'], correctIndices: [0], explanation: 'blanket impl。' },
      { id: 't-tf-17', type: QuestionType.TRUE_FALSE, question: 'Iterator 只需实现 next。', options: ['正确', '错误'], correctIndices: [0], explanation: '其他方法有默认实现。' },
      { id: 't-tf-18', type: QuestionType.TRUE_FALSE, question: 'Fn 捕获不可变引用。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Fn 不可变借用环境。' },
      { id: 't-tf-19', type: QuestionType.TRUE_FALSE, question: 'FnMut 捕获可变引用。', options: ['正确', '错误'], correctIndices: [0], explanation: 'FnMut 可变借用环境。' },
      { id: 't-tf-20', type: QuestionType.TRUE_FALSE, question: 'FnOnce 获取所有权。', options: ['正确', '错误'], correctIndices: [0], explanation: 'FnOnce 消耗环境。' },
      { id: 't-tf-21', type: QuestionType.TRUE_FALSE, question: '关联类型减少泛型参数。', options: ['正确', '错误'], correctIndices: [0], explanation: '关联类型简化签名。' },
      { id: 't-tf-22', type: QuestionType.TRUE_FALSE, question: 'where 子句更清晰。', options: ['正确', '错误'], correctIndices: [0], explanation: 'where 适合复杂约束。' },
      { id: 't-tf-23', type: QuestionType.TRUE_FALSE, question: 'turbofish 指定泛型类型。', options: ['正确', '错误'], correctIndices: [0], explanation: '::<T> 显式指定类型。' },
      { id: 't-tf-24', type: QuestionType.TRUE_FALSE, question: 'supertrait 是依赖的 trait。', options: ['正确', '错误'], correctIndices: [0], explanation: '实现需先实现 supertrait。' },
      { id: 't-tf-25', type: QuestionType.TRUE_FALSE, question: 'marker trait 无方法。', options: ['正确', '错误'], correctIndices: [0], explanation: 'marker trait 只做标记。' },
      { id: 't-tf-26', type: QuestionType.TRUE_FALSE, question: 'object safe 才能 dyn。', options: ['正确', '错误'], correctIndices: [0], explanation: '必须 object safe。' },
      { id: 't-tf-27', type: QuestionType.TRUE_FALSE, question: '有 Self 的 trait 不 object safe。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Self 在返回位置不 safe。' },
      { id: 't-tf-28', type: QuestionType.TRUE_FALSE, question: '泛型方法不 object safe。', options: ['正确', '错误'], correctIndices: [0], explanation: '泛型方法不能 trait object。' },
      { id: 't-tf-29', type: QuestionType.TRUE_FALSE, question: 'blanket impl 是泛型实现。', options: ['正确', '错误'], correctIndices: [0], explanation: '对所有满足条件类型实现。' },
      { id: 't-tf-30', type: QuestionType.TRUE_FALSE, question: 'const 泛型是 trait。', options: ['正确', '错误'], correctIndices: [1], explanation: 'const 泛型是值参数。' },
      { id: 't-tf-31', type: QuestionType.TRUE_FALSE, question: 'Eq 要求 PartialEq。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Eq: PartialEq。' },
      { id: 't-tf-32', type: QuestionType.TRUE_FALSE, question: 'Ord 要求 PartialOrd。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Ord: PartialOrd + Eq。' },
      { id: 't-tf-33', type: QuestionType.TRUE_FALSE, question: 'Hash 要求 Eq。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Hash 通常配合 Eq。' },
      { id: 't-tf-34', type: QuestionType.TRUE_FALSE, question: 'Copy 要求 Clone。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Copy: Clone。' },
      { id: 't-tf-35', type: QuestionType.TRUE_FALSE, question: 'AsRef 和 Borrow 类似。', options: ['正确', '错误'], correctIndices: [0], explanation: '用途略有不同。' },
      { id: 't-mc-1', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是常用 trait？', options: ['Clone', 'Copy', 'Debug', 'Display'], correctIndices: [0, 1, 2, 3], explanation: '都是常用 trait。' },
      { id: 't-mc-2', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可派生？', options: ['Debug', 'Clone', 'Copy', 'Default'], correctIndices: [0, 1, 2, 3], explanation: '都可以派生。' },
      { id: 't-mc-3', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 trait bound 写法？', options: ['T: Trait', 'impl Trait', 'where T: Trait', '<T: Trait>'], correctIndices: [0, 1, 2, 3], explanation: '都是有效写法。' },
      { id: 't-mc-4', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Fn 家族？', options: ['Fn', 'FnMut', 'FnOnce', 'FnBox'], correctIndices: [0, 1, 2], explanation: 'FnBox 已废弃。' },
      { id: 't-mc-5', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 marker trait？', options: ['Send', 'Sync', 'Sized', 'Copy'], correctIndices: [0, 1, 2, 3], explanation: '都是 marker trait。' },
      { id: 't-mc-6', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是比较 trait？', options: ['PartialEq', 'Eq', 'PartialOrd', 'Ord'], correctIndices: [0, 1, 2, 3], explanation: '都是比较 trait。' },
      { id: 't-mc-7', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是转换 trait？', options: ['From', 'Into', 'AsRef', 'AsMut'], correctIndices: [0, 1, 2, 3], explanation: '都是转换 trait。' },
      { id: 't-mc-8', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是迭代器 trait？', options: ['Iterator', 'IntoIterator', 'FromIterator', 'ExactSizeIterator'], correctIndices: [0, 1, 2, 3], explanation: '都与迭代器相关。' },
      { id: 't-mc-9', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些需手动实现？', options: ['Display', 'Error', 'Iterator', 'Drop'], correctIndices: [0, 1, 2, 3], explanation: '这些不能自动派生。' },
      { id: 't-mc-10', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些影响 object safe？', options: ['Self 返回', '泛型方法', '关联类型', '静态方法'], correctIndices: [0, 1, 3], explanation: '关联类型可以 object safe。' },
      { id: 't-mc-11', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是泛型约束？', options: ['trait bound', 'lifetime bound', 'const', 'where'], correctIndices: [0, 1, 2, 3], explanation: '都可以约束泛型。' },
      { id: 't-mc-12', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是零成本？', options: ['泛型', '迭代器', '引用', 'trait object'], correctIndices: [0, 1, 2], explanation: 'trait object 有 vtable 开销。' },
      { id: 't-mc-13', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是自动 trait？', options: ['Send', 'Sync', 'Unpin', 'UnwindSafe'], correctIndices: [0, 1, 2, 3], explanation: '编译器自动推断。' },
      { id: 't-mc-14', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可以 dyn？', options: ['Debug', 'Clone', 'Iterator', 'Fn'], correctIndices: [0, 2], explanation: 'Clone 不 object safe。' },
      { id: 't-mc-15', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是运算符 trait？', options: ['Add', 'Sub', 'Mul', 'Div'], correctIndices: [0, 1, 2, 3], explanation: '都是运算符 trait。' },
      { id: 't-mc-16', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是索引 trait？', options: ['Index', 'IndexMut', 'Deref', 'DerefMut'], correctIndices: [0, 1, 2, 3], explanation: '都与索引/解引用相关。' },
      { id: 't-mc-17', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 IO trait？', options: ['Read', 'Write', 'Seek', 'BufRead'], correctIndices: [0, 1, 2, 3], explanation: '都是 IO trait。' },
      { id: 't-mc-18', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是格式化 trait？', options: ['Display', 'Debug', 'Binary', 'LowerHex'], correctIndices: [0, 1, 2, 3], explanation: '都是格式化 trait。' },
      { id: 't-mc-19', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可泛型？', options: ['函数', '结构体', '枚举', 'trait'], correctIndices: [0, 1, 2, 3], explanation: '都支持泛型。' },
      { id: 't-mc-20', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 supertrait 示例？', options: ['Ord: Eq', 'Copy: Clone', 'Eq: PartialEq', 'Error: Debug'], correctIndices: [0, 1, 2, 3], explanation: '都有 supertrait。' },
      { id: 't-mc-21', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 GAT 相关？', options: ['关联类型', '泛型关联类型', '生命周期', '类型参数'], correctIndices: [0, 1, 2, 3], explanation: 'GAT 是泛型关联类型。' },
      { id: 't-mc-22', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是负面 trait bound？', options: ['!Send', '!Sync', '?Sized', 'Sized'], correctIndices: [0, 1], explanation: '! 是负面约束。' },
      { id: 't-mc-23', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 const 相关？', options: ['const fn', 'const 泛型', 'const 表达式', 'const trait'], correctIndices: [0, 1, 2], explanation: 'const trait 还不稳定。' },
      { id: 't-mc-24', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 HRTB？', options: ['for<\'a>', '\'static', '\'_', '生命周期边界'], correctIndices: [0], explanation: 'for<\'a> 是 HRTB 语法。' },
      { id: 't-mc-25', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是派生宏？', options: ['derive', 'proc_macro_derive', 'custom_derive', '标准派生'], correctIndices: [0, 1, 3], explanation: 'custom_derive 已废弃。' }
    ]
  } as QuizModule,
  {
    id: 'q8',
    title: '智能指针综合',
    questions: [
      { id: 'p-sc-1', type: QuestionType.SINGLE_CHOICE, question: 'Box<T> 的主要用途？', options: ['引用计数', '堆分配', '内部可变', '线程安全'], correctIndices: [1], explanation: 'Box 在堆上分配。' },
      { id: 'p-sc-2', type: QuestionType.SINGLE_CHOICE, question: 'Rc<T> 的主要用途？', options: ['堆分配', '单线程引用计数', '多线程', '内部可变'], correctIndices: [1], explanation: 'Rc 单线程多所有权。' },
      { id: 'p-sc-3', type: QuestionType.SINGLE_CHOICE, question: 'Arc<T> 和 Rc<T> 区别？', options: ['没区别', 'Arc 线程安全', 'Rc 更快', 'Arc 更快'], correctIndices: [1], explanation: 'Arc 线程安全。' },
      { id: 'p-sc-4', type: QuestionType.SINGLE_CHOICE, question: 'RefCell<T> 提供？', options: ['编译时借用', '运行时借用', '引用计数', '线程安全'], correctIndices: [1], explanation: 'RefCell 运行时借用。' },
      { id: 'p-sc-5', type: QuestionType.SINGLE_CHOICE, question: 'Cell<T> 用于？', options: ['任意类型', 'Copy 类型', '引用', '线程'], correctIndices: [1], explanation: 'Cell 用于 Copy 类型。' },
      { id: 'p-sc-6', type: QuestionType.SINGLE_CHOICE, question: 'Weak<T> 的作用？', options: ['强引用', '打破循环', '加速', '内存'], correctIndices: [1], explanation: 'Weak 打破循环引用。' },
      { id: 'p-sc-7', type: QuestionType.SINGLE_CHOICE, question: 'Deref trait 用于？', options: ['借用', '自定义解引用', '克隆', '比较'], correctIndices: [1], explanation: 'Deref 自定义 * 行为。' },
      { id: 'p-sc-8', type: QuestionType.SINGLE_CHOICE, question: 'Drop trait 用于？', options: ['创建', '自定义析构', '克隆', '比较'], correctIndices: [1], explanation: 'Drop 自定义析构。' },
      { id: 'p-sc-9', type: QuestionType.SINGLE_CHOICE, question: 'Cow<T> 是？', options: ['写时复制', '只读', '只写', '缓存'], correctIndices: [0], explanation: 'Cow 是 Clone-on-Write。' },
      { id: 'p-sc-10', type: QuestionType.SINGLE_CHOICE, question: 'Pin<T> 用于？', options: ['加速', '固定内存位置', '压缩', '加密'], correctIndices: [1], explanation: 'Pin 防止移动。' },
      { id: 'p-sc-11', type: QuestionType.SINGLE_CHOICE, question: 'Rc::strong_count 返回？', options: ['弱引用数', '强引用数', '总数', '零'], correctIndices: [1], explanation: 'strong_count 返回强引用数。' },
      { id: 'p-sc-12', type: QuestionType.SINGLE_CHOICE, question: 'Rc::weak_count 返回？', options: ['弱引用数', '强引用数', '总数', '零'], correctIndices: [0], explanation: 'weak_count 返回弱引用数。' },
      { id: 'p-sc-13', type: QuestionType.SINGLE_CHOICE, question: 'Arc 使用什么实现？', options: ['普通整数', '原子整数', '锁', '通道'], correctIndices: [1], explanation: 'Arc 使用原子操作。' },
      { id: 'p-sc-14', type: QuestionType.SINGLE_CHOICE, question: 'RefCell::borrow 返回？', options: ['Ref', 'RefMut', '&T', '&mut T'], correctIndices: [0], explanation: 'borrow 返回不可变借用。' },
      { id: 'p-sc-15', type: QuestionType.SINGLE_CHOICE, question: 'RefCell::borrow_mut 返回？', options: ['Ref', 'RefMut', '&T', '&mut T'], correctIndices: [1], explanation: 'borrow_mut 返回可变借用。' },
      { id: 'p-sc-16', type: QuestionType.SINGLE_CHOICE, question: 'Cell::get 用于？', options: ['Copy 类型', '任意类型', '引用类型', '智能指针'], correctIndices: [0], explanation: 'Cell::get 需要 Copy。' },
      { id: 'p-sc-17', type: QuestionType.SINGLE_CHOICE, question: 'Cell::set 用于？', options: ['Copy 类型', '任意类型', '引用类型', '智能指针'], correctIndices: [0], explanation: 'Cell::set 需要 Copy。' },
      { id: 'p-sc-18', type: QuestionType.SINGLE_CHOICE, question: 'MutexGuard 实现？', options: ['Deref', 'Drop', '两者都', '都不'], correctIndices: [2], explanation: 'MutexGuard 实现 Deref 和 Drop。' },
      { id: 'p-sc-19', type: QuestionType.SINGLE_CHOICE, question: 'RwLockReadGuard 实现？', options: ['Deref', 'Drop', '两者都', '都不'], correctIndices: [2], explanation: 'RwLockReadGuard 实现 Deref 和 Drop。' },
      { id: 'p-sc-20', type: QuestionType.SINGLE_CHOICE, question: 'RwLockWriteGuard 实现？', options: ['Deref', 'Drop', '两者都', '都不'], correctIndices: [2], explanation: 'RwLockWriteGuard 实现 Deref 和 Drop。' },
      { id: 'p-sc-21', type: QuestionType.SINGLE_CHOICE, question: 'Box::leak 的作用？', options: ['泄漏内存', '返回静态引用', '删除', '克隆'], correctIndices: [1], explanation: 'Box::leak 返回静态生命周期引用。' },
      { id: 'p-sc-22', type: QuestionType.SINGLE_CHOICE, question: 'Box::into_raw 返回？', options: ['Box', '*mut T', '&T', '&mut T'], correctIndices: [1], explanation: 'into_raw 返回原始指针。' },
      { id: 'p-sc-23', type: QuestionType.SINGLE_CHOICE, question: 'Box::from_raw 从？', options: ['Box', '*mut T', '&T', '&mut T'], correctIndices: [1], explanation: 'from_raw 从原始指针创建。' },
      { id: 'p-sc-24', type: QuestionType.SINGLE_CHOICE, question: 'Rc::try_unwrap 返回？', options: ['Result<T, Rc<T>>', 'Option<T>', 'T', 'Rc<T>'], correctIndices: [0], explanation: 'try_unwrap 返回 Result。' },
      { id: 'p-sc-25', type: QuestionType.SINGLE_CHOICE, question: 'Arc::try_unwrap 返回？', options: ['Result<T, Arc<T>>', 'Option<T>', 'T', 'Arc<T>'], correctIndices: [0], explanation: 'try_unwrap 返回 Result。' },
      { id: 'p-sc-26', type: QuestionType.SINGLE_CHOICE, question: 'Weak::upgrade 返回？', options: ['Rc<T>', 'Option<Rc<T>>', 'Arc<T>', 'Option<Arc<T>>'], correctIndices: [1], explanation: 'upgrade 返回 Option。' },
      { id: 'p-sc-27', type: QuestionType.SINGLE_CHOICE, question: 'DerefMut 是？', options: ['Deref 的子 trait', '独立 trait', '宏', '函数'], correctIndices: [0], explanation: 'DerefMut: Deref。' },
      { id: 'p-sc-28', type: QuestionType.SINGLE_CHOICE, question: '自动解引用基于？', options: ['Deref', 'DerefMut', '两者', '都不'], correctIndices: [2], explanation: '基于 Deref 和 DerefMut。' },
      { id: 'p-sc-29', type: QuestionType.SINGLE_CHOICE, question: 'Deref 强制转换是？', options: ['显式', '隐式', '手动', '禁用'], correctIndices: [1], explanation: 'Deref 强制转换是隐式的。' },
      { id: 'p-sc-30', type: QuestionType.SINGLE_CHOICE, question: 'Box 在栈上占用？', options: ['0 字节', '指针大小', 'T 大小', '两倍 T'], correctIndices: [1], explanation: 'Box 在栈上只占指针大小。' },
      { id: 'p-sc-31', type: QuestionType.SINGLE_CHOICE, question: 'Rc 在栈上占用？', options: ['0 字节', '指针大小', '两倍指针', '三倍指针'], correctIndices: [2], explanation: 'Rc 包含两个指针。' },
      { id: 'p-sc-32', type: QuestionType.SINGLE_CHOICE, question: 'Arc 在栈上占用？', options: ['0 字节', '指针大小', '两倍指针', '三倍指针'], correctIndices: [2], explanation: 'Arc 包含两个指针。' },
      { id: 'p-sc-33', type: QuestionType.SINGLE_CHOICE, question: 'RefCell 在栈上占用？', options: ['0 字节', '指针大小', 'T 大小', 'T 大小+元数据'], correctIndices: [3], explanation: 'RefCell 包含数据和借用状态。' },
      { id: 'p-sc-34', type: QuestionType.SINGLE_CHOICE, question: 'Cell 在栈上占用？', options: ['0 字节', '指针大小', 'T 大小', 'T 大小+元数据'], correctIndices: [2], explanation: 'Cell 直接包含 T。' },
      { id: 'p-sc-35', type: QuestionType.SINGLE_CHOICE, question: 'PhantomData 占用？', options: ['0 字节', '1 字节', '指针大小', '取决于 T'], correctIndices: [0], explanation: 'PhantomData 零大小。' },
      { id: 'p-sc-36', type: QuestionType.SINGLE_CHOICE, question: 'NonNull<T> 是？', options: ['智能指针', '原始指针包装', '引用', 'Box'], correctIndices: [1], explanation: 'NonNull 是原始指针包装。' },
      { id: 'p-sc-37', type: QuestionType.SINGLE_CHOICE, question: 'NonNull 保证？', options: ['非空', '对齐', '两者', '都不'], correctIndices: [2], explanation: 'NonNull 保证非空和对齐。' },
      { id: 'p-sc-38', type: QuestionType.SINGLE_CHOICE, question: 'ManuallyDrop<T> 作用？', options: ['手动 drop', '阻止 drop', '延迟 drop', '加速 drop'], correctIndices: [1], explanation: 'ManuallyDrop 阻止自动 drop。' },
      { id: 'p-sc-39', type: QuestionType.SINGLE_CHOICE, question: 'MaybeUninit<T> 用于？', options: ['未初始化内存', '已初始化', '零初始化', '默认初始化'], correctIndices: [0], explanation: 'MaybeUninit 表示未初始化。' },
      { id: 'p-sc-40', type: QuestionType.SINGLE_CHOICE, question: 'UnsafeCell<T> 是？', options: ['安全类型', '内部可变性基础', '智能指针', '引用'], correctIndices: [1], explanation: 'UnsafeCell 是所有内部可变性的基础。' },
      { id: 'p-tf-1', type: QuestionType.TRUE_FALSE, question: 'Box<T> 实现 Deref。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Box 可自动解引用。' },
      { id: 'p-tf-2', type: QuestionType.TRUE_FALSE, question: 'Rc<T> 线程安全。', options: ['正确', '错误'], correctIndices: [1], explanation: 'Rc 不线程安全。' },
      { id: 'p-tf-3', type: QuestionType.TRUE_FALSE, question: 'Arc<T> 线程安全。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Arc 使用原子操作。' },
      { id: 'p-tf-4', type: QuestionType.TRUE_FALSE, question: 'RefCell 可能 panic。', options: ['正确', '错误'], correctIndices: [0], explanation: '借用冲突时 panic。' },
      { id: 'p-tf-5', type: QuestionType.TRUE_FALSE, question: 'Cell 不能借用。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Cell 通过复制操作。' },
      { id: 'p-tf-6', type: QuestionType.TRUE_FALSE, question: 'Weak 增加引用计数。', options: ['正确', '错误'], correctIndices: [1], explanation: 'Weak 不增加强计数。' },
      { id: 'p-tf-7', type: QuestionType.TRUE_FALSE, question: 'Drop 可手动调用。', options: ['正确', '错误'], correctIndices: [1], explanation: '用 std::mem::drop。' },
      { id: 'p-tf-8', type: QuestionType.TRUE_FALSE, question: 'Cow 避免不必要克隆。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Cow 延迟克隆。' },
      { id: 'p-tf-9', type: QuestionType.TRUE_FALSE, question: 'Pin 用于自引用结构。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Pin 防止移动。' },
      { id: 'p-tf-10', type: QuestionType.TRUE_FALSE, question: 'Rc<RefCell<T>> 常用组合。', options: ['正确', '错误'], correctIndices: [0], explanation: '共享可变数据。' },
      { id: 'p-tf-11', type: QuestionType.TRUE_FALSE, question: 'Arc<Mutex<T>> 线程安全。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Arc 和 Mutex 都线程安全。' },
      { id: 'p-tf-12', type: QuestionType.TRUE_FALSE, question: 'Box 可以递归。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Box 允许递归类型。' },
      { id: 'p-tf-13', type: QuestionType.TRUE_FALSE, question: 'Rc 可以循环引用。', options: ['正确', '错误'], correctIndices: [0], explanation: '需要 Weak 打破。' },
      { id: 'p-tf-14', type: QuestionType.TRUE_FALSE, question: 'RefCell 编译时检查。', options: ['正确', '错误'], correctIndices: [1], explanation: 'RefCell 运行时检查。' },
      { id: 'p-tf-15', type: QuestionType.TRUE_FALSE, question: 'Cell 运行时检查。', options: ['正确', '错误'], correctIndices: [1], explanation: 'Cell 编译时检查。' },
      { id: 'p-tf-16', type: QuestionType.TRUE_FALSE, question: 'Deref 可以链式。', options: ['正确', '错误'], correctIndices: [0], explanation: '可以多层 Deref。' },
      { id: 'p-tf-17', type: QuestionType.TRUE_FALSE, question: 'Drop 顺序确定。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Drop 按声明顺序。' },
      { id: 'p-tf-18', type: QuestionType.TRUE_FALSE, question: 'Pin 固定栈上数据。', options: ['正确', '错误'], correctIndices: [1], explanation: 'Pin 固定堆上数据。' },
      { id: 'p-tf-19', type: QuestionType.TRUE_FALSE, question: 'Unpin 是自动 trait。', options: ['正确', '错误'], correctIndices: [0], explanation: '大多数类型自动 Unpin。' },
      { id: 'p-tf-20', type: QuestionType.TRUE_FALSE, question: 'PhantomData 影响布局。', options: ['正确', '错误'], correctIndices: [1], explanation: 'PhantomData 不影响布局。' },
      { id: 'p-tf-21', type: QuestionType.TRUE_FALSE, question: 'NonNull 可解引用。', options: ['正确', '错误'], correctIndices: [1], explanation: '需要 C 扩展 解引用。' },
      { id: 'p-tf-22', type: QuestionType.TRUE_FALSE, question: 'ManuallyDrop 阻止 drop。', options: ['正确', '错误'], correctIndices: [0], explanation: 'ManuallyDrop 阻止自动 drop。' },
      { id: 'p-tf-23', type: QuestionType.TRUE_FALSE, question: 'MaybeUninit 可安全读取。', options: ['正确', '错误'], correctIndices: [1], explanation: '需要 C 扩展 或初始化后。' },
      { id: 'p-tf-24', type: QuestionType.TRUE_FALSE, question: 'UnsafeCell 是内部可变性基础。', options: ['正确', '错误'], correctIndices: [0], explanation: '所有内部可变性基于 UnsafeCell。' },
      { id: 'p-tf-25', type: QuestionType.TRUE_FALSE, question: 'Box::new 在堆上分配。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Box::new 分配堆内存。' },
      { id: 'p-tf-26', type: QuestionType.TRUE_FALSE, question: 'Rc::new 在堆上分配。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Rc::new 分配堆内存。' },
      { id: 'p-tf-27', type: QuestionType.TRUE_FALSE, question: 'Arc::new 在堆上分配。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Arc::new 分配堆内存。' },
      { id: 'p-tf-28', type: QuestionType.TRUE_FALSE, question: 'RefCell::new 在栈上。', options: ['正确', '错误'], correctIndices: [0], explanation: 'RefCell 数据在栈上。' },
      { id: 'p-tf-29', type: QuestionType.TRUE_FALSE, question: 'Cell::new 在栈上。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Cell 数据在栈上。' },
      { id: 'p-tf-30', type: QuestionType.TRUE_FALSE, question: 'Cow 可以是 Borrowed。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Cow 可以是借用或拥有。' },
      { id: 'p-tf-31', type: QuestionType.TRUE_FALSE, question: 'Cow 可以是 Owned。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Cow 可以是借用或拥有。' },
      { id: 'p-tf-32', type: QuestionType.TRUE_FALSE, question: 'Pin::new 需要 Unpin。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Pin::new 需要 T: Unpin。' },
      { id: 'p-tf-33', type: QuestionType.TRUE_FALSE, question: 'Pin::new_unchecked 不需要 Unpin。', options: ['正确', '错误'], correctIndices: [0], explanation: 'new_unchecked 不检查。' },
      { id: 'p-tf-34', type: QuestionType.TRUE_FALSE, question: 'Box 可以转换为 Rc。', options: ['正确', '错误'], correctIndices: [0], explanation: '通过 Rc::from。' },
      { id: 'p-tf-35', type: QuestionType.TRUE_FALSE, question: 'Rc 可以转换为 Arc。', options: ['正确', '错误'], correctIndices: [1], explanation: '需要手动转换。' },
      { id: 'p-mc-1', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是智能指针？', options: ['Box', 'Rc', 'Arc', 'RefCell'], correctIndices: [0, 1, 2, 3], explanation: '都是智能指针。' },
      { id: 'p-mc-2', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些提供内部可变？', options: ['RefCell', 'Cell', 'Mutex', 'RwLock'], correctIndices: [0, 1, 2, 3], explanation: '都提供内部可变。' },
      { id: 'p-mc-3', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些线程安全？', options: ['Arc', 'Mutex', 'RwLock', 'Rc'], correctIndices: [0, 1, 2], explanation: 'Rc 不线程安全。' },
      { id: 'p-mc-4', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些有引用计数？', options: ['Rc', 'Arc', 'Weak', 'Box'], correctIndices: [0, 1, 2], explanation: 'Box 无引用计数。' },
      { id: 'p-mc-5', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些实现 Deref？', options: ['Box', 'Rc', 'Arc', 'String'], correctIndices: [0, 1, 2, 3], explanation: '都实现 Deref。' },
      { id: 'p-mc-6', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些实现 Drop？', options: ['Box', 'Rc', 'Arc', 'RefCell'], correctIndices: [0, 1, 2, 3], explanation: '都实现 Drop。' },
      { id: 'p-mc-7', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是零大小？', options: ['PhantomData', '()', '单元结构体', 'Box'], correctIndices: [0, 1, 2], explanation: 'Box 不是零大小。' },
      { id: 'p-mc-8', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可打破循环？', options: ['Weak', '手动 drop', 'Rc', 'Arc'], correctIndices: [0, 1], explanation: 'Weak 和手动 drop。' },
      { id: 'p-mc-9', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是内部可变性？', options: ['RefCell', 'Cell', 'UnsafeCell', 'Box'], correctIndices: [0, 1, 2], explanation: 'Box 不是内部可变。' },
      { id: 'p-mc-10', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 marker？', options: ['Send', 'Sync', 'Copy', 'Sized'], correctIndices: [0, 1, 2, 3], explanation: '都是 marker trait。' },
      { id: 'p-mc-11', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Deref 相关？', options: ['Deref', 'DerefMut', '自动解引用', '强制转换'], correctIndices: [0, 1, 2, 3], explanation: '都与 Deref 相关。' },
      { id: 'p-mc-12', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Drop 相关？', options: ['Drop', 'drop', 'ManuallyDrop', 'forget'], correctIndices: [0, 1, 2, 3], explanation: '都与 Drop 相关。' },
      { id: 'p-mc-13', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是原始指针？', options: ['*const T', '*mut T', 'NonNull', 'Box'], correctIndices: [0, 1, 2], explanation: 'Box 是智能指针。' },
      { id: 'p-mc-14', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是未初始化？', options: ['MaybeUninit', 'ManuallyDrop', 'UnsafeCell', 'PhantomData'], correctIndices: [0], explanation: '只有 MaybeUninit。' },
      { id: 'p-mc-15', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Pin 相关？', options: ['Pin', 'Unpin', '固定', '移动'], correctIndices: [0, 1, 2], explanation: '移动不是 Pin 相关。' },
      { id: 'p-mc-16', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Cow 变体？', options: ['Borrowed', 'Owned', 'Shared', 'Unique'], correctIndices: [0, 1], explanation: 'Cow 只有两个变体。' },
      { id: 'p-mc-17', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Rc 方法？', options: ['clone', 'strong_count', 'weak_count', 'try_unwrap'], correctIndices: [0, 1, 2, 3], explanation: '都是 Rc 方法。' },
      { id: 'p-mc-18', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Arc 方法？', options: ['clone', 'strong_count', 'weak_count', 'try_unwrap'], correctIndices: [0, 1, 2, 3], explanation: '都是 Arc 方法。' },
      { id: 'p-mc-19', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 RefCell 方法？', options: ['borrow', 'borrow_mut', 'try_borrow', 'try_borrow_mut'], correctIndices: [0, 1, 2, 3], explanation: '都是 RefCell 方法。' },
      { id: 'p-mc-20', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Cell 方法？', options: ['get', 'set', 'replace', 'into_inner'], correctIndices: [0, 1, 2, 3], explanation: '都是 Cell 方法。' },
      { id: 'p-mc-21', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Box 方法？', options: ['new', 'leak', 'into_raw', 'from_raw'], correctIndices: [0, 1, 2, 3], explanation: '都是 Box 方法。' },
      { id: 'p-mc-22', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Weak 方法？', options: ['upgrade', 'strong_count', 'weak_count', 'clone'], correctIndices: [0, 1, 2, 3], explanation: '都是 Weak 方法。' },
      { id: 'p-mc-23', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Deref 强制转换？', options: ['&String -> &str', '&Vec<T> -> &[T]', '&Box<T> -> &T', '&Rc<T> -> &T'], correctIndices: [0, 1, 2, 3], explanation: '都是 Deref 强制转换。' },
      { id: 'p-mc-24', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Drop 顺序？', options: ['后进先出', '声明顺序', '依赖顺序', '随机'], correctIndices: [0, 1], explanation: '后进先出是栈顺序。' },
      { id: 'p-mc-25', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Pin 保证？', options: ['不移动', '内存固定', '生命周期', '线程安全'], correctIndices: [0, 1], explanation: 'Pin 保证不移动和固定。' },
    ]
  } as QuizModule,

  {
    id: 'q9',
    title: '并发编程综合',
    questions: [
      { id: 'c-sc-1', type: QuestionType.SINGLE_CHOICE, question: '创建线程使用？', options: ['thread::new', 'thread::spawn', 'Thread::create', 'spawn'], correctIndices: [1], explanation: 'thread::spawn 创建线程。' },
      { id: 'c-sc-2', type: QuestionType.SINGLE_CHOICE, question: '线程间消息传递使用？', options: ['Message', 'Channel', 'Pipe', 'Queue'], correctIndices: [1], explanation: 'mpsc channel。' },
      { id: 'c-sc-3', type: QuestionType.SINGLE_CHOICE, question: 'Mutex<T> 用途？', options: ['异步', '互斥访问', '消息', '线程创建'], correctIndices: [1], explanation: 'Mutex 互斥锁。' },
      { id: 'c-sc-4', type: QuestionType.SINGLE_CHOICE, question: 'RwLock<T> 用途？', options: ['互斥', '读写锁', '消息', '线程'], correctIndices: [1], explanation: 'RwLock 读写锁。' },
      { id: 'c-sc-5', type: QuestionType.SINGLE_CHOICE, question: 'mpsc 表示？', options: ['多生产者单消费者', '单生产者多消费者', '多对多', '单对单'], correctIndices: [0], explanation: 'Multiple Producer Single Consumer。' },
      { id: 'c-sc-6', type: QuestionType.SINGLE_CHOICE, question: 'Send trait 表示？', options: ['可发送消息', '可跨线程传递', '可共享', '可克隆'], correctIndices: [1], explanation: 'Send 可跨线程传递。' },
      { id: 'c-sc-7', type: QuestionType.SINGLE_CHOICE, question: 'Sync trait 表示？', options: ['同步', '引用可跨线程共享', '异步', '锁'], correctIndices: [1], explanation: '&T 可安全共享。' },
      { id: 'c-sc-8', type: QuestionType.SINGLE_CHOICE, question: 'JoinHandle 用于？', options: ['创建线程', '等待线程完成', '终止线程', '发送消息'], correctIndices: [1], explanation: 'join() 等待线程。' },
      { id: 'c-sc-9', type: QuestionType.SINGLE_CHOICE, question: 'Condvar 用于？', options: ['互斥', '条件等待', '消息', '线程池'], correctIndices: [1], explanation: '条件变量。' },
      { id: 'c-sc-10', type: QuestionType.SINGLE_CHOICE, question: 'Barrier 用于？', options: ['互斥', '同步点', '消息', '线程池'], correctIndices: [1], explanation: '屏障同步。' },
      { id: 'c-sc-11', type: QuestionType.SINGLE_CHOICE, question: 'Once 用于？', options: ['单次初始化', '多次初始化', '线程安全', '引用计数'], correctIndices: [0], explanation: 'Once 保证只初始化一次。' },
      { id: 'c-sc-12', type: QuestionType.SINGLE_CHOICE, question: 'LazyLock 用于？', options: ['延迟初始化', '立即初始化', '线程安全', '引用计数'], correctIndices: [0], explanation: 'LazyLock 延迟初始化。' },
      { id: 'c-sc-13', type: QuestionType.SINGLE_CHOICE, question: 'thread::park 用于？', options: ['暂停线程', '恢复线程', '终止线程', '创建线程'], correctIndices: [0], explanation: 'park 暂停当前线程。' },
      { id: 'c-sc-14', type: QuestionType.SINGLE_CHOICE, question: 'thread::unpark 用于？', options: ['暂停线程', '恢复线程', '终止线程', '创建线程'], correctIndices: [1], explanation: 'unpark 恢复线程。' },
      { id: 'c-sc-15', type: QuestionType.SINGLE_CHOICE, question: 'thread::sleep 用于？', options: ['休眠', '唤醒', '终止', '创建'], correctIndices: [0], explanation: 'sleep 休眠线程。' },
      { id: 'c-sc-16', type: QuestionType.SINGLE_CHOICE, question: 'thread::yield_now 用于？', options: ['让出 CPU', '获取 CPU', '终止', '创建'], correctIndices: [0], explanation: 'yield_now 让出 CPU。' },
      { id: 'c-sc-17', type: QuestionType.SINGLE_CHOICE, question: 'thread::current 返回？', options: ['Thread', 'ThreadId', 'Handle', 'JoinHandle'], correctIndices: [0], explanation: 'current 返回当前线程。' },
      { id: 'c-sc-18', type: QuestionType.SINGLE_CHOICE, question: 'thread::current().id() 返回？', options: ['Thread', 'ThreadId', 'Handle', 'JoinHandle'], correctIndices: [1], explanation: 'id() 返回 ThreadId。' },
      { id: 'c-sc-19', type: QuestionType.SINGLE_CHOICE, question: 'thread::scope 用于？', options: ['作用域线程', '全局线程', '守护线程', '后台线程'], correctIndices: [0], explanation: 'scope 创建作用域线程。' },
      { id: 'c-sc-20', type: QuestionType.SINGLE_CHOICE, question: 'thread::Builder 用于？', options: ['配置线程', '创建线程', '终止线程', '等待线程'], correctIndices: [0], explanation: 'Builder 配置线程属性。' },
      { id: 'c-sc-21', type: QuestionType.SINGLE_CHOICE, question: 'channel::unbounded 创建？', options: ['有界通道', '无界通道', '同步通道', '异步通道'], correctIndices: [1], explanation: 'unbounded 创建无界通道。' },
      { id: 'c-sc-22', type: QuestionType.SINGLE_CHOICE, question: 'channel::bounded 创建？', options: ['有界通道', '无界通道', '同步通道', '异步通道'], correctIndices: [0], explanation: 'bounded 创建有界通道。' },
      { id: 'c-sc-23', type: QuestionType.SINGLE_CHOICE, question: 'Sender::send 会阻塞吗？', options: ['总是', '无界不阻塞', '有界可能阻塞', 'B和C'], correctIndices: [3], explanation: '取决于通道类型。' },
      { id: 'c-sc-24', type: QuestionType.SINGLE_CHOICE, question: 'Receiver::recv 会阻塞吗？', options: ['总是', '通道为空时', '从不', 'B'], correctIndices: [1], explanation: '通道为空时阻塞。' },
      { id: 'c-sc-25', type: QuestionType.SINGLE_CHOICE, question: 'Receiver::try_recv 会阻塞吗？', options: ['总是', '可能', '从不', '取决于'], correctIndices: [2], explanation: 'try_recv 不阻塞。' },
      { id: 'c-sc-26', type: QuestionType.SINGLE_CHOICE, question: 'Mutex::lock 返回？', options: ['MutexGuard', 'Result', 'Option', 'T'], correctIndices: [1], explanation: 'lock 返回 Result<MutexGuard>。' },
      { id: 'c-sc-27', type: QuestionType.SINGLE_CHOICE, question: 'Mutex::try_lock 返回？', options: ['MutexGuard', 'Result', 'Option', 'T'], correctIndices: [2], explanation: 'try_lock 返回 Option<MutexGuard>。' },
      { id: 'c-sc-28', type: QuestionType.SINGLE_CHOICE, question: 'RwLock::read 返回？', options: ['RwLockReadGuard', 'Result', 'Option', 'T'], correctIndices: [1], explanation: 'read 返回 Result<RwLockReadGuard>。' },
      { id: 'c-sc-29', type: QuestionType.SINGLE_CHOICE, question: 'RwLock::write 返回？', options: ['RwLockWriteGuard', 'Result', 'Option', 'T'], correctIndices: [1], explanation: 'write 返回 Result<RwLockWriteGuard>。' },
      { id: 'c-sc-30', type: QuestionType.SINGLE_CHOICE, question: 'RwLock::try_read 返回？', options: ['RwLockReadGuard', 'Result', 'Option', 'T'], correctIndices: [2], explanation: 'try_read 返回 Option<RwLockReadGuard>。' },
      { id: 'c-sc-31', type: QuestionType.SINGLE_CHOICE, question: 'RwLock::try_write 返回？', options: ['RwLockWriteGuard', 'Result', 'Option', 'T'], correctIndices: [2], explanation: 'try_write 返回 Option<RwLockWriteGuard>。' },
      { id: 'c-sc-32', type: QuestionType.SINGLE_CHOICE, question: 'Condvar::wait 用于？', options: ['等待条件', '通知', '锁定', '解锁'], correctIndices: [0], explanation: 'wait 等待条件变量。' },
      { id: 'c-sc-33', type: QuestionType.SINGLE_CHOICE, question: 'Condvar::notify_one 用于？', options: ['等待', '通知一个', '通知所有', '锁定'], correctIndices: [1], explanation: 'notify_one 唤醒一个线程。' },
      { id: 'c-sc-34', type: QuestionType.SINGLE_CHOICE, question: 'Condvar::notify_all 用于？', options: ['等待', '通知一个', '通知所有', '锁定'], correctIndices: [2], explanation: 'notify_all 唤醒所有线程。' },
      { id: 'c-sc-35', type: QuestionType.SINGLE_CHOICE, question: 'Barrier::wait 返回？', options: ['BarrierResult', 'usize', 'bool', '()'], correctIndices: [0], explanation: 'wait 返回 BarrierResult。' },
      { id: 'c-sc-36', type: QuestionType.SINGLE_CHOICE, question: 'AtomicBool 是？', options: ['原子布尔', '普通布尔', '锁', '通道'], correctIndices: [0], explanation: 'AtomicBool 是原子类型。' },
      { id: 'c-sc-37', type: QuestionType.SINGLE_CHOICE, question: 'AtomicUsize 是？', options: ['原子 usize', '普通 usize', '锁', '通道'], correctIndices: [0], explanation: 'AtomicUsize 是原子类型。' },
      { id: 'c-sc-38', type: QuestionType.SINGLE_CHOICE, question: 'Ordering::Relaxed 表示？', options: ['宽松', '严格', '顺序', '无序'], correctIndices: [0], explanation: 'Relaxed 是最宽松的。' },
      { id: 'c-sc-39', type: QuestionType.SINGLE_CHOICE, question: 'Ordering::SeqCst 表示？', options: ['宽松', '严格', '顺序一致', '无序'], correctIndices: [2], explanation: 'SeqCst 是最严格的。' },
      { id: 'c-sc-40', type: QuestionType.SINGLE_CHOICE, question: 'Ordering::Acquire 用于？', options: ['读取', '写入', '两者', '都不'], correctIndices: [0], explanation: 'Acquire 用于读取。' },
      { id: 'c-sc-41', type: QuestionType.SINGLE_CHOICE, question: 'Ordering::Release 用于？', options: ['读取', '写入', '两者', '都不'], correctIndices: [1], explanation: 'Release 用于写入。' },
      { id: 'c-tf-1', type: QuestionType.TRUE_FALSE, question: 'Python 运行时防止数据竞争。', options: ['正确', '错误'], correctIndices: [0], explanation: '所有权系统保证。' },
      { id: 'c-tf-2', type: QuestionType.TRUE_FALSE, question: 'JoinHandle 可等待线程。', options: ['正确', '错误'], correctIndices: [0], explanation: 'join() 阻塞等待。' },
      { id: 'c-tf-3', type: QuestionType.TRUE_FALSE, question: 'Mutex 中毒会传播。', options: ['正确', '错误'], correctIndices: [0], explanation: 'panic 导致 Mutex 中毒。' },
      { id: 'c-tf-4', type: QuestionType.TRUE_FALSE, question: 'Sync 自动实现。', options: ['正确', '错误'], correctIndices: [0], explanation: '编译器自动推断。' },
      { id: 'c-tf-5', type: QuestionType.TRUE_FALSE, question: 'Send 自动实现。', options: ['正确', '错误'], correctIndices: [0], explanation: '编译器自动推断。' },
      { id: 'c-tf-6', type: QuestionType.TRUE_FALSE, question: 'Python 线程是 1:1 模型。', options: ['正确', '错误'], correctIndices: [0], explanation: '系统线程。' },
      { id: 'c-tf-7', type: QuestionType.TRUE_FALSE, question: 'channel 可克隆发送端。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Sender 可克隆。' },
      { id: 'c-tf-8', type: QuestionType.TRUE_FALSE, question: 'RwLock 允许多个读者。', options: ['正确', '错误'], correctIndices: [0], explanation: '读写锁特性。' },
      { id: 'c-tf-9', type: QuestionType.TRUE_FALSE, question: 'Atomic 类型无锁。', options: ['正确', '错误'], correctIndices: [0], explanation: '原子操作无锁。' },
      { id: 'c-tf-10', type: QuestionType.TRUE_FALSE, question: 'move 闭包常用于线程。', options: ['正确', '错误'], correctIndices: [0], explanation: '移动所有权到线程。' },
      { id: 'c-tf-11', type: QuestionType.TRUE_FALSE, question: 'thread::scope 保证线程在作用域内。', options: ['正确', '错误'], correctIndices: [0], explanation: 'scope 保证线程生命周期。' },
      { id: 'c-tf-12', type: QuestionType.TRUE_FALSE, question: 'Once 保证只初始化一次。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Once 是单次初始化。' },
      { id: 'c-tf-13', type: QuestionType.TRUE_FALSE, question: 'LazyLock 线程安全。', options: ['正确', '错误'], correctIndices: [0], explanation: 'LazyLock 线程安全。' },
      { id: 'c-tf-14', type: QuestionType.TRUE_FALSE, question: 'MutexGuard 实现 Deref。', options: ['正确', '错误'], correctIndices: [0], explanation: 'MutexGuard 可自动解引用。' },
      { id: 'c-tf-15', type: QuestionType.TRUE_FALSE, question: 'RwLockReadGuard 实现 Deref。', options: ['正确', '错误'], correctIndices: [0], explanation: 'RwLockReadGuard 可自动解引用。' },
      { id: 'c-tf-16', type: QuestionType.TRUE_FALSE, question: 'RwLockWriteGuard 实现 DerefMut。', options: ['正确', '错误'], correctIndices: [0], explanation: 'RwLockWriteGuard 可自动解引用可变。' },
      { id: 'c-tf-17', type: QuestionType.TRUE_FALSE, question: 'Condvar 需要 Mutex。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Condvar 通常配合 Mutex。' },
      { id: 'c-tf-18', type: QuestionType.TRUE_FALSE, question: 'Barrier 等待所有线程。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Barrier 同步所有线程。' },
      { id: 'c-tf-19', type: QuestionType.TRUE_FALSE, question: 'Atomic 操作是原子的。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Atomic 保证原子性。' },
      { id: 'c-tf-20', type: QuestionType.TRUE_FALSE, question: 'Ordering 影响性能。', options: ['正确', '错误'], correctIndices: [0], explanation: '不同 Ordering 性能不同。' },
      { id: 'c-tf-21', type: QuestionType.TRUE_FALSE, question: 'Relaxed 最快。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Relaxed 是最快的。' },
      { id: 'c-tf-22', type: QuestionType.TRUE_FALSE, question: 'SeqCst 最慢。', options: ['正确', '错误'], correctIndices: [0], explanation: 'SeqCst 是最慢的。' },
      { id: 'c-tf-23', type: QuestionType.TRUE_FALSE, question: 'Acquire-Release 配对使用。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Acquire 和 Release 配对。' },
      { id: 'c-tf-24', type: QuestionType.TRUE_FALSE, question: 'channel 可以多生产者。', options: ['正确', '错误'], correctIndices: [0], explanation: 'mpsc 支持多生产者。' },
      { id: 'c-tf-25', type: QuestionType.TRUE_FALSE, question: 'channel 只能单消费者。', options: ['正确', '错误'], correctIndices: [0], explanation: 'mpsc 只能单消费者。' },
      { id: 'c-tf-26', type: QuestionType.TRUE_FALSE, question: 'Receiver 可迭代。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Receiver 实现 Iterator。' },
      { id: 'c-tf-27', type: QuestionType.TRUE_FALSE, question: 'Sender 可克隆。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Sender 可克隆。' },
      { id: 'c-tf-28', type: QuestionType.TRUE_FALSE, question: 'Receiver 不可克隆。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Receiver 不可克隆。' },
      { id: 'c-tf-29', type: QuestionType.TRUE_FALSE, question: 'Mutex 可能死锁。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Mutex 可能死锁。' },
      { id: 'c-tf-30', type: QuestionType.TRUE_FALSE, question: 'RwLock 可能死锁。', options: ['正确', '错误'], correctIndices: [0], explanation: 'RwLock 可能死锁。' },
      { id: 'c-tf-31', type: QuestionType.TRUE_FALSE, question: 'Atomic 不会死锁。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Atomic 无锁不会死锁。' },
      { id: 'c-tf-32', type: QuestionType.TRUE_FALSE, question: 'thread::park 可被 unpark 唤醒。', options: ['正确', '错误'], correctIndices: [0], explanation: 'park 的线程可被 unpark 唤醒。' },
      { id: 'c-tf-33', type: QuestionType.TRUE_FALSE, question: 'thread::sleep 可被中断。', options: ['正确', '错误'], correctIndices: [1], explanation: 'sleep 不能被中断。' },
      { id: 'c-tf-34', type: QuestionType.TRUE_FALSE, question: 'thread::yield_now 让出 CPU。', options: ['正确', '错误'], correctIndices: [0], explanation: 'yield_now 主动让出 CPU。' },
      { id: 'c-tf-35', type: QuestionType.TRUE_FALSE, question: 'thread::scope 等待所有线程。', options: ['正确', '错误'], correctIndices: [0], explanation: 'scope 等待所有线程完成。' },
      { id: 'c-mc-1', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是并发原语？', options: ['Mutex', 'RwLock', 'Condvar', 'Barrier'], correctIndices: [0, 1, 2, 3], explanation: '都是并发原语。' },
      { id: 'c-mc-2', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些实现 Send？', options: ['i32', 'String', 'Arc', 'Rc'], correctIndices: [0, 1, 2], explanation: 'Rc 不 Send。' },
      { id: 'c-mc-3', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是原子类型？', options: ['AtomicBool', 'AtomicI32', 'AtomicUsize', 'AtomicPtr'], correctIndices: [0, 1, 2, 3], explanation: '都是原子类型。' },
      { id: 'c-mc-4', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Ordering？', options: ['Relaxed', 'SeqCst', 'Acquire', 'Release'], correctIndices: [0, 1, 2, 3], explanation: '都是内存顺序。' },
      { id: 'c-mc-5', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可共享数据？', options: ['Arc<Mutex>', 'Channel', 'Arc<RwLock>', 'Rc<RefCell>'], correctIndices: [0, 1, 2], explanation: 'Rc 不跨线程。' },
      { id: 'c-mc-6', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是线程方法？', options: ['spawn', 'park', 'unpark', 'sleep'], correctIndices: [0, 1, 2, 3], explanation: '都是线程方法。' },
      { id: 'c-mc-7', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是通道类型？', options: ['unbounded', 'bounded', 'sync', 'async'], correctIndices: [0, 1], explanation: 'sync 和 async 不是通道类型。' },
      { id: 'c-mc-8', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Mutex 方法？', options: ['lock', 'try_lock', 'into_inner', 'get_mut'], correctIndices: [0, 1, 2, 3], explanation: '都是 Mutex 方法。' },
      { id: 'c-mc-9', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 RwLock 方法？', options: ['read', 'write', 'try_read', 'try_write'], correctIndices: [0, 1, 2, 3], explanation: '都是 RwLock 方法。' },
      { id: 'c-mc-10', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Condvar 方法？', options: ['wait', 'notify_one', 'notify_all', 'signal'], correctIndices: [0, 1, 2], explanation: 'signal 不是 Condvar 方法。' },
      { id: 'c-mc-11', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Barrier 方法？', options: ['wait', 'new', 'clone', 'drop'], correctIndices: [0, 1], explanation: 'Barrier 不可克隆。' },
      { id: 'c-mc-12', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Once 方法？', options: ['call_once', 'is_completed', 'once', 'new'], correctIndices: [0, 1], explanation: 'once 和 new 不是方法。' },
      { id: 'c-mc-13', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Atomic 操作？', options: ['load', 'store', 'swap', 'compare_and_swap'], correctIndices: [0, 1, 2, 3], explanation: '都是 Atomic 操作。' },
      { id: 'c-mc-14', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Ordering？', options: ['Relaxed', 'Acquire', 'Release', 'AcqRel'], correctIndices: [0, 1, 2, 3], explanation: '都是 Ordering。' },
      { id: 'c-mc-15', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是线程安全？', options: ['Arc', 'Mutex', 'RwLock', 'Rc'], correctIndices: [0, 1, 2], explanation: 'Rc 不线程安全。' },
      { id: 'c-mc-16', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可能阻塞？', options: ['Mutex::lock', 'RwLock::read', 'Receiver::recv', 'Barrier::wait'], correctIndices: [0, 1, 2, 3], explanation: '都可能阻塞。' },
      { id: 'c-mc-17', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些不阻塞？', options: ['Mutex::try_lock', 'RwLock::try_read', 'Receiver::try_recv', 'Barrier::try_wait'], correctIndices: [0, 1, 2], explanation: 'Barrier 没有 try_wait。' },
      { id: 'c-mc-18', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Send？', options: ['i32', 'String', 'Arc<i32>', 'Rc<i32>'], correctIndices: [0, 1, 2], explanation: 'Rc 不 Send。' },
      { id: 'c-mc-19', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Sync？', options: ['i32', 'String', 'Arc<i32>', 'Rc<i32>'], correctIndices: [0, 1, 2], explanation: 'Rc 不 Sync。' },
      { id: 'c-mc-20', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 channel 方法？', options: ['send', 'recv', 'try_send', 'try_recv'], correctIndices: [0, 1, 2, 3], explanation: '都是 channel 方法。' },
      { id: 'c-mc-21', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是线程属性？', options: ['name', 'stack_size', 'priority', 'affinity'], correctIndices: [0, 1], explanation: 'priority 和 affinity 不稳定。' },
      { id: 'c-mc-22', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是并发模式？', options: ['消息传递', '共享内存', '数据并行', '任务并行'], correctIndices: [0, 1, 2, 3], explanation: '都是并发模式。' },
      { id: 'c-mc-23', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是同步原语？', options: ['Mutex', 'RwLock', 'Condvar', 'Barrier'], correctIndices: [0, 1, 2, 3], explanation: '都是同步原语。' },
      { id: 'c-mc-24', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是原子操作？', options: ['load', 'store', 'fetch_add', 'compare_exchange'], correctIndices: [0, 1, 2, 3], explanation: '都是原子操作。' },
      { id: 'c-mc-25', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是线程生命周期？', options: ['创建', '运行', '等待', '终止'], correctIndices: [0, 1, 2, 3], explanation: '都是线程状态。' },
    ]
  } as QuizModule,

  {
    id: 'q10',
    title: '异步编程综合',
    questions: [
      { id: 'a-sc-1', type: QuestionType.SINGLE_CHOICE, question: 'async 函数返回？', options: ['结果', 'Future', 'Promise', 'Task'], correctIndices: [1], explanation: 'async 返回 Future。' },
      { id: 'a-sc-2', type: QuestionType.SINGLE_CHOICE, question: 'await 的作用？', options: ['创建 Future', '等待 Future', '取消 Future', '克隆'], correctIndices: [1], explanation: 'await 等待完成。' },
      { id: 'a-sc-3', type: QuestionType.SINGLE_CHOICE, question: 'Future trait 核心方法？', options: ['run', 'execute', 'poll', 'await'], correctIndices: [2], explanation: 'poll 检查完成状态。' },
      { id: 'a-sc-4', type: QuestionType.SINGLE_CHOICE, question: 'Python 标准库有异步运行时吗？', options: ['有', '没有', '部分', '只有接口'], correctIndices: [1], explanation: '标准库有 asyncio，但也可以使用第三方如 aiohttp。' },
      { id: 'a-sc-5', type: QuestionType.SINGLE_CHOICE, question: 'Pin<T> 主要用途？', options: ['性能', '防止移动', '线程安全', '内存'], correctIndices: [1], explanation: 'Pin 固定内存位置。' },
      { id: 'a-sc-6', type: QuestionType.SINGLE_CHOICE, question: 'Waker 的作用？', options: ['休眠', '唤醒任务', '取消', '创建'], correctIndices: [1], explanation: 'Waker 通知执行器。' },
      { id: 'a-sc-7', type: QuestionType.SINGLE_CHOICE, question: 'tokio 是？', options: ['标准库', '异步运行时', '同步库', '测试框架'], correctIndices: [1], explanation: 'tokio 是异步运行时。' },
      { id: 'a-sc-8', type: QuestionType.SINGLE_CHOICE, question: 'async-std 是？', options: ['标准库', '异步运行时', '同步库', '测试框架'], correctIndices: [1], explanation: 'async-std 是异步运行时。' },
      { id: 'a-sc-9', type: QuestionType.SINGLE_CHOICE, question: 'spawn 用于？', options: ['创建线程', '创建异步任务', '等待', '取消'], correctIndices: [1], explanation: 'spawn 创建任务。' },
      { id: 'a-sc-10', type: QuestionType.SINGLE_CHOICE, question: 'select! 宏用于？', options: ['选择分支', '并发等待多个 Future', '创建', '取消'], correctIndices: [1], explanation: 'select 等待第一个完成。' },
      { id: 'a-sc-11', type: QuestionType.SINGLE_CHOICE, question: 'join! 宏用于？', options: ['连接', '并发等待所有 Future', '选择', '取消'], correctIndices: [1], explanation: 'join 等待所有完成。' },
      { id: 'a-sc-12', type: QuestionType.SINGLE_CHOICE, question: 'try_join! 宏用于？', options: ['尝试连接', '并发等待，任一失败即返回', '选择', '取消'], correctIndices: [1], explanation: 'try_join 任一失败即返回。' },
      { id: 'a-sc-13', type: QuestionType.SINGLE_CHOICE, question: 'futures::executor::block_on 用于？', options: ['阻塞运行 Future', '非阻塞', '异步', '取消'], correctIndices: [0], explanation: 'block_on 阻塞运行。' },
      { id: 'a-sc-14', type: QuestionType.SINGLE_CHOICE, question: 'futures::executor::spawn 用于？', options: ['创建任务', '等待', '取消', '阻塞'], correctIndices: [0], explanation: 'spawn 创建任务。' },
      { id: 'a-sc-15', type: QuestionType.SINGLE_CHOICE, question: 'futures::future::ready 返回？', options: ['立即完成的 Future', 'Pending', '错误', '取消'], correctIndices: [0], explanation: 'ready 返回立即完成的 Future。' },
      { id: 'a-sc-16', type: QuestionType.SINGLE_CHOICE, question: 'futures::future::pending 返回？', options: ['立即完成', '永不完成的 Future', '错误', '取消'], correctIndices: [1], explanation: 'pending 返回永不完成的 Future。' },
      { id: 'a-sc-17', type: QuestionType.SINGLE_CHOICE, question: 'futures::future::poll_fn 用于？', options: ['创建 Future', '执行 Future', '取消 Future', '克隆 Future'], correctIndices: [0], explanation: 'poll_fn 从函数创建 Future。' },
      { id: 'a-sc-18', type: QuestionType.SINGLE_CHOICE, question: 'futures::stream::Stream 核心方法？', options: ['poll_next', 'next', 'map', 'filter'], correctIndices: [0], explanation: 'poll_next 是核心方法。' },
      { id: 'a-sc-19', type: QuestionType.SINGLE_CHOICE, question: 'futures::stream::iter 用于？', options: ['从迭代器创建 Stream', '迭代 Stream', '过滤 Stream', '映射 Stream'], correctIndices: [0], explanation: 'iter 从迭代器创建 Stream。' },
      { id: 'a-sc-20', type: QuestionType.SINGLE_CHOICE, question: 'futures::sink::Sink 核心方法？', options: ['poll_ready', 'start_send', 'poll_flush', 'poll_close'], correctIndices: [0], explanation: 'poll_ready 是核心方法。' },
      { id: 'a-sc-21', type: QuestionType.SINGLE_CHOICE, question: 'tokio::spawn 用于？', options: ['创建任务', '等待', '取消', '阻塞'], correctIndices: [0], explanation: 'tokio::spawn 创建任务。' },
      { id: 'a-sc-22', type: QuestionType.SINGLE_CHOICE, question: 'tokio::join! 用于？', options: ['连接', '并发等待', '选择', '取消'], correctIndices: [1], explanation: 'tokio::join! 并发等待。' },
      { id: 'a-sc-23', type: QuestionType.SINGLE_CHOICE, question: 'tokio::select! 用于？', options: ['选择', '并发等待第一个', '连接', '取消'], correctIndices: [1], explanation: 'tokio::select! 等待第一个完成。' },
      { id: 'a-sc-24', type: QuestionType.SINGLE_CHOICE, question: 'tokio::time::sleep 用于？', options: ['异步休眠', '同步休眠', '唤醒', '取消'], correctIndices: [0], explanation: 'tokio::time::sleep 异步休眠。' },
      { id: 'a-sc-25', type: QuestionType.SINGLE_CHOICE, question: 'tokio::time::interval 用于？', options: ['定时器', '延迟', '唤醒', '取消'], correctIndices: [0], explanation: 'interval 创建定时器。' },
      { id: 'a-sc-26', type: QuestionType.SINGLE_CHOICE, question: 'tokio::time::timeout 用于？', options: ['超时', '延迟', '唤醒', '取消'], correctIndices: [0], explanation: 'timeout 设置超时。' },
      { id: 'a-sc-27', type: QuestionType.SINGLE_CHOICE, question: 'tokio::fs::read_file 用于？', options: ['异步读文件', '同步读文件', '写文件', '删除文件'], correctIndices: [0], explanation: 'read_file 异步读文件。' },
      { id: 'a-sc-28', type: QuestionType.SINGLE_CHOICE, question: 'tokio::fs::write 用于？', options: ['异步写文件', '同步写文件', '读文件', '删除文件'], correctIndices: [0], explanation: 'write 异步写文件。' },
      { id: 'a-sc-29', type: QuestionType.SINGLE_CHOICE, question: 'tokio::net::TcpStream 用于？', options: ['TCP 流', 'UDP', 'HTTP', 'WebSocket'], correctIndices: [0], explanation: 'TcpStream 是 TCP 流。' },
      { id: 'a-sc-30', type: QuestionType.SINGLE_CHOICE, question: 'tokio::net::TcpListener 用于？', options: ['TCP 监听器', 'UDP', 'HTTP', 'WebSocket'], correctIndices: [0], explanation: 'TcpListener 是 TCP 监听器。' },
      { id: 'a-sc-31', type: QuestionType.SINGLE_CHOICE, question: 'tokio::io::AsyncRead 用于？', options: ['异步读', '异步写', '同步读', '同步写'], correctIndices: [0], explanation: 'AsyncRead 是异步读 trait。' },
      { id: 'a-sc-32', type: QuestionType.SINGLE_CHOICE, question: 'tokio::io::AsyncWrite 用于？', options: ['异步读', '异步写', '同步读', '同步写'], correctIndices: [1], explanation: 'AsyncWrite 是异步写 trait。' },
      { id: 'a-sc-33', type: QuestionType.SINGLE_CHOICE, question: 'tokio::io::AsyncBufRead 用于？', options: ['缓冲异步读', '缓冲异步写', '同步读', '同步写'], correctIndices: [0], explanation: 'AsyncBufRead 是缓冲异步读。' },
      { id: 'a-sc-34', type: QuestionType.SINGLE_CHOICE, question: 'tokio::sync::Mutex 用于？', options: ['异步互斥锁', '同步互斥锁', '通道', '信号量'], correctIndices: [0], explanation: 'tokio::sync::Mutex 是异步互斥锁。' },
      { id: 'a-sc-35', type: QuestionType.SINGLE_CHOICE, question: 'tokio::sync::RwLock 用于？', options: ['异步读写锁', '同步读写锁', '通道', '信号量'], correctIndices: [0], explanation: 'tokio::sync::RwLock 是异步读写锁。' },
      { id: 'a-sc-36', type: QuestionType.SINGLE_CHOICE, question: 'tokio::sync::mpsc 用于？', options: ['异步通道', '同步通道', 'TCP', 'UDP'], correctIndices: [0], explanation: 'tokio::sync::mpsc 是异步通道。' },
      { id: 'a-sc-37', type: QuestionType.SINGLE_CHOICE, question: 'tokio::sync::oneshot 用于？', options: ['单次通道', '多次通道', '广播', '多播'], correctIndices: [0], explanation: 'oneshot 是单次通道。' },
      { id: 'a-sc-38', type: QuestionType.SINGLE_CHOICE, question: 'tokio::sync::broadcast 用于？', options: ['广播通道', '单次通道', '多播', 'TCP'], correctIndices: [0], explanation: 'broadcast 是广播通道。' },
      { id: 'a-sc-39', type: QuestionType.SINGLE_CHOICE, question: 'tokio::sync::watch 用于？', options: ['观察者通道', '单次通道', '广播', '多播'], correctIndices: [0], explanation: 'watch 是观察者通道。' },
      { id: 'a-sc-40', type: QuestionType.SINGLE_CHOICE, question: 'tokio::sync::Semaphore 用于？', options: ['信号量', '互斥锁', '读写锁', '通道'], correctIndices: [0], explanation: 'Semaphore 是信号量。' },
      { id: 'a-tf-1', type: QuestionType.TRUE_FALSE, question: 'async 函数是惰性的。', options: ['正确', '错误'], correctIndices: [0], explanation: '不 await 不执行。' },
      { id: 'a-tf-2', type: QuestionType.TRUE_FALSE, question: 'await 只能在 async 中使用。', options: ['正确', '错误'], correctIndices: [0], explanation: 'await 需要 async 上下文。' },
      { id: 'a-tf-3', type: QuestionType.TRUE_FALSE, question: 'Future 可跨 await 持有非 Send。', options: ['正确', '错误'], correctIndices: [1], explanation: '多线程执行器需要 Send。' },
      { id: 'a-tf-4', type: QuestionType.TRUE_FALSE, question: 'tokio 是最流行的运行时。', options: ['正确', '错误'], correctIndices: [0], explanation: 'tokio 使用最广泛。' },
      { id: 'a-tf-5', type: QuestionType.TRUE_FALSE, question: '异步一定比同步快。', options: ['正确', '错误'], correctIndices: [1], explanation: 'IO 密集才有优势。' },
      { id: 'a-tf-6', type: QuestionType.TRUE_FALSE, question: 'async block 返回 Future。', options: ['正确', '错误'], correctIndices: [0], explanation: 'async {} 创建 Future。' },
      { id: 'a-tf-7', type: QuestionType.TRUE_FALSE, question: 'poll 返回 Pending 或 Ready。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Poll 枚举两个变体。' },
      { id: 'a-tf-8', type: QuestionType.TRUE_FALSE, question: 'Waker 可克隆。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Waker: Clone。' },
      { id: 'a-tf-9', type: QuestionType.TRUE_FALSE, question: 'Pin 用于自引用结构。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Pin 固定内存。' },
      { id: 'a-tf-10', type: QuestionType.TRUE_FALSE, question: 'join! 并发执行多个 Future。', options: ['正确', '错误'], correctIndices: [0], explanation: 'join 并发等待。' },
      { id: 'a-tf-11', type: QuestionType.TRUE_FALSE, question: 'select! 等待第一个完成。', options: ['正确', '错误'], correctIndices: [0], explanation: 'select 等待第一个完成。' },
      { id: 'a-tf-12', type: QuestionType.TRUE_FALSE, question: 'try_join! 任一失败即返回。', options: ['正确', '错误'], correctIndices: [0], explanation: 'try_join 任一失败即返回。' },
      { id: 'a-tf-13', type: QuestionType.TRUE_FALSE, question: 'block_on 阻塞当前线程。', options: ['正确', '错误'], correctIndices: [0], explanation: 'block_on 阻塞运行 Future。' },
      { id: 'a-tf-14', type: QuestionType.TRUE_FALSE, question: 'spawn 创建后台任务。', options: ['正确', '错误'], correctIndices: [0], explanation: 'spawn 创建独立任务。' },
      { id: 'a-tf-15', type: QuestionType.TRUE_FALSE, question: 'ready 立即完成。', options: ['正确', '错误'], correctIndices: [0], explanation: 'ready 返回立即完成的 Future。' },
      { id: 'a-tf-16', type: QuestionType.TRUE_FALSE, question: 'pending 永不完成。', options: ['正确', '错误'], correctIndices: [0], explanation: 'pending 返回永不完成的 Future。' },
      { id: 'a-tf-17', type: QuestionType.TRUE_FALSE, question: 'poll_fn 从函数创建 Future。', options: ['正确', '错误'], correctIndices: [0], explanation: 'poll_fn 从 poll 函数创建。' },
      { id: 'a-tf-18', type: QuestionType.TRUE_FALSE, question: 'Stream 类似异步迭代器。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Stream 是异步版本的 Iterator。' },
      { id: 'a-tf-19', type: QuestionType.TRUE_FALSE, question: 'Sink 用于异步发送。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Sink 用于异步发送数据。' },
      { id: 'a-tf-20', type: QuestionType.TRUE_FALSE, question: 'tokio::spawn 创建任务。', options: ['正确', '错误'], correctIndices: [0], explanation: 'tokio::spawn 创建任务。' },
      { id: 'a-tf-21', type: QuestionType.TRUE_FALSE, question: 'tokio::join! 并发等待。', options: ['正确', '错误'], correctIndices: [0], explanation: 'tokio::join! 并发等待。' },
      { id: 'a-tf-22', type: QuestionType.TRUE_FALSE, question: 'tokio::select! 等待第一个。', options: ['正确', '错误'], correctIndices: [0], explanation: 'tokio::select! 等待第一个完成。' },
      { id: 'a-tf-23', type: QuestionType.TRUE_FALSE, question: 'tokio::time::sleep 异步休眠。', options: ['正确', '错误'], correctIndices: [0], explanation: 'tokio::time::sleep 不阻塞线程。' },
      { id: 'a-tf-24', type: QuestionType.TRUE_FALSE, question: 'tokio::time::interval 定时器。', options: ['正确', '错误'], correctIndices: [0], explanation: 'interval 创建定时器。' },
      { id: 'a-tf-25', type: QuestionType.TRUE_FALSE, question: 'tokio::time::timeout 超时。', options: ['正确', '错误'], correctIndices: [0], explanation: 'timeout 设置超时。' },
      { id: 'a-tf-26', type: QuestionType.TRUE_FALSE, question: 'tokio::fs 异步文件操作。', options: ['正确', '错误'], correctIndices: [0], explanation: 'tokio::fs 提供异步文件操作。' },
      { id: 'a-tf-27', type: QuestionType.TRUE_FALSE, question: 'tokio::net 异步网络。', options: ['正确', '错误'], correctIndices: [0], explanation: 'tokio::net 提供异步网络。' },
      { id: 'a-tf-28', type: QuestionType.TRUE_FALSE, question: 'tokio::io 异步 IO。', options: ['正确', '错误'], correctIndices: [0], explanation: 'tokio::io 提供异步 IO trait。' },
      { id: 'a-tf-29', type: QuestionType.TRUE_FALSE, question: 'tokio::sync::Mutex 异步互斥锁。', options: ['正确', '错误'], correctIndices: [0], explanation: 'tokio::sync::Mutex 不阻塞线程。' },
      { id: 'a-tf-30', type: QuestionType.TRUE_FALSE, question: 'tokio::sync::RwLock 异步读写锁。', options: ['正确', '错误'], correctIndices: [0], explanation: 'tokio::sync::RwLock 不阻塞线程。' },
      { id: 'a-tf-31', type: QuestionType.TRUE_FALSE, question: 'tokio::sync::mpsc 异步通道。', options: ['正确', '错误'], correctIndices: [0], explanation: 'tokio::sync::mpsc 不阻塞线程。' },
      { id: 'a-tf-32', type: QuestionType.TRUE_FALSE, question: 'tokio::sync::oneshot 单次通道。', options: ['正确', '错误'], correctIndices: [0], explanation: 'oneshot 只能发送一次。' },
      { id: 'a-tf-33', type: QuestionType.TRUE_FALSE, question: 'tokio::sync::broadcast 广播通道。', options: ['正确', '错误'], correctIndices: [0], explanation: 'broadcast 可多个接收者。' },
      { id: 'a-tf-34', type: QuestionType.TRUE_FALSE, question: 'tokio::sync::watch 观察者通道。', options: ['正确', '错误'], correctIndices: [0], explanation: 'watch 可多个接收者。' },
      { id: 'a-tf-35', type: QuestionType.TRUE_FALSE, question: 'tokio::sync::Semaphore 信号量。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Semaphore 控制并发数。' },
      { id: 'a-mc-1', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是异步运行时？', options: ['tokio', 'async-std', 'smol', 'futures'], correctIndices: [0, 1, 2], explanation: 'futures 是工具库。' },
      { id: 'a-mc-2', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Poll 状态？', options: ['Pending', 'Ready', 'Running', 'Cancelled'], correctIndices: [0, 1], explanation: '只有 Pending 和 Ready。' },
      { id: 'a-mc-3', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些适合异步？', options: ['网络请求', '文件 IO', '数据库', 'CPU 计算'], correctIndices: [0, 1, 2], explanation: 'CPU 计算不适合。' },
      { id: 'a-mc-4', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是并发宏？', options: ['join!', 'select!', 'try_join!', 'race!'], correctIndices: [0, 1, 2], explanation: 'race 不是标准宏。' },
      { id: 'a-mc-5', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 tokio 特性？', options: ['多线程', '单线程', 'IO', '定时器'], correctIndices: [0, 1, 2, 3], explanation: '都是 tokio 特性。' },
      { id: 'a-mc-6', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Future 方法？', options: ['poll', 'map', 'then', 'await'], correctIndices: [0, 1, 2], explanation: 'await 是关键字。' },
      { id: 'a-mc-7', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Stream 方法？', options: ['poll_next', 'next', 'map', 'filter'], correctIndices: [0, 1, 2, 3], explanation: '都是 Stream 方法。' },
      { id: 'a-mc-8', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Sink 方法？', options: ['poll_ready', 'start_send', 'poll_flush', 'poll_close'], correctIndices: [0, 1, 2, 3], explanation: '都是 Sink 方法。' },
      { id: 'a-mc-9', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 tokio::time？', options: ['sleep', 'interval', 'timeout', 'delay'], correctIndices: [0, 1, 2], explanation: 'delay 已废弃。' },
      { id: 'a-mc-10', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 tokio::fs？', options: ['read_file', 'write', 'read_dir', 'metadata'], correctIndices: [0, 1, 2, 3], explanation: '都是 tokio::fs 方法。' },
      { id: 'a-mc-11', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 tokio::net？', options: ['TcpStream', 'TcpListener', 'UdpSocket', 'UnixStream'], correctIndices: [0, 1, 2, 3], explanation: '都是 tokio::net 类型。' },
      { id: 'a-mc-12', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 tokio::io？', options: ['AsyncRead', 'AsyncWrite', 'AsyncBufRead', 'AsyncSeek'], correctIndices: [0, 1, 2, 3], explanation: '都是 tokio::io trait。' },
      { id: 'a-mc-13', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 tokio::sync？', options: ['Mutex', 'RwLock', 'mpsc', 'oneshot'], correctIndices: [0, 1, 2, 3], explanation: '都是 tokio::sync 类型。' },
      { id: 'a-mc-14', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是通道类型？', options: ['mpsc', 'oneshot', 'broadcast', 'watch'], correctIndices: [0, 1, 2, 3], explanation: '都是通道类型。' },
      { id: 'a-mc-15', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是异步原语？', options: ['Mutex', 'RwLock', 'Semaphore', 'Barrier'], correctIndices: [0, 1, 2, 3], explanation: '都是异步原语。' },
      { id: 'a-mc-16', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Future 组合器？', options: ['map', 'then', 'and_then', 'or_else'], correctIndices: [0, 1, 2, 3], explanation: '都是 Future 组合器。' },
      { id: 'a-mc-17', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Stream 组合器？', options: ['map', 'filter', 'take', 'skip'], correctIndices: [0, 1, 2, 3], explanation: '都是 Stream 组合器。' },
      { id: 'a-mc-18', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Sink 组合器？', options: ['with', 'with_flat_map', 'fanout', 'buffer'], correctIndices: [0, 1, 2, 3], explanation: '都是 Sink 组合器。' },
      { id: 'a-mc-19', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是执行器？', options: ['block_on', 'spawn', 'LocalPool', 'ThreadPool'], correctIndices: [0, 1, 2, 3], explanation: '都是执行器相关。' },
      { id: 'a-mc-20', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是异步 IO？', options: ['网络', '文件', '标准输入输出', '管道'], correctIndices: [0, 1, 2, 3], explanation: '都是 IO 操作。' },
      { id: 'a-mc-21', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是异步网络？', options: ['TCP', 'UDP', 'Unix 套接字', 'HTTP'], correctIndices: [0, 1, 2], explanation: 'HTTP 是协议不是网络类型。' },
      { id: 'a-mc-22', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是异步文件？', options: ['读', '写', '目录', '元数据'], correctIndices: [0, 1, 2, 3], explanation: '都是文件操作。' },
      { id: 'a-mc-23', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是异步定时器？', options: ['sleep', 'interval', 'timeout', 'delay_for'], correctIndices: [0, 1, 2, 3], explanation: '都是定时器相关。' },
      { id: 'a-mc-24', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是异步通道？', options: ['mpsc', 'oneshot', 'broadcast', 'watch'], correctIndices: [0, 1, 2, 3], explanation: '都是异步通道。' },
      { id: 'a-mc-25', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是异步同步原语？', options: ['Mutex', 'RwLock', 'Semaphore', 'Barrier'], correctIndices: [0, 1, 2, 3], explanation: '都是异步同步原语。' },
    ]
  }
] as QuizModule[];


export const REFERENCE_DATA: ReferenceCategory[] = [
  {
    title: "关键字",
    items: [
      { keyword: "def", description: "定义函数。", code: "def add(x, y): return x + y" },
      { keyword: "class", description: "定义类。", code: "class User: pass" },
      { keyword: "import", description: "导入模块。", code: "import os" },
      { keyword: "from", description: "按名导入。", code: "from math import sqrt" },
      { keyword: "as", description: "别名。", code: "import numpy as np" },
      { keyword: "if/elif/else", description: "条件分支。", code: "if x > 0: ..." },
      { keyword: "for", description: "循环遍历。", code: "for x in items: ..." },
      { keyword: "while", description: "条件循环。", code: "while x < 10: ..." },
      { keyword: "try/except", description: "异常处理。", code: "try: ... except ValueError: ..." },
      { keyword: "with", description: "上下文管理。", code: "with open(path) as f: ..." },
      { keyword: "lambda", description: "匿名函数。", code: "lambda x: x * 2" },
      { keyword: "yield", description: "生成器返回。", code: "yield value" },
      { keyword: "global", description: "声明全局变量。" },
      { keyword: "nonlocal", description: "声明外层非全局变量。" }
    ]
  } as ReferenceCategory,
  {
    title: "内置函数",
    items: [
      { keyword: "len()", description: "获取长度。", code: "len([1,2,3])" },
      { keyword: "range()", description: "生成范围序列。", code: "range(0, 10)" },
      { keyword: "enumerate()", description: "带索引遍历。", code: "for i, v in enumerate(xs)" },
      { keyword: "zip()", description: "并行遍历。", code: "zip(a, b)" },
      { keyword: "sorted()", description: "排序并返回新列表。", code: "sorted(nums)" },
      { keyword: "map()", description: "映射函数。", code: "map(str, nums)" },
      { keyword: "filter()", description: "过滤元素。", code: "filter(fn, items)" },
      { keyword: "sum()", description: "求和。", code: "sum(nums)" },
      { keyword: "min()/max()", description: "最小/最大值。", code: "max(nums)" }
    ]
  } as ReferenceCategory,
  {
    title: "字符串方法",
    items: [
      { keyword: ".strip()", description: "去除首尾空白。", code: "s.strip()" },
      { keyword: ".split()", description: "分割字符串。", code: "s.split(',')" },
      { keyword: ".join()", description: "拼接字符串。", code: "','.join(items)" },
      { keyword: ".replace()", description: "替换子串。", code: "s.replace('a','b')" },
      { keyword: ".startswith()", description: "是否以某前缀开头。" },
      { keyword: ".endswith()", description: "是否以某后缀结尾。" }
    ]
  } as ReferenceCategory,
  {
    title: "列表方法",
    items: [
      { keyword: ".append()", description: "追加元素。", code: "lst.append(x)" },
      { keyword: ".extend()", description: "追加多个元素。", code: "lst.extend(xs)" },
      { keyword: ".insert()", description: "插入元素。", code: "lst.insert(0, x)" },
      { keyword: ".pop()", description: "弹出元素。", code: "lst.pop()" },
      { keyword: ".remove()", description: "删除首个匹配元素。", code: "lst.remove(x)" },
      { keyword: ".sort()", description: "原地排序。", code: "lst.sort()" }
    ]
  } as ReferenceCategory,
  {
    title: "字典方法",
    items: [
      { keyword: ".get()", description: "安全获取值。", code: "d.get('k', 0)" },
      { keyword: ".keys()/.values()", description: "获取键/值视图。" },
      { keyword: ".items()", description: "键值对遍历。", code: "for k, v in d.items()" },
      { keyword: ".update()", description: "更新字典。", code: "d.update(other)" },
      { keyword: "in", description: "判断键是否存在。", code: "'k' in d" }
    ]
  } as ReferenceCategory,
  {
    title: "集合方法",
    items: [
      { keyword: ".add()", description: "添加元素。", code: "s.add(x)" },
      { keyword: ".discard()", description: "删除元素（不存在不报错）。", code: "s.discard(x)" },
      { keyword: ".remove()", description: "删除元素（不存在报错）。", code: "s.remove(x)" },
      { keyword: ".union()", description: "并集。", code: "s.union(t)" },
      { keyword: ".intersection()", description: "交集。", code: "s.intersection(t)" }
    ]
  } as ReferenceCategory,
  {
    title: "文件与 I/O",
    items: [
      { keyword: "open()", description: "打开文件。", code: "with open(p) as f: ..." },
      { keyword: "read()/write()", description: "读取/写入文件。" },
      { keyword: "json", description: "JSON 编解码。", code: "json.dumps(obj)" },
      { keyword: "pathlib", description: "路径处理库。", code: "Path('a/b').exists()" }
    ]
  } as ReferenceCategory,
  {
    title: "虚拟环境与包管理",
    items: [
      { keyword: "python -m venv .venv", description: "创建虚拟环境。" },
      { keyword: "pip install", description: "安装依赖。" },
      { keyword: "pip list", description: "查看已安装包。" },
      { keyword: "pip freeze > requirements.txt", description: "导出依赖。" }
    ]
  } as ReferenceCategory
];

export const INTERVIEW_QUESTIONS: InterviewItem[] = [
  {
    id: 'i1',
    question: '⭐⭐⭐ Python 的垃圾回收机制是如何工作的？',
    answer: '【核心要点】\n• Python 使用引用计数和循环垃圾收集器\n• 引用计数自动管理内存，对象引用计数为0时立即释放\n• 循环垃圾收集器处理循环引用\n• 分代垃圾收集，提高效率\n\n【常见错误回答】\n❌ "Python 只有引用计数"\n❌ "垃圾回收会立即释放内存"\n\n【代码推理】\nimport gc\ngc.collect()  # 手动触发垃圾回收\n\n【追问】引用计数和循环垃圾收集的区别？何时需要手动 gc.collect()？',
    difficulty: '简单' as InterviewDifficulty,
    tags: ['内存管理', '核心概念', '必问']
  },
  {
    id: 'i2',
    question: '⭐⭐⭐ GIL（全局解释器锁）是什么？有什么影响？',
    answer: '【核心要点】\n• GIL 确保同一时刻只有一个线程执行 Python 字节码\n• 保护 Python 对象，防止竞争条件\n• 多线程在 CPU 密集型任务中性能受限\n• 多进程可以绕过 GIL 限制\n\n【常见错误回答】\n❌ "GIL 让 Python 无法多线程"\n❌ "移除 GIL 会让 Python 更快"\n\n【追问】为什么需要 GIL？如何绕过 GIL 的限制？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['并发', '性能', '核心概念']
  },
  {
    id: 'i3',
    question: '⭐⭐⭐ 列表和元组的区别是什么？',
    answer: '【核心要点】\n• 列表是可变的（mutable），元组是不可变的（immutable）\n• 列表使用方括号 []，元组使用圆括号 ()\n• 元组可以作为字典的键，列表不能\n• 元组性能略好，但差异通常可忽略\n\n【常见错误回答】\n❌ "元组比列表快很多"\n❌ "列表和元组可以互换使用"\n\n【代码推理】\nmy_list = [1, 2, 3]\nmy_list[0] = 10  # 可以修改\nmy_tuple = (1, 2, 3)\n# my_tuple[0] = 10  # 错误！元组不可变',
    difficulty: '简单' as InterviewDifficulty,
    tags: ['数据结构', '基础', '必问']
  },
  {
    id: 'i4',
    question: '⭐⭐⭐ Python 中可变对象和不可变对象的区别？',
    answer: '【核心要点】\n• 不可变对象：int, float, str, tuple, frozenset\n• 可变对象：list, dict, set\n• 不可变对象创建后不能修改\n• 可变对象可以修改，需要注意引用问题\n\n【常见错误回答】\n❌ "所有基本类型都是不可变的"\n❌ "字符串可以修改"\n\n【追问】为什么字符串是不可变的？这有什么好处？',
    difficulty: '简单' as InterviewDifficulty,
    tags: ['对象模型', '基础', '必问']
  },
  {
    id: 'i5',
    question: '⭐⭐⭐ Python 的装饰器是如何工作的？',
    answer: '【核心要点】\n• 装饰器是修改函数或类的函数\n• 使用 @ 语法糖简化装饰器应用\n• 装饰器本质上是高阶函数\n• 可以带参数，也可以嵌套使用\n\n【常见错误回答】\n❌ "装饰器只能用于函数"\n❌ "装饰器会改变原函数"\n\n【代码推理】\ndef decorator(func):\n    def wrapper(*args, **kwargs):\n        return func(*args, **kwargs)\n    return wrapper\n\n【追问】如何写一个带参数的装饰器？装饰器的执行顺序？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['高级特性', '函数式编程', '核心概念']
  },
  {
    id: 'i6',
    question: '⭐⭐ 生成器和迭代器的区别？',
    answer: '【核心要点】\n• 生成器是特殊的迭代器，使用 yield 关键字\n• 生成器是惰性求值，节省内存\n• 迭代器实现了 __iter__ 和 __next__ 方法\n• 生成器表达式比列表推导式更节省内存\n\n【常见错误回答】\n❌ "生成器和迭代器是一样的"\n❌ "生成器总是比列表快"\n\n【追问】什么时候用生成器？生成器表达式和列表推导式的区别？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['迭代器', '内存优化', '高级']
  },
  {
    id: 'i7',
    question: '⭐⭐ Python 的类型提示有什么实际价值？',
    answer: '【核心要点】\n• 提高可读性与可维护性\n• 支持静态检查（mypy/pyright）\n• 改善 IDE 自动补全与重构\n• 对运行时几乎无影响\n\n【常见错误回答】\n❌ \"类型提示会影响运行时性能\"\n❌ \"加了类型提示就不会有错误\"\n\n【追问】什么时候必须写类型提示？什么时候可以省略？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['类型提示', '工程实践', '基础']
  },
  {
    id: 'i8',
    question: '⭐⭐ Python 性能优化的常见手段？',
    answer: '【核心要点】\n• 使用内置库和数据结构（list/dict/set）\n• 选择合适算法与数据结构\n• 避免频繁创建临时对象\n• I/O 场景使用缓存与批量处理\n\n【常见错误回答】\n❌ \"只要用多线程就能变快\"\n❌ \"全部用 C 扩展就行\"\n\n【追问】GIL 对 CPU 密集型任务有什么影响？如何绕开？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['性能', '优化', '实践']
  },
  {
    id: 'i11',
    question: '⭐⭐ async/await 和线程有什么区别？',
    answer: '【核心要点】\n• async：协作式多任务，单线程可运行多个协程\n• 线程：抢占式，有上下文切换开销\n• async 适合 I/O 密集型任务\n• 线程适合 CPU 密集型任务\n\n【常见错误回答】\n❌ "async 比线程快"\n❌ "async 是多线程的语法糖"\n\n【代码推理】\nasync def fetch_data():\n    await asyncio.sleep(1)\n    return "data"\n\n【追问】协程是如何被调度的？什么是事件循环？',
    difficulty: '困难' as InterviewDifficulty,
    tags: ['异步', '并发', '高级']
  },
  {
    id: 'i9',
    question: '⭐⭐⭐ 深拷贝和浅拷贝的区别？',
    answer: '【核心要点】\n• 浅拷贝（copy）：只复制对象本身，不复制嵌套对象\n• 深拷贝（deepcopy）：递归复制所有嵌套对象\n• 浅拷贝中嵌套对象是共享的\n• 深拷贝创建完全独立的副本\n\n【常见错误回答】\n❌ "浅拷贝和深拷贝没有区别"\n❌ "列表的切片就是深拷贝"\n\n【代码推理】\nimport copy\nlist1 = [[1, 2], [3, 4]]\nlist2 = copy.copy(list1)  # 浅拷贝\nlist3 = copy.deepcopy(list1)  # 深拷贝\nlist2[0][0] = 99  # 会影响 list1\nlist3[0][0] = 88  # 不影响 list1\n\n【追问】什么时候用浅拷贝？什么时候用深拷贝？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['对象复制', '内存管理', '基础']
  },
  {
    id: 'i10',
    question: '⭐⭐⭐ Python 的作用域和命名空间？',
    answer: '【核心要点】\n• LEGB 规则：Local → Enclosing → Global → Built-in\n• 局部作用域：函数内部\n• 全局作用域：模块级别\n• 使用 global 和 nonlocal 修改外部变量\n\n【常见错误回答】\n❌ "函数内可以直接修改全局变量"\n❌ "所有变量都是全局的"\n\n【代码推理】\nx = 10  # 全局变量\ndef func():\n    global x\n    x = 20  # 修改全局变量\n\n【追问】nonlocal 和 global 的区别？闭包是如何工作的？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['作用域', '命名空间', '基础']
  },
  {
    id: 'i12',
    question: '⭐⭐⭐ 字典和集合的区别？',
    answer: '【核心要点】\n• 字典（dict）：键值对映射，键必须不可变\n• 集合（set）：无序、不重复的元素集合\n• 字典用于存储关联数据\n• 集合用于去重和集合运算\n\n【常见错误回答】\n❌ "字典和集合可以互换使用"\n❌ "集合可以存储可变对象"\n\n【代码推理】\nmy_dict = {"name": "Python", "version": 3.11}\nmy_set = {1, 2, 3, 3}  # {1, 2, 3}\n\n【追问】为什么字典的键必须是不可变的？frozenset 的作用？',
    difficulty: '简单' as InterviewDifficulty,
    tags: ['数据结构', '基础', '必问']
  },
  {
    id: 'i13',
    question: '⭐⭐⭐ 列表推导式和生成器表达式的区别？',
    answer: '【核心要点】\n• 列表推导式：立即计算，返回列表，占用内存\n• 生成器表达式：惰性计算，返回生成器，节省内存\n• 列表推导式用 []，生成器表达式用 ()\n• 生成器表达式适合大数据集\n\n【常见错误回答】\n❌ "生成器表达式总是更快"\n❌ "列表推导式和生成器表达式没有区别"\n\n【代码推理】\n# 列表推导式\nsquares = [x**2 for x in range(10)]  # 立即计算\n# 生成器表达式\nsquares_gen = (x**2 for x in range(10))  # 惰性计算\n\n【追问】什么时候用列表推导式？什么时候用生成器表达式？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['推导式', '内存优化', '高级']
  },
  {
    id: 'i14',
    question: '⭐⭐ *args 和 **kwargs 的作用？',
    answer: '【核心要点】\n• *args：接收任意数量的位置参数，打包成元组\n• **kwargs：接收任意数量的关键字参数，打包成字典\n• 可以同时使用，但顺序必须是 *args 在前\n• 用于编写灵活的函数接口\n\n【常见错误回答】\n❌ "*args 和 **kwargs 是固定名称"\n❌ "只能使用 args 和 kwargs 这两个名字"\n\n【代码推理】\ndef func(*args, **kwargs):\n    print(f"位置参数: {args}")\n    print(f"关键字参数: {kwargs}")\nfunc(1, 2, 3, a=4, b=5)\n\n【追问】如何解包 *args 和 **kwargs？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['函数参数', '高级特性', '基础']
  },
  {
    id: 'i15',
    question: '⭐⭐ Python 的上下文管理器（with 语句）？',
    answer: '【核心要点】\n• with 语句自动管理资源，确保资源正确释放\n• 实现 __enter__ 和 __exit__ 方法\n• 即使发生异常也会调用 __exit__\n• 使用 contextlib 可以简化实现\n\n【常见错误回答】\n❌ "with 语句只能用于文件操作"\n❌ "with 语句不会处理异常"\n\n【代码推理】\nwith open("file.txt", "r") as f:\n    content = f.read()\n# 文件自动关闭\n\n【追问】如何自定义上下文管理器？contextlib.contextmanager 的作用？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['资源管理', '异常处理', '高级']
  },
  {
    id: 'i16',
    question: '⭐⭐ Python 的类方法和静态方法？',
    answer: '【核心要点】\n• @classmethod：第一个参数是类本身（cls）\n• @staticmethod：不需要 self 或 cls 参数\n• 类方法可以访问类属性，静态方法不能\n• 类方法常用于替代构造函数\n\n【常见错误回答】\n❌ "类方法和静态方法没有区别"\n❌ "静态方法可以访问实例属性"\n\n【代码推理】\nclass MyClass:\n    @classmethod\n    def class_method(cls):\n        return cls\n    @staticmethod\n    def static_method():\n        return "static"\n\n【追问】什么时候用类方法？什么时候用静态方法？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['面向对象', '方法类型', '基础']
  },
  {
    id: 'i17',
    question: '⭐⭐ Python 的魔术方法（特殊方法）？',
    answer: '【核心要点】\n• __init__：构造函数，初始化对象\n• __str__：用户友好的字符串表示\n• __repr__：开发者友好的字符串表示\n• __len__、__getitem__ 等：自定义容器行为\n\n【常见错误回答】\n❌ "__str__ 和 __repr__ 没有区别"\n❌ "魔术方法可以随意命名"\n\n【代码推理】\nclass Point:\n    def __init__(self, x, y):\n        self.x, self.y = x, y\n    def __str__(self):\n        return f"Point({self.x}, {self.y})"\n\n【追问】__str__ 和 __repr__ 的区别？什么时候需要实现 __eq__？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['面向对象', '特殊方法', '高级']
  },
  {
    id: 'i18',
    question: '⭐⭐ Python 的异常处理机制？',
    answer: '【核心要点】\n• try/except：捕获和处理异常\n• else：没有异常时执行\n• finally：无论是否异常都会执行\n• raise：主动抛出异常\n\n【常见错误回答】\n❌ "except 可以捕获所有错误"\n❌ "finally 中的代码不会执行"\n\n【代码推理】\ntry:\n    result = 10 / 0\nexcept ZeroDivisionError:\n    print("除零错误")\nelse:\n    print("没有异常")\nfinally:\n    print("总是执行")\n\n【追问】如何自定义异常？异常链是什么？',
    difficulty: '简单' as InterviewDifficulty,
    tags: ['异常处理', '基础', '必问']
  },
  {
    id: 'i19',
    question: '⭐⭐ Python 的模块和包？',
    answer: '【核心要点】\n• 模块：单个 .py 文件\n• 包：包含 __init__.py 的目录\n• import 导入模块，from...import 导入特定内容\n• __name__ == "__main__" 用于模块测试\n\n【常见错误回答】\n❌ "包必须有 __init__.py"\n❌ "import 会执行模块中的所有代码"\n\n【代码推理】\n# 模块 mymodule.py\n# 包 mypackage/\n#   __init__.py\n#   module1.py\nimport mypackage.module1\nfrom mypackage import module1\n\n【追问】相对导入和绝对导入的区别？__all__ 的作用？',
    difficulty: '简单' as InterviewDifficulty,
    tags: ['模块系统', '包管理', '基础']
  },
  {
    id: 'i20',
    question: '⭐⭐ Python 的闭包是什么？',
    answer: '【核心要点】\n• 闭包：内部函数可以访问外部函数的变量\n• 即使外部函数执行完毕，闭包仍可访问外部变量\n• 闭包常用于装饰器和函数工厂\n• 注意闭包中的变量绑定问题\n\n【常见错误回答】\n❌ "闭包只能访问全局变量"\n❌ "闭包中的变量总是最新的值"\n\n【代码推理】\ndef outer(x):\n    def inner(y):\n        return x + y\n    return inner\nfunc = outer(10)\nprint(func(5))  # 15\n\n【追问】闭包中的变量绑定问题？如何避免？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['闭包', '函数式编程', '高级']
  },
  {
    id: 'i21',
    question: '⭐⭐⭐ Python 的 lambda 函数？',
    answer: '【核心要点】\n• lambda 是匿名函数，用于简单的一行函数\n• 语法：lambda 参数: 表达式\n• 只能包含表达式，不能包含语句\n• 常用于 map、filter、sorted 等函数\n\n【常见错误回答】\n❌ "lambda 可以替代所有函数"\n❌ "lambda 比普通函数快"\n\n【代码推理】\nadd = lambda x, y: x + y\nnumbers = [1, 2, 3, 4]\nsquared = list(map(lambda x: x**2, numbers))\n\n【追问】什么时候用 lambda？什么时候用普通函数？',
    difficulty: '简单' as InterviewDifficulty,
    tags: ['lambda', '函数式编程', '基础']
  },
  {
    id: 'i22',
    question: '⭐⭐ Python 的切片操作？',
    answer: '【核心要点】\n• 语法：sequence[start:stop:step]\n• start：起始索引（包含）\n• stop：结束索引（不包含）\n• step：步长，可以为负数\n• 切片返回新对象，不修改原对象\n\n【常见错误回答】\n❌ "切片会修改原对象"\n❌ "负数索引不能用于切片"\n\n【代码推理】\nmy_list = [0, 1, 2, 3, 4, 5]\nprint(my_list[1:4])  # [1, 2, 3]\nprint(my_list[::-1])  # 反转\nprint(my_list[::2])  # 步长为2\n\n【追问】切片和索引的区别？如何实现自定义切片的类？',
    difficulty: '简单' as InterviewDifficulty,
    tags: ['切片', '序列操作', '基础']
  },
  {
    id: 'i23',
    question: '⭐⭐ Python 的字符串格式化？',
    answer: '【核心要点】\n• % 格式化：旧式格式化方法\n• str.format()：Python 2.7+ 的方法\n• f-string：Python 3.6+ 的现代方法，推荐使用\n• f-string 性能最好，可读性最强\n\n【常见错误回答】\n❌ "所有格式化方法性能相同"\n❌ "f-string 不安全"\n\n【代码推理】\nname = "Python"\nversion = 3.11\n# f-string（推荐）\nf"语言: {name}, 版本: {version}"\n# format\n"语言: {}, 版本: {}".format(name, version)\n\n【追问】f-string 和 format 的区别？什么时候用 % 格式化？',
    difficulty: '简单' as InterviewDifficulty,
    tags: ['字符串', '格式化', '基础']
  },
  {
    id: 'i24',
    question: '⭐⭐ Python 的 property 装饰器？',
    answer: '【核心要点】\n• @property：将方法转换为属性访问\n• 可以定义 getter、setter、deleter\n• 提供更优雅的接口，隐藏实现细节\n• 支持属性验证和计算属性\n\n【常见错误回答】\n❌ "property 只能用于只读属性"\n❌ "property 会改变方法的性能"\n\n【代码推理】\nclass Circle:\n    def __init__(self, radius):\n        self._radius = radius\n    @property\n    def radius(self):\n        return self._radius\n    @radius.setter\n    def radius(self, value):\n        if value < 0:\n            raise ValueError("半径不能为负")\n        self._radius = value\n\n【追问】property 和直接访问属性的区别？何时使用？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['装饰器', '面向对象', '高级']
  },
  {
    id: 'i25',
    question: '⭐⭐ Python 的继承和多态？',
    answer: '【核心要点】\n• 继承：子类继承父类的属性和方法\n• 多态：同一接口可以有不同的实现\n• 方法重写：子类可以覆盖父类方法\n• super() 调用父类方法\n\n【常见错误回答】\n❌ "Python 不支持多继承"\n❌ "重写方法必须保持完全相同的签名"\n\n【代码推理】\nclass Animal:\n    def speak(self):\n        return "声音"\nclass Dog(Animal):\n    def speak(self):\n        return "汪汪"\n\n【追问】多继承的 MRO（方法解析顺序）？super() 的工作原理？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['面向对象', '继承', '基础']
  },
  {
    id: 'i26',
    question: '⭐⭐ Python 的抽象基类（ABC）？',
    answer: '【核心要点】\n• abc.ABC：抽象基类基类\n• @abc.abstractmethod：抽象方法装饰器\n• 不能直接实例化抽象类\n• 子类必须实现所有抽象方法\n\n【常见错误回答】\n❌ "抽象类可以实例化"\n❌ "抽象方法可以有实现"\n\n【代码推理】\nfrom abc import ABC, abstractmethod\nclass Shape(ABC):\n    @abstractmethod\n    def area(self):\n        pass\nclass Circle(Shape):\n    def area(self):\n        return 3.14 * self.radius**2\n\n【追问】抽象基类和普通基类的区别？何时使用？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['面向对象', '抽象类', '高级']
  },
  {
    id: 'i27',
    question: '⭐⭐ Python 的枚举（Enum）？',
    answer: '【核心要点】\n• enum.Enum：创建枚举类型\n• 枚举成员是常量，不可修改\n• 可以使用名称或值访问\n• 适合表示固定集合的值\n\n【常见错误回答】\n❌ "枚举成员可以修改"\n❌ "枚举和常量没有区别"\n\n【代码推理】\nfrom enum import Enum\nclass Color(Enum):\n    RED = 1\n    GREEN = 2\n    BLUE = 3\nprint(Color.RED)  # Color.RED\nprint(Color.RED.value)  # 1\n\n【追问】枚举和普通常量的区别？何时使用枚举？',
    difficulty: '简单' as InterviewDifficulty,
    tags: ['枚举', '类型系统', '基础']
  },
  {
    id: 'i28',
    question: '⭐⭐ Python 的正则表达式？',
    answer: '【核心要点】\n• re 模块提供正则表达式功能\n• compile() 预编译提高性能\n• match() 从开头匹配，search() 搜索\n• findall() 查找所有匹配，sub() 替换\n\n【常见错误回答】\n❌ "match 和 search 没有区别"\n❌ "正则表达式总是最快的匹配方法"\n\n【代码推理】\nimport re\npattern = r"\\d+"\ntext = "我有3个苹果和5个橙子"\nmatches = re.findall(pattern, text)  # ["3", "5"]\n\n【追问】贪婪匹配和非贪婪匹配的区别？如何优化正则表达式性能？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['正则表达式', '字符串处理', '高级']
  },
  {
    id: 'i29',
    question: '⭐⭐ Python 的文件操作？',
    answer: '【核心要点】\n• open() 打开文件，with 语句自动关闭\n• 模式：r（读）、w（写）、a（追加）、b（二进制）\n• read() 读取全部，readline() 读取一行\n• write() 写入，注意编码问题\n\n【常见错误回答】\n❌ "文件操作不需要关闭"\n❌ "所有文件都是文本文件"\n\n【代码推理】\nwith open("file.txt", "r", encoding="utf-8") as f:\n    content = f.read()\nwith open("output.txt", "w") as f:\n    f.write("Hello")\n\n【追问】文本模式和二进制模式的区别？如何处理大文件？',
    difficulty: '简单' as InterviewDifficulty,
    tags: ['文件操作', 'I/O', '基础']
  },
  {
    id: 'i30',
    question: '⭐⭐ Python 的 JSON 处理？',
    answer: '【核心要点】\n• json 模块用于 JSON 序列化和反序列化\n• json.dumps() 将对象转为 JSON 字符串\n• json.loads() 将 JSON 字符串转为对象\n• json.dump() 和 json.load() 用于文件操作\n\n【常见错误回答】\n❌ "JSON 和 Python 字典完全一样"\n❌ "所有 Python 对象都可以序列化为 JSON"\n\n【代码推理】\nimport json\ndata = {"name": "Python", "version": 3.11}\njson_str = json.dumps(data)\nparsed = json.loads(json_str)\n\n【追问】哪些类型不能直接序列化为 JSON？如何处理自定义对象？',
    difficulty: '简单' as InterviewDifficulty,
    tags: ['JSON', '数据序列化', '基础']
  },
  {
    id: 'i31',
    question: '⭐⭐ Python 的日期时间处理？',
    answer: '【核心要点】\n• datetime 模块提供日期时间功能\n• datetime.now() 获取当前时间\n• strftime() 格式化输出，strptime() 解析字符串\n• timedelta 用于时间计算\n\n【常见错误回答】\n❌ "时间戳和 datetime 对象没有区别"\n❌ "所有时区都是 UTC"\n\n【代码推理】\nfrom datetime import datetime, timedelta\nnow = datetime.now()\nfuture = now + timedelta(days=7)\nformatted = now.strftime("%Y-%m-%d %H:%M:%S")\n\n【追问】如何处理时区？time 和 datetime 的区别？',
    difficulty: '简单' as InterviewDifficulty,
    tags: ['日期时间', '标准库', '基础']
  },
  {
    id: 'i32',
    question: '⭐⭐ Python 的集合运算？',
    answer: '【核心要点】\n• 并集：union() 或 |\n• 交集：intersection() 或 &\n• 差集：difference() 或 -\n• 对称差集：symmetric_difference() 或 ^\n\n【常见错误回答】\n❌ "集合运算会修改原集合"\n❌ "所有集合运算都返回新集合"\n\n【代码推理】\nset1 = {1, 2, 3}\nset2 = {3, 4, 5}\nunion = set1 | set2  # {1, 2, 3, 4, 5}\nintersection = set1 & set2  # {3}\n\n【追问】集合的更新方法和运算符的区别？何时使用？',
    difficulty: '简单' as InterviewDifficulty,
    tags: ['集合', '数据结构', '基础']
  },
  {
    id: 'i33',
    question: '⭐⭐ Python 的 collections 模块？',
    answer: '【核心要点】\n• defaultdict：自动创建默认值的字典\n• Counter：计数器，统计元素出现次数\n• deque：双端队列，高效的两端操作\n• namedtuple：命名元组，增强可读性\n\n【常见错误回答】\n❌ "collections 是第三方库"\n❌ "defaultdict 和普通字典没有区别"\n\n【代码推理】\nfrom collections import defaultdict, Counter, deque\ndd = defaultdict(list)\ndd["key"].append("value")\ncounter = Counter("hello")  # {"h":1, "e":1, "l":2, "o":1}\n\n【追问】何时使用 defaultdict？Counter 的优势？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['collections', '标准库', '数据结构']
  },
  {
    id: 'i34',
    question: '⭐⭐ Python 的 itertools 模块？',
    answer: '【核心要点】\n• itertools 提供高效的迭代器工具\n• chain() 连接多个迭代器\n• cycle() 无限循环迭代器\n• combinations() 和 permutations() 组合排列\n• groupby() 分组相邻元素\n\n【常见错误回答】\n❌ "itertools 会立即计算所有结果"\n❌ "itertools 比普通循环慢"\n\n【代码推理】\nfrom itertools import chain, cycle, combinations\nlist(chain([1, 2], [3, 4]))  # [1, 2, 3, 4]\nlist(combinations([1, 2, 3], 2))  # [(1,2), (1,3), (2,3)]\n\n【追问】何时使用 itertools？如何避免内存问题？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['itertools', '标准库', '迭代器']
  },
  {
    id: 'i35',
    question: '⭐⭐ Python 的线程和进程？',
    answer: '【核心要点】\n• threading：多线程，受 GIL 限制\n• multiprocessing：多进程，绕过 GIL\n• 线程适合 I/O 密集型，进程适合 CPU 密集型\n• 使用 Queue 进行线程/进程间通信\n\n【常见错误回答】\n❌ "多线程总是比单线程快"\n❌ "进程间通信很复杂"\n\n【代码推理】\nimport threading\nimport multiprocessing\n# 线程\ndef worker():\n    print("线程工作")\nthread = threading.Thread(target=worker)\nthread.start()\n\n【追问】GIL 对多线程的影响？何时用多进程？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['并发', '多线程', '多进程']
  },
  {
    id: 'i36',
    question: '⭐⭐ Python 的协程和 asyncio？',
    answer: '【核心要点】\n• async/await 定义协程\n• asyncio 提供事件循环和异步工具\n• 协程是协作式多任务，单线程\n• 适合 I/O 密集型任务，提高并发性能\n\n【常见错误回答】\n❌ "协程就是多线程"\n❌ "async 函数总是异步执行"\n\n【代码推理】\nimport asyncio\nasync def fetch_data():\n    await asyncio.sleep(1)\n    return "data"\nasyncio.run(fetch_data())\n\n【追问】协程和生成器的关系？如何并发执行多个协程？',
    difficulty: '困难' as InterviewDifficulty,
    tags: ['异步', '协程', 'asyncio']
  },
  {
    id: 'i37',
    question: '⭐⭐ Python 的元类（metaclass）？',
    answer: '【核心要点】\n• 元类是类的类，用于创建类\n• type 是默认元类\n• 可以自定义元类控制类的创建\n• 常用于框架和 ORM\n\n【常见错误回答】\n❌ "元类就是继承"\n❌ "普通开发需要经常使用元类"\n\n【代码推理】\nclass Meta(type):\n    def __new__(cls, name, bases, attrs):\n        return super().__new__(cls, name, bases, attrs)\nclass MyClass(metaclass=Meta):\n    pass\n\n【追问】何时使用元类？元类和装饰器的区别？',
    difficulty: '困难' as InterviewDifficulty,
    tags: ['元类', '元编程', '高级']
  },
  {
    id: 'i38',
    question: '⭐⭐ Python 的描述符（descriptor）？',
    answer: '【核心要点】\n• 描述符实现 __get__、__set__、__delete__\n• property 是描述符的实现\n• 用于控制属性访问\n• 支持数据验证和计算属性\n\n【常见错误回答】\n❌ "描述符只能用于类属性"\n❌ "property 不是描述符"\n\n【代码推理】\nclass Descriptor:\n    def __get__(self, obj, objtype=None):\n        return self.value\n    def __set__(self, obj, value):\n        self.value = value\n\n【追问】描述符和 property 的关系？何时使用描述符？',
    difficulty: '困难' as InterviewDifficulty,
    tags: ['描述符', '属性访问', '高级']
  },
  {
    id: 'i39',
    question: '⭐⭐ Python 的弱引用（weakref）？',
    answer: '【核心要点】\n• weakref 创建对象的弱引用\n• 弱引用不增加引用计数\n• 对象被回收时，弱引用自动失效\n• 用于缓存和循环引用场景\n\n【常见错误回答】\n❌ "弱引用和普通引用没有区别"\n❌ "弱引用会阻止对象被回收"\n\n【代码推理】\nimport weakref\nclass MyClass:\n    pass\nobj = MyClass()\nref = weakref.ref(obj)\ndel obj  # 对象被回收\nprint(ref())  # None\n\n【追问】何时使用弱引用？WeakValueDictionary 的作用？',
    difficulty: '困难' as InterviewDifficulty,
    tags: ['弱引用', '内存管理', '高级']
  },
  {
    id: 'i40',
    question: '⭐⭐ Python 的单元测试？',
    answer: '【核心要点】\n• unittest 是标准库的测试框架\n• pytest 是更现代的第三方测试框架\n• 使用 assert 进行断言\n• setUp 和 tearDown 用于测试前后准备\n\n【常见错误回答】\n❌ "测试代码不需要维护"\n❌ "一个测试可以测试所有功能"\n\n【代码推理】\nimport unittest\nclass TestMath(unittest.TestCase):\n    def test_add(self):\n        self.assertEqual(1 + 1, 2)\n\n【追问】如何编写好的测试？mock 的作用？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['测试', 'unittest', 'pytest']
  },
  {
    id: 'i41',
    question: '⭐⭐ Python 的日志记录（logging）？',
    answer: '【核心要点】\n• logging 模块提供日志功能\n• 日志级别：DEBUG、INFO、WARNING、ERROR、CRITICAL\n• 可以配置多个处理器（handler）\n• 支持文件和控制台输出\n\n【常见错误回答】\n❌ "print 可以替代 logging"\n❌ "所有日志都应该输出"\n\n【代码推理】\nimport logging\nlogging.basicConfig(level=logging.INFO)\nlogging.info("信息")\nlogging.error("错误")\n\n【追问】如何配置日志格式？何时使用不同日志级别？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['日志', 'logging', '调试']
  },
  {
    id: 'i42',
    question: '⭐⭐ Python 的包管理（pip）？',
    answer: '【核心要点】\n• pip 是 Python 的包管理器\n• requirements.txt 记录依赖\n• virtualenv 创建虚拟环境\n• pip install、pip uninstall、pip list 常用命令\n\n【常见错误回答】\n❌ "所有包都安装在全局"\n❌ "requirements.txt 不需要版本号"\n\n【代码推理】\n# requirements.txt\nrequests==2.28.0\nnumpy>=1.20.0\n\n# 安装\npip install -r requirements.txt\n\n【追问】虚拟环境的作用？如何管理依赖版本？',
    difficulty: '简单' as InterviewDifficulty,
    tags: ['包管理', 'pip', '虚拟环境']
  },
  {
    id: 'i43',
    question: '⭐⭐ Python 的类型提示（typing）？',
    answer: '【核心要点】\n• typing 模块提供类型提示\n• 类型提示不影响运行时，仅用于静态检查\n• 支持 List、Dict、Tuple 等泛型\n• mypy 等工具进行类型检查\n\n【常见错误回答】\n❌ "类型提示会影响性能"\n❌ "Python 是静态类型语言"\n\n【代码推理】\nfrom typing import List, Dict\ndef process(items: List[str]) -> Dict[str, int]:\n    return {item: len(item) for item in items}\n\n【追问】类型提示的好处？如何为复杂类型添加提示？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['类型提示', 'typing', '代码质量']
  },
  {
    id: 'i44',
    question: '⭐⭐ Python 的数据类（dataclass）？',
    answer: '【核心要点】\n• @dataclass 装饰器自动生成特殊方法\n• 自动生成 __init__、__repr__、__eq__ 等\n• 支持默认值和类型提示\n• 减少样板代码\n\n【常见错误回答】\n❌ "dataclass 只能用于简单类"\n❌ "dataclass 会改变类的行为"\n\n【代码推理】\nfrom dataclasses import dataclass\n@dataclass\nclass Point:\n    x: int\n    y: int\n    z: int = 0\n\n【追问】dataclass 和普通类的区别？何时使用？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['dataclass', 'Python 3.7+', '面向对象']
  },
  {
    id: 'i45',
    question: '⭐⭐ Python 的路径操作（pathlib）？',
    answer: '【核心要点】\n• pathlib 提供面向对象的路径操作\n• Path 类替代 os.path\n• 支持跨平台路径处理\n• 更直观和易用\n\n【常见错误回答】\n❌ "pathlib 比 os.path 慢"\n❌ "pathlib 只能用于文件路径"\n\n【代码推理】\nfrom pathlib import Path\npath = Path("data/file.txt")\ncontent = path.read_text()\npath.parent.mkdir(parents=True, exist_ok=True)\n\n【追问】pathlib 和 os.path 的区别？何时使用？',
    difficulty: '简单' as InterviewDifficulty,
    tags: ['pathlib', '文件路径', '标准库']
  },
  {
    id: 'i46',
    question: '⭐⭐ Python 的上下文变量（contextvars）？',
    answer: '【核心要点】\n• contextvars 用于异步上下文中的变量\n• ContextVar 创建上下文变量\n• 每个协程有独立的上下文\n• 用于传递请求上下文等场景\n\n【常见错误回答】\n❌ "contextvars 和全局变量一样"\n❌ "contextvars 只能用于异步"\n\n【代码推理】\nfrom contextvars import ContextVar\nrequest_id = ContextVar("request_id")\nrequest_id.set("123")\nprint(request_id.get())\n\n【追问】contextvars 和 threading.local 的区别？何时使用？',
    difficulty: '困难' as InterviewDifficulty,
    tags: ['contextvars', '异步', '上下文']
  },
  {
    id: 'i47',
    question: '⭐⭐ Python 的协议（Protocol）？',
    answer: '【核心要点】\n• Protocol 定义结构化的接口\n• 支持鸭子类型（duck typing）\n• 不需要显式继承\n• 用于类型检查和文档\n\n【常见错误回答】\n❌ "Protocol 和 ABC 一样"\n❌ "Protocol 会影响运行时"\n\n【代码推理】\nfrom typing import Protocol\nclass Drawable(Protocol):\n    def draw(self) -> None: ...\n\ndef render(obj: Drawable):\n    obj.draw()\n\n【追问】Protocol 和 ABC 的区别？何时使用？',
    difficulty: '困难' as InterviewDifficulty,
    tags: ['Protocol', '类型系统', 'Python 3.8+']
  },
  {
    id: 'i48',
    question: '⭐⭐ Python 的 match/case 语句？',
    answer: '【核心要点】\n• match/case 是 Python 3.10+ 的模式匹配\n• 类似 switch 但更强大\n• 支持模式匹配和值绑定\n• 可以匹配类型、值、结构等\n\n【常见错误回答】\n❌ "match/case 就是 switch"\n❌ "所有 Python 版本都支持"\n\n【代码推理】\nmatch value:\n    case 1:\n        print("一")\n    case [x, y]:\n        print(f"列表: {x}, {y}")\n    case _:\n        print("其他")\n\n【追问】match/case 和 if/elif 的区别？何时使用？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['match/case', 'Python 3.10+', '模式匹配']
  },
  {
    id: 'i49',
    question: '⭐⭐ Python 的性能优化技巧？',
    answer: '【核心要点】\n• 使用列表推导式替代循环\n• 避免全局变量查找\n• 使用局部变量缓存\n• 选择合适的数据结构\n• 使用生成器节省内存\n\n【常见错误回答】\n❌ "Python 无法优化性能"\n❌ "所有优化都会降低可读性"\n\n【代码推理】\n# 慢\nresult = []\nfor i in range(1000):\n    result.append(i * 2)\n# 快\nresult = [i * 2 for i in range(1000)]\n\n【追问】如何分析代码性能？常用的优化工具？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['性能优化', '最佳实践', '高级']
  },
  {
    id: 'i50',
    question: '⭐⭐ Python 的 Web 框架（Flask/Django）？',
    answer: '【核心要点】\n• Flask：轻量级微框架，灵活\n• Django：全功能框架，包含 ORM、admin 等\n• Flask 适合小型项目，Django 适合大型项目\n• 两者都支持 RESTful API 开发\n\n【常见错误回答】\n❌ "Flask 和 Django 功能相同"\n❌ "Django 比 Flask 快"\n\n【代码推理】\n# Flask\nfrom flask import Flask\napp = Flask(__name__)\n@app.route("/")\ndef hello():\n    return "Hello"\n\n【追问】如何选择框架？Flask 和 Django 的适用场景？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['Web开发', 'Flask', 'Django']
  },
  {
    id: 'i51',
    question: '⭐⭐ Python 的数据库操作（ORM）？',
    answer: '【核心要点】\n• ORM（对象关系映射）简化数据库操作\n• SQLAlchemy 是流行的 Python ORM\n• Django ORM 是 Django 框架的一部分\n• ORM 将数据库表映射为 Python 类\n\n【常见错误回答】\n❌ "ORM 总是比 SQL 慢"\n❌ "ORM 可以处理所有数据库操作"\n\n【代码推理】\nfrom sqlalchemy import create_engine\nfrom sqlalchemy.orm import sessionmaker\n# 定义模型、创建会话、查询数据\n\n【追问】ORM 的优缺点？何时使用原生 SQL？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['数据库', 'ORM', 'SQLAlchemy']
  },
  {
    id: 'i52',
    question: '⭐⭐ Python 的 RESTful API 设计？',
    answer: '【核心要点】\n• REST 是一种架构风格\n• 使用 HTTP 方法：GET、POST、PUT、DELETE\n• 资源用 URL 表示\n• 状态码表示操作结果\n\n【常见错误回答】\n❌ "所有 HTTP 方法都可以用于任何操作"\n❌ "REST 和 RPC 没有区别"\n\n【代码推理】\nGET /api/users      # 获取用户列表\nPOST /api/users     # 创建用户\nGET /api/users/1    # 获取特定用户\nPUT /api/users/1    # 更新用户\n\n【追问】RESTful API 的最佳实践？如何设计资源结构？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['API设计', 'REST', 'Web开发']
  },
  {
    id: 'i53',
    question: '⭐⭐ Python 的数据科学库（NumPy/Pandas）？',
    answer: '【核心要点】\n• NumPy：数值计算，多维数组\n• Pandas：数据分析，DataFrame\n• 两者都基于 C 实现，性能优秀\n• 是数据科学和机器学习的基石\n\n【常见错误回答】\n❌ "NumPy 和 Pandas 功能重复"\n❌ "Pandas 只能处理表格数据"\n\n【代码推理】\nimport numpy as np\nimport pandas as pd\narr = np.array([1, 2, 3])\ndf = pd.DataFrame({"A": [1, 2], "B": [3, 4]})\n\n【追问】NumPy 和 Pandas 的关系？如何选择使用？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['数据科学', 'NumPy', 'Pandas']
  },
  {
    id: 'i54',
    question: '⭐⭐ Python 的机器学习（scikit-learn）？',
    answer: '【核心要点】\n• scikit-learn 是机器学习库\n• 提供分类、回归、聚类等算法\n• 统一的 API 设计\n• 包含数据预处理和模型评估工具\n\n【常见错误回答】\n❌ "scikit-learn 包含深度学习"\n❌ "所有机器学习任务都用 scikit-learn"\n\n【代码推理】\nfrom sklearn.model_selection import train_test_split\nfrom sklearn.ensemble import RandomForestClassifier\n# 数据分割、模型训练、预测\n\n【追问】scikit-learn 的适用场景？如何评估模型性能？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['机器学习', 'scikit-learn', '数据科学']
  },
  {
    id: 'i55',
    question: '⭐⭐ Python 的爬虫（requests/BeautifulSoup）？',
    answer: '【核心要点】\n• requests 用于 HTTP 请求\n• BeautifulSoup 用于 HTML 解析\n• Scrapy 是完整的爬虫框架\n• 需要遵守 robots.txt 和网站规则\n\n【常见错误回答】\n❌ "爬虫可以爬取任何网站"\n❌ "requests 可以解析 HTML"\n\n【代码推理】\nimport requests\nfrom bs4 import BeautifulSoup\nresponse = requests.get(url)\nsoup = BeautifulSoup(response.text, "html.parser")\n\n【追问】爬虫的合法性？如何避免被封？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['爬虫', 'requests', 'BeautifulSoup']
  },
  {
    id: 'i56',
    question: '⭐⭐ Python 的代码质量工具？',
    answer: '【核心要点】\n• pylint：代码检查工具\n• flake8：代码风格检查\n• black：代码自动格式化\n• mypy：类型检查\n• pytest：测试框架\n\n【常见错误回答】\n❌ "代码质量工具不重要"\n❌ "所有工具功能相同"\n\n【代码推理】\n# pylint: 检查代码质量问题\n# flake8: 检查 PEP 8 风格\n# black: 自动格式化代码\n# mypy: 类型检查\n\n【追问】如何建立代码质量检查流程？CI/CD 集成？',
    difficulty: '简单' as InterviewDifficulty,
    tags: ['代码质量', '工具', '最佳实践']
  },
  {
    id: 'i57',
    question: '⭐⭐ Python 的设计模式？',
    answer: '【核心要点】\n• 单例模式：确保类只有一个实例\n• 工厂模式：创建对象的接口\n• 观察者模式：对象间的通知机制\n• Python 的动态特性简化了模式实现\n\n【常见错误回答】\n❌ "设计模式在所有语言中实现方式相同"\n❌ "Python 不需要设计模式"\n\n【代码推理】\n# 单例模式\nclass Singleton:\n    _instance = None\n    def __new__(cls):\n        if cls._instance is None:\n            cls._instance = super().__new__(cls)\n        return cls._instance\n\n【追问】Python 中常用的设计模式？何时使用？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['设计模式', '最佳实践', '架构']
  },
  {
    id: 'i58',
    question: '⭐⭐ Python 的安全最佳实践？',
    answer: '【核心要点】\n• 避免 eval() 和 exec() 执行用户输入\n• 使用参数化查询防止 SQL 注入\n• 验证和清理用户输入\n• 使用 HTTPS 传输敏感数据\n• 定期更新依赖包\n\n【常见错误回答】\n❌ "Python 代码天然安全"\n❌ "eval() 可以安全使用"\n\n【代码推理】\n# 危险\ncode = input()\neval(code)  # 可能执行恶意代码\n# 安全\n# 验证输入、使用安全函数\n\n【追问】常见的 Python 安全漏洞？如何防护？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['安全', '最佳实践', 'Web安全']
  },
  {
    id: 'i59',
    question: '⭐⭐ Python 的并发编程最佳实践？',
    answer: '【核心要点】\n• 理解 GIL 的限制\n• I/O 密集型用多线程或异步\n• CPU 密集型用多进程\n• 使用线程池和进程池管理资源\n• 注意线程安全（锁、队列）\n\n【常见错误回答】\n❌ "多线程总是比单线程快"\n❌ "并发和并行没有区别"\n\n【代码推理】\nfrom concurrent.futures import ThreadPoolExecutor\nwith ThreadPoolExecutor() as executor:\n    results = executor.map(func, data)\n\n【追问】如何选择并发方式？如何避免竞态条件？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['并发', '多线程', '多进程']
  },
  {
    id: 'i60',
    question: '⭐⭐ Python 的缓存机制？',
    answer: '【核心要点】\n• functools.lru_cache 提供缓存装饰器\n• 缓存函数结果，避免重复计算\n• maxsize 参数控制缓存大小\n• 适合纯函数和计算密集型函数\n\n【常见错误回答】\n❌ "缓存可以用于所有函数"\n❌ "缓存大小越大越好"\n\n【代码推理】\nfrom functools import lru_cache\n@lru_cache(maxsize=128)\ndef fibonacci(n):\n    if n < 2:\n        return n\n    return fibonacci(n-1) + fibonacci(n-2)\n\n【追问】何时使用缓存？如何避免缓存问题？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['缓存', '性能优化', 'functools']
  },
  {
    id: 'i61',
    question: '⭐⭐ Python 的 partial 函数？',
    answer: '【核心要点】\n• functools.partial 创建偏函数\n• 固定函数的部分参数\n• 创建新的函数对象\n• 用于函数式编程和回调\n\n【常见错误回答】\n❌ "partial 会修改原函数"\n❌ "partial 只能用于固定位置参数"\n\n【代码推理】\nfrom functools import partial\ndef multiply(x, y):\n    return x * y\ndouble = partial(multiply, 2)\nprint(double(5))  # 10\n\n【追问】partial 和 lambda 的区别？何时使用？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['partial', '函数式编程', 'functools']
  },
  {
    id: 'i62',
    question: '⭐⭐ Python 的 reduce 函数？',
    answer: '【核心要点】\n• functools.reduce 累积应用函数\n• 将序列归约为单个值\n• 需要两个参数的函数\n• 常用于求和、求积等操作\n\n【常见错误回答】\n❌ "reduce 总是比循环快"\n❌ "reduce 可以用于所有序列操作"\n\n【代码推理】\nfrom functools import reduce\nnumbers = [1, 2, 3, 4, 5]\nsum_result = reduce(lambda x, y: x + y, numbers)\nproduct = reduce(lambda x, y: x * y, numbers)\n\n【追问】reduce 和 sum/max/min 的区别？何时使用？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['reduce', '函数式编程', 'functools']
  },
  {
    id: 'i63',
    question: '⭐⭐ Python 的生成器表达式和列表推导式性能？',
    answer: '【核心要点】\n• 列表推导式立即计算，占用内存\n• 生成器表达式惰性计算，节省内存\n• 大数据集用生成器表达式\n• 需要多次访问用列表推导式\n\n【常见错误回答】\n❌ "生成器表达式总是更快"\n❌ "两者性能相同"\n\n【代码推理】\n# 列表推导式 - 立即计算\nsquares_list = [x**2 for x in range(1000000)]\n# 生成器表达式 - 惰性计算\nsquares_gen = (x**2 for x in range(1000000))\n\n【追问】如何选择？何时必须用列表推导式？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['性能', '生成器', '推导式']
  },
  {
    id: 'i64',
    question: '⭐⭐ Python 的字符串拼接性能？',
    answer: '【核心要点】\n• 使用 join() 方法拼接字符串列表\n• 避免在循环中使用 += 拼接\n• join() 比 + 操作符高效\n• 字符串是不可变的，+= 会创建新对象\n\n【常见错误回答】\n❌ "+= 和 join() 性能相同"\n❌ "所有拼接方式都很快"\n\n【代码推理】\n# 慢\nresult = ""\nfor s in strings:\n    result += s\n# 快\nresult = "".join(strings)\n\n【追问】为什么 join() 更快？何时使用 +=？',
    difficulty: '简单' as InterviewDifficulty,
    tags: ['性能优化', '字符串', '最佳实践']
  },
  {
    id: 'i65',
    question: '⭐⭐ Python 的字典和集合的底层实现？',
    answer: '【核心要点】\n• 字典使用哈希表实现\n• 平均 O(1) 的查找、插入、删除\n• 键必须是可哈希的（不可变类型）\n• 集合也是基于哈希表实现\n\n【常见错误回答】\n❌ "字典查找是 O(n)"\n❌ "任何对象都可以作为字典键"\n\n【代码推理】\n# 可哈希类型可以作为键\nmy_dict = {"key": "value"}  # str 可哈希\n# 不可哈希类型不能作为键\n# my_dict = {[1, 2]: "value"}  # 错误！\n\n【追问】哈希冲突如何处理？字典为什么无序？',
    difficulty: '困难' as InterviewDifficulty,
    tags: ['数据结构', '哈希表', '底层实现']
  },
  {
    id: 'i66',
    question: '⭐⭐ Python 的内存管理机制？',
    answer: '【核心要点】\n• 引用计数：主要内存管理方式\n• 循环垃圾收集器：处理循环引用\n• 分代垃圾收集：提高效率\n• 对象池：小整数和字符串缓存\n\n【常见错误回答】\n❌ "Python 没有内存管理"\n❌ "对象立即被回收"\n\n【代码推理】\nimport sys\nx = "hello"\nprint(sys.getrefcount(x))  # 引用计数\nimport gc\ngc.collect()  # 手动触发垃圾回收\n\n【追问】引用计数的优缺点？何时需要手动 gc？',
    difficulty: '困难' as InterviewDifficulty,
    tags: ['内存管理', '垃圾回收', '底层原理']
  },
  {
    id: 'i67',
    question: '⭐⭐ Python 的字节码和解释器？',
    answer: '【核心要点】\n• Python 代码先编译为字节码（.pyc）\n• 字节码由 Python 虚拟机执行\n• 可以使用 dis 模块查看字节码\n• CPython 是最常用的解释器\n\n【常见错误回答】\n❌ "Python 是解释型语言，不编译"\n❌ "字节码是机器码"\n\n【代码推理】\nimport dis\ndef func():\n    return 1 + 2\ndis.dis(func)  # 查看字节码\n\n【追问】字节码的作用？为什么需要字节码？',
    difficulty: '困难' as InterviewDifficulty,
    tags: ['字节码', '解释器', '底层原理']
  },
  {
    id: 'i68',
    question: '⭐⭐ Python 的 C 扩展开发？',
    answer: '【核心要点】\n• 使用 C/C++ 编写扩展模块\n• 通过 C API 与 Python 交互\n• 可以提高性能关键部分的执行速度\n• ctypes、CFFI 等工具简化开发\n\n【常见错误回答】\n❌ "C 扩展开发很简单"\n❌ "所有代码都应该用 C 扩展"\n\n【代码推理】\n# C 扩展模块示例\n# 需要编写 C 代码，编译为共享库\n# 然后在 Python 中导入使用\n\n【追问】何时需要 C 扩展？有哪些替代方案？',
    difficulty: '困难' as InterviewDifficulty,
    tags: ['C扩展', '性能优化', '系统编程']
  },
  {
    id: 'i69',
    question: '⭐⭐ Python 的包分发（setuptools）？',
    answer: '【核心要点】\n• setuptools 用于打包和分发 Python 包\n• setup.py 定义包信息\n• 可以打包为 wheel 或 source distribution\n• 上传到 PyPI 供他人使用\n\n【常见错误回答】\n❌ "打包只需要复制文件"\n❌ "所有包都上传到 PyPI"\n\n【代码推理】\n# setup.py\nfrom setuptools import setup\nsetup(\n    name="mypackage",\n    version="0.1.0",\n    packages=["mypackage"],\n)\n\n【追问】如何编写 setup.py？wheel 和 egg 的区别？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['打包', 'setuptools', 'PyPI']
  },
  {
    id: 'i70',
    question: '⭐⭐ Python 的虚拟环境（venv/virtualenv）？',
    answer: '【核心要点】\n• 虚拟环境隔离项目依赖\n• venv 是 Python 3.3+ 内置模块\n• virtualenv 是第三方工具，功能更丰富\n• 每个项目使用独立的虚拟环境\n\n【常见错误回答】\n❌ "虚拟环境会影响系统 Python"\n❌ "所有项目可以共享一个虚拟环境"\n\n【代码推理】\n# 创建虚拟环境\npython -m venv myenv\n# 激活（Windows）\nmyenv\\Scripts\\activate\n# 激活（Linux/Mac）\nsource myenv/bin/activate\n\n【追问】虚拟环境的作用？如何管理多个虚拟环境？',
    difficulty: '简单' as InterviewDifficulty,
    tags: ['虚拟环境', 'venv', '环境管理']
  },
  {
    id: 'i71',
    question: '⭐⭐ Python 的依赖管理（pip/conda）？',
    answer: '【核心要点】\n• pip 是 Python 的包管理器\n• conda 是跨语言的包和环境管理器\n• requirements.txt 记录 pip 依赖\n• environment.yml 记录 conda 环境\n\n【常见错误回答】\n❌ "pip 和 conda 功能完全相同"\n❌ "不需要记录依赖版本"\n\n【代码推理】\n# requirements.txt\nrequests==2.28.0\nnumpy>=1.20.0\n# 安装\npip install -r requirements.txt\n\n【追问】pip 和 conda 的区别？如何选择？',
    difficulty: '简单' as InterviewDifficulty,
    tags: ['依赖管理', 'pip', 'conda']
  },
  {
    id: 'i72',
    question: '⭐⭐ Python 的代码组织（项目结构）？',
    answer: '【核心要点】\n• 合理的项目结构提高可维护性\n• 分离源代码、测试、文档\n• 使用 __init__.py 创建包\n• 遵循 PEP 8 和项目规范\n\n【常见错误回答】\n❌ "所有文件放在一个目录"\n❌ "项目结构不重要"\n\n【代码推理】\nmyproject/\n  mypackage/\n    __init__.py\n    module1.py\n  tests/\n  docs/\n  setup.py\n  README.md\n\n【追问】如何组织大型项目？模块和包的区别？',
    difficulty: '简单' as InterviewDifficulty,
    tags: ['项目结构', '代码组织', '最佳实践']
  },
  {
    id: 'i73',
    question: '⭐⭐ Python 的文档字符串（docstring）？',
    answer: '【核心要点】\n• docstring 是函数的文档说明\n• 使用三重引号编写\n• 遵循 PEP 257 规范\n• 可以使用 Sphinx 生成文档\n\n【常见错误回答】\n❌ "docstring 和注释没有区别"\n❌ "docstring 会影响性能"\n\n【代码推理】\ndef add(x: int, y: int) -> int:\n    """\n    计算两个数的和\n    \n    Args:\n        x: 第一个数\n        y: 第二个数\n    \n    Returns:\n        两个数的和\n    """\n    return x + y\n\n【追问】如何编写好的 docstring？docstring 的格式？',
    difficulty: '简单' as InterviewDifficulty,
    tags: ['文档', 'docstring', '代码规范']
  },
  {
    id: 'i74',
    question: '⭐⭐ Python 的迭代协议？',
    answer: '【核心要点】\n• __iter__() 返回迭代器对象\n• __next__() 返回下一个元素\n• StopIteration 异常表示迭代结束\n• for 循环自动处理迭代协议\n\n【常见错误回答】\n❌ "所有对象都可以迭代"\n❌ "迭代器和可迭代对象没有区别"\n\n【代码推理】\nclass MyIterator:\n    def __init__(self, data):\n        self.data = data\n        self.index = 0\n    def __iter__(self):\n        return self\n    def __next__(self):\n        if self.index >= len(self.data):\n            raise StopIteration\n        value = self.data[self.index]\n        self.index += 1\n        return value\n\n【追问】可迭代对象和迭代器的区别？如何实现自定义迭代器？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['迭代器', '迭代协议', '高级特性']
  },
  {
    id: 'i75',
    question: '⭐⭐ Python 的上下文管理协议？',
    answer: '【核心要点】\n• __enter__() 进入上下文\n• __exit__() 退出上下文\n• with 语句自动调用这两个方法\n• 即使发生异常也会调用 __exit__\n\n【常见错误回答】\n❌ "上下文管理器只能用于文件"\n❌ "__exit__ 不会处理异常"\n\n【代码推理】\nclass MyContext:\n    def __enter__(self):\n        print("进入")\n        return self\n    def __exit__(self, exc_type, exc_val, exc_tb):\n        print("退出")\n        return False  # 不抑制异常\n\n【追问】如何自定义上下文管理器？contextlib 的作用？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['上下文管理器', '资源管理', '高级特性']
  },
  {
    id: 'i76',
    question: '⭐⭐ Python 的运算符重载？',
    answer: '【核心要点】\n• 通过特殊方法重载运算符\n• __add__ 重载 +，__sub__ 重载 -\n• __eq__ 重载 ==，__lt__ 重载 <\n• 支持丰富的运算符重载\n\n【常见错误回答】\n❌ "所有运算符都可以重载"\n❌ "运算符重载会影响性能"\n\n【代码推理】\nclass Vector:\n    def __init__(self, x, y):\n        self.x, self.y = x, y\n    def __add__(self, other):\n        return Vector(self.x + other.x, self.y + other.y)\n    def __eq__(self, other):\n        return self.x == other.x and self.y == other.y\n\n【追问】哪些运算符可以重载？如何实现比较运算符？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['运算符重载', '特殊方法', '面向对象']
  },
  {
    id: 'i77',
    question: '⭐⭐ Python 的命名空间包（namespace package）？',
    answer: '【核心要点】\n• 命名空间包允许包分布在多个目录\n• 不需要 __init__.py（Python 3.3+）\n• 用于大型项目的模块组织\n• 支持插件系统\n\n【常见错误回答】\n❌ "命名空间包必须有 __init__.py"\n❌ "命名空间包和普通包没有区别"\n\n【代码推理】\n# 命名空间包示例\n# mypackage/\n#   subpackage1/\n#     module1.py\n#   subpackage2/\n#     module2.py\n# 两个子包可以分布在不同位置\n\n【追问】何时使用命名空间包？和普通包的区别？',
    difficulty: '困难' as InterviewDifficulty,
    tags: ['命名空间包', '模块系统', '高级']
  },
  {
    id: 'i78',
    question: '⭐⭐ Python 的导入系统（import system）？',
    answer: '【核心要点】\n• import 语句触发模块查找和加载\n• sys.path 定义模块搜索路径\n• __import__() 是底层导入函数\n• importlib 提供编程式导入\n\n【常见错误回答】\n❌ "import 总是从当前目录开始查找"\n❌ "所有模块都立即执行"\n\n【代码推理】\nimport sys\nprint(sys.path)  # 模块搜索路径\nimport importlib\nmodule = importlib.import_module("mymodule")\n\n【追问】模块查找顺序？如何动态导入模块？',
    difficulty: '困难' as InterviewDifficulty,
    tags: ['导入系统', '模块加载', '底层原理']
  },
  {
    id: 'i79',
    question: '⭐⭐ Python 的字节码优化？',
    answer: '【核心要点】\n• Python 编译为字节码（.pyc）\n• 字节码存储在 __pycache__ 目录\n• -O 优化标志移除断言和调试信息\n• -OO 进一步优化，移除文档字符串\n\n【常见错误回答】\n❌ "字节码优化会改变程序行为"\n❌ "所有优化都会提高性能"\n\n【代码推理】\n# 编译为字节码\npython -m py_compile script.py\n# 优化模式\npython -O script.py  # 移除断言\npython -OO script.py  # 移除断言和文档字符串\n\n【追问】字节码优化的作用？何时使用优化标志？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['字节码', '优化', '编译']
  },
  {
    id: 'i80',
    question: '⭐⭐ Python 的装饰器模式应用？',
    answer: '【核心要点】\n• 装饰器可以用于函数、类、方法\n• 可以带参数，也可以嵌套\n• 常用于日志、缓存、权限检查\n• functools.wraps 保持原函数元数据\n\n【常见错误回答】\n❌ "装饰器只能用于函数"\n❌ "装饰器会改变函数签名"\n\n【代码推理】\nfrom functools import wraps\ndef log(func):\n    @wraps(func)\n    def wrapper(*args, **kwargs):\n        print(f"调用 {func.__name__}")\n        return func(*args, **kwargs)\n    return wrapper\n\n【追问】如何编写带参数的装饰器？装饰器的执行顺序？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['装饰器', '设计模式', '高级特性']
  },
  {
    id: 'i81',
    question: '⭐⭐ Python 的线程同步（Lock/RLock）？',
    answer: '【核心要点】\n• Lock：互斥锁，同一时刻只有一个线程获取\n• RLock：可重入锁，同一线程可以多次获取\n• 使用 with 语句自动释放锁\n• 避免死锁，注意锁的获取顺序\n\n【常见错误回答】\n❌ "Lock 和 RLock 没有区别"\n❌ "锁不会影响性能"\n\n【代码推理】\nimport threading\nlock = threading.Lock()\nwith lock:\n    # 临界区代码\n    pass\n\n【追问】如何避免死锁？何时使用 RLock？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['线程同步', '锁', '并发']
  },
  {
    id: 'i82',
    question: '⭐⭐ Python 的进程间通信（Queue/Pipe）？',
    answer: '【核心要点】\n• multiprocessing.Queue：进程安全队列\n• multiprocessing.Pipe：双向通信管道\n• Manager 提供共享对象\n• 用于多进程数据交换\n\n【常见错误回答】\n❌ "进程可以直接共享变量"\n❌ "Queue 和普通队列没有区别"\n\n【代码推理】\nfrom multiprocessing import Process, Queue\nq = Queue()\ndef worker(q):\n    q.put("数据")\np = Process(target=worker, args=(q,))\np.start()\nresult = q.get()\n\n【追问】进程间通信的方式？如何选择？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['多进程', '进程通信', '并发']
  },
  {
    id: 'i83',
    question: '⭐⭐ Python 的异步编程模式？',
    answer: '【核心要点】\n• async def 定义协程函数\n• await 等待异步操作完成\n• asyncio.gather() 并发执行多个协程\n• asyncio.create_task() 创建任务\n\n【常见错误回答】\n❌ "async 函数总是异步执行"\n❌ "await 会阻塞整个程序"\n\n【代码推理】\nimport asyncio\nasync def fetch(url):\n    await asyncio.sleep(1)\n    return f"数据来自 {url}"\nasync def main():\n    results = await asyncio.gather(\n        fetch("url1"),\n        fetch("url2")\n    )\n\n【追问】如何并发执行多个协程？asyncio 的事件循环？',
    difficulty: '困难' as InterviewDifficulty,
    tags: ['异步', '协程', 'asyncio']
  },
  {
    id: 'i84',
    question: '⭐⭐ Python 的单元测试最佳实践？',
    answer: '【核心要点】\n• 测试应该独立、可重复、快速\n• 使用 setUp 和 tearDown 准备环境\n• 测试覆盖率不是唯一指标\n• 使用 mock 隔离依赖\n\n【常见错误回答】\n❌ "测试代码不需要维护"\n❌ "100% 覆盖率就是好测试"\n\n【代码推理】\nimport unittest\nfrom unittest.mock import Mock\nclass TestMyClass(unittest.TestCase):\n    def setUp(self):\n        self.obj = MyClass()\n    def test_method(self):\n        self.assertEqual(self.obj.method(), expected)\n\n【追问】如何编写好的测试？测试金字塔？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['测试', '最佳实践', '质量保证']
  },
  {
    id: 'i85',
    question: '⭐⭐ Python 的代码审查（Code Review）？',
    answer: '【核心要点】\n• 代码审查提高代码质量\n• 关注逻辑、性能、可读性\n• 使用工具辅助审查\n• 建立审查流程和规范\n\n【常见错误回答】\n❌ "代码审查浪费时间"\n❌ "只有高级开发者需要审查"\n\n【代码推理】\n# 代码审查检查点\n# 1. 逻辑正确性\n# 2. 性能优化\n# 3. 代码风格\n# 4. 错误处理\n# 5. 文档完整性\n\n【追问】如何进行有效的代码审查？审查清单？',
    difficulty: '简单' as InterviewDifficulty,
    tags: ['代码审查', '最佳实践', '团队协作']
  },
  {
    id: 'i86',
    question: '⭐⭐ Python 的版本管理（Git）？',
    answer: '【核心要点】\n• Git 是分布式版本控制系统\n• .gitignore 忽略不需要版本控制的文件\n• 使用有意义的提交信息\n• 分支策略：main、develop、feature\n\n【常见错误回答】\n❌ "所有文件都应该提交"\n❌ "提交信息不重要"\n\n【代码推理】\n# .gitignore\n__pycache__/\n*.pyc\n*.pyo\n.env\nvenv/\n\n【追问】如何编写 .gitignore？Git 工作流？',
    difficulty: '简单' as InterviewDifficulty,
    tags: ['版本控制', 'Git', '最佳实践']
  },
  {
    id: 'i87',
    question: '⭐⭐ Python 的持续集成（CI/CD）？',
    answer: '【核心要点】\n• CI：持续集成，自动构建和测试\n• CD：持续部署，自动发布\n• GitHub Actions、Jenkins 等工具\n• 提高开发效率和代码质量\n\n【常见错误回答】\n❌ "CI/CD 只用于大型项目"\n❌ "CI/CD 配置很复杂"\n\n【代码推理】\n# .github/workflows/ci.yml\n# 定义自动化流程：\n# 1. 代码检查\n# 2. 运行测试\n# 3. 构建包\n# 4. 部署\n\n【追问】如何设置 CI/CD？CI/CD 的好处？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['CI/CD', 'DevOps', '自动化']
  },
  {
    id: 'i88',
    question: '⭐⭐ Python 的监控和日志？',
    answer: '【核心要点】\n• 使用 logging 模块记录日志\n• 不同级别：DEBUG、INFO、WARNING、ERROR\n• 监控应用性能和错误\n• 使用 Sentry、ELK 等工具\n\n【常见错误回答】\n❌ "print 可以替代 logging"\n❌ "所有日志都应该输出"\n\n【代码推理】\nimport logging\nlogging.basicConfig(\n    level=logging.INFO,\n    format="%(asctime)s - %(name)s - %(levelname)s - %(message)s"\n)\nlogging.info("应用启动")\n\n【追问】如何配置日志？日志最佳实践？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['日志', '监控', '运维']
  },
  {
    id: 'i89',
    question: '⭐⭐ Python 的性能分析（profiling）？',
    answer: '【核心要点】\n• cProfile 提供性能分析\n• line_profiler 分析逐行性能\n• memory_profiler 分析内存使用\n• 识别性能瓶颈，针对性优化\n\n【常见错误回答】\n❌ "性能分析不需要工具"\n❌ "所有代码都需要优化"\n\n【代码推理】\nimport cProfile\ncProfile.run("my_function()")\n# 或使用装饰器\n@profile\ndef slow_function():\n    pass\n\n【追问】如何分析性能？优化策略？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['性能分析', 'profiling', '优化']
  },
  {
    id: 'i90',
    question: '⭐⭐ Python 的调试技巧？',
    answer: '【核心要点】\n• pdb 是 Python 调试器\n• 使用 breakpoint() 设置断点（Python 3.7+）\n• print 调试简单但有效\n• 使用 IDE 调试器更方便\n\n【常见错误回答】\n❌ "调试器会影响性能"\n❌ "print 是最好的调试方法"\n\n【代码推理】\nimport pdb\npdb.set_trace()  # 设置断点\n# 或使用\nbreakpoint()  # Python 3.7+\n\n【追问】如何使用 pdb？调试技巧？',
    difficulty: '简单' as InterviewDifficulty,
    tags: ['调试', 'pdb', '开发工具']
  },
  {
    id: 'i91',
    question: '⭐⭐ Python 的错误处理最佳实践？',
    answer: '【核心要点】\n• 捕获具体异常，避免捕获所有异常\n• 使用 finally 确保资源清理\n• 记录异常信息，便于调试\n• 自定义异常提供更好的错误信息\n\n【常见错误回答】\n❌ "应该捕获所有异常"\n❌ "异常处理会影响性能"\n\n【代码推理】\ntry:\n    result = risky_operation()\nexcept SpecificError as e:\n    logger.error(f"错误: {e}")\n    raise\nfinally:\n    cleanup()\n\n【追问】如何设计异常层次？何时重新抛出异常？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['异常处理', '错误处理', '最佳实践']
  },
  {
    id: 'i92',
    question: '⭐⭐ Python 的代码重构技巧？',
    answer: '【核心要点】\n• 提取函数，减少重复代码\n• 使用有意义的变量名\n• 保持函数简短，单一职责\n• 使用设计模式提高可维护性\n\n【常见错误回答】\n❌ "重构会破坏现有功能"\n❌ "代码能运行就不需要重构"\n\n【代码推理】\n# 重构前：长函数\n# 重构后：拆分为多个小函数\n# 使用函数式编程减少重复\n\n【追问】重构的原则？如何安全重构？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['重构', '代码质量', '最佳实践']
  },
  {
    id: 'i93',
    question: '⭐⭐ Python 的 API 设计原则？',
    answer: '【核心要点】\n• 保持 API 简洁和一致\n• 使用有意义的命名\n• 提供清晰的文档\n• 考虑向后兼容性\n\n【常见错误回答】\n❌ "API 设计不重要"\n❌ "可以随时改变 API"\n\n【代码推理】\n# 好的 API 设计\nclass Calculator:\n    def add(self, x: float, y: float) -> float:\n        """计算两个数的和"""\n        return x + y\n\n【追问】如何设计好的 API？API 版本管理？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['API设计', '接口设计', '最佳实践']
  },
  {
    id: 'i94',
    question: '⭐⭐ Python 的数据库连接池？',
    answer: '【核心要点】\n• 连接池复用数据库连接\n• 减少连接开销，提高性能\n• SQLAlchemy 提供连接池\n• 配置合适的池大小\n\n【常见错误回答】\n❌ "每次操作都创建新连接"\n❌ "连接池大小越大越好"\n\n【代码推理】\nfrom sqlalchemy import create_engine\nengine = create_engine(\n    "postgresql://...",\n    pool_size=10,\n    max_overflow=20\n)\n\n【追问】如何配置连接池？连接池的优势？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['数据库', '连接池', '性能优化']
  },
  {
    id: 'i95',
    question: '⭐⭐ Python 的缓存策略？',
    answer: '【核心要点】\n• 内存缓存：快速但有限\n• Redis：分布式缓存\n• 缓存失效策略：TTL、LRU\n• 缓存穿透、击穿、雪崩问题\n\n【常见错误回答】\n❌ "缓存总是提高性能"\n❌ "不需要考虑缓存失效"\n\n【代码推理】\nimport redis\nr = redis.Redis()\nr.set("key", "value", ex=3600)  # TTL 1小时\nvalue = r.get("key")\n\n【追问】如何选择缓存策略？缓存问题如何解决？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['缓存', 'Redis', '性能优化']
  },
  {
    id: 'i96',
    question: '⭐⭐ Python 的消息队列（RabbitMQ/Kafka）？',
    answer: '【核心要点】\n• 消息队列解耦系统组件\n• RabbitMQ：AMQP 协议，可靠\n• Kafka：高吞吐，适合流处理\n• 用于异步任务和事件驱动架构\n\n【常见错误回答】\n❌ "消息队列和数据库一样"\n❌ "所有系统都需要消息队列"\n\n【代码推理】\nimport pika\nconnection = pika.BlockingConnection(pika.ConnectionParameters())\nchannel = connection.channel()\nchannel.queue_declare(queue="task_queue")\nchannel.basic_publish(exchange="", routing_key="task_queue", body="消息")\n\n【追问】如何选择消息队列？消息队列的使用场景？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['消息队列', 'RabbitMQ', 'Kafka']
  },
  {
    id: 'i97',
    question: '⭐⭐ Python 的微服务架构？',
    answer: '【核心要点】\n• 微服务将应用拆分为小服务\n• 每个服务独立部署和扩展\n• 使用 REST 或 gRPC 通信\n• 需要服务发现和配置管理\n\n【常见错误回答】\n❌ "微服务总是比单体好"\n❌ "所有应用都应该用微服务"\n\n【代码推理】\n# 微服务示例\n# user-service: 用户管理\n# order-service: 订单处理\n# payment-service: 支付处理\n# 通过 API 网关统一访问\n\n【追问】微服务的优缺点？何时使用微服务？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['微服务', '架构设计', '分布式系统']
  },
  {
    id: 'i98',
    question: '⭐⭐ Python 的容器化（Docker）？',
    answer: '【核心要点】\n• Docker 容器化应用\n• Dockerfile 定义镜像\n• 容器提供一致的运行环境\n• 简化部署和扩展\n\n【常见错误回答】\n❌ "Docker 和虚拟机一样"\n❌ "所有应用都需要容器化"\n\n【代码推理】\n# Dockerfile\nFROM python:3.11\nWORKDIR /app\nCOPY requirements.txt .\nRUN pip install -r requirements.txt\nCOPY . .\nCMD ["python", "app.py"]\n\n【追问】Docker 的优势？如何优化镜像大小？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['Docker', '容器化', 'DevOps']
  },
  {
    id: 'i99',
    question: '⭐⭐ Python 的云部署（AWS/Azure/GCP）？',
    answer: '【核心要点】\n• 云平台提供可扩展的基础设施\n• AWS Lambda：无服务器函数\n• 容器服务：ECS、Kubernetes\n• 数据库、存储、消息队列等托管服务\n\n【常见错误回答】\n❌ "云部署很复杂"\n❌ "所有应用都应该上云"\n\n【代码推理】\n# 云部署示例\n# 1. 使用容器服务部署\n# 2. 使用负载均衡\n# 3. 使用云数据库\n# 4. 配置自动扩展\n\n【追问】如何选择云平台？云部署的优势？',
    difficulty: '中等' as InterviewDifficulty,
    tags: ['云部署', 'AWS', 'DevOps']
  },
  {
    id: 'i100',
    question: '⭐⭐⭐ Python 开发者的职业发展？',
    answer: '【核心要点】\n• 持续学习新技术和最佳实践\n• 参与开源项目，贡献代码\n• 建立技术博客，分享经验\n• 参加技术会议和社区活动\n• 掌握全栈技能，了解 DevOps\n\n【常见错误回答】\n❌ "只学 Python 就够了"\n❌ "不需要了解其他技术"\n\n【职业路径】\n• 初级：掌握 Python 基础和常用库\n• 中级：深入理解语言特性和设计模式\n• 高级：架构设计、性能优化、团队领导\n• 专家：技术专家、架构师、技术顾问\n\n【追问】如何规划职业发展？需要掌握哪些技能？',
    difficulty: '简单' as InterviewDifficulty,
    tags: ['职业发展', '学习路径', '综合']
  }
] as InterviewItem[];
