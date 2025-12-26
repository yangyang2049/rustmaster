import { CourseChapter, CourseUnit, QuizModule, ReferenceCategory, InterviewItem, QuestionType } from './RustTypes';

export const DAILY_TIPS: string[] = [
  "在 Rust 中，如果你不需要使用某个变量，可以在变量名前加下划线（如 _x）来忽略未使用的警告。",
  "使用 `cargo check` 比 `cargo build` 快得多，它只检查代码是否能编译而不生成可执行文件。",
  "Option::map 方法可以在 Option 为 Some 时转换值，为 None 时保持 None，非常优雅。",
  "Rust 的 String 是 UTF-8 编码的，所以不能直接通过索引访问字符（如 s[0]）。",
  "使用 `dbg!(x)` 宏可以在控制台打印变量的值和行号，调试神器！",
  "Rust 的所有权系统确保内存安全，无需垃圾回收器，性能与 C/C++ 相当。",
  "使用 `match` 表达式时必须覆盖所有可能的情况，这能防止遗漏边界情况。",
  "`unwrap()` 和 `expect()` 在开发时很有用，但在生产代码中应使用 `?` 操作符进行错误处理。",
  "`Vec<T>` 是 Rust 中最常用的动态数组，使用 `vec![]` 宏可以快速创建。",
  "生命周期标注（如 `'a`）帮助编译器理解引用的有效范围，确保内存安全。",
  "`Result<T, E>` 类型强制你处理错误，这是 Rust 错误处理的核心。",
  "使用 `if let` 可以简洁地处理 `Option` 或 `Result` 的单一情况。",
  "`&str` 是字符串切片，`String` 是拥有所有权的字符串，理解它们的区别很重要。",
  "`clone()` 会深度复制数据，虽然安全但可能有性能开销，应谨慎使用。",
  "Rust 的借用检查器在编译时防止数据竞争，这是并发安全的基础。",
  "使用 `#[derive(Debug)]` 可以自动为结构体实现 `Debug` trait，方便打印调试。",
  "`impl` 块用于为类型实现方法，可以定义关联函数（类似静态方法）和实例方法。",
  "`trait` 类似于其他语言中的接口，但更强大，可以定义默认实现。",
  "`const` 和 `static` 都用于定义常量，但 `static` 有固定的内存地址。",
  "使用 `cargo fmt` 可以自动格式化代码，保持代码风格一致。",
  "`Box<T>` 用于在堆上分配数据，当需要递归类型或大类型时很有用。",
  "`Rc<T>` 和 `Arc<T>` 提供引用计数，`Arc` 是线程安全的版本。",
  "`RefCell<T>` 允许在运行时进行借用检查，提供内部可变性。",
  "使用 `async/await` 可以编写异步代码，Rust 的异步运行时非常高效。",
  "`tokio` 是 Rust 最流行的异步运行时，提供了丰富的异步工具。",
  "`serde` 是 Rust 最常用的序列化/反序列化库，支持 JSON、YAML 等多种格式。",
  "使用 `#[test]` 属性可以编写单元测试，`cargo test` 运行所有测试。",
  "`cargo doc --open` 可以生成并打开项目的文档，非常方便。",
  "Rust 的模式匹配非常强大，可以在 `match`、`if let`、`while let` 等地方使用。",
  "`_` 是通配符模式，可以匹配任何值但不绑定变量，常用于忽略值。",
  "使用 `..` 可以匹配剩余的所有值，在模式匹配中很有用。",
  "`#[derive(Clone, Copy)]` 可以让类型实现 `Clone` 和 `Copy` trait。",
  "`Copy` trait 表示类型可以通过复制位来复制，而不是移动。",
  "`Send` 和 `Sync` trait 是 Rust 并发安全的基础，大多数类型自动实现它们。",
  "使用 `std::thread::spawn` 可以创建新线程，但通常使用异步更高效。",
  "`Mutex<T>` 和 `RwLock<T>` 提供线程安全的内部可变性。",
  "`Cow<T>` 是 Clone-on-Write 类型，可以避免不必要的克隆。",
  "使用 `Iterator` trait 的方法链可以写出非常优雅的函数式代码。",
  "`map`、`filter`、`fold` 等迭代器方法在 Rust 中非常常用。",
  "`collect()` 可以将迭代器转换为集合类型，如 `Vec`、`HashMap` 等。",
  "`unwrap_or()` 和 `unwrap_or_else()` 提供了 `unwrap()` 的安全替代方案。",
  "使用 `?` 操作符可以简洁地传播错误，比手动 `match` 更优雅。",
  "`From` 和 `Into` trait 提供了类型转换的标准方式。",
  "`Deref` trait 允许类型自动解引用，`DerefMut` 提供可变解引用。",
  "使用 `#[cfg(test)]` 可以只在测试时编译某些代码。",
  "`cargo clippy` 是 Rust 的 linter，可以帮助发现代码中的问题。",
  "Rust 的宏系统非常强大，`macro_rules!` 可以定义声明宏。",
  "过程宏（procedural macros）比声明宏更强大，可以生成任意代码。",
  "`unsafe` 关键字允许绕过 Rust 的安全检查，但应谨慎使用。",
  "理解所有权、借用和生命周期是掌握 Rust 的关键，需要时间和实践。"
];

export const COURSE_UNITS: CourseUnit[] = [
  { id: 'unit1', name: 'Rust 基础', description: '掌握 Rust 的基本语法和核心概念', order: 1 } as CourseUnit,
  { id: 'unit2', name: '所有权系统', description: '深入理解 Rust 的所有权、借用和生命周期', order: 2 } as CourseUnit,
  { id: 'unit3', name: '复合数据类型', description: '学习结构体、枚举和模式匹配', order: 3 } as CourseUnit,
  { id: 'unit4', name: '集合类型', description: '掌握 Vector、String、HashMap 等集合', order: 4 } as CourseUnit,
  { id: 'unit5', name: '错误处理', description: '学习 Rust 的错误处理机制', order: 5 } as CourseUnit,
  { id: 'unit6', name: '模块系统', description: '理解 Rust 的模块、包和 crate', order: 6 } as CourseUnit,
  { id: 'unit7', name: '泛型与 Trait', description: '掌握泛型编程和 Trait 系统', order: 7 } as CourseUnit,
  { id: 'unit8', name: '智能指针', description: '学习 Box、Rc、RefCell 等智能指针', order: 8 } as CourseUnit,
  { id: 'unit9', name: '并发编程', description: '掌握 Rust 的并发和线程安全', order: 9 } as CourseUnit,
  { id: 'unit10', name: '异步编程', description: '学习 async/await 和异步编程', order: 10 } as CourseUnit,
  { id: 'unit11', name: '高级特性', description: '探索宏、Unsafe Rust 等高级特性', order: 11 } as CourseUnit,
  { id: 'unit12', name: '实战项目', description: '通过实际项目巩固所学知识', order: 12 } as CourseUnit
];

export const COURSE_CHAPTERS: CourseChapter[] = ([
  {
    id: '0',
    unitId: 'unit1',
    title: 'Rust 概述',
    description: '了解 Rust 语言的基本概念、特点和优势，为学习 Rust 打下基础。',
    difficulty: '入门',
    content: `Rust 是一门现代的系统编程语言，由 Mozilla 开发，专注于安全性、速度和并发性。

## Rust 的特点

1. **内存安全**：无需垃圾回收器，通过所有权系统在编译时保证内存安全
2. **零成本抽象**：高级抽象不会带来运行时开销
3. **并发安全**：编译时防止数据竞争
4. **性能优异**：性能可与 C/C++ 媲美
5. **类型系统强大**：静态类型检查，减少运行时错误

## Rust 的应用场景

- 系统编程（操作系统、嵌入式系统）
- Web 后端开发
- 区块链开发
- 游戏引擎
- 网络服务
- 命令行工具

## 为什么学习 Rust？

Rust 解决了系统编程中的核心问题：如何在保证内存安全的同时获得高性能。它让你可以编写既安全又快速的代码，无需担心常见的内存错误。`,
    exampleCode: `// Rust 的 Hello World 程序
fn main() {
    println!("Hello, Rust!");
}

// Rust 程序的基本结构
// 1. fn 关键字定义函数
// 2. main 函数是程序的入口点
// 3. println! 是宏，用于打印输出
// 4. 分号表示语句结束

// 编译和运行
// 使用 cargo new hello_rust 创建新项目
// 使用 cargo run 编译并运行程序
// 使用 cargo build 只编译不运行`,
    summary: [
      'Rust 是一门现代系统编程语言，专注于安全性和性能。',
      '通过所有权系统在编译时保证内存安全，无需垃圾回收。',
      '零成本抽象，高级特性不会带来运行时开销。',
      '适合系统编程、Web 后端、区块链等多种应用场景。',
      '学习 Rust 可以编写既安全又高性能的代码。'
    ]
  },
  {
    id: '1',
    unitId: 'unit1',
    title: 'Rust 变量与可变性',
    description: '理解 let 关键字、变量绑定以及 mut 可变性的核心机制。',
    difficulty: '入门',
    content: `在 Rust 中，变量默认是不可变的（Immutable）。这是 Rust 提供安全性和并发性的基石之一。

## 为什么变量默认不可变？

不可变性是 Rust 设计哲学的核心。默认不可变的设计带来了多重好处：

1. **防止意外修改**：避免在代码执行过程中意外改变变量的值，减少 bug
2. **并发安全**：不可变数据天然线程安全，多个线程可以安全地读取同一份数据
3. **代码可读性**：明确哪些变量会改变，哪些不会，让代码更容易理解
4. **编译器优化**：编译器知道不可变变量不会改变，可以进行更多优化

## 可变性的使用场景

当你使用 let 关键字声明变量时，一旦绑定了值，就不能再改变它。如果需要改变变量的值，必须使用 mut 关键字。

可变性应该在真正需要时才使用。例如：
- 需要在循环中累积值
- 需要修改集合（如 Vector）的内容
- 需要更新状态

## 变量遮蔽（Shadowing）

Rust 允许使用同名变量遮蔽之前的变量，这不同于可变性。遮蔽会创建一个新变量，可以改变类型，而可变性只能改变值，不能改变类型。`,
    exampleCode: `fn main() {
    // 1. 不可变变量
    let x = 5;
    println!("x 的值是: {}", x);
    // x = 6; // 这行代码会报错！

    // 2. 可变变量
    let mut y = 10;
    println!("y 的初始值: {}", y);
    y = 20;
    println!("y 修改后的值: {}", y);
    
    // 3. 常量
    const MAX_POINTS: u32 = 100_000;
    println!("常量值: {}", MAX_POINTS);
}`,
    summary: [
      '变量默认不可变，保证数据安全。',
      '使用 mut 关键字使变量可变。',
      '常量使用 const 声明，必须标注类型。'
    ]
  },
  {
    id: '2',
    unitId: 'unit2',
    title: '所有权 (Ownership)',
    description: 'Rust 最独特的功能，无需垃圾回收即可保证内存安全。',
    difficulty: '进阶',
    content: `所有权是 Rust 最核心的概念，也是 Rust 与其他语言最大的区别。它让 Rust 可以在没有垃圾回收器的情况下保证内存安全。

## 所有权的三条基本规则

所有权系统遵循三条基本规则：

1. **每个值都有一个所有者**：Rust 中的每一个值都有一个被称为其所有者（owner）的变量。这个变量负责管理该值的生命周期。

2. **同一时刻只能有一个所有者**：值在任一时刻有且只有一个所有者。这确保了不会有多个变量同时拥有同一份数据，避免了数据竞争和悬垂指针。

3. **所有者离开作用域时值被丢弃**：当所有者（变量）离开作用域，这个值将被自动丢弃（drop）。Rust 会自动调用清理代码，释放内存。

## 所有权如何工作？

当变量进入作用域时，它成为值的所有者。当变量离开作用域时，Rust 会自动调用 drop 函数，释放该值占用的内存。这个过程是自动的，你不需要手动管理内存。

## 所有权与性能

所有权的设计让 Rust 在编译时就能确定何时释放内存，无需运行时垃圾回收。这既保证了内存安全，又获得了 C/C++ 级别的性能。`,
    exampleCode: `fn main() {
    // String 类型存储在堆上
    let s1 = String::from("hello");
    
    // 所有权移动 (Move)
    // s1 的值移动到了 s2，s1 失效
    let s2 = s1; 
    
    // println!("{}, world!", s1); // 错误！s1 已无效
    println!("{}, world!", s2); // 正确

    // 克隆 (Clone)
    let s3 = s2.clone();
    println!("s2: {}, s3: {}", s2, s3);
}`,
    summary: [
      '每个值都有一个所有者。',
      '赋值语句会发生成员移动（Move），旧变量失效。',
      '使用 .clone() 可以深度复制堆数据。'
    ]
  },
  {
    id: '3',
    unitId: 'unit3',
    title: '结构体 (Structs)',
    description: '使用结构体组织相关联的数据，创建自定义数据类型。',
    difficulty: '入门',
    content: `结构体（Struct）让你可以创建自定义类型，将多个相关的值组合在一起，形成一个有意义的整体。

## 为什么需要结构体？

在编程中，我们经常需要将相关的数据组合在一起。例如，用户信息包括用户名、邮箱、年龄等。使用结构体可以将这些数据组织成一个逻辑单元，使代码更加清晰和易于维护。

## Rust 的三种结构体

Rust 提供了三种结构体类型，每种都有不同的用途：

1. **经典结构体（C 风格）**：有命名字段的结构体，最常用。每个字段都有名称，访问时使用点号语法。

2. **元组结构体**：字段没有名称，只有类型。类似于元组，但有自己的类型名称。适用于字段较少且含义明确的情况。

3. **单元结构体（无字段）**：没有任何字段的结构体。通常用于实现 trait 或作为标记类型。

## 结构体的优势

使用结构体可以：
- 将相关数据组织在一起，提高代码可读性
- 创建自定义类型，使代码更加语义化
- 通过方法（method）为结构体添加行为
- 实现 trait，提供多态性`,
    exampleCode: `struct User {
    username: String,
    email: String,
    active: bool,
}

fn main() {
    // 创建实例
    let user1 = User {
        email: String::from("someone@example.com"),
        username: String::from("someusername123"),
        active: true,
    };

    println!("用户: {}", user1.username);
    println!("邮箱: {}", user1.email);
}`,
    summary: [
      '结构体用于自定义数据类型。',
      '字段名: 值 的语法用于实例化。',
      '使用点号 . 访问字段。'
    ]
  },
  {
    id: '4',
    unitId: 'unit3',
    title: '枚举与模式匹配',
    description: '枚举允许你列举所有可能的值，配合 match 使用非常强大。',
    difficulty: '进阶',
    content: `枚举（Enums）是 Rust 中非常强大的特性，允许你通过列举可能的成员来定义一个类型。

## 枚举的基本概念

枚举让你可以定义一个类型，它可以是多个可能值中的一个。例如，IP 地址可以是 IPv4 或 IPv6，使用枚举可以精确地表示这种"要么是 A，要么是 B"的关系。

## 枚举的优势

相比其他语言，Rust 的枚举更加强大：
- **可以携带数据**：枚举的每个变体可以关联不同类型和数量的数据
- **类型安全**：编译器会确保你处理所有可能的情况
- **模式匹配**：配合 match 表达式，可以优雅地处理所有变体

## match 表达式

match 是 Rust 中最强大的控制流结构之一。它允许我们将一个值与一系列的模式进行比较，并根据匹配的模式执行相应代码。

match 必须是**穷尽的**（exhaustive），这意味着必须覆盖所有可能的情况。如果遗漏了某个变体，编译器会报错，这确保了代码的完整性。

## 枚举与 Option、Result

Rust 标准库中的 `Option<T>` 和 `Result<T, E>` 都是枚举，它们展示了枚举的强大之处。Option 用于表示可能为空的值，Result 用于表示可能失败的操作。`,
    exampleCode: `enum Coin {
    Penny,
    Nickel,
    Dime,
}

fn value_in_cents(coin: Coin) -> u8 {
    match coin {
        Coin::Penny => 1,
        Coin::Nickel => 5,
        Coin::Dime => 10,
    }
}

fn main() {
    let coin = Coin::Nickel;
    println!("硬币价值: {} 美分", value_in_cents(coin));
}`,
    summary: [
      '枚举定义一组可能的值。',
      'Match 必须覆盖所有可能的情况（穷尽性）。',
      'Option<T> 是 Rust 中处理空值的标准枚举。'
    ]
  },
  // 单元1：Rust 基础
  {
    id: '5',
    unitId: 'unit1',
    title: '数据类型',
    description: '学习 Rust 的基本数据类型：整数、浮点数、布尔值、字符等。',
    difficulty: '入门',
    content: `Rust 是静态类型语言，这意味着它必须在编译时知道所有变量的类型。这种设计让编译器可以在编译时发现类型错误，而不是等到运行时。

## 类型系统的重要性

静态类型系统是 Rust 安全性的重要组成部分。通过类型检查，编译器可以：
- 在编译时发现类型错误
- 提供更好的代码补全和文档
- 进行更激进的优化
- 确保内存安全

## 基本数据类型

Rust 提供了丰富的基本数据类型：

### 整数类型

整数类型分为有符号（i）和无符号（u）两种：
- **有符号整数**：i8, i16, i32, i64, i128, isize（可以是负数）
- **无符号整数**：u8, u16, u32, u64, u128, usize（只能是正数或零）

`isize` 和 `usize` 的大小取决于目标架构（32位或64位）。默认整数类型是 `i32`。

### 浮点类型

Rust 有两种浮点类型：
- **f32**：32位单精度浮点数
- **f64**：64位双精度浮点数（默认）

### 布尔类型

`bool` 类型只有两个值：`true` 和 `false`。布尔值主要用于条件判断。

### 字符类型

`char` 类型表示一个 Unicode 标量值，占用 4 字节。可以表示任何 Unicode 字符，包括中文、emoji 等。

### 复合类型

Rust 提供了两种复合类型：
- **元组 (tuple)**：可以包含不同类型的值，长度固定
- **数组 (array)**：包含相同类型的值，长度固定

元组适合将不同类型的值组合在一起，数组适合存储相同类型的多个值。`,
    exampleCode: `fn main() {
    // 整数类型
    let x: i32 = 42;
    let y: u64 = 100;
    
    // 浮点类型
    let pi: f64 = 3.14159;
    
    // 布尔类型
    let is_rust_awesome: bool = true;
    
    // 字符类型（注意是单引号）
    let emoji: char = '🦀';
    
    // 元组
    let tup: (i32, f64, bool) = (500, 6.4, true);
    let (a, b, c) = tup; // 解构
    println!("a = {}, b = {}, c = {}", a, b, c);
    
    // 数组（固定长度）
    let arr: [i32; 5] = [1, 2, 3, 4, 5];
    println!("第一个元素: {}", arr[0]);
}`,
    summary: [
      'Rust 是静态类型语言，编译时确定类型。',
      '整数类型有有符号(i)和无符号(u)两种。',
      '字符类型 char 是4字节 Unicode 字符。',
      '元组可以包含不同类型的值。',
      '数组长度固定，元素类型相同。'
    ]
  },
  {
    id: '6',
    unitId: 'unit1',
    title: '函数',
    description: '学习如何定义和调用函数，理解参数和返回值。',
    difficulty: '入门',
    content: `函数是 Rust 代码的基本构建块，用于组织和复用代码。使用 fn 关键字定义函数。

## 函数的作用

函数让你可以：
- **组织代码**：将相关代码组织成逻辑单元
- **复用代码**：避免重复编写相同的代码
- **抽象概念**：将复杂操作封装成简单的函数调用
- **测试代码**：函数是单元测试的基本单位

## 函数的组成部分

Rust 函数包含以下部分：

1. **函数签名**：包括函数名、参数列表和返回类型
2. **参数**：函数可以接收零个或多个参数，每个参数都需要类型标注
3. **返回值**：函数可以返回值，使用 `->` 指定返回类型
4. **函数体**：包含实际的执行代码

## 表达式与语句

Rust 区分表达式和语句：
- **表达式**：会返回值，如 `5 + 3`、函数调用等
- **语句**：执行操作但不返回值，如 `let x = 5;`

函数体的最后一个表达式（没有分号）会作为返回值。如果使用分号，就变成了语句，不会返回值。

## 命名规范

Rust 中的函数和变量名使用 **snake_case** 命名规范，即所有字母小写，单词之间用下划线分隔。例如：`calculate_length`、`get_user_name`。`,
    exampleCode: `fn main() {
    let result = add(5, 3);
    println!("5 + 3 = {}", result);
    
    let product = multiply(4, 7);
    println!("4 * 7 = {}", product);
    
    greet("Rust");
    
    let num = get_number();
    println!("获取的数字: {}", num);
}

// 带参数和返回值的函数
fn add(x: i32, y: i32) -> i32 {
    x + y  // 注意：没有分号，这是表达式，会返回值
}

fn multiply(x: i32, y: i32) -> i32 {
    return x * y;  // 使用 return 也可以
}

// 无返回值的函数
fn greet(name: &str) {
    println!("你好, {}!", name);
}

// 返回值的函数
fn get_number() -> i32 {
    42  // 最后一个表达式作为返回值
}`,
    summary: [
      '使用 fn 关键字定义函数。',
      '函数参数需要标注类型。',
      '返回值类型使用 -> 指定。',
      '最后一个表达式（无分号）会作为返回值。',
      '函数名使用 snake_case 命名。'
    ]
  },
  {
    id: '7',
    unitId: 'unit1',
    title: '注释',
    description: '学习如何在代码中添加注释，提高代码可读性。',
    difficulty: '入门',
    content: `注释是代码中不会被执行的文本，用于解释代码的功能、意图和设计决策。

## 为什么需要注释？

好的注释可以：
- **解释"为什么"**：说明代码的设计意图和决策原因
- **提供上下文**：帮助其他开发者（包括未来的自己）理解代码
- **生成文档**：Rust 的文档注释可以自动生成 API 文档
- **提高可维护性**：清晰的注释让代码更容易维护和修改

## Rust 的注释类型

Rust 支持多种注释方式：

### 行注释

使用 `//` 创建行注释，从 `//` 开始到行尾都是注释。适合单行说明。

### 块注释

使用 `/* */` 创建块注释，可以跨越多行。适合较长的说明或临时禁用代码块。

### 文档注释

Rust 提供了特殊的文档注释：
- **`///`**：用于函数、结构体、枚举等项的文档注释
- **`//!`**：用于模块或 crate 级别的文档注释

文档注释支持 Markdown 格式，可以使用 `cargo doc` 命令生成 HTML 文档。

## 注释的最佳实践

- 注释应该解释"为什么"而不是"是什么"（代码本身已经说明了"是什么"）
- 保持注释与代码同步更新
- 避免过度注释显而易见的代码
- 使用文档注释为公共 API 提供文档`,
    exampleCode: `fn main() {
    // 这是行注释
    let x = 5; // 行尾注释
    
    /* 这是块注释
       可以跨越多行
       非常方便 */
    
    let y = 10;
    
    /// 这是文档注释
    /// 用于生成 API 文档
    fn documented_function() {
        // 函数实现
    }
}

//! 这也是文档注释
//! 用于模块级别的文档`,
    summary: [
      '// 用于行注释。',
      '/* */ 用于块注释。',
      '/// 用于函数/结构体文档注释。',
      '//! 用于模块级文档注释。',
      '注释帮助提高代码可读性。'
    ]
  },
  {
    id: '8',
    unitId: 'unit1',
    title: '控制流：if/else',
    description: '学习使用条件语句控制程序执行流程。',
    difficulty: '入门',
    content: `if 表达式允许根据条件执行不同的代码分支，是控制程序流程的基本工具。

## if 表达式 vs if 语句

在 Rust 中，`if` 是一个**表达式**而不是语句，这意味着它可以返回值。这是 Rust 与其他语言的重要区别。

作为表达式，`if` 可以：
- 在 `let` 语句中使用
- 作为函数返回值
- 嵌套使用创建复杂的条件逻辑

## 条件必须是 bool 类型

Rust 要求 `if` 的条件必须是 `bool` 类型，不能像其他语言那样使用数字或指针。这防止了常见的错误，如意外将 `0` 当作 `false`。

例如，以下代码在 Rust 中会编译错误：
- `if 1 { ... }` - 错误！数字不是 bool
- `if ptr { ... }` - 错误！指针不是 bool

必须明确写出布尔表达式：`if x > 0 { ... }`

## if-else if-else 链

可以使用 `else if` 处理多个条件。每个条件按顺序检查，第一个为 `true` 的分支会被执行。

## if 表达式的返回值

`if` 表达式的所有分支必须返回相同类型。如果分支返回不同类型，编译器会报错。这确保了类型安全。`,
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
  },
  {
    id: '9',
    unitId: 'unit1',
    title: '循环：loop、while、for',
    description: '学习三种循环方式，掌握如何重复执行代码。',
    difficulty: '入门',
    content: `循环允许你重复执行代码块，是编程中的基本控制流结构。Rust 提供了三种循环方式，每种都有不同的用途。

## 三种循环类型

### 1. loop - 无限循环

`loop` 创建一个无限循环，直到遇到 `break` 才会停止。适合需要重复执行直到满足某个条件的情况。

`loop` 可以返回值，使用 `break` 后跟值即可。这使得 `loop` 可以用于实现重试逻辑或等待特定条件。

### 2. while - 条件循环

`while` 循环在条件为 `true` 时重复执行。条件在每次循环开始前检查，如果为 `false`，循环立即停止。

适合循环次数不确定，但有一个明确的停止条件的情况。

### 3. for - 遍历循环

`for` 循环用于遍历集合或范围。这是 Rust 中最常用的循环方式，因为它最安全、最简洁。

`for` 循环会自动处理迭代器，避免了索引越界的风险。

## 循环标签

可以使用标签来标识循环，然后在 `break` 或 `continue` 中指定要跳出或继续的循环。这对于嵌套循环特别有用。

## 选择循环类型

- 需要无限循环直到特定条件：使用 `loop`
- 循环次数不确定但有停止条件：使用 `while`
- 遍历集合或范围：使用 `for`（推荐）`,
    exampleCode: `fn main() {
    // 1. loop - 无限循环
    let mut counter = 0;
    let result = loop {
        counter += 1;
        if counter == 10 {
            break counter * 2;  // break 可以返回值
        }
    };
    println!("结果是: {}", result);
    
    // 2. while - 条件循环
    let mut number = 3;
    while number != 0 {
        println!("{}!", number);
        number -= 1;
    }
    println!("发射！");
    
    // 3. for - 遍历集合
    let arr = [10, 20, 30, 40, 50];
    for element in arr.iter() {
        println!("值是: {}", element);
    }
    
    // for 遍历范围
    for number in 1..4 {  // 1, 2, 3
        println!("{}!", number);
    }
    
    for number in 1..=4 {  // 1, 2, 3, 4 (包含4)
        println!("{}!", number);
    }
}`,
    summary: [
      'loop 创建无限循环，需要 break 退出。',
      'while 根据条件重复执行。',
      'for 用于遍历集合或范围。',
      'break 可以返回值。',
      '使用 .. 创建范围（不包含终点），..= 包含终点。'
    ]
  },
  {
    id: '10',
    unitId: 'unit1',
    title: '所有权基础',
    description: '初步了解 Rust 的所有权概念，理解作用域和值的生命周期。',
    difficulty: '入门',
    content: `所有权是 Rust 最独特的特性，也是 Rust 与其他语言最大的区别。它让 Rust 可以在没有垃圾回收器的情况下保证内存安全。

## 所有权的核心思想

每个值都有一个所有者，当所有者离开作用域时，值会被自动丢弃。这个简单的规则解决了内存管理的根本问题：
- **自动内存管理**：无需手动释放内存，也无需垃圾回收器
- **编译时检查**：所有内存安全问题在编译时就能发现
- **零成本抽象**：运行时没有额外开销

## 作用域的概念

作用域是变量有效的代码范围。当变量进入作用域时有效，离开作用域时无效。

理解作用域对于理解所有权至关重要：
- 变量在声明处进入作用域
- 变量在作用域结束时离开作用域
- 离开作用域时，Rust 会自动调用 `drop` 函数释放内存

## 栈与堆的区别

理解栈和堆的区别有助于理解所有权：
- **栈**：存储固定大小的数据，速度快，自动管理
- **堆**：存储动态大小的数据，速度慢，需要手动管理（在 Rust 中由所有权系统自动管理）

对于存储在栈上的数据（如整数），赋值会复制。对于存储在堆上的数据（如 String），赋值会移动所有权。`,
    exampleCode: `fn main() {
    // 变量 s 在这里无效，尚未声明
    {
        let s = "hello";  // s 从这里开始有效
        // 使用 s
        println!("{}", s);
    }  // 作用域结束，s 不再有效
    
    // 字符串字面量（&str）存储在栈上
    let s1 = "hello";
    let s2 = s1;  // s1 和 s2 都有效（因为实现了 Copy）
    println!("s1: {}, s2: {}", s1, s2);
    
    // String 类型存储在堆上
    let s3 = String::from("hello");
    let s4 = s3;  // s3 的所有权移动到 s4，s3 失效
    // println!("{}", s3);  // 错误！s3 已无效
    println!("{}", s4);  // 正确
}`,
    summary: [
      '每个值都有一个所有者。',
      '当所有者离开作用域，值被丢弃。',
      'String 类型存储在堆上，所有权会移动。',
      '实现了 Copy trait 的类型（如整数）会复制而不是移动。',
      '作用域决定变量的生命周期。'
    ]
  },
  {
    id: '11',
    unitId: 'unit1',
    title: '作用域',
    description: '深入理解作用域的概念，掌握变量的生命周期。',
    difficulty: '入门',
    content: `作用域是变量有效的代码范围，是理解 Rust 所有权和借用系统的基础。

## 作用域的基本规则

变量从声明处开始有效，直到作用域结束。作用域通常由花括号 `{}` 定义：
- 函数体是一个作用域
- `if`、`while`、`for` 等代码块也是作用域
- 可以嵌套多个作用域

## 作用域与所有权

理解作用域对于理解所有权和借用非常重要：
- 变量在进入作用域时获得值的所有权
- 变量在离开作用域时释放值（调用 drop）
- 内层作用域可以访问外层作用域的变量
- 外层作用域不能访问内层作用域的变量

## 变量遮蔽（Shadowing）

Rust 允许在同一个作用域中使用同名变量遮蔽之前的变量。这与可变性不同：
- **遮蔽**：创建新变量，可以改变类型
- **可变性**：改变现有变量的值，不能改变类型

遮蔽让你可以在不改变变量名的情况下，将值从一种类型转换为另一种类型。`,
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
  },
  // 单元2：所有权系统
  {
    id: '12',
    unitId: 'unit2',
    title: '所有权规则',
    description: '深入理解所有权的三条基本规则。',
    difficulty: '进阶',
    content: `所有权的三条基本规则是 Rust 内存安全的基础。理解这些规则对于掌握 Rust 至关重要。

## 规则一：每个值都有一个所有者

Rust 中的每一个值都有一个被称为其所有者（owner）的变量。这个变量负责管理该值的生命周期。

当你创建一个值时，创建它的变量自动成为它的所有者。例如，`let s = String::from("hello");` 中，`s` 是字符串 "hello" 的所有者。

## 规则二：同一时刻只能有一个所有者

值在任一时刻有且只有一个所有者。这个规则确保了：
- **避免数据竞争**：不会有多个变量同时修改同一份数据
- **防止悬垂指针**：当值被释放时，不会有其他变量仍在使用它
- **简化内存管理**：编译器知道何时可以安全地释放内存

## 规则三：所有者离开作用域时值被丢弃

当所有者（变量）离开作用域，这个值将被自动丢弃。Rust 会调用 `drop` 函数来清理资源。

这个过程是自动的，你不需要手动释放内存。编译器会在编译时确定每个值的生命周期，确保内存安全。

## 这些规则的意义

这些规则确保了内存安全，无需垃圾回收器。通过编译时检查，Rust 可以：
- 防止内存泄漏
- 防止悬垂指针
- 防止数据竞争
- 获得 C/C++ 级别的性能`,
    exampleCode: `fn main() {
    // 规则1：每个值都有一个所有者
    let s = String::from("hello");  // s 是 "hello" 的所有者
    
    // 规则2：值在任一时刻有且只有一个所有者
    let s2 = s;  // s 的所有权移动到 s2
    // println!("{}", s);  // 错误！s 不再是所有者
    
    // 规则3：所有者离开作用域，值被丢弃
    {
        let s3 = String::from("world");
        // s3 在这里有效
    }  // s3 离开作用域，值被自动释放
    
    // 函数调用也会转移所有权
    let s4 = String::from("test");
    takes_ownership(s4);  // s4 的所有权移动到函数
    // println!("{}", s4);  // 错误！s4 已无效
}

fn takes_ownership(some_string: String) {
    println!("{}", some_string);
}  // some_string 离开作用域，值被丢弃`,
    summary: [
      '每个值都有一个所有者。',
      '同一时刻只能有一个所有者。',
      '所有者离开作用域时值被丢弃。',
      '所有权可以移动（Move）。',
      '这些规则保证内存安全。'
    ]
  },
  {
    id: '13',
    unitId: 'unit2',
    title: '移动（Move）',
    description: '理解所有权移动的机制，掌握何时发生移动。',
    difficulty: '进阶',
    content: `当将值赋给另一个变量或传递给函数时，会发生所有权的移动（Move）。理解移动机制是掌握 Rust 所有权的关键。

## 什么是移动（Move）？

移动是指将值的所有权从一个变量转移到另一个变量。移动后，原变量不再有效，不能再使用。

移动只发生在赋值、函数参数传递和函数返回值时。这是 Rust 确保内存安全的方式。

## 堆数据 vs 栈数据

对于存储在堆上的数据（如 String、Vec），赋值会移动所有权，原变量失效。这是因为堆数据可能很大，复制成本高，移动更高效。

对于实现了 Copy trait 的类型（如整数、布尔值、字符），会复制而不是移动。这些类型通常很小，复制成本低。

## Copy trait

实现了 `Copy` trait 的类型在赋值时会复制而不是移动。常见的 Copy 类型包括：
- 所有整数类型（i32, u64 等）
- 布尔类型（bool）
- 字符类型（char）
- 浮点类型（f32, f64）
- 包含 Copy 类型的元组

## 移动的规则

移动遵循以下规则：
- 移动后原变量失效，不能再使用
- 函数参数会移动所有权
- 函数返回值会转移所有权
- 移动是零成本的，只是改变所有权的标记`,
    exampleCode: `fn main() {
    // String 存储在堆上，会发生移动
    let s1 = String::from("hello");
    let s2 = s1;  // s1 的所有权移动到 s2
    // println!("{}", s1);  // 错误！s1 已无效
    
    // 整数实现了 Copy，会复制
    let x = 5;
    let y = x;  // x 的值被复制到 y
    println!("x: {}, y: {}", x, y);  // 两者都有效
    
    // 函数参数也会移动所有权
    let s3 = String::from("world");
    takes_string(s3);  // s3 的所有权移动到函数
    // println!("{}", s3);  // 错误！
    
    // 返回值也会转移所有权
    let s4 = gives_ownership();
    println!("{}", s4);
}

fn takes_string(s: String) {
    println!("{}", s);
}  // s 离开作用域，值被丢弃

fn gives_ownership() -> String {
    let some_string = String::from("hello");
    some_string  // 所有权返回给调用者
}`,
    summary: [
      '堆上数据的赋值会移动所有权。',
      '实现了 Copy 的类型会复制而不是移动。',
      '函数参数会移动所有权。',
      '返回值会转移所有权。',
      '移动后原变量失效。'
    ]
  },
  {
    id: '14',
    unitId: 'unit2',
    title: '克隆（Clone）',
    description: '学习如何使用 clone 方法创建数据的深拷贝。',
    difficulty: '进阶',
    content: `当需要复制堆上的数据时，可以使用 clone 方法。理解何时使用 clone 以及它的成本很重要。

## 什么是克隆（Clone）？

`clone` 会创建数据的深拷贝，这意味着会复制堆上的所有数据。克隆后，原变量和新变量都有效，它们拥有各自独立的数据副本。

## 何时使用 clone？

在以下情况下可能需要使用 clone：
- 需要保留原数据的同时创建副本
- 需要将数据传递给函数但不想转移所有权
- 需要在多个地方使用同一份数据

## clone 的成本

clone 可能会很昂贵，因为它需要：
- 分配新的堆内存
- 复制所有数据
- 对于嵌套结构，递归复制所有子数据

因此，要谨慎使用 clone。如果可能，优先考虑使用引用（借用）来避免所有权转移。

## Clone trait

实现了 `Clone` trait 的类型可以调用 `clone` 方法。许多标准库类型都实现了 Clone，你也可以为自己的类型实现 Clone。

使用 `#[derive(Clone)]` 可以为结构体和枚举自动实现 Clone trait。`,
    exampleCode: `fn main() {
    let s1 = String::from("hello");
    let s2 = s1.clone();  // 深拷贝，s1 和 s2 都有效
    println!("s1: {}, s2: {}", s1, s2);
    
    // 对于实现了 Clone trait 的类型
    let v1 = vec![1, 2, 3];
    let v2 = v1.clone();
    println!("v1: {:?}, v2: {:?}", v1, v2);
    
    // 结构体也可以实现 Clone
    #[derive(Clone)]
    struct Point {
        x: i32,
        y: i32,
    }
    
    let p1 = Point { x: 0, y: 0 };
    let p2 = p1.clone();
    println!("p1: ({}, {}), p2: ({}, {})", p1.x, p1.y, p2.x, p2.y);
    
    // 注意：clone 可能很昂贵
    let large_string = String::from("a very long string...");
    let copy = large_string.clone();  // 复制所有数据
}`,
    summary: [
      'clone 创建深拷贝。',
      'clone 后原变量仍然有效。',
      'clone 可能很昂贵，要谨慎使用。',
      '许多类型实现了 Clone trait。',
      '可以使用 #[derive(Clone)] 自动实现。'
    ]
  },
  {
    id: '15',
    unitId: 'unit2',
    title: '引用与借用',
    description: '学习如何使用引用，避免所有权转移。',
    difficulty: '进阶',
    content: `引用允许你使用值但不获取所有权。这被称为借用（Borrowing），是 Rust 中避免所有权转移的重要机制。

## 为什么需要引用？

如果每次使用值都要转移所有权，代码会变得非常繁琐。引用解决了这个问题：
- **避免所有权转移**：可以访问值而不获取所有权
- **提高效率**：不需要复制数据
- **支持多个访问**：可以有多个不可变引用同时存在

## 引用的创建

引用使用 `&` 符号创建。例如，`&s` 创建了 `s` 的引用。

引用默认是不可变的，这意味着通过引用不能修改借用的值。这保证了数据安全，防止意外的修改。

## 引用的生命周期

引用的生命周期不能超过它引用的数据。当数据被释放时，引用也会失效。Rust 的借用检查器会在编译时确保这一点。

## 借用规则

Rust 的借用遵循以下规则：
- 可以有多个不可变引用
- 只能有一个可变引用
- 不能同时有可变和不可变引用

这些规则在编译时检查，确保内存安全和数据竞争安全。`,
    exampleCode: `fn main() {
    let s1 = String::from("hello");
    
    // 创建引用（借用）
    let len = calculate_length(&s1);  // &s1 创建引用
    println!("'{}' 的长度是 {}", s1, len);  // s1 仍然有效
    
    // 引用默认不可变
    let s2 = String::from("world");
    // change(&s2);  // 错误！不能通过不可变引用修改值
}

fn calculate_length(s: &String) -> usize {
    s.len()
}  // s 离开作用域，但因为它只是引用，不会丢弃值

// 这个函数会编译错误
// fn change(some_string: &String) {
//     some_string.push_str(", world");  // 错误！
// }`,
    summary: [
      '引用使用 & 符号创建。',
      '引用允许使用值但不获取所有权。',
      '引用默认不可变。',
      '引用离开作用域不会丢弃值。',
      '借用避免了所有权转移。'
    ]
  },
  {
    id: '16',
    unitId: 'unit2',
    title: '可变引用',
    description: '学习如何使用可变引用修改借用的值。',
    difficulty: '进阶',
    content: `可变引用允许修改借用的值，使用 `&mut` 创建可变引用。这是 Rust 在保证安全性的同时提供灵活性的方式。

## 可变引用的用途

可变引用让你可以：
- 修改借用的值而不获取所有权
- 在函数中修改参数
- 实现可变借用模式

## 可变引用的限制

可变引用有一个重要限制：在特定作用域中，对特定数据只能有一个可变引用。这个限制防止了数据竞争。

数据竞争是指多个线程同时访问同一数据，且至少有一个是写操作。Rust 在编译时就防止了这种情况。

## 为什么只能有一个可变引用？

这个限制确保了：
- **数据竞争安全**：不会有多个地方同时修改数据
- **内存安全**：避免了悬垂指针和未定义行为
- **编译时检查**：所有问题在编译时就能发现

## 可变引用 vs 不可变引用

- **不可变引用**：可以有多个，但不能修改值
- **可变引用**：只能有一个，但可以修改值
- **不能同时存在**：不能同时有可变和不可变引用

这个设计让 Rust 在编译时就能保证内存安全和线程安全。`,
    exampleCode: `fn main() {
    let mut s = String::from("hello");
    
    // 创建可变引用
    change(&mut s);
    println!("{}", s);  // "hello, world"
    
    // 可变引用的限制
    let mut s2 = String::from("test");
    let r1 = &mut s2;
    // let r2 = &mut s2;  // 错误！不能有多个可变引用
    println!("{}", r1);
    
    // 但是可以有多个不可变引用
    let s3 = String::from("hello");
    let r1 = &s3;
    let r2 = &s3;  // 可以
    println!("{}, {}", r1, r2);
    
    // 不能同时有可变和不可变引用
    let mut s4 = String::from("hello");
    let r1 = &s4;
    // let r2 = &mut s4;  // 错误！
    println!("{}", r1);
}

fn change(some_string: &mut String) {
    some_string.push_str(", world");
}`,
    summary: [
      '使用 &mut 创建可变引用。',
      '可变引用允许修改值。',
      '同一作用域只能有一个可变引用。',
      '可以有多个不可变引用。',
      '不能同时有可变和不可变引用。'
    ]
  },
  {
    id: '17',
    unitId: 'unit2',
    title: '悬垂引用',
    description: '理解悬垂引用的概念，了解 Rust 如何防止它们。',
    difficulty: '进阶',
    content: `悬垂引用是指指向已被释放内存的引用。这是其他语言中常见的 bug 来源，但在 Rust 中，编译器会确保这种情况永远不会发生。

## 什么是悬垂引用？

悬垂引用是指引用指向的内存已经被释放，但引用仍然存在。使用悬垂引用会导致未定义行为，可能造成程序崩溃或安全漏洞。

## Rust 如何防止悬垂引用？

在 Rust 中，编译器会确保引用永远不会比它指向的数据活得更久。这通过生命周期系统实现：
- 编译器会检查所有引用的生命周期
- 确保引用的生命周期不超过数据的生命周期
- 如果发现悬垂引用的可能性，编译会失败

## 借用检查器

Rust 的借用检查器会检查所有引用，确保它们都是有效的。借用检查器会：
- 跟踪每个引用的生命周期
- 确保引用在使用时数据仍然有效
- 在编译时报告所有潜在问题

## 生命周期标注

大多数情况下，Rust 可以自动推断生命周期。但在某些复杂情况下，需要显式标注生命周期参数，帮助编译器理解引用的有效性。

## 悬垂引用的示例

尝试返回局部变量的引用会导致编译错误，因为局部变量在函数返回时就被释放了。Rust 会在编译时捕获这种错误，而不是等到运行时。`,
    exampleCode: `fn main() {
    // 这个函数会编译错误，因为返回了悬垂引用
    // fn dangle() -> &String {
    //     let s = String::from("hello");
    //     &s  // 错误！s 离开作用域后被丢弃
    // }
    
    // 正确的做法：返回所有权
    let s = no_dangle();
    println!("{}", s);
}

fn no_dangle() -> String {
    let s = String::from("hello");
    s  // 返回所有权，而不是引用
}

// Rust 的借用检查器会阻止这样的代码：
// {
//     let r;
//     {
//         let x = 5;
//         r = &x;  // 错误！x 的生命周期不够长
//     }
//     println!("{}", r);  // r 指向的 x 已经不存在
// }`,
    summary: [
      '悬垂引用指向已释放的内存。',
      'Rust 编译器会阻止悬垂引用。',
      '引用不能比数据活得更久。',
      '借用检查器确保引用有效性。',
      '返回引用时要确保数据仍然有效。'
    ]
  },
  {
    id: '18',
    unitId: 'unit2',
    title: '生命周期基础',
    description: '初步了解生命周期，理解引用有效性的保证。',
    difficulty: '进阶',
    content: `生命周期是 Rust 中引用有效的作用域。生命周期系统确保引用在使用时是有效的，这是 Rust 内存安全的重要组成部分。

## 什么是生命周期？

生命周期是引用有效的作用域。每个引用都有一个生命周期，表示引用在代码中有效的范围。

生命周期的主要目的是防止悬垂引用，确保引用不会指向已经被释放的内存。

## 生命周期推断

大多数情况下，生命周期是隐式的，编译器可以自动推断。编译器会分析代码，确定每个引用的生命周期。

例如，在函数中，编译器通常可以推断参数和返回值的生命周期关系。

## 何时需要显式标注？

有时需要显式标注生命周期参数，特别是当：
- 函数返回引用时
- 有多个引用参数时
- 编译器无法推断生命周期时

生命周期标注使用单引号和标识符，如 `'a`、`'b` 等。

## 生命周期标注的语法

生命周期标注的语法是 `'name`，通常放在引用类型中，如 `&'a str`。生命周期参数放在函数名后的尖括号中，如 `fn longest<'a>(x: &'a str, y: &'a str) -> &'a str`。

## 生命周期的作用

生命周期系统让 Rust 可以：
- 在编译时检查引用的有效性
- 防止悬垂引用
- 不需要运行时开销
- 提供内存安全保障`,
    exampleCode: `fn main() {
    let string1 = String::from("long string is long");
    {
        let string2 = String::from("xyz");
        let result = longest(string1.as_str(), string2.as_str());
        println!("最长的字符串是 {}", result);
    }
}

// 这个函数需要生命周期标注
fn longest<'a>(x: &'a str, y: &'a str) -> &'a str {
    if x.len() > y.len() {
        x
    } else {
        y
    }
}

// 生命周期标注 'a 表示：
// - 参数 x 和 y 的引用至少和 'a 一样长
// - 返回的引用也至少和 'a 一样长

// 结构体中的生命周期
struct ImportantExcerpt<'a> {
    part: &'a str,
}

fn main2() {
    let novel = String::from("Call me Ishmael. Some years ago...");
    let first_sentence = novel.split('.').next().expect("找不到 '.'");
    let i = ImportantExcerpt {
        part: first_sentence,
    };
}`,
    summary: [
      '生命周期确保引用在使用时有效。',
      '大多数情况下生命周期可以推断。',
      '生命周期参数使用 \'a 语法。',
      '结构体可以包含引用，需要生命周期标注。',
      '生命周期是 Rust 内存安全的关键。'
    ]
  },
  // 单元3：复合数据类型
  {
    id: '19',
    unitId: 'unit3',
    title: '元组',
    description: '学习元组类型，将多个不同类型的值组合在一起。',
    difficulty: '入门',
    content: `元组是将多个不同类型的值组合成一个复合类型的方式。它让你可以将相关的值组织在一起，即使它们的类型不同。

## 元组的特点

元组有以下特点：
- **固定长度**：一旦声明，其长度和类型就不能改变
- **不同类型**：可以包含不同类型的值
- **有序**：元素有固定的顺序，通过索引访问

## 元组的用途

元组适合用于：
- 从函数返回多个值
- 将相关的值临时组合在一起
- 作为函数的参数传递多个值
- 解构赋值，同时获取多个值

## 元组 vs 结构体

元组和结构体都可以组合多个值，但有不同的用途：
- **元组**：适合临时组合，不需要命名字段
- **结构体**：适合表示有意义的实体，有命名字段更清晰

## 元组的访问方式

可以通过两种方式访问元组元素：
- **索引访问**：使用点号和索引，如 `tup.0`
- **解构**：使用模式匹配解构元组，如 `let (x, y) = tup;`

解构是 Rust 中常用的模式，可以同时获取多个值。`,
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
  },
  {
    id: '20',
    unitId: 'unit3',
    title: '模式匹配（match）深入',
    description: '深入学习 match 表达式的各种用法和模式。',
    difficulty: '进阶',
    content: `match 是 Rust 中最强大的控制流结构之一。它允许你将值与一系列模式进行比较，并根据匹配的模式执行相应代码。

## match 的强大之处

match 表达式提供了：
- **模式匹配**：可以匹配值、结构、枚举变体等
- **穷尽性检查**：编译器确保所有可能的情况都被处理
- **返回值**：match 是表达式，可以返回值
- **解构能力**：可以在匹配时解构值

## 穷尽性检查

match 必须是**穷尽的**（exhaustive），必须覆盖所有可能的情况。如果遗漏了某个变体，编译器会报错。

这个特性确保了代码的完整性，防止了遗漏处理某些情况导致的 bug。这是 Rust 安全性的重要体现。

## 模式匹配

match 支持多种模式：
- 字面量匹配
- 变量绑定
- 通配符模式（`_`）
- 范围匹配
- 守卫条件（`if`）

## match vs if-else

虽然 `if-else` 也可以处理条件，但 `match` 更适合：
- 匹配枚举变体
- 需要处理多个离散值
- 需要解构值
- 需要穷尽性检查

## 使用 _ 通配符

可以使用 `_` 作为通配符，匹配所有其他情况。这在处理枚举时特别有用，可以明确表示"处理所有其他情况"。`,
    exampleCode: `fn main() {
    let number = 5;
    
    // 基本匹配
    match number {
        1 => println!("一"),
        2 => println!("二"),
        3 => println!("三"),
        _ => println!("其他"),  // 通配符，匹配所有其他值
    }
    
    // 匹配多个值
    match number {
        1 | 2 => println!("一或二"),
        3..=5 => println!("三到五"),
        _ => println!("其他"),
    }
    
    // 匹配并绑定值
    let point = (0, 5);
    match point {
        (0, y) => println!("在 y 轴上，y = {}", y),
        (x, 0) => println!("在 x 轴上，x = {}", x),
        (x, y) => println!("在 ({}, {})", x, y),
    }
    
    // match 作为表达式
    let result = match number {
        n if n < 5 => "小于5",
        n if n == 5 => "等于5",
        _ => "大于5",
    };
    println!("{}", result);
}`,
    summary: [
      'match 必须覆盖所有可能的情况。',
      '使用 | 匹配多个值。',
      '使用 ..= 匹配范围。',
      '可以使用 if 条件（守卫）。',
      'match 是表达式，可以返回值。'
    ]
  },
  {
    id: '21',
    unitId: 'unit3',
    title: 'if let 和 while let',
    description: '学习 if let 和 while let 语法糖，简化模式匹配。',
    difficulty: '进阶',
    content: `if let 和 while let 是 match 的语法糖，用于处理只关心一种匹配模式的情况。它们让代码更简洁，但失去了 match 的穷尽性检查。

## if let 语法

`if let` 允许你只处理一种匹配模式，忽略其他所有情况。这对于处理 `Option` 或 `Result` 时特别有用。

例如，如果你只关心 `Some` 值，可以使用 `if let Some(x) = option`，而不需要写完整的 `match` 表达式。

## while let 语法

`while let` 类似于 `if let`，但用于循环。只要模式匹配成功，循环就会继续执行。

这对于从迭代器中获取值特别有用，可以简洁地处理 `Some` 值，直到遇到 `None`。

## 何时使用 if let / while let？

使用 `if let` 或 `while let` 当：
- 只关心一种匹配模式
- 其他情况可以忽略
- 需要更简洁的代码

## 何时使用 match？

使用 `match` 当：
- 需要处理所有可能的情况
- 需要穷尽性检查
- 需要处理多种模式

## 权衡

`if let` 和 `while let` 提供了简洁性，但失去了 `match` 的穷尽性检查。在选择时，要考虑是否需要处理所有情况。`,
    exampleCode: `fn main() {
    // if let - 只匹配一种情况
    let favorite_color: Option<&str> = None;
    let is_tuesday = false;
    let age: Result<u8, _> = "34".parse();
    
    if let Some(color) = favorite_color {
        println!("使用你喜欢的颜色 {}", color);
    } else if is_tuesday {
        println!("星期二是绿色日！");
    } else if let Ok(age) = age {
        if age > 30 {
            println!("使用紫色");
        } else {
            println!("使用橙色");
        }
    } else {
        println!("使用蓝色");
    }
    
    // while let - 循环直到模式不匹配
    let mut stack = Vec::new();
    stack.push(1);
    stack.push(2);
    stack.push(3);
    
    while let Some(top) = stack.pop() {
        println!("{}", top);
    }
    
    // for 循环中的模式匹配
    let v = vec!['a', 'b', 'c'];
    for (index, value) in v.iter().enumerate() {
        println!("{} 在索引 {}", value, index);
    }
}`,
    summary: [
      'if let 用于只匹配一种模式的情况。',
      'while let 用于循环直到模式不匹配。',
      '可以结合 else 使用。',
      '比 match 简洁，但失去穷尽性检查。',
      'for 循环也可以使用模式匹配。'
    ]
  },
  {
    id: '22',
    unitId: 'unit3',
    title: 'Option<T> 类型',
    description: '深入学习 Option 枚举，Rust 中处理空值的方式。',
    difficulty: '进阶',
    content: `Option<T> 是 Rust 标准库中用于表示可能为空值的类型。它是 Rust 处理空值的标准方式，避免了其他语言中常见的空指针异常问题。

## 为什么需要 Option？

在其他语言中，空值（null）是许多 bug 的根源。Rust 通过 `Option<T>` 类型系统层面解决了这个问题：
- **类型安全**：空值不再是特殊值，而是类型系统的一部分
- **强制处理**：必须显式处理 `None` 情况，不能忽略
- **编译时检查**：所有空值问题在编译时就能发现

## Option 的两个变体

`Option<T>` 有两个变体：
- **Some(T)**：包含一个值，表示有值的情况
- **None**：不包含值，表示空值的情况

## 使用 Option

使用 `Option` 时，必须处理两种情况：
- 使用 `match` 表达式显式处理
- 使用 `if let` 只处理 `Some` 情况
- 使用 `unwrap` 或 `expect`（不推荐，可能 panic）
- 使用 `unwrap_or` 提供默认值

## Option 的常用方法

`Option` 提供了许多有用的方法：
- `unwrap()`：获取值，如果是 `None` 会 panic
- `unwrap_or(default)`：获取值或默认值
- `map(f)`：如果有值，应用函数转换
- `and_then(f)`：链式操作
- `is_some()` / `is_none()`：检查是否有值

## Option 的优势

使用 `Option` 而不是空指针：
- 类型系统强制处理空值
- 编译时检查，运行时安全
- 代码意图更明确
- 避免空指针异常`,
    exampleCode: `fn main() {
    // Option 的基本使用
    let some_number = Some(5);
    let some_string = Some("a string");
    let absent_number: Option<i32> = None;
    
    // 使用 match 处理 Option
    let x: Option<i32> = Some(5);
    match x {
        Some(value) => println!("值是: {}", value),
        None => println!("没有值"),
    }
    
    // Option 的常用方法
    let number = Some(5);
    let no_number: Option<i32> = None;
    
    // unwrap - 如果是 None 会 panic
    // let value = no_number.unwrap();  // 危险！
    
    // unwrap_or - 提供默认值
    let value = no_number.unwrap_or(0);
    println!("值: {}", value);
    
    // map - 转换值
    let doubled = number.map(|n| n * 2);
    println!("{:?}", doubled);  // Some(10)
    
    // 使用 ? 运算符传播 None
    let result = divide(10, 2);
    match result {
        Some(value) => println!("结果: {}", value),
        None => println!("除以零"),
    }
}

fn divide(numerator: f64, denominator: f64) -> Option<f64> {
    if denominator == 0.0 {
        None
    } else {
        Some(numerator / denominator)
    }
}`,
    summary: [
      'Option<T> 表示可能为空的值。',
      'Some(T) 包含值，None 表示无值。',
      '使用 match 处理 Option。',
      '可以使用 unwrap_or 提供默认值。',
      'map 方法可以转换 Option 中的值。'
    ]
  },
  {
    id: '23',
    unitId: 'unit3',
    title: 'Result<T, E> 类型',
    description: '学习 Result 类型，Rust 中处理错误的标准方式。',
    difficulty: '进阶',
    content: `Result<T, E> 是 Rust 中用于处理可能失败的操作的类型。它是 Rust 错误处理的标准方式，避免了其他语言中异常机制的问题。

## 为什么使用 Result？

Rust 没有异常机制，而是使用 `Result` 类型显式处理错误：
- **显式错误处理**：错误是类型系统的一部分，不能忽略
- **性能优势**：没有异常处理的运行时开销
- **类型安全**：编译器强制处理错误情况
- **可组合性**：可以链式处理多个可能失败的操作

## Result 的两个变体

`Result<T, E>` 有两个变体：
- **Ok(T)**：操作成功，包含结果值
- **Err(E)**：操作失败，包含错误信息

`T` 是成功时的值类型，`E` 是错误类型。

## 处理 Result

处理 `Result` 的常用方式：
- 使用 `match` 表达式显式处理两种情况
- 使用 `unwrap` 或 `expect`（不推荐，可能 panic）
- 使用 `unwrap_or` 提供默认值
- 使用 `?` 运算符传播错误
- 使用 `map` 和 `and_then` 链式操作

## ? 运算符

`?` 运算符是处理 `Result` 的便捷方式：
- 如果值是 `Ok`，解包并继续
- 如果值是 `Err`，从函数返回该错误
- 只能用于返回 `Result` 的函数

## Result vs Option

`Result` 和 `Option` 类似，但用途不同：
- **Option**：表示可能为空的值
- **Result**：表示可能失败的操作

两者都强制显式处理所有情况，确保代码的健壮性。`,
    exampleCode: `fn main() {
    // Result 的基本使用
    let success: Result<i32, &str> = Ok(42);
    let failure: Result<i32, &str> = Err("出错了");
    
    // 使用 match 处理 Result
    match success {
        Ok(value) => println!("成功: {}", value),
        Err(e) => println!("错误: {}", e),
    }
    
    // Result 的常用方法
    let result: Result<i32, &str> = Ok(5);
    
    // unwrap - 如果是 Err 会 panic
    // let value = failure.unwrap();  // 危险！
    
    // unwrap_or - 提供默认值
    let value = failure.unwrap_or(0);
    println!("值: {}", value);
    
    // ? 运算符 - 传播错误
    match parse_and_double("10") {
        Ok(value) => println!("结果: {}", value),
        Err(e) => println!("错误: {}", e),
    }
    
    // map - 转换 Ok 中的值
    let doubled = result.map(|n| n * 2);
    println!("{:?}", doubled);  // Ok(10)
}

fn parse_and_double(s: &str) -> Result<i32, std::num::ParseIntError> {
    let num = s.parse::<i32>()?;  // ? 传播错误
    Ok(num * 2)
}`,
    summary: [
      'Result<T, E> 表示可能失败的操作。',
      'Ok(T) 表示成功，Err(E) 表示失败。',
      '使用 match 处理 Result。',
      '? 运算符可以传播错误。',
      'map 方法可以转换 Ok 中的值。'
    ]
  },
  {
    id: '24',
    unitId: 'unit3',
    title: '结构体方法',
    description: '学习如何为结构体定义方法，使用 impl 块。',
    difficulty: '入门',
    content: `方法类似于函数，但它们在结构体的上下文中定义，第一个参数总是 `self`。方法让你可以为结构体添加行为，将数据和行为组织在一起。

## 方法与函数的区别

方法与函数的主要区别：
- **上下文**：方法在结构体的上下文中定义
- **第一个参数**：方法的第一个参数总是 `self`，表示方法被调用的实例
- **调用方式**：方法使用点号调用，如 `rect.area()`
- **自动引用**：Rust 会自动添加 `&`、`&mut` 或 `*`，使对象匹配方法签名

## impl 块

使用 `impl` 块为结构体定义方法。一个结构体可以有多个 `impl` 块，这在组织代码时很有用。

## 实例方法 vs 关联函数

可以定义两种类型的方法：

### 实例方法

接收 `self` 作为第一个参数的方法：
- `&self`：不可变引用，可以读取但不能修改
- `&mut self`：可变引用，可以修改
- `self`：获取所有权，通常用于转换或消费

### 关联函数

不接收 `self` 的函数，类似于其他语言中的静态方法：
- 使用 `::` 调用，如 `String::from()`
- 常用于构造函数，如 `Rectangle::new()`
- 也可以用于工具函数

## 方法的好处

使用方法可以：
- 将相关功能组织在一起
- 提供更清晰的 API
- 利用 Rust 的自动引用和解引用
- 实现面向对象风格的代码组织`,
    exampleCode: `struct Rectangle {
    width: u32,
    height: u32,
}

impl Rectangle {
    // 关联函数（不接收 self）
    fn square(size: u32) -> Rectangle {
        Rectangle {
            width: size,
            height: size,
        }
    }
    
    // 实例方法（接收 &self）
    fn area(&self) -> u32 {
        self.width * self.height
    }
    
    // 可变方法（接收 &mut self）
    fn double_size(&mut self) {
        self.width *= 2;
        self.height *= 2;
    }
    
    // 获取所有权的方法（接收 self）
    fn into_tuple(self) -> (u32, u32) {
        (self.width, self.height)
    }
    
    // 方法可以调用其他方法
    fn can_hold(&self, other: &Rectangle) -> bool {
        self.width > other.width && self.height > other.height
    }
}

fn main() {
    let mut rect = Rectangle {
        width: 30,
        height: 50,
    };
    
    println!("面积: {}", rect.area());
    
    rect.double_size();
    println!("放大后面积: {}", rect.area());
    
    let square = Rectangle::square(10);
    println!("正方形面积: {}", square.area());
    
    println!("rect 能容纳 square: {}", rect.can_hold(&square));
}`,
    summary: [
      '使用 impl 块定义方法。',
      '&self 表示不可变引用。',
      '&mut self 表示可变引用。',
      'self 表示获取所有权。',
      '关联函数使用 :: 调用，方法使用 . 调用。'
    ]
  },
  // 单元4：集合类型
  {
    id: '25',
    unitId: 'unit4',
    title: 'Vector',
    description: '学习 Vec<T>，Rust 中的动态数组。',
    difficulty: '入门',
    content: `Vector（Vec<T>）是 Rust 中的动态数组，可以在运行时增长或缩小。它是 Rust 中最常用的集合类型之一。

## Vector 的特点

Vector 具有以下特点：
- **动态大小**：可以在运行时增长或缩小
- **堆存储**：数据存储在堆上，可以存储大量数据
- **类型统一**：所有元素必须是相同类型
- **高效访问**：支持通过索引快速访问元素

## 何时使用 Vector？

Vector 适合以下场景：
- 需要存储数量未知的元素
- 需要频繁添加或删除元素
- 需要按顺序访问元素
- 需要高效的索引访问

## Vector 的创建方式

有多种方式创建 Vector：
- `Vec::new()`：创建空 Vector
- `vec![]` 宏：创建并初始化 Vector
- `vec![value; count]`：创建包含重复值的 Vector

## Vector 的常用操作

Vector 提供了丰富的操作：
- `push()`：在末尾添加元素
- `pop()`：移除并返回最后一个元素
- `get(index)`：安全地获取元素，返回 `Option`
- `[index]`：直接索引访问，越界会 panic
- `len()`：获取长度
- `is_empty()`：检查是否为空

## 存储不同类型

虽然 Vector 要求所有元素类型相同，但可以使用枚举来存储不同类型。这是 Rust 中常见的模式，既保证了类型安全，又提供了灵活性。`,
    exampleCode: `fn main() {
    // 创建 Vector
    let mut v: Vec<i32> = Vec::new();
    let v2 = vec![1, 2, 3];  // 使用宏创建
    
    // 添加元素
    v.push(1);
    v.push(2);
    v.push(3);
    
    // 访问元素
    let third = &v[2];  // 索引访问，如果越界会 panic
    println!("第三个元素: {}", third);
    
    // 安全访问
    match v.get(2) {
        Some(third) => println!("第三个元素: {}", third),
        None => println!("没有第三个元素"),
    }
    
    // 遍历
    for i in &v {
        println!("{}", i);
    }
    
    // 可变遍历
    for i in &mut v {
        *i += 50;  // 解引用并修改
    }
    
    // 使用枚举存储不同类型
    enum SpreadsheetCell {
        Int(i32),
        Float(f64),
        Text(String),
    }
    
    let row = vec![
        SpreadsheetCell::Int(3),
        SpreadsheetCell::Text(String::from("blue")),
        SpreadsheetCell::Float(10.12),
    ];
}`,
    summary: [
      'Vec<T> 是动态数组。',
      '使用 push 添加元素。',
      '使用索引或 get 访问元素。',
      '可以使用枚举存储不同类型。',
      'Vector 在堆上分配内存。'
    ]
  },
  {
    id: '26',
    unitId: 'unit4',
    title: 'String 深入',
    description: '深入学习 String 类型，理解字符串的内部实现。',
    difficulty: '进阶',
    content: `String 是 Rust 中可增长的、可变的、有所有权的 UTF-8 编码字符串类型。理解 String 和 &str 的区别对于掌握 Rust 的字符串处理很重要。

## String vs &str

Rust 有两种主要的字符串类型：
- **String**：可增长的、可变的、有所有权的字符串，存储在堆上
- **&str**：字符串切片，通常是借用的，不可变

## String 的特点

String 具有以下特点：
- **可增长**：可以在运行时添加内容
- **可变**：可以修改内容
- **有所有权**：拥有字符串数据的所有权
- **UTF-8 编码**：支持所有 Unicode 字符

## &str 的特点

&str 是字符串切片：
- **不可变**：不能修改内容
- **借用**：通常是借用的，不拥有数据
- **高效**：不需要分配堆内存
- **灵活**：可以引用 String 的一部分或字符串字面量

## 何时使用 String？

使用 String 当：
- 需要修改字符串内容
- 需要从用户输入构建字符串
- 需要拥有字符串的所有权
- 字符串大小在运行时确定

## 何时使用 &str？

使用 &str 当：
- 只需要读取字符串
- 作为函数参数（更灵活）
- 处理字符串字面量
- 不需要所有权

## 字符串操作

String 提供了丰富的操作：
- `push_str()`：追加字符串
- `push()`：追加单个字符
- `+` 运算符：连接字符串（会移动所有权）
- `format!` 宏：格式化字符串（推荐）

## UTF-8 的挑战

由于 String 是 UTF-8 编码，不能直接通过索引访问字符。需要使用 `chars()` 方法遍历字符，或使用字符串切片（但要小心，必须按字节边界切片）。`,
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
  },
  {
    id: '27',
    unitId: 'unit4',
    title: 'HashMap',
    description: '学习 HashMap<K, V>，Rust 中的键值对集合。',
    difficulty: '进阶',
    content: `HashMap 存储键值对，使用哈希函数决定如何将这些键值对放入内存。它是 Rust 中实现键值对映射的标准方式。

## HashMap 的特点

HashMap 具有以下特点：
- **键值对存储**：每个键对应一个值
- **快速查找**：通过哈希函数实现 O(1) 平均时间复杂度的查找
- **类型统一**：所有键必须是相同类型，所有值也必须是相同类型
- **无序**：不保证元素的顺序（如果需要有序，可以使用 BTreeMap）

## 何时使用 HashMap？

HashMap 适合以下场景：
- 需要快速查找值
- 需要建立键值映射关系
- 需要统计计数
- 不需要保持插入顺序

## HashMap 的创建

创建 HashMap 需要导入 `std::collections::HashMap`。可以使用 `new()` 创建空 HashMap，或使用迭代器从键值对创建。

## HashMap 的常用操作

HashMap 提供了丰富的操作：
- `insert(key, value)`：插入或更新键值对
- `get(key)`：获取值，返回 `Option<&V>`
- `remove(key)`：移除键值对
- `contains_key(key)`：检查是否包含键
- `entry(key)`：获取 Entry，用于只在不存在时插入

## Entry API

Entry API 是 HashMap 的强大特性，允许你：
- 只在键不存在时插入
- 根据旧值更新新值
- 实现复杂的插入逻辑

这对于实现计数器、缓存等场景特别有用。

## 哈希函数

HashMap 使用哈希函数将键映射到存储位置。默认的哈希函数提供了安全性和性能的平衡，但在某些场景下，可以使用自定义哈希函数来优化性能。`,
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
  },
  {
    id: '28',
    unitId: 'unit4',
    title: '迭代器',
    description: '学习迭代器模式，Rust 中处理集合的强大方式。',
    difficulty: '进阶',
    content: `迭代器允许你依次处理序列中的每个元素。它是 Rust 中处理集合的强大方式，提供了函数式编程风格的 API。

## 迭代器的优势

使用迭代器可以：
- **安全**：避免索引越界错误
- **高效**：编译器可以优化迭代器代码
- **简洁**：链式调用让代码更清晰
- **灵活**：可以组合多个操作

## 惰性求值

Rust 的迭代器是**惰性的**（lazy），只有在消费迭代器时才会执行。这意味着：
- 创建迭代器不会立即执行操作
- 只有在调用消费方法（如 `collect`、`for` 循环）时才执行
- 可以链式组合多个操作，但不会立即计算

## 迭代器适配器

迭代器提供了许多适配器方法，用于转换和处理数据：
- `map()`：转换每个元素
- `filter()`：过滤元素
- `fold()`：累积操作
- `zip()`：组合两个迭代器
- `enumerate()`：获取索引和值

这些方法返回新的迭代器，可以链式调用。

## 消费迭代器

消费迭代器的方法会实际执行操作并消耗迭代器：
- `collect()`：收集到集合
- `sum()`：求和
- `count()`：计数
- `for` 循环：遍历并执行操作

## 三种迭代器类型

Rust 提供了三种迭代器：
- `iter()`：返回不可变引用
- `iter_mut()`：返回可变引用
- `into_iter()`：获取所有权

选择哪种取决于你的需求。`,
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
  },
  {
    id: '29',
    unitId: 'unit4',
    title: '闭包',
    description: '学习闭包（匿名函数），Rust 中的函数式编程特性。',
    difficulty: '进阶',
    content: `闭包是可以捕获其环境中变量的匿名函数。它是 Rust 中函数式编程的重要特性，提供了灵活和强大的代码组织方式。

## 什么是闭包？

闭包类似于函数，但有以下特点：
- **匿名**：没有函数名
- **捕获环境**：可以访问定义它的作用域中的变量
- **灵活**：可以存储在变量中，可以作为参数传递

## 闭包的语法

闭包使用 `|参数|` 语法定义，参数类型通常可以省略（编译器可以推断）。闭包体可以是表达式或代码块。

## 三种捕获方式

闭包可以捕获三种方式的值：

### 1. 不可变借用

闭包通过不可变引用捕获变量。闭包执行后，原变量仍然可以使用。这是默认的捕获方式。

### 2. 可变借用

闭包通过可变引用捕获变量。闭包执行期间，原变量不能在其他地方使用。

### 3. 获取所有权

使用 `move` 关键字，闭包可以获取变量的所有权。这对于将闭包传递给其他线程特别有用。

## 闭包的用途

闭包常用于：
- 作为函数参数（如迭代器方法）
- 存储为变量
- 从函数返回
- 实现回调函数
- 并发编程（配合线程使用）

## 闭包的类型推断

闭包的类型是唯一的，不能直接用类型标注。但可以存储在实现了特定 trait 的类型中，如 `Fn`、`FnMut`、`FnOnce`。

## 性能考虑

闭包通常是零成本的抽象，编译器会内联优化。但在某些情况下，闭包可能需要在堆上分配，需要注意性能影响。`,
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
  },
  // 单元5：错误处理
  {
    id: '30',
    unitId: 'unit5',
    title: 'panic! 宏',
    description: '学习 panic! 宏，理解程序崩溃时的行为。',
    difficulty: '入门',
    content: `panic! 宏会导致程序立即终止并打印错误信息。理解何时使用 panic 以及如何避免 panic 对于编写健壮的 Rust 程序很重要。

## 什么是 panic？

panic 是程序遇到不可恢复错误时的行为。当发生 panic 时：
- 程序会立即终止
- 打印错误信息和堆栈跟踪
- 清理当前线程的栈（但可能不会清理其他线程）

## 何时会发生 panic？

panic 会在以下情况发生：
- 显式调用 `panic!` 宏
- 数组或 Vector 索引越界
- 调用 `unwrap()` 或 `expect()` 在 `None` 或 `Err` 上
- 整数除以零
- 断言失败

## panic vs Result

Rust 区分两种错误处理方式：
- **panic**：用于不可恢复的错误，程序应该终止
- **Result**：用于可恢复的错误，应该被处理

## 何时使用 panic？

panic 应该用于：
- 程序遇到了不应该发生的错误
- 继续执行会导致更严重的问题
- 开发阶段快速定位问题

## 何时避免 panic？

在生产代码中，应该：
- 使用 `Result` 处理可恢复的错误
- 使用 `Option` 处理可能为空的值
- 提供有意义的错误信息
- 让调用者决定如何处理错误

## 处理 panic

可以使用 `std::panic::catch_unwind` 捕获 panic（不推荐），但更好的做法是：
- 在开发时使用 panic 快速定位问题
- 在生产代码中使用 Result 处理错误
- 提供清晰的错误信息

## panic hook

可以设置 panic hook 来自定义 panic 时的行为，这对于日志记录或错误报告很有用。`,
    exampleCode: `fn main() {
    // 直接调用 panic!
    // panic!("出错了！");
    
    // 通过索引越界触发 panic
    let v = vec![1, 2, 3];
    // let value = v[99];  // 会 panic
    
    // 使用 expect 和 unwrap 也可能 panic
    let x: Option<i32> = None;
    // let value = x.unwrap();  // 会 panic
    // let value = x.expect("x 是 None");  // 会 panic，但可以自定义消息
    
    // 使用 match 安全处理
    match x {
        Some(value) => println!("值: {}", value),
        None => println!("没有值"),
    }
}

// 设置 panic hook
fn setup_panic_hook() {
    std::panic::set_hook(Box::new(|panic_info| {
        println!("发生 panic: {:?}", panic_info);
    }));
}`,
    summary: [
      'panic! 会导致程序立即终止。',
      '索引越界会触发 panic。',
      'unwrap 和 expect 在 None/Err 时会 panic。',
      '生产环境应避免 panic。',
      '可以使用 panic hook 自定义 panic 行为。'
    ]
  },
  {
    id: '31',
    unitId: 'unit5',
    title: 'Result 类型深入',
    description: '深入学习 Result 类型，掌握错误处理的最佳实践。',
    difficulty: '进阶',
    content: `Result<T, E> 是 Rust 中处理可恢复错误的标准方式。深入理解 Result 的使用对于编写健壮的 Rust 程序至关重要。

## Result 的设计哲学

使用 Result 可以让调用者决定如何处理错误，而不是强制程序崩溃。这提供了：
- **灵活性**：调用者可以选择如何处理错误
- **可恢复性**：可以优雅地处理错误并继续执行
- **类型安全**：错误是类型系统的一部分，不能忽略

## 处理 Result 的方式

有多种方式处理 Result：

### match 表达式

使用 `match` 显式处理两种情况，这是最清晰的方式。

### unwrap 和 expect

`unwrap()` 和 `expect()` 会在 `Err` 时 panic，通常只在确定不会失败时使用。

### unwrap_or

`unwrap_or(default)` 提供默认值，在 `Err` 时返回默认值。

### ? 运算符

`?` 运算符可以传播错误，让错误处理代码更简洁。

## 错误传播

错误传播是 Result 的重要特性。使用 `?` 运算符可以：
- 自动处理 `Ok` 和 `Err` 情况
- 在 `Err` 时从函数返回
- 链式处理多个可能失败的操作

## Result 的链式操作

Result 提供了许多方法用于链式操作：
- `map()`：转换 `Ok` 值
- `map_err()`：转换 `Err` 值
- `and_then()`：链式操作
- `or_else()`：处理错误

这些方法让错误处理代码更简洁和可读。

## 最佳实践

处理 Result 的最佳实践：
- 优先使用 `match` 或 `?` 运算符
- 避免在生产代码中使用 `unwrap()`
- 提供有意义的错误信息
- 让调用者决定如何处理错误`,
    exampleCode: `use std::fs::File;
use std::io::ErrorKind;

fn main() {
    // 处理 Result
    let f = File::open("hello.txt");
    
    let f = match f {
        Ok(file) => file,
        Err(error) => match error.kind() {
            ErrorKind::NotFound => {
                match File::create("hello.txt") {
                    Ok(fc) => fc,
                    Err(e) => panic!("创建文件时出错: {:?}", e),
                }
            }
            other_error => {
                panic!("打开文件时出错: {:?}", other_error);
            }
        },
    };
    
    // 使用 unwrap_or_else
    let f = File::open("hello.txt").unwrap_or_else(|error| {
        if error.kind() == ErrorKind::NotFound {
            File::create("hello.txt").unwrap_or_else(|error| {
                panic!("创建文件时出错: {:?}", error);
            })
        } else {
            panic!("打开文件时出错: {:?}", error);
        }
    });
    
    // 传播错误
    match read_username_from_file() {
        Ok(username) => println!("用户名: {}", username),
        Err(e) => println!("错误: {:?}", e),
    }
}

fn read_username_from_file() -> Result<String, std::io::Error> {
    let f = File::open("hello.txt")?;  // ? 运算符传播错误
    // ... 处理文件
    Ok(String::from("username"))
}`,
    summary: [
      'Result 用于可恢复的错误。',
      '使用 match 处理 Result。',
      'unwrap_or_else 可以处理错误。',
      '? 运算符可以传播错误。',
      '错误处理让程序更健壮。'
    ]
  },
  {
    id: '32',
    unitId: 'unit5',
    title: '? 运算符',
    description: '学习 ? 运算符，简化错误传播的语法。',
    difficulty: '进阶',
    content: `? 运算符是 Rust 中用于错误传播的语法糖。它让错误处理代码更简洁，是 Rust 错误处理的核心工具。

## ? 运算符的工作原理

`?` 运算符的工作原理：
- 如果值是 `Ok`，则解包值并继续执行
- 如果值是 `Err`，则从当前函数返回该错误
- 自动进行错误类型转换（如果实现了 `From` trait）

## 使用 ? 运算符的好处

使用 `?` 运算符可以：
- **简化代码**：避免大量的 `match` 表达式
- **提高可读性**：错误处理逻辑更清晰
- **自动传播**：错误自动向上传播
- **类型转换**：自动转换错误类型

## ? 运算符的限制

`?` 运算符只能在返回 `Result` 的函数中使用。如果函数返回其他类型，不能使用 `?` 运算符。

## 错误类型转换

如果实现了 `From` trait，`?` 运算符可以自动转换错误类型。这让你可以在函数中使用不同的错误类型，而编译器会自动处理转换。

## 链式使用

`?` 运算符可以链式使用，让多个可能失败的操作更简洁：

```rust
let mut s = String::new();
File::open("hello.txt")?.read_to_string(&mut s)?;
```

## 与 match 的对比

`?` 运算符等价于 `match` 表达式，但更简洁。选择使用哪种取决于具体情况：
- 需要传播错误：使用 `?`
- 需要特殊处理：使用 `match``,
    exampleCode: `use std::fs::File;
use std::io;
use std::io::Read;

fn main() {
    match read_username_from_file() {
        Ok(username) => println!("用户名: {}", username),
        Err(e) => println!("错误: {}", e),
    }
}

// 使用 ? 运算符简化错误处理
fn read_username_from_file() -> Result<String, io::Error> {
    let mut f = File::open("hello.txt")?;  // 如果错误，直接返回
    let mut s = String::new();
    f.read_to_string(&mut s)?;  // 如果错误，直接返回
    Ok(s)
}

// ? 运算符等价于：
fn read_username_from_file_manual() -> Result<String, io::Error> {
    let mut f = match File::open("hello.txt") {
        Ok(file) => file,
        Err(e) => return Err(e),  // 返回错误
    };
    
    let mut s = String::new();
    match f.read_to_string(&mut s) {
        Ok(_) => Ok(s),
        Err(e) => Err(e),
    }
}

// ? 运算符可以链式调用
fn read_and_process() -> Result<String, io::Error> {
    let mut s = String::new();
    File::open("hello.txt")?.read_to_string(&mut s)?;
    Ok(s)
}`,
    summary: [
      '? 运算符用于错误传播。',
      'Ok 值会被解包。',
      'Err 值会从函数返回。',
      '只能用于返回 Result 的函数。',
      '可以链式调用简化代码。'
    ]
  },
  {
    id: '33',
    unitId: 'unit5',
    title: '自定义错误类型',
    description: '学习如何定义和使用自定义错误类型。',
    difficulty: '高阶',
    content: `可以定义自己的错误类型，实现 Error trait。这允许你创建更具体、更有用的错误信息，并可以组合不同类型的错误。

## 为什么需要自定义错误类型？

标准库的错误类型可能不够具体。自定义错误类型可以：
- **提供更具体的错误信息**：针对你的应用场景
- **组合多种错误**：将不同类型的错误统一处理
- **更好的错误处理**：调用者可以根据错误类型采取不同行动
- **类型安全**：错误是类型系统的一部分

## 实现 Error trait

要实现自定义错误类型，需要：
1. 定义错误类型（通常是枚举）
2. 实现 `Error` trait
3. 实现 `Display` trait（提供错误信息）
4. 实现 `Debug` trait（用于调试）

## From trait 的重要性

实现 `From` trait 允许使用 `?` 运算符自动转换错误类型。这让你可以在函数中使用不同的错误类型，而编译器会自动处理转换。

## 错误组合

可以使用枚举来组合多种错误类型。例如，可以定义一个枚举，包含 IO 错误、解析错误、自定义错误等。

## 错误处理库

对于复杂的错误处理，可以使用 `thiserror` 或 `anyhow` 等库：
- `thiserror`：用于定义错误类型
- `anyhow`：用于简化错误处理

这些库可以减少样板代码，让错误处理更简单。

## 最佳实践

定义自定义错误类型的最佳实践：
- 使用枚举组合多种错误
- 实现 `Display` 提供用户友好的错误信息
- 实现 `From` 支持错误类型转换
- 提供上下文信息帮助调试`,
    exampleCode: `use std::fmt;

// 定义自定义错误类型
#[derive(Debug)]
enum MyError {
    IoError(std::io::Error),
    ParseError(String),
    CustomError(String),
}

// 实现 Error trait
impl std::error::Error for MyError {}

// 实现 Display trait
impl fmt::Display for MyError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self {
            MyError::IoError(e) => write!(f, "IO 错误: {}", e),
            MyError::ParseError(s) => write!(f, "解析错误: {}", s),
            MyError::CustomError(s) => write!(f, "自定义错误: {}", s),
        }
    }
}

// 实现 From trait，允许使用 ? 运算符
impl From<std::io::Error> for MyError {
    fn from(error: std::io::Error) -> Self {
        MyError::IoError(error)
    }
}

fn main() {
    match process_file("test.txt") {
        Ok(_) => println!("成功"),
        Err(e) => println!("错误: {}", e),
    }
}

fn process_file(filename: &str) -> Result<(), MyError> {
    use std::fs::File;
    use std::io::Read;
    
    let mut file = File::open(filename)?;  // ? 自动转换错误类型
    let mut contents = String::new();
    file.read_to_string(&mut contents)?;
    
    if contents.is_empty() {
        return Err(MyError::CustomError("文件为空".to_string()));
    }
    
    Ok(())
}`,
    summary: [
      '可以定义自定义错误类型。',
      '实现 Error trait 使其成为错误类型。',
      '实现 Display 提供错误信息。',
      '实现 From 允许使用 ? 运算符。',
      '自定义错误提供更好的错误信息。'
    ]
  },
  // 单元6：模块系统
  {
    id: '34',
    unitId: 'unit6',
    title: '模块定义',
    description: '学习如何定义和使用模块，组织代码结构。',
    difficulty: '进阶',
    content: `模块允许你将代码组织成逻辑单元，控制作用域和私有性。良好的模块组织是编写可维护 Rust 代码的基础。

## 为什么需要模块？

模块系统让你可以：
- **组织代码**：将相关代码组织在一起
- **控制可见性**：决定哪些代码可以被外部访问
- **避免命名冲突**：不同模块可以有同名项
- **提高可维护性**：清晰的模块结构让代码更易维护

## 模块的定义

模块使用 `mod` 关键字定义，可以嵌套。模块可以：
- 定义在同一个文件中
- 拆分到不同文件
- 使用目录组织

## 可见性规则

默认情况下，模块中的项是**私有的**，只能在同一个模块或其子模块中访问。使用 `pub` 关键字使项变为公有，可以被外部访问。

## 模块路径

访问模块中的项需要使用路径：
- **绝对路径**：从 crate 根开始，使用 `crate::` 前缀
- **相对路径**：从当前模块开始

## 模块组织

良好的模块组织应该：
- 按功能组织，而不是按类型
- 保持模块大小适中
- 使用清晰的命名
- 合理使用嵌套

## 模块拆分

当模块变大时，可以拆分到不同文件：
- 使用 `mod module_name;` 声明模块
- 在同名文件中定义模块内容
- 或使用 `mod.rs` 文件定义模块

## use 关键字

`use` 关键字可以将路径引入作用域，简化代码。可以使用 `pub use` 重新导出，让外部更方便地使用你的模块。`,
    exampleCode: `// 定义模块
mod front_of_house {
    pub mod hosting {
        pub fn add_to_waitlist() {}
        fn seat_at_table() {}  // 私有函数
    }
    
    mod serving {
        fn take_order() {}
        fn serve_order() {}
        fn take_payment() {}
    }
}

// 使用模块
pub fn eat_at_restaurant() {
    // 绝对路径
    crate::front_of_house::hosting::add_to_waitlist();
    
    // 相对路径
    front_of_house::hosting::add_to_waitlist();
}

// 模块可以拆分到不同文件
// src/lib.rs 或 src/main.rs
mod front_of_house;

// src/front_of_house.rs
pub mod hosting {
    pub fn add_to_waitlist() {}
}

// 或者使用目录
// src/front_of_house/mod.rs
pub mod hosting;

// src/front_of_house/hosting.rs
pub fn add_to_waitlist() {}`,
    summary: [
      '使用 mod 关键字定义模块。',
      'pub 关键字使项变为公有。',
      '模块默认是私有的。',
      '可以使用绝对路径或相对路径。',
      '模块可以拆分到不同文件。'
    ]
  },
  {
    id: '35',
    unitId: 'unit6',
    title: 'use 关键字',
    description: '学习 use 关键字，简化模块路径。',
    difficulty: '进阶',
    content: `use 关键字可以将路径引入作用域，这样就不需要每次都写完整路径。它是 Rust 模块系统中提高代码可读性的重要工具。

## use 的作用

`use` 关键字的主要作用：
- **简化路径**：避免每次都写完整路径
- **提高可读性**：让代码更简洁清晰
- **组织导入**：集中管理导入项
- **重新导出**：使用 `pub use` 可以重新导出项

## use 的使用方式

可以使用多种方式使用 `use`：
- 引入整个模块：`use std::collections::HashMap;`
- 引入特定项：`use std::io::{self, Write};`
- 引入所有公有项：`use std::collections::*;`（谨慎使用）

## as 关键字

可以使用 `as` 关键字创建别名，解决命名冲突或简化长名称：

```rust
use std::fmt::Result;
use std::io::Result as IoResult;
```

## pub use 重新导出

`pub use` 可以重新导出项，让外部代码更方便地使用你的模块。这对于创建清晰的公共 API 很有用。

## 嵌套路径

可以使用嵌套路径减少重复：

```rust
use std::{cmp::Ordering, io};
```

## glob 导入

使用 `*` 可以导入模块的所有公有项，但应该谨慎使用，因为：
- 可能导致命名冲突
- 不清楚导入了哪些项
- 降低代码可读性

## 最佳实践

使用 `use` 的最佳实践：
- 在文件顶部集中管理导入
- 优先使用具体导入而不是 glob
- 使用 `as` 解决命名冲突
- 使用 `pub use` 创建清晰的公共 API`,
    exampleCode: `mod front_of_house {
    pub mod hosting {
        pub fn add_to_waitlist() {}
    }
}

// 使用 use 引入路径
use crate::front_of_house::hosting;

pub fn eat_at_restaurant() {
    hosting::add_to_waitlist();  // 不需要完整路径
}

// 也可以直接引入函数
use crate::front_of_house::hosting::add_to_waitlist;

pub fn eat_at_restaurant2() {
    add_to_waitlist();  // 直接调用
}

// 使用 as 创建别名
use std::fmt::Result;
use std::io::Result as IoResult;

fn function1() -> Result {
    // ...
}

fn function2() -> IoResult<()> {
    // ...
}

// 使用 pub use 重新导出
pub use crate::front_of_house::hosting;

// 嵌套路径
use std::{cmp::Ordering, io};
use std::io::{self, Write};

// 使用 glob 引入所有公有项
use std::collections::*;`,
    summary: [
      'use 关键字引入路径到作用域。',
      '可以使用 as 创建别名。',
      'pub use 重新导出项。',
      '可以嵌套路径减少重复。',
      'glob (*) 引入所有公有项。'
    ]
  },
  {
    id: '36',
    unitId: 'unit6',
    title: '包和 Crate',
    description: '理解 Rust 的包（package）和 crate 的概念。',
    difficulty: '进阶',
    content: `Crate 是 Rust 编译的最小单元。包（package）包含一个或多个 crate。理解 crate 和包的概念对于组织 Rust 项目很重要。

## Crate 的概念

Crate 是 Rust 编译的最小单元，可以是：
- **二进制 crate**：可以编译成可执行文件
- **库 crate**：提供可复用的代码

一个 crate 可以包含多个模块，但编译时作为一个整体。

## 包（Package）的概念

包（package）包含一个或多个 crate，由 `Cargo.toml` 文件定义。一个包可以包含：
- 最多一个库 crate（`src/lib.rs`）
- 任意多个二进制 crate（`src/main.rs` 或 `src/bin/*.rs`）

## 二进制 crate

二进制 crate 有 `main` 函数，可以编译成可执行文件。通常用于：
- 应用程序的入口点
- 命令行工具
- 可执行程序

## 库 crate

库 crate 没有 `main` 函数，提供可复用的代码。通常用于：
- 提供 API 供其他项目使用
- 封装功能模块
- 创建可复用的库

## Cargo 的作用

Cargo 是 Rust 的包管理器，负责：
- 管理项目依赖
- 编译项目
- 运行测试
- 生成文档
- 发布包

## 项目结构

典型的 Rust 项目结构：
- `Cargo.toml`：项目配置和依赖
- `src/main.rs`：二进制 crate 入口
- `src/lib.rs`：库 crate 入口
- `src/bin/`：其他二进制 crate

## 依赖管理

Cargo 通过 `Cargo.toml` 管理依赖：
- 从 crates.io 下载依赖
- 解析依赖关系
- 编译所有依赖
- 确保版本兼容性`,
    exampleCode: `// 一个包可以包含：
// - 最多一个库 crate（src/lib.rs）
// - 任意多个二进制 crate（src/main.rs 或 src/bin/*.rs）

// src/lib.rs - 库 crate
pub mod utils;

pub fn add(left: usize, right: usize) -> usize {
    left + right
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        let result = add(2, 2);
        assert_eq!(result, 4);
    }
}

// src/main.rs - 二进制 crate
use my_package::add;

fn main() {
    println!("{}", add(2, 3));
}

// Cargo.toml 定义包
// [package]
// name = "my_package"
// version = "0.1.0"
// edition = "2021"

// [dependencies]
// serde = "1.0"`,
    summary: [
      'Crate 是编译的最小单元。',
      '包包含一个或多个 crate。',
      '二进制 crate 有 main 函数。',
      '库 crate 提供可复用的代码。',
      'Cargo 管理包和依赖。'
    ]
  },
  {
    id: '37',
    unitId: 'unit6',
    title: '可见性',
    description: '学习 Rust 的可见性规则，理解公有和私有。',
    difficulty: '进阶',
    content: `Rust 的可见性规则控制哪些项可以在哪些地方被访问。理解可见性规则对于设计良好的 API 和模块化代码很重要。

## 可见性的重要性

可见性规则让你可以：
- **封装实现细节**：隐藏不需要暴露的内部实现
- **控制 API**：只暴露必要的接口
- **防止误用**：私有项不能被外部误用
- **提高可维护性**：可以修改私有实现而不影响外部代码

## 默认可见性

默认情况下，所有项都是**私有的**，只能在以下位置访问：
- 同一个模块内
- 子模块内
- 父模块内（通过 `super::`）

## pub 关键字

使用 `pub` 关键字使项变为公有，可以被外部访问。`pub` 有不同的级别：
- `pub`：在当前模块的父模块中可见
- `pub(crate)`：在整个 crate 中可见
- `pub(super)`：在父模块中可见
- `pub(in path)`：在指定路径中可见

## 结构体的可见性

结构体的可见性规则：
- 结构体本身可以是公有或私有
- 字段可以单独设为公有或私有
- 即使结构体是公有的，私有字段也不能被外部访问

## 枚举的可见性

枚举的可见性规则：
- 如果枚举是公有的，所有变体都是公有的
- 不能单独控制变体的可见性
- 这是枚举的设计选择，简化了使用

## 最佳实践

可见性的最佳实践：
- 默认使用私有，只在需要时使用 `pub`
- 使用私有字段隐藏实现细节
- 提供公有方法访问私有数据
- 保持公共 API 简洁清晰`,
    exampleCode: `mod outer_module {
    pub mod inner_module {
        pub fn public_function() {
            println!("公有函数");
        }
        
        fn private_function() {
            println!("私有函数");
        }
        
        pub fn indirect_access() {
            private_function();  // 可以访问同模块的私有项
        }
    }
    
    pub fn outer_public() {
        inner_module::public_function();
        // inner_module::private_function();  // 错误！私有
    }
}

// 结构体的可见性
mod my_module {
    pub struct PublicStruct {
        pub public_field: i32,
        private_field: i32,  // 私有字段
    }
    
    impl PublicStruct {
        pub fn new() -> PublicStruct {
            PublicStruct {
                public_field: 1,
                private_field: 2,
            }
        }
        
        pub fn get_private(&self) -> i32 {
            self.private_field  // 可以通过方法访问私有字段
        }
    }
}

// 枚举的可见性
mod my_enum {
    pub enum PublicEnum {
        Variant1,  // 如果枚举是 pub，所有变体都是 pub
        Variant2,
    }
}`,
    summary: [
      '默认情况下所有项都是私有的。',
      'pub 使项变为公有。',
      '结构体字段可以单独设为公有或私有。',
      '如果枚举是 pub，所有变体都是 pub。',
      '子模块可以访问父模块的私有项。'
    ]
  },
  // 单元7：泛型与 Trait
  {
    id: '38',
    unitId: 'unit7',
    title: '泛型函数',
    description: '学习如何定义和使用泛型函数。',
    difficulty: '进阶',
    content: `泛型允许你编写可以处理多种类型的代码，而不需要为每种类型重复编写。它是 Rust 中实现代码复用的重要方式。

## 为什么需要泛型？

没有泛型，你需要为每种类型编写重复的代码。泛型让你可以：
- **代码复用**：编写一次，适用于多种类型
- **类型安全**：编译时检查类型正确性
- **性能**：零成本抽象，没有运行时开销
- **灵活性**：可以处理多种类型而不损失性能

## 泛型函数

泛型函数使用类型参数，可以在调用时指定具体类型。类型参数通常使用单个大写字母，如 `T`、`U` 等。

## 类型约束

可以使用 trait 约束来限制泛型类型必须实现的功能。例如，`T: PartialOrd` 表示 `T` 必须实现 `PartialOrd` trait。

## 泛型结构体和枚举

不仅函数可以使用泛型，结构体和枚举也可以：
- 泛型结构体：如 `Option<T>`、`Result<T, E>`
- 泛型枚举：可以携带不同类型的值
- 泛型方法：可以为泛型类型定义方法

## 性能考虑

Rust 的泛型是**零成本的**：
- 编译时进行单态化（monomorphization）
- 为每种使用的类型生成专门的代码
- 没有运行时开销
- 性能与手写代码相同

## 泛型的最佳实践

使用泛型的最佳实践：
- 使用有意义的类型参数名（如 `T` 表示类型，`E` 表示错误）
- 使用 trait 约束限制类型
- 保持泛型代码简洁清晰
- 考虑使用 `impl Trait` 语法简化签名`,
    exampleCode: `// 泛型函数
fn largest<T: PartialOrd>(list: &[T]) -> &T {
    let mut largest = &list[0];
    
    for item in list {
        if item > largest {
            largest = item;
        }
    }
    
    largest
}

fn main() {
    let number_list = vec![34, 50, 25, 100, 65];
    let result = largest(&number_list);
    println!("最大的数字是 {}", result);
    
    let char_list = vec!['y', 'm', 'a', 'q'];
    let result = largest(&char_list);
    println!("最大的字符是 {}", result);
}

// 多个类型参数
fn swap<T, U>(x: T, y: U) -> (U, T) {
    (y, x)
}

// 泛型函数可以有多个约束
fn compare_and_print<T: PartialOrd + std::fmt::Display>(a: T, b: T) {
    if a > b {
        println!("{} > {}", a, b);
    } else {
        println!("{} <= {}", a, b);
    }
}`,
    summary: [
      '泛型允许代码处理多种类型。',
      '使用 <T> 定义类型参数。',
      '可以指定多个类型参数。',
      '可以使用 trait bound 约束类型。',
      '泛型在编译时单态化。'
    ]
  },
  {
    id: '39',
    unitId: 'unit7',
    title: '泛型结构体',
    description: '学习如何定义和使用泛型结构体。',
    difficulty: '进阶',
    content: `结构体可以使用泛型，让一个结构体可以处理多种类型。

可以为泛型结构体实现方法，也可以为特定类型实现方法。`,
    exampleCode: `// 泛型结构体
struct Point<T> {
    x: T,
    y: T,
}

impl<T> Point<T> {
    fn new(x: T, y: T) -> Point<T> {
        Point { x, y }
    }
    
    fn x(&self) -> &T {
        &self.x
    }
}

// 为特定类型实现方法
impl Point<f32> {
    fn distance_from_origin(&self) -> f32 {
        (self.x.powi(2) + self.y.powi(2)).sqrt()
    }
}

// 多个类型参数
struct Point2<T, U> {
    x: T,
    y: U,
}

impl<T, U> Point2<T, U> {
    fn mixup<V, W>(self, other: Point2<V, W>) -> Point2<T, W> {
        Point2 {
            x: self.x,
            y: other.y,
        }
    }
}

fn main() {
    let integer = Point { x: 5, y: 10 };
    let float = Point { x: 1.0, y: 4.0 };
    
    let p = Point::new(5, 10);
    println!("p.x = {}", p.x());
    
    let p1 = Point2 { x: 5, y: 10.4 };
    let p2 = Point2 { x: "Hello", y: 'c' };
    let p3 = p1.mixup(p2);
    println!("p3.x = {}, p3.y = {}", p3.x, p3.y);
}`,
    summary: [
      '结构体可以使用泛型。',
      '可以为泛型结构体实现方法。',
      '可以为特定类型实现方法。',
      '可以有多个类型参数。',
      '方法也可以使用额外的类型参数。'
    ]
  },
  {
    id: '40',
    unitId: 'unit7',
    title: 'Trait 定义',
    description: '学习如何定义 Trait，Rust 中的接口概念。',
    difficulty: '进阶',
    content: `Trait 定义了类型可以实现的共享行为。

Trait 类似于其他语言中的接口，但更强大。可以定义默认实现。`,
    exampleCode: `// 定义 Trait
pub trait Summary {
    fn summarize(&self) -> String;
    
    // 默认实现
    fn summarize_author(&self) -> String {
        String::from("(阅读更多...)")
    }
}

// 为类型实现 Trait
pub struct NewsArticle {
    pub headline: String,
    pub location: String,
    pub author: String,
    pub content: String,
}

impl Summary for NewsArticle {
    fn summarize(&self) -> String {
        format!("{}, by {} ({})", self.headline, self.author, self.location)
    }
}

pub struct Tweet {
    pub username: String,
    pub content: String,
    pub reply: bool,
    pub retweet: bool,
}

impl Summary for Tweet {
    fn summarize(&self) -> String {
        format!("{}: {}", self.username, self.content)
    }
    
    // 覆盖默认实现
    fn summarize_author(&self) -> String {
        format!("@{}", self.username)
    }
}

fn main() {
    let tweet = Tweet {
        username: String::from("horse_ebooks"),
        content: String::from("当然，你知道，就像..."),
        reply: false,
        retweet: false,
    };
    
    println!("1 条新推文: {}", tweet.summarize());
}`,
    summary: [
      'Trait 定义共享行为。',
      '使用 impl Trait for Type 实现。',
      '可以有默认实现。',
      '可以覆盖默认实现。',
      'Trait 类似于接口。'
    ]
  },
  {
    id: '41',
    unitId: 'unit7',
    title: 'Trait 作为参数',
    description: '学习如何使用 Trait 作为函数参数，实现多态。',
    difficulty: '进阶',
    content: `可以使用 Trait 作为函数参数，允许函数接受实现了该 Trait 的任何类型。

这实现了多态，让代码更灵活。`,
    exampleCode: `pub trait Summary {
    fn summarize(&self) -> String;
}

pub struct NewsArticle {
    pub headline: String,
    pub author: String,
}

impl Summary for NewsArticle {
    fn summarize(&self) -> String {
        format!("{}, by {}", self.headline, self.author)
    }
}

pub struct Tweet {
    pub username: String,
    pub content: String,
}

impl Summary for Tweet {
    fn summarize(&self) -> String {
        format!("{}: {}", self.username, self.content)
    }
}

// Trait Bound 语法
pub fn notify<T: Summary>(item: &T) {
    println!("突发新闻! {}", item.summarize());
}

// 使用 impl Trait 语法（更简洁）
pub fn notify2(item: &impl Summary) {
    println!("突发新闻! {}", item.summarize());
}

// 多个 Trait Bound
pub fn notify3(item: &(impl Summary + Display)) {
    // ...
}

// 使用 where 子句
fn some_function<T, U>(t: &T, u: &U) -> i32
where
    T: Display + Clone,
    U: Clone + Debug,
{
    // ...
}

fn main() {
    let article = NewsArticle {
        headline: String::from("标题"),
        author: String::from("作者"),
    };
    
    notify(&article);
    notify2(&article);
}`,
    summary: [
      '可以使用 Trait 作为参数。',
      'Trait Bound 语法：<T: Trait>。',
      'impl Trait 语法更简洁。',
      '可以指定多个 Trait Bound。',
      'where 子句让代码更清晰。'
    ]
  },
  {
    id: '42',
    unitId: 'unit7',
    title: 'Trait Bound',
    description: '深入学习 Trait Bound，约束泛型类型。',
    difficulty: '进阶',
    content: `Trait Bound 指定泛型类型必须实现特定的 Trait。

这允许你在泛型代码中使用 Trait 的方法。`,
    exampleCode: `use std::fmt::Display;

// Trait Bound 基本语法
fn largest<T: PartialOrd + Copy>(list: &[T]) -> T {
    let mut largest = list[0];
    
    for &item in list {
        if item > largest {
            largest = item;
        }
    }
    
    largest
}

// 使用 where 子句
fn some_function<T, U>(t: &T, u: &U) -> i32
where
    T: Display + Clone,
    U: Clone + Debug,
{
    // ...
}

// 为实现了特定 Trait 的类型实现方法
struct Pair<T> {
    x: T,
    y: T,
}

impl<T> Pair<T> {
    fn new(x: T, y: T) -> Self {
        Self { x, y }
    }
}

impl<T: Display + PartialOrd> Pair<T> {
    fn cmp_display(&self) {
        if self.x >= self.y {
            println!("最大的成员是 x = {}", self.x);
        } else {
            println!("最大的成员是 y = {}", self.y);
        }
    }
}

// 条件实现
impl<T: Display> ToString for T {
    fn to_string(&self) -> String {
        // ...
    }
}`,
    summary: [
      'Trait Bound 约束泛型类型。',
      '可以指定多个 Trait Bound。',
      'where 子句让代码更清晰。',
      '可以为特定 Trait 组合实现方法。',
      '条件实现允许灵活的实现策略。'
    ]
  },
  {
    id: '43',
    unitId: 'unit7',
    title: '关联类型',
    description: '学习 Trait 中的关联类型，更灵活的 Trait 设计。',
    difficulty: '高阶',
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
  },
  {
    id: '44',
    unitId: 'unit7',
    title: '默认实现',
    description: '学习 Trait 的默认实现，减少代码重复。',
    difficulty: '进阶',
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
  },
  // 单元8：智能指针
  {
    id: '45',
    unitId: 'unit8',
    title: 'Box<T>',
    description: '学习 Box 智能指针，在堆上分配数据。',
    difficulty: '进阶',
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
  },
  {
    id: '46',
    unitId: 'unit8',
    title: 'Rc<T>',
    description: '学习引用计数智能指针，实现多所有权。',
    difficulty: '高阶',
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
  },
  {
    id: '47',
    unitId: 'unit8',
    title: 'RefCell<T>',
    description: '学习 RefCell，实现内部可变性。',
    difficulty: '高阶',
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
  },
  {
    id: '48',
    unitId: 'unit8',
    title: '引用循环',
    description: '理解引用循环问题，学习如何避免内存泄漏。',
    difficulty: '高阶',
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
  },
  // 单元9：并发编程
  {
    id: '49',
    unitId: 'unit9',
    title: '线程创建',
    description: '学习如何使用线程，实现并发执行。',
    difficulty: '进阶',
    content: `Rust 标准库提供了线程支持，可以使用 thread::spawn 创建新线程。

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
      'Rust 保证线程安全。'
    ]
  },
  {
    id: '50',
    unitId: 'unit9',
    title: '消息传递（Channel）',
    description: '学习使用通道在线程间传递消息。',
    difficulty: '进阶',
    content: `通道允许线程间通过发送消息进行通信。

Rust 的通道遵循"不要通过共享内存来通信，而是通过通信来共享内存"的理念。`,
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
  },
  {
    id: '51',
    unitId: 'unit9',
    title: '共享状态（Mutex）',
    description: '学习使用 Mutex 实现线程间共享数据。',
    difficulty: '进阶',
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
  },
  {
    id: '52',
    unitId: 'unit9',
    title: 'Arc<T>',
    description: '学习原子引用计数，用于多线程场景。',
    difficulty: '高阶',
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
  },
  {
    id: '53',
    unitId: 'unit9',
    title: 'Send 和 Sync',
    description: '理解 Send 和 Sync trait，Rust 线程安全的基础。',
    difficulty: '高阶',
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
  },
  // 单元10：异步编程
  {
    id: '54',
    unitId: 'unit10',
    title: 'async/await',
    description: '学习 Rust 的异步编程，使用 async/await 语法。',
    difficulty: '高阶',
    content: `async/await 是 Rust 中编写异步代码的语法。

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
  },
  {
    id: '55',
    unitId: 'unit10',
    title: 'Future trait',
    description: '深入理解 Future trait，异步编程的基础。',
    difficulty: '高阶',
    content: `Future 是 Rust 异步编程的核心 trait。

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
  },
  {
    id: '56',
    unitId: 'unit10',
    title: '异步任务',
    description: '学习如何创建和管理异步任务。',
    difficulty: '高阶',
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
  },
  // 单元11：高级特性
  {
    id: '57',
    unitId: 'unit11',
    title: '宏（macro_rules!）',
    description: '学习声明宏，使用 macro_rules! 创建代码生成工具。',
    difficulty: '高阶',
    content: `宏是 Rust 中的代码生成工具，允许你编写编写代码的代码。

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
  },
  {
    id: '58',
    unitId: 'unit11',
    title: 'Unsafe Rust',
    description: '学习 Unsafe Rust，绕过编译器的安全检查。',
    difficulty: '高阶',
    content: `Unsafe Rust 允许你执行通常被编译器禁止的操作。

Unsafe 代码块让你可以：
1. 解引用裸指针
2. 调用 unsafe 函数
3. 访问或修改可变静态变量
4. 实现 unsafe trait

使用 unsafe 需要你自己保证安全性。`,
    exampleCode: `fn main() {
    let mut num = 5;
    
    // 创建裸指针
    let r1 = &num as *const i32;
    let r2 = &mut num as *mut i32;
    
    // 解引用裸指针需要 unsafe
    unsafe {
        println!("r1 是: {}", *r1);
        println!("r2 是: {}", *r2);
    }
    
    // 调用 unsafe 函数
    unsafe {
        dangerous();
    }
    
    // 访问可变静态变量
    unsafe {
        COUNTER += 1;
        println!("COUNTER = {}", COUNTER);
    }
}

// unsafe 函数
unsafe fn dangerous() {
    println!("这是 unsafe 函数");
}

// 可变静态变量
static mut COUNTER: u32 = 0;

// 实现 unsafe trait
unsafe trait UnsafeTrait {
    // ...
}

unsafe impl UnsafeTrait for i32 {
    // ...
}

// 使用外部函数接口（FFI）
extern "C" {
    fn abs(input: i32) -> i32;
}

fn example() {
    unsafe {
        println!("C 的 abs(-3) = {}", abs(-3));
    }
}`,
    summary: [
      'unsafe 允许绕过编译器检查。',
      '可以解引用裸指针。',
      '可以调用 unsafe 函数。',
      '可以访问可变静态变量。',
      '需要自己保证安全性。'
    ]
  },
  {
    id: '59',
    unitId: 'unit11',
    title: '高级生命周期',
    description: '深入学习生命周期，掌握复杂场景下的生命周期标注。',
    difficulty: '高阶',
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
  },
  // 单元12：实战项目
  {
    id: '60',
    unitId: 'unit12',
    title: '构建命令行工具',
    description: '学习使用 clap 等库构建命令行应用。',
    difficulty: '进阶',
    content: `Rust 非常适合构建命令行工具，性能好且易于分发。

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
      'Rust 适合构建命令行工具。',
      '使用 clap 解析参数。',
      '处理文件 I/O。',
      '错误处理很重要。',
      '可以编译成单个可执行文件。'
    ]
  },
  {
    id: '61',
    unitId: 'unit12',
    title: '构建 Web API',
    description: '学习使用 actix-web 或 axum 构建 REST API。',
    difficulty: '高阶',
    content: `Rust 可以构建高性能的 Web API。

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
      'Rust 可以构建高性能 Web API。',
      '使用 axum、actix-web 等框架。',
      '异步处理请求。',
      '类型安全的路由。',
      '优秀的性能表现。'
    ]
  },
  {
    id: '62',
    unitId: 'unit12',
    title: '数据库操作',
    description: '学习使用 sqlx 或 diesel 进行数据库操作。',
    difficulty: '高阶',
    content: `Rust 有多个优秀的数据库库。

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
  },
  {
    id: '63',
    unitId: 'unit12',
    title: '性能优化',
    description: '学习 Rust 性能优化的技巧和最佳实践。',
    difficulty: '高阶',
    content: `Rust 已经很快，但还可以进一步优化。

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
  }
] as CourseChapter[]);

export const QUIZ_MODULES: QuizModule[] = ([
  // ========== 1000道题目综合题库（按主题整合） ==========
  {
    id: 'q1',
    title: 'Rust 基础语法综合',
    questions: [
      // ===== 单选题 (40道) =====
      { id: 'b-sc-1', type: QuestionType.SINGLE_CHOICE, question: '在 Rust 中，默认情况下变量是？', options: ['可变的', '不可变的', '全局的', '静态的'], correctIndices: [1], explanation: 'Rust 变量默认是不可变的，需要 mut 关键字才能修改。' },
      { id: 'b-sc-2', type: QuestionType.SINGLE_CHOICE, question: '要修改变量的值，声明时必须使用哪个关键字？', options: ['change', 'var', 'mut', 'static'], correctIndices: [2], explanation: 'mut 关键字用于标记变量为可变。' },
      { id: 'b-sc-3', type: QuestionType.SINGLE_CHOICE, question: 'Rust 的默认整数类型是？', options: ['i8', 'i16', 'i32', 'i64'], correctIndices: [2], explanation: 'Rust 默认整数类型是 i32。' },
      { id: 'b-sc-4', type: QuestionType.SINGLE_CHOICE, question: 'Rust 函数定义使用什么关键字？', options: ['function', 'fn', 'def', 'fun'], correctIndices: [1], explanation: 'Rust 使用 fn 关键字定义函数。' },
      { id: 'b-sc-5', type: QuestionType.SINGLE_CHOICE, question: 'Rust 中如何打印到控制台？', options: ['print()', 'println!()', 'console.log()', 'printf()'], correctIndices: [1], explanation: 'Rust 使用 println! 宏打印到控制台。' },
      { id: 'b-sc-6', type: QuestionType.SINGLE_CHOICE, question: 'Rust 的默认浮点数类型是？', options: ['f32', 'f64', 'float', 'double'], correctIndices: [1], explanation: 'Rust 默认浮点数类型是 f64。' },
      { id: 'b-sc-7', type: QuestionType.SINGLE_CHOICE, question: 'Rust 中字符类型使用什么符号？', options: ['双引号', '单引号', '反引号', '方括号'], correctIndices: [1], explanation: 'Rust 的 char 类型使用单引号。' },
      { id: 'b-sc-8', type: QuestionType.SINGLE_CHOICE, question: 'Rust 中如何声明常量？', options: ['let const', 'const', 'static', 'final'], correctIndices: [1], explanation: 'Rust 使用 const 关键字声明常量。' },
      { id: 'b-sc-9', type: QuestionType.SINGLE_CHOICE, question: 'Rust 中如何表示无返回值？', options: ['void', 'None', '不写返回类型', 'null'], correctIndices: [2], explanation: '不写返回类型表示返回单元类型 ()。' },
      { id: 'b-sc-10', type: QuestionType.SINGLE_CHOICE, question: 'Rust 中如何创建数组？', options: ['Array::new()', '[]', 'array!', 'new Array()'], correctIndices: [1], explanation: 'Rust 使用方括号创建数组。' },
      { id: 'b-sc-11', type: QuestionType.SINGLE_CHOICE, question: 'Rust 中如何创建元组？', options: ['()', 'Tuple::new()', 'tuple!', 'new Tuple()'], correctIndices: [0], explanation: 'Rust 使用圆括号创建元组。' },
      { id: 'b-sc-12', type: QuestionType.SINGLE_CHOICE, question: 'Rust 中如何访问元组元素？', options: ['tup[0]', 'tup.0', 'tup->0', 'tup.get(0)'], correctIndices: [1], explanation: 'Rust 使用点号加索引访问元组元素。' },
      { id: 'b-sc-13', type: QuestionType.SINGLE_CHOICE, question: 'Rust 中如何格式化字符串？', options: ['format()', 'format!()', 'String.format()', 'fmt()'], correctIndices: [1], explanation: 'Rust 使用 format! 宏格式化字符串。' },
      { id: 'b-sc-14', type: QuestionType.SINGLE_CHOICE, question: 'Rust 的 char 类型占用多少字节？', options: ['1', '2', '4', '8'], correctIndices: [2], explanation: 'Rust 的 char 类型是 4 字节，用于存储 Unicode 标量值。' },
      { id: 'b-sc-15', type: QuestionType.SINGLE_CHOICE, question: 'Rust 中使用什么符号表示代码块？', options: ['{}', '()', '[]', '<>'], correctIndices: [0], explanation: 'Rust 使用花括号 {} 表示代码块。' },
      { id: 'b-sc-16', type: QuestionType.SINGLE_CHOICE, question: 'Rust 程序的入口函数是？', options: ['start()', 'main()', 'init()', 'run()'], correctIndices: [1], explanation: 'Rust 程序的入口点是 main 函数。' },
      { id: 'b-sc-17', type: QuestionType.SINGLE_CHOICE, question: '语句和表达式的区别是？', options: ['没有区别', '表达式返回值', '语句返回值', '都不返回值'], correctIndices: [1], explanation: '表达式返回值，语句不返回值。' },
      { id: 'b-sc-18', type: QuestionType.SINGLE_CHOICE, question: 'Rust 中如何表示范围？', options: ['1 to 10', '1..10', '1:10', 'range(1,10)'], correctIndices: [1], explanation: 'Rust 使用 .. 表示范围，如 1..10。' },
      { id: 'b-sc-19', type: QuestionType.SINGLE_CHOICE, question: '包含右边界的范围使用？', options: ['1..10', '1..=10', '1...10', '1->10'], correctIndices: [1], explanation: '..= 表示包含右边界的范围。' },
      { id: 'b-sc-20', type: QuestionType.SINGLE_CHOICE, question: 'Rust 中注释使用什么符号？', options: ['#', '//', '/*', '--'], correctIndices: [1], explanation: 'Rust 使用 // 表示单行注释。' },
      { id: 'b-sc-21', type: QuestionType.SINGLE_CHOICE, question: 'Rust 文档注释使用？', options: ['///', '/**/', '##', '!!'], correctIndices: [0], explanation: '/// 用于文档注释。' },
      { id: 'b-sc-22', type: QuestionType.SINGLE_CHOICE, question: 'Rust 的布尔类型关键字是？', options: ['boolean', 'bool', 'Boolean', 'BOOL'], correctIndices: [1], explanation: 'Rust 使用 bool 表示布尔类型。' },
      { id: 'b-sc-23', type: QuestionType.SINGLE_CHOICE, question: '无符号 8 位整数类型是？', options: ['i8', 'u8', 'byte', 'uint8'], correctIndices: [1], explanation: 'u8 表示无符号 8 位整数。' },
      { id: 'b-sc-24', type: QuestionType.SINGLE_CHOICE, question: 'Rust 中如何获取数组长度？', options: ['.length', '.len()', '.size()', '.count()'], correctIndices: [1], explanation: '使用 .len() 方法获取数组长度。' },
      { id: 'b-sc-25', type: QuestionType.SINGLE_CHOICE, question: '变量遮蔽使用什么关键字？', options: ['shadow', 'override', 'let', 'new'], correctIndices: [2], explanation: '使用 let 可以遮蔽同名变量。' },
      { id: 'b-sc-26', type: QuestionType.SINGLE_CHOICE, question: 'Rust 的 isize 类型大小取决于？', options: ['编译器', '操作系统位数', '常量定义', 'CPU 型号'], correctIndices: [1], explanation: 'isize 大小取决于目标平台的位数。' },
      { id: 'b-sc-27', type: QuestionType.SINGLE_CHOICE, question: '_ 在 Rust 中表示？', options: ['空值', '占位符/忽略值', '私有', '全局'], correctIndices: [1], explanation: '_ 用于忽略值或作为占位符。' },
      { id: 'b-sc-28', type: QuestionType.SINGLE_CHOICE, question: 'Rust 中如何声明静态变量？', options: ['const', 'static', 'global', 'var'], correctIndices: [1], explanation: '使用 static 关键字声明静态变量。' },
      { id: 'b-sc-29', type: QuestionType.SINGLE_CHOICE, question: 'const 和 static 的主要区别？', options: ['没区别', 'const 内联，static 有固定地址', '作用域不同', '类型不同'], correctIndices: [1], explanation: 'const 会内联，static 有固定内存地址。' },
      { id: 'b-sc-30', type: QuestionType.SINGLE_CHOICE, question: '空元组 () 也叫做？', options: ['null', 'void', 'unit', 'empty'], correctIndices: [2], explanation: '空元组 () 称为单元类型 (unit type)。' },
      { id: 'b-sc-31', type: QuestionType.SINGLE_CHOICE, question: 'Rust 表达式结尾加分号会？', options: ['语法错误', '变成语句，返回 ()', '返回值不变', '编译警告'], correctIndices: [1], explanation: '表达式加分号变成语句，返回单元类型。' },
      { id: 'b-sc-32', type: QuestionType.SINGLE_CHOICE, question: 'Rust 中如何创建无限循环？', options: ['while(true)', 'for(;;)', 'loop', 'repeat'], correctIndices: [2], explanation: 'Rust 使用 loop 创建无限循环。' },
      { id: 'b-sc-33', type: QuestionType.SINGLE_CHOICE, question: '跳出循环使用什么关键字？', options: ['exit', 'stop', 'break', 'end'], correctIndices: [2], explanation: '使用 break 跳出循环。' },
      { id: 'b-sc-34', type: QuestionType.SINGLE_CHOICE, question: '跳过当前循环迭代使用？', options: ['skip', 'next', 'continue', 'pass'], correctIndices: [2], explanation: '使用 continue 跳过当前迭代。' },
      { id: 'b-sc-35', type: QuestionType.SINGLE_CHOICE, question: 'loop 循环可以返回值吗？', options: ['不能', '可以，通过 break', '可以，通过 return', '只能返回 ()'], correctIndices: [1], explanation: 'loop 可以通过 break 返回值。' },
      { id: 'b-sc-36', type: QuestionType.SINGLE_CHOICE, question: 'Rust 中 if 是表达式还是语句？', options: ['语句', '表达式', '两者都是', '取决于用法'], correctIndices: [1], explanation: 'Rust 中 if 是表达式，可以返回值。' },
      { id: 'b-sc-37', type: QuestionType.SINGLE_CHOICE, question: 'else if 在 Rust 中写作？', options: ['elif', 'elseif', 'else if', 'elsif'], correctIndices: [2], explanation: 'Rust 使用 else if（两个单词）。' },
      { id: 'b-sc-38', type: QuestionType.SINGLE_CHOICE, question: '数组索引越界会发生什么？', options: ['返回 None', '返回默认值', 'panic', '未定义行为'], correctIndices: [2], explanation: '数组索引越界会导致 panic。' },
      { id: 'b-sc-39', type: QuestionType.SINGLE_CHOICE, question: '元组最多可以有多少元素？', options: ['8', '12', '16', '无限制'], correctIndices: [1], explanation: '元组最多 12 个元素（标准库限制）。' },
      { id: 'b-sc-40', type: QuestionType.SINGLE_CHOICE, question: 'Rust 中字面量 5u8 表示？', options: ['8 位无符号整数 5', '5 的 8 次方', '数组', '字符串'], correctIndices: [0], explanation: '5u8 是类型后缀，表示 u8 类型的 5。' },
      // ===== 判断题 (35道) =====
      { id: 'b-tf-1', type: QuestionType.TRUE_FALSE, question: 'Rust 变量默认是不可变的。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。需要 mut 关键字才能修改。' },
      { id: 'b-tf-2', type: QuestionType.TRUE_FALSE, question: 'Rust 是静态类型语言。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。编译器在编译时检查所有类型。' },
      { id: 'b-tf-3', type: QuestionType.TRUE_FALSE, question: 'Rust 有垃圾回收器。', options: ['正确', '错误'], correctIndices: [1], explanation: '错误。Rust 通过所有权系统管理内存。' },
      { id: 'b-tf-4', type: QuestionType.TRUE_FALSE, question: 'Rust 的 if 表达式可以返回值。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。if 是表达式，可以返回值。' },
      { id: 'b-tf-5', type: QuestionType.TRUE_FALSE, question: 'Rust 支持空指针 null。', options: ['正确', '错误'], correctIndices: [1], explanation: '错误。Rust 使用 Option<T> 表示可能为空的值。' },
      { id: 'b-tf-6', type: QuestionType.TRUE_FALSE, question: 'Rust 的数组长度在运行时可变。', options: ['正确', '错误'], correctIndices: [1], explanation: '错误。数组长度固定，可变长度用 Vec<T>。' },
      { id: 'b-tf-7', type: QuestionType.TRUE_FALSE, question: 'Rust 支持函数重载。', options: ['正确', '错误'], correctIndices: [1], explanation: '错误。Rust 不支持函数重载。' },
      { id: 'b-tf-8', type: QuestionType.TRUE_FALSE, question: 'Rust 的 char 类型是 1 字节。', options: ['正确', '错误'], correctIndices: [1], explanation: '错误。char 是 4 字节 Unicode 标量。' },
      { id: 'b-tf-9', type: QuestionType.TRUE_FALSE, question: 'let 可以遮蔽同名变量。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。这叫变量遮蔽 (shadowing)。' },
      { id: 'b-tf-10', type: QuestionType.TRUE_FALSE, question: 'const 必须标注类型。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。常量必须显式标注类型。' },
      { id: 'b-tf-11', type: QuestionType.TRUE_FALSE, question: '元组可以包含不同类型的值。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。元组可以包含不同类型。' },
      { id: 'b-tf-12', type: QuestionType.TRUE_FALSE, question: 'break 可以从 loop 返回值。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。如 break 42。' },
      { id: 'b-tf-13', type: QuestionType.TRUE_FALSE, question: '字符串字面量 &str 存储在堆上。', options: ['正确', '错误'], correctIndices: [1], explanation: '错误。存储在程序二进制文件中。' },
      { id: 'b-tf-14', type: QuestionType.TRUE_FALSE, question: 'Rust 区分大小写。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。Rust 是大小写敏感的。' },
      { id: 'b-tf-15', type: QuestionType.TRUE_FALSE, question: '函数参数必须标注类型。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。函数签名中必须标注参数类型。' },
      { id: 'b-tf-16', type: QuestionType.TRUE_FALSE, question: '函数返回值类型可以省略。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。省略时返回单元类型 ()。' },
      { id: 'b-tf-17', type: QuestionType.TRUE_FALSE, question: '整数溢出在 debug 模式会 panic。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。release 模式会回绕。' },
      { id: 'b-tf-18', type: QuestionType.TRUE_FALSE, question: 'Rust 支持隐式类型转换。', options: ['正确', '错误'], correctIndices: [1], explanation: '错误。必须显式转换类型。' },
      { id: 'b-tf-19', type: QuestionType.TRUE_FALSE, question: 'as 关键字用于类型转换。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。如 5i32 as u8。' },
      { id: 'b-tf-20', type: QuestionType.TRUE_FALSE, question: '数组类型包含长度信息。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。如 [i32; 5]。' },
      { id: 'b-tf-21', type: QuestionType.TRUE_FALSE, question: 'for 循环自动解引用迭代器。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。for 会自动调用 into_iter。' },
      { id: 'b-tf-22', type: QuestionType.TRUE_FALSE, question: 'while 循环条件不需要括号。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。Rust 条件不需要括号。' },
      { id: 'b-tf-23', type: QuestionType.TRUE_FALSE, question: 'return 关键字可以省略。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。最后一个表达式自动返回。' },
      { id: 'b-tf-24', type: QuestionType.TRUE_FALSE, question: 'Rust 有三元运算符 ?:。', options: ['正确', '错误'], correctIndices: [1], explanation: '错误。使用 if else 表达式替代。' },
      { id: 'b-tf-25', type: QuestionType.TRUE_FALSE, question: '语句不返回值。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。语句返回单元类型。' },
      { id: 'b-tf-26', type: QuestionType.TRUE_FALSE, question: '代码块 {} 是表达式。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。代码块可以返回值。' },
      { id: 'b-tf-27', type: QuestionType.TRUE_FALSE, question: 'Rust 支持 ++ 自增运算符。', options: ['正确', '错误'], correctIndices: [1], explanation: '错误。使用 += 1 替代。' },
      { id: 'b-tf-28', type: QuestionType.TRUE_FALSE, question: '数字字面量可以用 _ 分隔。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。如 1_000_000。' },
      { id: 'b-tf-29', type: QuestionType.TRUE_FALSE, question: '0x 前缀表示十六进制。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。如 0xff。' },
      { id: 'b-tf-30', type: QuestionType.TRUE_FALSE, question: '0b 前缀表示二进制。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。如 0b1010。' },
      { id: 'b-tf-31', type: QuestionType.TRUE_FALSE, question: '0o 前缀表示八进制。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。如 0o77。' },
      { id: 'b-tf-32', type: QuestionType.TRUE_FALSE, question: 'b\'A\' 表示字节字面量。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。b 前缀表示字节。' },
      { id: 'b-tf-33', type: QuestionType.TRUE_FALSE, question: 'Rust 的 bool 占用 1 字节。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。bool 类型占用 1 字节。' },
      { id: 'b-tf-34', type: QuestionType.TRUE_FALSE, question: '函数名使用蛇形命名法。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。如 my_function。' },
      { id: 'b-tf-35', type: QuestionType.TRUE_FALSE, question: '类型名使用驼峰命名法。', options: ['正确', '错误'], correctIndices: [0], explanation: '正确。如 MyStruct。' },
      // ===== 多选题 (25道) =====
      { id: 'b-mc-1', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Rust 的基本数据类型？', options: ['i32', 'f64', 'bool', 'String'], correctIndices: [0, 1, 2], explanation: 'String 是标准库类型，不是基本类型。' },
      { id: 'b-mc-2', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Rust 的循环方式？', options: ['loop', 'while', 'for', 'do-while'], correctIndices: [0, 1, 2], explanation: 'Rust 没有 do-while。' },
      { id: 'b-mc-3', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Rust 的宏？', options: ['println!', 'vec!', 'format!', 'panic!'], correctIndices: [0, 1, 2, 3], explanation: '这些都是标准宏。' },
      { id: 'b-mc-4', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些类型实现了 Copy？', options: ['i32', 'bool', 'char', 'String'], correctIndices: [0, 1, 2], explanation: 'String 没有实现 Copy。' },
      { id: 'b-mc-5', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是整数类型？', options: ['i8', 'u32', 'f64', 'isize'], correctIndices: [0, 1, 3], explanation: 'f64 是浮点类型。' },
      { id: 'b-mc-6', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是浮点类型？', options: ['f32', 'f64', 'float', 'double'], correctIndices: [0, 1], explanation: 'Rust 只有 f32 和 f64。' },
      { id: 'b-mc-7', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是复合类型？', options: ['tuple', 'array', 'i32', 'bool'], correctIndices: [0, 1], explanation: 'i32、bool 是标量类型。' },
      { id: 'b-mc-8', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可以作为数组元素类型？', options: ['i32', 'String', 'bool', '元组'], correctIndices: [0, 1, 2, 3], explanation: '任何类型都可以作为数组元素。' },
      { id: 'b-mc-9', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些关键字用于声明？', options: ['let', 'const', 'static', 'var'], correctIndices: [0, 1, 2], explanation: 'Rust 没有 var 关键字。' },
      { id: 'b-mc-10', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是控制流关键字？', options: ['if', 'match', 'for', 'fn'], correctIndices: [0, 1, 2], explanation: 'fn 是函数定义关键字。' },
      { id: 'b-mc-11', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可以跳出循环？', options: ['break', 'return', 'continue', 'exit'], correctIndices: [0, 1], explanation: 'continue 跳过迭代，exit 不是 Rust 关键字。' },
      { id: 'b-mc-12', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是有效的整数字面量？', options: ['42', '0xff', '0b1010', '42.0'], correctIndices: [0, 1, 2], explanation: '42.0 是浮点字面量。' },
      { id: 'b-mc-13', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是合法的变量名？', options: ['_x', 'x1', '1x', 'my_var'], correctIndices: [0, 1, 3], explanation: '变量名不能以数字开头。' },
      { id: 'b-mc-14', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是运算符？', options: ['+', '==', '&&', '::'], correctIndices: [0, 1, 2], explanation: ':: 是路径分隔符，不是运算符。' },
      { id: 'b-mc-15', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是比较运算符？', options: ['==', '!=', '>=', '&&'], correctIndices: [0, 1, 2], explanation: '&& 是逻辑与运算符。' },
      { id: 'b-mc-16', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是逻辑运算符？', options: ['&&', '||', '!', '&'], correctIndices: [0, 1, 2], explanation: '& 是位与运算符。' },
      { id: 'b-mc-17', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是位运算符？', options: ['&', '|', '^', '~'], correctIndices: [0, 1, 2], explanation: 'Rust 使用 ! 进行位取反。' },
      { id: 'b-mc-18', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是赋值运算符？', options: ['=', '+=', '-=', '=='], correctIndices: [0, 1, 2], explanation: '== 是比较运算符。' },
      { id: 'b-mc-19', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些注释语法正确？', options: ['//', '/* */', '///', '#'], correctIndices: [0, 1, 2], explanation: 'Rust 不使用 # 注释。' },
      { id: 'b-mc-20', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些表示范围？', options: ['1..10', '1..=10', '1...10', '[1,10]'], correctIndices: [0, 1], explanation: '... 和 [] 不是范围语法。' },
      { id: 'b-mc-21', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是函数参数传递方式？', options: ['值传递', '引用传递', '可变引用传递', '指针传递'], correctIndices: [0, 1, 2], explanation: 'Rust 使用引用而非原始指针传递。' },
      { id: 'b-mc-22', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些可以在函数返回？', options: ['i32', '()', 'String', '元组'], correctIndices: [0, 1, 2, 3], explanation: '任何类型都可以作为返回值。' },
      { id: 'b-mc-23', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是调试工具？', options: ['println!', 'dbg!', 'eprintln!', 'log!'], correctIndices: [0, 1, 2], explanation: 'log! 不是标准宏。' },
      { id: 'b-mc-24', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些适合用 const？', options: ['数学常量', '配置值', '运行时计算值', '编译时常量'], correctIndices: [0, 1, 3], explanation: '运行时计算值不能用 const。' },
      { id: 'b-mc-25', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是标量类型？', options: ['i32', 'f64', 'bool', 'char'], correctIndices: [0, 1, 2, 3], explanation: '这四个都是标量类型。' }
    ]
  },
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
      { id: 'o-sc-10', type: QuestionType.SINGLE_CHOICE, question: 'Rust 如何防止悬垂引用？', options: ['垃圾回收', '编译时检查', '运行时检查', '不防止'], correctIndices: [1], explanation: '编译器通过生命周期检查防止。' },
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
      { id: 'o-tf-1', type: QuestionType.TRUE_FALSE, question: '每个值只能有一个所有者。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Rust 所有权基本规则。' },
      { id: 'o-tf-2', type: QuestionType.TRUE_FALSE, question: '所有者离开作用域时值自动释放。', options: ['正确', '错误'], correctIndices: [0], explanation: '自动调用 drop。' },
      { id: 'o-tf-3', type: QuestionType.TRUE_FALSE, question: '可以同时有多个可变引用。', options: ['正确', '错误'], correctIndices: [1], explanation: '只能有一个可变引用。' },
      { id: 'o-tf-4', type: QuestionType.TRUE_FALSE, question: '不可变和可变引用可同时存在。', options: ['正确', '错误'], correctIndices: [1], explanation: '不能同时存在。' },
      { id: 'o-tf-5', type: QuestionType.TRUE_FALSE, question: 'String 实现了 Copy trait。', options: ['正确', '错误'], correctIndices: [1], explanation: 'String 在堆上，需要 Clone。' },
      { id: 'o-tf-6', type: QuestionType.TRUE_FALSE, question: '引用必须始终有效。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Rust 保证引用有效性。' },
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
      { id: 'o-tf-25', type: QuestionType.TRUE_FALSE, question: '堆上的数据需要手动释放。', options: ['正确', '错误'], correctIndices: [1], explanation: 'Rust 自动管理。' },
      { id: 'o-tf-26', type: QuestionType.TRUE_FALSE, question: '引用可以为 null。', options: ['正确', '错误'], correctIndices: [1], explanation: 'Rust 引用不能为空。' },
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
      { id: 'o-mc-18', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 unsafe 操作？', options: ['解引用原始指针', '调用 unsafe 函数', '实现 unsafe trait', '所有以上'], correctIndices: [0, 1, 2, 3], explanation: '都是 unsafe 操作。' },
      { id: 'o-mc-19', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是零成本抽象？', options: ['泛型', '迭代器', '引用', '所有以上'], correctIndices: [0, 1, 2, 3], explanation: 'Rust 核心抽象零成本。' },
      { id: 'o-mc-20', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些影响所有权分析？', options: ['PhantomData', '生命周期', '类型', '所有以上'], correctIndices: [0, 1, 2, 3], explanation: '这些都影响所有权分析。' },
      { id: 'o-mc-21', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Deref 用途？', options: ['自动解引用', '方法查找', '类型强转', '所有以上'], correctIndices: [0, 1, 2, 3], explanation: 'Deref 有多种用途。' },
      { id: 'o-mc-22', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些类型可 Pin？', options: ['Box<T>', '&mut T', 'Rc<T>', '所有以上'], correctIndices: [0, 1, 2, 3], explanation: '这些都可以 Pin。' },
      { id: 'o-mc-23', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是内存安全问题？', options: ['悬垂指针', '数据竞争', '双重释放', '所有以上'], correctIndices: [0, 1, 2, 3], explanation: 'Rust 防止这些问题。' },
      { id: 'o-mc-24', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Clone 特点？', options: ['显式调用', '可能昂贵', '可派生', '所有以上'], correctIndices: [0, 1, 2, 3], explanation: 'Clone 的特点。' },
      { id: 'o-mc-25', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 Drop 特点？', options: ['自动调用', '不能显式调用', '可自定义', '不能派生'], correctIndices: [0, 1, 2, 3], explanation: 'Drop 的所有特点。' }
    ]
  },
  {
    id: 'q3',
    title: '数据结构综合',
    questions: [
      { id: 'd-sc-1', type: QuestionType.SINGLE_CHOICE, question: 'Rust 中定义结构体使用什么关键字？', options: ['class', 'struct', 'object', 'type'], correctIndices: [1], explanation: 'Rust 使用 struct 定义结构体。' },
      { id: 'd-sc-2', type: QuestionType.SINGLE_CHOICE, question: '结构体字段访问使用什么符号？', options: ['->', '::', '.', ':'], correctIndices: [2], explanation: '使用点号访问字段。' },
      { id: 'd-sc-3', type: QuestionType.SINGLE_CHOICE, question: '定义枚举使用什么关键字？', options: ['enum', 'enumeration', 'variant', 'type'], correctIndices: [0], explanation: 'Rust 使用 enum 定义枚举。' },
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
      { id: 'd-tf-1', type: QuestionType.TRUE_FALSE, question: '枚举变体可以携带数据。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Rust 枚举可携带数据。' },
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
      { id: 'd-mc-2', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是结构体类型？', options: ['命名字段', '元组结构体', '单元结构体', '联合结构体'], correctIndices: [0, 1, 2], explanation: 'Rust 无联合结构体。' },
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
  },
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
  },
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
      { id: 'e-tf-1', type: QuestionType.TRUE_FALSE, question: 'Rust 没有异常机制。', options: ['正确', '错误'], correctIndices: [0], explanation: 'Rust 使用 Result 处理错误。' },
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
      { id: 'e-tf-23', type: QuestionType.TRUE_FALSE, question: 'RUST_BACKTRACE=1 显示栈。', options: ['正确', '错误'], correctIndices: [0], explanation: '环境变量控制 backtrace。' },
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
  },
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
      { id: 'm-sc-36', type: QuestionType.SINGLE_CHOICE, question: 'cargo new --lib 创建？', options: ['可执行项目', '库项目', '测试项目', '示例项目'], correctIndices: [1], explanation: '--lib 创建库项目。' },
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
      { id: 'm-mc-6', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是依赖类型？', options: ['dependencies', 'dev-dependencies', 'build-dependencies', 'peer-dependencies'], correctIndices: [0, 1, 2], explanation: 'Rust 没有 peer-dependencies。' },
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
      { id: 'm-mc-21', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是环境变量？', options: ['CARGO_HOME', 'RUSTUP_HOME', 'RUST_BACKTRACE', 'CARGO_TARGET_DIR'], correctIndices: [0, 1, 2, 3], explanation: '都是 Rust 相关环境变量。' },
      { id: 'm-mc-22', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些影响编译？', options: ['features', 'target', 'profile', 'edition'], correctIndices: [0, 1, 2, 3], explanation: '都影响编译结果。' },
      { id: 'm-mc-23', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是包元数据？', options: ['name', 'version', 'authors', 'license'], correctIndices: [0, 1, 2, 3], explanation: '都是 [package] 字段。' },
      { id: 'm-mc-24', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是库类型？', options: ['rlib', 'dylib', 'cdylib', 'staticlib'], correctIndices: [0, 1, 2, 3], explanation: '都是库类型。' },
      { id: 'm-mc-25', type: QuestionType.MULTIPLE_CHOICE, question: '以下哪些是 edition？', options: ['2015', '2018', '2021', '2024'], correctIndices: [0, 1, 2, 3], explanation: '都是有效 edition。' }
    ]
  },
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
  },
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
      { id: 'p-tf-21', type: QuestionType.TRUE_FALSE, question: 'NonNull 可解引用。', options: ['正确', '错误'], correctIndices: [1], explanation: '需要 unsafe 解引用。' },
      { id: 'p-tf-22', type: QuestionType.TRUE_FALSE, question: 'ManuallyDrop 阻止 drop。', options: ['正确', '错误'], correctIndices: [0], explanation: 'ManuallyDrop 阻止自动 drop。' },
      { id: 'p-tf-23', type: QuestionType.TRUE_FALSE, question: 'MaybeUninit 可安全读取。', options: ['正确', '错误'], correctIndices: [1], explanation: '需要 unsafe 或初始化后。' },
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
  },

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
      { id: 'c-tf-1', type: QuestionType.TRUE_FALSE, question: 'Rust 编译时防止数据竞争。', options: ['正确', '错误'], correctIndices: [0], explanation: '所有权系统保证。' },
      { id: 'c-tf-2', type: QuestionType.TRUE_FALSE, question: 'JoinHandle 可等待线程。', options: ['正确', '错误'], correctIndices: [0], explanation: 'join() 阻塞等待。' },
      { id: 'c-tf-3', type: QuestionType.TRUE_FALSE, question: 'Mutex 中毒会传播。', options: ['正确', '错误'], correctIndices: [0], explanation: 'panic 导致 Mutex 中毒。' },
      { id: 'c-tf-4', type: QuestionType.TRUE_FALSE, question: 'Sync 自动实现。', options: ['正确', '错误'], correctIndices: [0], explanation: '编译器自动推断。' },
      { id: 'c-tf-5', type: QuestionType.TRUE_FALSE, question: 'Send 自动实现。', options: ['正确', '错误'], correctIndices: [0], explanation: '编译器自动推断。' },
      { id: 'c-tf-6', type: QuestionType.TRUE_FALSE, question: 'Rust 线程是 1:1 模型。', options: ['正确', '错误'], correctIndices: [0], explanation: '系统线程。' },
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
  },

  {
    id: 'q10',
    title: '异步编程综合',
    questions: [
      { id: 'a-sc-1', type: QuestionType.SINGLE_CHOICE, question: 'async 函数返回？', options: ['结果', 'Future', 'Promise', 'Task'], correctIndices: [1], explanation: 'async 返回 Future。' },
      { id: 'a-sc-2', type: QuestionType.SINGLE_CHOICE, question: 'await 的作用？', options: ['创建 Future', '等待 Future', '取消 Future', '克隆'], correctIndices: [1], explanation: 'await 等待完成。' },
      { id: 'a-sc-3', type: QuestionType.SINGLE_CHOICE, question: 'Future trait 核心方法？', options: ['run', 'execute', 'poll', 'await'], correctIndices: [2], explanation: 'poll 检查完成状态。' },
      { id: 'a-sc-4', type: QuestionType.SINGLE_CHOICE, question: 'Rust 标准库有运行时吗？', options: ['有', '没有', '部分', '只有接口'], correctIndices: [1], explanation: '需第三方如 tokio。' },
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
] as QuizModule[]);


export const REFERENCE_DATA: ReferenceCategory[] = ([
  {
    title: "关键字",
    items: [
      { keyword: "let", description: "声明变量（默认不可变）。", code: `let x = 5;` },
      { keyword: "mut", description: "标记变量为可变。", code: `let mut x = 5;` },
      { keyword: "const", description: "声明常量。", code: `const MAX: i32 = 100;` },
      { keyword: "static", description: "声明静态变量。", code: `static COUNTER: i32 = 0;` },
      { keyword: "fn", description: "定义函数。", code: `fn add(x: i32, y: i32) -> i32 { x + y }` },
      { keyword: "return", description: "返回值。", code: `return 42;` },
      { keyword: "if", description: "条件分支。", code: `if x > 0 { ... }` },
      { keyword: "else", description: "否则分支。", code: `if x > 0 { ... } else { ... }` },
      { keyword: "match", description: "模式匹配。", code: `match x { 1 => "one", _ => "other" }` },
      { keyword: "loop", description: "无限循环。", code: `loop { break; }` },
      { keyword: "while", description: "条件循环。", code: `while x > 0 { x -= 1; }` },
      { keyword: "for", description: "遍历迭代器。", code: `for i in 0..10 { ... }` },
      { keyword: "break", description: "跳出循环。", code: `break;` },
      { keyword: "continue", description: "跳过当前迭代。", code: `continue;` },
      { keyword: "struct", description: "定义结构体。", code: `struct Point { x: i32, y: i32 }` },
      { keyword: "enum", description: "定义枚举。", code: `enum Color { Red, Green, Blue }` },
      { keyword: "impl", description: "实现方法或 trait。", code: `impl Point { fn new() -> Self { ... } }` },
      { keyword: "trait", description: "定义 trait。", code: `trait Draw { fn draw(&self); }` },
      { keyword: "type", description: "类型别名。", code: `type Kilometers = i32;` },
      { keyword: "mod", description: "定义模块。", code: `mod my_module { ... }` },
      { keyword: "use", description: "引入路径。", code: `use std::collections::HashMap;` },
      { keyword: "pub", description: "公有可见性。", code: `pub fn public_fn() { ... }` },
      { keyword: "as", description: "类型转换或别名。", code: `let x = 5 as f64;` },
      { keyword: "ref", description: "模式绑定引用。", code: `let ref r = x;` },
      { keyword: "move", description: "闭包获取所有权。", code: `move || { ... }` },
      { keyword: "dyn", description: "Trait 对象。", code: `&dyn Display` },
      { keyword: "async", description: "异步函数。", code: `async fn fetch() { ... }` },
      { keyword: "await", description: "等待 Future。", code: `result.await` },
      { keyword: "unsafe", description: "不安全代码块。", code: `unsafe { ... }` },
      { keyword: "extern", description: "外部函数接口。", code: `extern "C" { ... }` },
      { keyword: "crate", description: "crate 根路径。", code: `crate::module::item` },
      { keyword: "super", description: "父模块路径。", code: `super::parent_item` },
      { keyword: "Self", description: "当前类型别名。", code: `Self { x: 0, y: 0 }` },
      { keyword: "self", description: "方法接收者（获取所有权）。", code: `fn take(self) { ... }` },
      { keyword: "where", description: "where 子句。", code: `where T: Display + Clone` },
      { keyword: "true", description: "布尔值真。", code: `let b = true;` },
      { keyword: "false", description: "布尔值假。", code: `let b = false;` },
      { keyword: "in", description: "for 循环中的关键字。", code: `for x in vec { ... }` }
    ]
  },
  {
    title: "Cargo 常用命令",
    items: [
      { keyword: "cargo new [name]", description: "创建一个新的 Rust 项目。" },
      { keyword: "cargo run", description: "编译并运行当前项目。" },
      { keyword: "cargo build", description: "编译项目（默认 Debug 模式）。" },
      { keyword: "cargo check", description: "快速检查代码能否编译，不生成可执行文件。" },
      { keyword: "cargo build --release", description: "编译优化的 Release 版本。" },
      { keyword: "cargo fmt", description: "格式化所有 Rust 代码文件。" }
    ]
  },
  {
    title: "基本数据类型",
    items: [
      { keyword: "i8, i16, i32, i64, i128", description: "有符号整数。" },
      { keyword: "u8, u16, u32, u64, u128", description: "无符号整数。" },
      { keyword: "f32, f64", description: "浮点数（默认 f64）。" },
      { keyword: "bool", description: "布尔值 (true, false)。" },
      { keyword: "char", description: "字符类型，使用单引号，4字节 Unicode。" },
      { keyword: "tuple", description: "元组，固定长度不同类型组合。", code: "let tup: (i32, f64) = (500, 6.4);" },
      { keyword: "array", description: "数组，固定长度相同类型。", code: "let a = [1, 2, 3, 4, 5];" }
    ]
  },
  {
    title: "常用宏 (Macros)",
    items: [
      { keyword: "println!", description: "打印并换行。", code: `println!("Hello, {}!", name);` },
      { keyword: "print!", description: "打印但不换行。" },
      { keyword: "format!", description: "格式化字符串并返回。", code: `let s = format!("x = {}", 10);` },
      { keyword: "vec!", description: "创建 Vec<T>。", code: `let v = vec![1, 2, 3];` },
      { keyword: "panic!", description: "程序崩溃并抛出信息。", code: `panic!("Something went wrong");` },
      { keyword: "todo!", description: "标记未完成代码，运行时触发 panic。", code: `fn later() { todo!(); }` }
    ]
  },
  {
    title: "字符串方法",
    items: [
      { keyword: ".len()", description: "返回字符串的字节长度。", code: `s.len()` },
      { keyword: ".push_str()", description: "追加字符串切片 (仅对 String 有效)。", code: `s.push_str("bar");` },
      { keyword: ".contains()", description: "检查是否包含子串。", code: `s.contains("foo")` },
      { keyword: ".replace()", description: "替换模式。", code: `s.replace("old", "new")` },
      { keyword: ".trim()", description: "去除首尾空白字符。" }
    ]
  },
  {
    title: "流程控制",
    items: [
      { keyword: "if / else", description: "条件分支。", code: `if x < 5 { ... } else { ... }` },
      { keyword: "match", description: "模式匹配。", code: `match x { 1 => "one", _ => "other" }` },
      { keyword: "loop", description: "无限循环。", code: `loop { println!("again!"); break; }` },
      { keyword: "while", description: "条件循环。", code: `while n != 0 { n -= 1; }` },
      { keyword: "for", description: "遍历迭代器。", code: `for x in 0..5 { println!("{}", x); }` },
      { keyword: "if let", description: "单模式匹配。", code: `if let Some(x) = opt { ... }` },
      { keyword: "while let", description: "循环直到模式不匹配。", code: `while let Some(x) = stack.pop() { ... }` },
      { keyword: "break", description: "跳出循环，可返回值。", code: `break 42` },
      { keyword: "continue", description: "跳过当前迭代。", code: `continue` }
    ]
  },
  {
    title: "所有权与借用",
    items: [
      { keyword: "let", description: "声明变量（默认不可变）。", code: `let x = 5;` },
      { keyword: "let mut", description: "声明可变变量。", code: `let mut x = 5;` },
      { keyword: "&", description: "创建不可变引用。", code: `let r = &x;` },
      { keyword: "&mut", description: "创建可变引用。", code: `let r = &mut x;` },
      { keyword: "*", description: "解引用。", code: `*r = 10;` },
      { keyword: ".clone()", description: "深度复制。", code: `let y = x.clone();` },
      { keyword: ".copy()", description: "复制（Copy trait）。", code: `let y = x; // 自动复制` },
      { keyword: "move", description: "闭包获取所有权。", code: `move || { ... }` },
      { keyword: "Box::new()", description: "在堆上分配。", code: `let b = Box::new(5);` }
    ]
  },
  {
    title: "集合类型方法",
    items: [
      { keyword: "Vec::new()", description: "创建空向量。", code: `let v: Vec<i32> = Vec::new();` },
      { keyword: "vec![]", description: "创建向量宏。", code: `let v = vec![1, 2, 3];` },
      { keyword: ".push()", description: "添加元素。", code: `v.push(4);` },
      { keyword: ".pop()", description: "移除并返回最后一个元素。", code: `let x = v.pop();` },
      { keyword: ".get()", description: "安全访问元素。", code: `v.get(0)` },
      { keyword: ".len()", description: "获取长度。", code: `v.len()` },
      { keyword: ".is_empty()", description: "检查是否为空。", code: `v.is_empty()` },
      { keyword: ".contains()", description: "检查是否包含。", code: `v.contains(&5)` },
      { keyword: ".insert()", description: "在索引处插入。", code: `v.insert(1, 99);` },
      { keyword: ".remove()", description: "移除索引处元素。", code: `v.remove(1);` },
      { keyword: "HashMap::new()", description: "创建哈希映射。", code: `let mut map = HashMap::new();` },
      { keyword: ".insert()", description: "插入键值对。", code: `map.insert("key", "value");` },
      { keyword: ".get()", description: "获取值。", code: `map.get("key")` },
      { keyword: ".entry()", description: "获取条目。", code: `map.entry("key").or_insert(0);` },
      { keyword: ".or_insert()", description: "不存在时插入。", code: `map.entry("k").or_insert(1);` }
    ]
  },
  {
    title: "字符串方法",
    items: [
      { keyword: "String::from()", description: "从字符串字面量创建。", code: `let s = String::from("hello");` },
      { keyword: ".to_string()", description: "转换为 String。", code: `"hello".to_string()` },
      { keyword: ".len()", description: "返回字节长度。", code: `s.len()` },
      { keyword: ".push_str()", description: "追加字符串切片。", code: `s.push_str(" world");` },
      { keyword: ".push()", description: "追加字符。", code: `s.push('!');` },
      { keyword: ".contains()", description: "检查是否包含子串。", code: `s.contains("hello")` },
      { keyword: ".replace()", description: "替换子串。", code: `s.replace("old", "new")` },
      { keyword: ".trim()", description: "去除首尾空白。", code: `s.trim()` },
      { keyword: ".split()", description: "分割字符串。", code: `s.split(' ')` },
      { keyword: ".chars()", description: "获取字符迭代器。", code: `s.chars()` },
      { keyword: ".bytes()", description: "获取字节迭代器。", code: `s.bytes()` },
      { keyword: ".as_str()", description: "转换为 &str。", code: `s.as_str()` }
    ]
  },
  {
    title: "迭代器方法",
    items: [
      { keyword: ".iter()", description: "获取不可变引用迭代器。", code: `v.iter()` },
      { keyword: ".iter_mut()", description: "获取可变引用迭代器。", code: `v.iter_mut()` },
      { keyword: ".into_iter()", description: "获取所有权迭代器。", code: `v.into_iter()` },
      { keyword: ".map()", description: "转换每个元素。", code: `v.iter().map(|x| x * 2)` },
      { keyword: ".filter()", description: "过滤元素。", code: `v.iter().filter(|x| *x > 5)` },
      { keyword: ".collect()", description: "收集到集合。", code: `v.iter().collect::<Vec<_>>()` },
      { keyword: ".sum()", description: "求和。", code: `v.iter().sum::<i32>()` },
      { keyword: ".product()", description: "求积。", code: `v.iter().product::<i32>()` },
      { keyword: ".fold()", description: "累积。", code: `v.iter().fold(0, |acc, x| acc + x)` },
      { keyword: ".find()", description: "查找元素。", code: `v.iter().find(|x| *x > 5)` },
      { keyword: ".enumerate()", description: "获取索引和值。", code: `v.iter().enumerate()` },
      { keyword: ".zip()", description: "组合两个迭代器。", code: `v1.iter().zip(v2.iter())` },
      { keyword: ".take()", description: "取前 n 个。", code: `v.iter().take(5)` },
      { keyword: ".skip()", description: "跳过前 n 个。", code: `v.iter().skip(5)` },
      { keyword: ".rev()", description: "反转迭代器。", code: `v.iter().rev()` }
    ]
  },
  {
    title: "Option 和 Result",
    items: [
      { keyword: "Some()", description: "Option 的有值变体。", code: `Some(5)` },
      { keyword: "None", description: "Option 的无值变体。", code: `None` },
      { keyword: "Ok()", description: "Result 的成功变体。", code: `Ok(42)` },
      { keyword: "Err()", description: "Result 的错误变体。", code: `Err("error")` },
      { keyword: ".unwrap()", description: "解包，None/Err 时 panic。", code: `opt.unwrap()` },
      { keyword: ".unwrap_or()", description: "解包或返回默认值。", code: `opt.unwrap_or(0)` },
      { keyword: ".unwrap_or_else()", description: "解包或执行闭包。", code: `opt.unwrap_or_else(|| 0)` },
      { keyword: ".expect()", description: "解包，带错误消息。", code: `opt.expect("msg")` },
      { keyword: ".map()", description: "转换值。", code: `opt.map(|x| x * 2)` },
      { keyword: ".map_err()", description: "转换错误。", code: `res.map_err(|e| ...)` },
      { keyword: ".and_then()", description: "链式操作。", code: `opt.and_then(|x| ...)` },
      { keyword: ".or_else()", description: "None 时执行闭包。", code: `opt.or_else(|| ...)` },
      { keyword: "?", description: "错误传播运算符。", code: `let x = func()?;` },
      { keyword: ".is_some()", description: "检查是否为 Some。", code: `opt.is_some()` },
      { keyword: ".is_none()", description: "检查是否为 None。", code: `opt.is_none()` },
      { keyword: ".is_ok()", description: "检查是否为 Ok。", code: `res.is_ok()` },
      { keyword: ".is_err()", description: "检查是否为 Err。", code: `res.is_err()` }
    ]
  },
  {
    title: "结构体和枚举",
    items: [
      { keyword: "struct", description: "定义结构体。", code: `struct Point { x: i32, y: i32 }` },
      { keyword: "enum", description: "定义枚举。", code: `enum Color { Red, Green, Blue }` },
      { keyword: "impl", description: "实现方法。", code: `impl Point { fn new() -> Self { ... } }` },
      { keyword: "Self", description: "当前类型别名。", code: `Self { x: 0, y: 0 }` },
      { keyword: "self", description: "获取所有权。", code: `fn take(self) { ... }` },
      { keyword: "&self", description: "不可变引用。", code: `fn read(&self) { ... }` },
      { keyword: "&mut self", description: "可变引用。", code: `fn modify(&mut self) { ... }` },
      { keyword: "::", description: "关联函数调用。", code: `Point::new()` },
      { keyword: ".", description: "方法调用。", code: `point.x` },
      { keyword: "..", description: "结构体更新语法。", code: `Point { x: 1, ..other }` },
      { keyword: "#[derive()]", description: "自动实现 trait。", code: `#[derive(Debug, Clone)]` }
    ]
  },
  {
    title: "模块和可见性",
    items: [
      { keyword: "mod", description: "定义模块。", code: `mod my_module { ... }` },
      { keyword: "pub", description: "公有可见性。", code: `pub fn public_fn() { ... }` },
      { keyword: "use", description: "引入路径。", code: `use std::collections::HashMap;` },
      { keyword: "pub use", description: "重新导出。", code: `pub use crate::module::Item;` },
      { keyword: "as", description: "创建别名。", code: `use std::io::Result as IoResult;` },
      { keyword: "crate::", description: "绝对路径（从 crate 根）。", code: `crate::module::item` },
      { keyword: "super::", description: "父模块。", code: `super::parent_item` },
      { keyword: "self::", description: "当前模块。", code: `self::current_item` }
    ]
  },
  {
    title: "泛型和 Trait",
    items: [
      { keyword: "<T>", description: "泛型类型参数。", code: `fn func<T>(x: T) { ... }` },
      { keyword: "T: Trait", description: "Trait bound。", code: `fn func<T: Display>(x: T) { ... }` },
      { keyword: "where", description: "where 子句。", code: `where T: Display + Clone` },
      { keyword: "impl Trait", description: "impl Trait 语法。", code: `fn func(x: impl Display) { ... }` },
      { keyword: "dyn Trait", description: "Trait 对象。", code: `&dyn Display` },
      { keyword: "trait", description: "定义 trait。", code: `trait MyTrait { fn method(&self); }` },
      { keyword: "impl Trait for Type", description: "实现 trait。", code: `impl MyTrait for MyType { ... }` },
      { keyword: "type", description: "关联类型。", code: `type Item = i32;` },
      { keyword: "default", description: "默认实现。", code: `default fn method() { ... }` }
    ]
  },
  {
    title: "智能指针",
    items: [
      { keyword: "Box<T>", description: "堆分配指针。", code: `let b = Box::new(5);` },
      { keyword: "Rc<T>", description: "引用计数（单线程）。", code: `let r = Rc::new(data);` },
      { keyword: "Arc<T>", description: "原子引用计数（多线程）。", code: `let a = Arc::new(data);` },
      { keyword: "RefCell<T>", description: "内部可变性。", code: `let r = RefCell::new(5);` },
      { keyword: "Rc::clone()", description: "增加引用计数。", code: `Rc::clone(&rc)` },
      { keyword: "Arc::clone()", description: "增加引用计数。", code: `Arc::clone(&arc)` },
      { keyword: ".borrow()", description: "不可变借用（RefCell）。", code: `r.borrow()` },
      { keyword: ".borrow_mut()", description: "可变借用（RefCell）。", code: `r.borrow_mut()` },
      { keyword: "Weak<T>", description: "弱引用。", code: `Rc::downgrade(&rc)` },
      { keyword: ".upgrade()", description: "升级 Weak 为 Rc。", code: `weak.upgrade()` }
    ]
  },
  {
    title: "并发编程",
    items: [
      { keyword: "thread::spawn()", description: "创建线程。", code: `thread::spawn(|| { ... })` },
      { keyword: ".join()", description: "等待线程完成。", code: `handle.join()` },
      { keyword: "mpsc::channel()", description: "创建通道。", code: `let (tx, rx) = mpsc::channel();` },
      { keyword: ".send()", description: "发送消息。", code: `tx.send(msg)` },
      { keyword: ".recv()", description: "接收消息。", code: `rx.recv()` },
      { keyword: "Mutex::new()", description: "创建互斥锁。", code: `let m = Mutex::new(0);` },
      { keyword: ".lock()", description: "获取锁。", code: `m.lock().unwrap()` },
      { keyword: "Send", description: "可以在线程间转移。", code: `T: Send` },
      { keyword: "Sync", description: "可以在线程间共享。", code: `T: Sync` }
    ]
  },
  {
    title: "异步编程",
    items: [
      { keyword: "async", description: "异步函数。", code: `async fn func() { ... }` },
      { keyword: "await", description: "等待 Future。", code: `result.await` },
      { keyword: "Future", description: "Future trait。", code: `impl Future for MyType` },
      { keyword: "tokio::spawn()", description: "创建异步任务。", code: `tokio::spawn(async { ... })` },
      { keyword: "futures::join!()", description: "并发执行多个 Future。", code: `join!(f1, f2)` },
      { keyword: "futures::select!()", description: "选择第一个完成的。", code: `select! { ... }` }
    ]
  },
  {
    title: "错误处理",
    items: [
      { keyword: "panic!()", description: "触发 panic。", code: `panic!("error message")` },
      { keyword: "Result<T, E>", description: "结果类型。", code: `Result<i32, String>` },
      { keyword: "Option<T>", description: "可选类型。", code: `Option<i32>` },
      { keyword: ".unwrap()", description: "解包，失败时 panic。", code: `res.unwrap()` },
      { keyword: ".expect()", description: "解包，带消息。", code: `res.expect("msg")` },
      { keyword: "?", description: "错误传播。", code: `let x = func()?;` },
      { keyword: ".map_err()", description: "转换错误类型。", code: `res.map_err(|e| ...)` },
      { keyword: ".or_else()", description: "错误时执行闭包。", code: `res.or_else(|e| ...)` }
    ]
  },
  {
    title: "生命周期",
    items: [
      { keyword: "'a", description: "生命周期参数。", code: `fn func<'a>(x: &'a str) -> &'a str` },
      { keyword: "'static", description: "静态生命周期。", code: `&'static str` },
      { keyword: "'_", description: "匿名生命周期。", code: `StrWrap<'_>` },
      { keyword: "'b: 'a", description: "生命周期子类型。", code: `where 'b: 'a` }
    ]
  },
  {
    title: "常用类型转换",
    items: [
      { keyword: ".to_string()", description: "转换为 String。", code: `5.to_string()` },
      { keyword: ".parse()", description: "解析字符串。", code: `"42".parse::<i32>()` },
      { keyword: ".as_ref()", description: "转换为引用。", code: `opt.as_ref()` },
      { keyword: ".as_mut()", description: "转换为可变引用。", code: `opt.as_mut()` },
      { keyword: ".into()", description: "Into trait 转换。", code: `x.into()` },
      { keyword: ".from()", description: "From trait 转换。", code: `String::from("hello")` },
      { keyword: "as", description: "类型转换。", code: `x as i32` },
      { keyword: ".try_into()", description: "尝试转换。", code: `x.try_into()` }
    ]
  },
  {
    title: "常用标准库类型",
    items: [
      { keyword: "Vec<T>", description: "动态数组。", code: `Vec<i32>` },
      { keyword: "String", description: "可增长字符串。", code: `String` },
      { keyword: "&str", description: "字符串切片。", code: `&str` },
      { keyword: "HashMap<K, V>", description: "哈希映射。", code: `HashMap<String, i32>` },
      { keyword: "HashSet<T>", description: "哈希集合。", code: `HashSet<i32>` },
      { keyword: "Option<T>", description: "可选值。", code: `Option<i32>` },
      { keyword: "Result<T, E>", description: "结果类型。", code: `Result<i32, String>` },
      { keyword: "Box<T>", description: "堆指针。", code: `Box<i32>` },
      { keyword: "Rc<T>", description: "引用计数。", code: `Rc<i32>` },
      { keyword: "Arc<T>", description: "原子引用计数。", code: `Arc<i32>` },
      { keyword: "Mutex<T>", description: "互斥锁。", code: `Mutex<i32>` },
      { keyword: "RefCell<T>", description: "内部可变性。", code: `RefCell<i32>` }
    ]
  }
] as ReferenceCategory[]);

export const INTERVIEW_QUESTIONS: InterviewItem[] = ([
  {
    id: 'i1',
    question: '⭐⭐⭐ 为什么 Rust 使用所有权系统而不是垃圾回收？',
    answer: '【核心要点】\n• 无运行时 GC，内存安全在编译期保证\n• 确定性析构（RAII），资源释放可预测\n• 性能可预测，无 GC 暂停\n• 代价：学习曲线更陡峭\n\n【常见错误回答】\n❌ "所有权让 Rust 更慢但更安全"\n❌ "所有权就是手动管理内存"\n\n【代码推理】\nlet x = String::from("hello");\nlet y = x;\nprintln!("{}", x); // 编译失败！x 已移动给 y\n\n【追问】所有权的三条规则？Rc/Arc 何时用？',
    difficulty: '简单',
    tags: ['所有权', '核心概念', '必问']
  },
  {
    id: 'i2',
    question: '⭐⭐⭐ 借用检查器解决了什么问题？',
    answer: '【核心要点】\n• 防止悬垂引用（Dangling References）\n• 防止数据竞争（Data Races）\n• 编译期检查，无运行时开销\n• 保证引用永远有效\n\n【常见错误回答】\n❌ "借用检查器防止内存泄漏"\n❌ "借用检查器替代了垃圾回收"\n\n【追问】借用规则是什么？生命周期省略规则？',
    difficulty: '中等',
    tags: ['借用', '安全', '核心概念']
  },
  {
    id: 'i3',
    question: '⭐⭐⭐ Rc<T> 和 Arc<T> 有什么区别？',
    answer: '【核心要点】\n• Rc：单线程引用计数，非线程安全\n• Arc：原子引用计数，线程安全\n• Arc 有原子操作开销，但通常可忽略\n• 两者都用于多所有权场景\n\n【常见错误回答】\n❌ "Rc 在多线程中也能用，只是慢一点"\n❌ "Arc 会自动加锁保护数据"\n❌ "用 Arc 就不需要 Mutex 了"\n\n【代码推理】\nuse std::rc::Rc;\nlet a = Rc::new(5);\nstd::thread::spawn(move || println!("{}", a));\n// 编译失败！Rc 没有实现 Send',
    difficulty: '中等',
    tags: ['智能指针', '并发', '必问']
  },
  {
    id: 'i4',
    question: '⭐⭐⭐ String 和 &str 有什么区别？',
    answer: '【核心要点】\n• String：堆分配，拥有所有权，可变长\n• &str：字符串切片，借用，不可变\n• 函数参数优先用 &str（更灵活）\n• 需要拥有数据时用 String\n\n【常见错误回答】\n❌ "&str 就是字符串常量"\n❌ "String 比 &str 慢"\n\n【追问】为什么 &str 作为参数更好？什么是 Cow<str>？',
    difficulty: '简单',
    tags: ['字符串', '所有权', '基础']
  },
  {
    id: 'i5',
    question: '⭐⭐⭐ 什么是生命周期？为什么需要手动标注？',
    answer: '【核心要点】\n• 生命周期描述引用的有效范围\n• 大多数情况编译器可以推断（省略规则）\n• 当编译器无法推断时需要手动标注\n• 生命周期标注不改变实际生命周期\n\n【常见错误回答】\n❌ "生命周期决定变量何时被销毁"\n❌ "生命周期标注会影响运行时性能"\n\n【代码推理】\nfn longest(x: &str, y: &str) -> &str { ... }\n// 编译失败！需要：fn longest<\'a>(x: &\'a str, y: &\'a str) -> &\'a str',
    difficulty: '中等',
    tags: ['生命周期', '借用', '核心概念']
  },
  {
    id: 'i6',
    question: '⭐⭐ Send 和 Sync trait 是什么？',
    answer: '【核心要点】\n• Send：类型可以安全地跨线程转移所有权\n• Sync：类型可以安全地在多线程间共享引用\n• 大多数类型自动实现\n• Rc、Cell、RefCell 等不是 Sync\n\n【常见错误回答】\n❌ "Send 和 Sync 是运行时检查"\n❌ "只要用 Arc 就自动线程安全"\n\n【追问】为什么 Rc 不是 Send？RefCell 为什么不是 Sync？',
    difficulty: '困难',
    tags: ['并发', '线程安全', '高级']
  },
  {
    id: 'i7',
    question: '⭐⭐ 泛型和 Trait Object 有什么区别？',
    answer: '【核心要点】\n• 泛型：静态分发，编译时单态化\n• Trait Object：动态分发，运行时虚表\n• 泛型性能更好，但代码膨胀\n• Trait Object 更灵活，但有运行时开销\n\n【常见错误回答】\n❌ "动态分发总是更慢"\n❌ "应该总是用泛型"\n\n【代码推理】\nVec<Box<dyn Display>> 为什么要用 dyn？\n→ Vec 中可以存储不同具体类型',
    difficulty: '困难',
    tags: ['泛型', 'Trait', '性能']
  },
  {
    id: 'i8',
    question: '⭐⭐ unsafe 代码是什么？什么时候需要用？',
    answer: '【核心要点】\n• 绕过编译器安全检查的代码块\n• 用于：解引用裸指针、调用 unsafe 函数、FFI\n• unsafe 不意味着代码危险\n• 应封装在安全 API 中\n\n【常见错误回答】\n❌ "unsafe 代码就是不安全的代码"\n❌ "好的 Rust 代码不应该有 unsafe"\n\n【追问】unsafe 能做哪些普通代码不能做的事？',
    difficulty: '困难',
    tags: ['unsafe', '系统编程', '高级']
  },
  {
    id: 'i9',
    question: '⭐⭐⭐ Option 和 Result 有什么区别？',
    answer: '【核心要点】\n• Option：表示"有或无"（Some/None）\n• Result：表示"成功或失败"（Ok/Err）\n• Result 可以携带错误信息\n• 使用 ? 运算符简化错误传播\n\n【常见错误回答】\n❌ "用 unwrap() 就行了"\n❌ "Option 就是可空类型"\n\n【代码推理】\nfn divide(a: i32, b: i32) -> Option<i32> { ... }\n→ 应该用 Result，可以返回错误信息',
    difficulty: '简单',
    tags: ['错误处理', '类型系统', '基础']
  },
  {
    id: 'i10',
    question: '⭐⭐ 什么是零成本抽象？',
    answer: '【核心要点】\n• 高级抽象编译后无运行时开销\n• 性能与手写底层代码相当\n• 通过单态化和内联实现\n• 迭代器、闭包都是零成本的\n\n【常见错误回答】\n❌ "零成本意味着没有编译时成本"\n❌ "所有抽象都是零成本的"\n\n【追问】单态化是什么？有什么代价？',
    difficulty: '中等',
    tags: ['性能', '编译器', '设计哲学']
  },
  {
    id: 'i11',
    question: '⭐⭐ async/await 和线程有什么区别？',
    answer: '【核心要点】\n• async：协作式多任务，单线程可运行多个\n• 线程：抢占式，有上下文切换开销\n• async 适合 I/O 密集型\n• 线程适合 CPU 密集型\n\n【常见错误回答】\n❌ "async 比线程快"\n❌ "async 是多线程的语法糖"\n\n【追问】Future 是如何被执行的？什么是 Pin？',
    difficulty: '困难',
    tags: ['异步', '并发', '高级']
  },
  {
    id: 'i12',
    question: '⭐⭐⭐ Box、Rc、Arc 分别什么时候用？',
    answer: '【核心要点】\n• Box：单一所有权，堆分配\n• Rc：单线程共享所有权\n• Arc：多线程共享所有权\n• 优先用最简单的能满足需求的\n\n【常见错误回答】\n❌ "默认用 Arc 最安全"\n❌ "Box 比栈上的数据慢"\n\n【代码推理】\nenum List { Cons(i32, List), Nil }\n→ 编译失败！递归类型需要 Box',
    difficulty: '中等',
    tags: ['智能指针', '内存管理', '必问']
  },
  {
    id: 'i13',
    question: '⭐⭐ Fn、FnMut、FnOnce 有什么区别？',
    answer: '【核心要点】\n• Fn：不可变借用环境，可多次调用\n• FnMut：可变借用环境，可多次调用\n• FnOnce：获取所有权，只能调用一次\n• 编译器自动推断最宽松的 trait\n\n【常见错误回答】\n❌ "move 闭包就是 FnOnce"\n❌ "闭包比函数慢"\n\n【代码推理】\nlet s = String::from("hi");\nlet f = || println!("{}", s);\n→ f 实现 Fn，只不可变借用了 s',
    difficulty: '中等',
    tags: ['闭包', '函数式', '所有权']
  },
  {
    id: 'i14',
    question: '⭐⭐ Cell 和 RefCell 是什么？',
    answer: '【核心要点】\n• 提供内部可变性（Interior Mutability）\n• Cell：用于 Copy 类型，零开销\n• RefCell：运行时借用检查，有开销\n• 绕过编译期借用检查的合法方式\n\n【常见错误回答】\n❌ "RefCell 让代码更安全"\n❌ "Cell/RefCell 是线程安全的"\n\n【代码推理】\nlet a = cell.borrow(); let b = cell.borrow_mut();\n→ 运行时 panic！',
    difficulty: '困难',
    tags: ['内部可变性', '智能指针', '高级']
  },
  {
    id: 'i15',
    question: '⭐⭐ 如何处理 Rust 中的错误？',
    answer: '【核心要点】\n• 使用 Result 而不是 panic\n• 用 ? 运算符传播错误\n• 自定义错误类型（thiserror/anyhow）\n• 区分可恢复和不可恢复错误\n\n【常见错误回答】\n❌ "unwrap() 在原型代码中可以接受"\n❌ "应该总是用 anyhow"\n\n【追问】thiserror 和 anyhow 的区别？什么时候该 panic？',
    difficulty: '中等',
    tags: ['错误处理', '最佳实践', '工程']
  },
  {
    id: 'i16',
    question: '⭐⭐ 什么是模式匹配？match 和 if let 的区别？',
    answer: '【核心要点】\n• 模式匹配是 Rust 的核心特性\n• match 必须覆盖所有可能\n• if let 是 match 的语法糖，只匹配一种情况\n• 模式匹配可以解构、绑定、守卫\n\n【常见错误回答】\n❌ "match 就是 switch-case"\n❌ "if let 只能用于 Option"\n\n【代码推理】\nmatch x { Some(i) if i > 0 => ..., Some(_) => ..., None => ... }\n→ 模式守卫的使用',
    difficulty: '简单',
    tags: ['模式匹配', '控制流', '基础']
  },
  {
    id: 'i17',
    question: '⭐⭐⭐ Vec<T> 和数组有什么区别？',
    answer: '【核心要点】\n• 数组：固定大小，栈分配，类型为 [T; N]\n• Vec：动态大小，堆分配，类型为 Vec<T>\n• 数组性能更好，Vec 更灵活\n• Vec 可以 grow 和 shrink\n\n【常见错误回答】\n❌ "数组就是 Vec 的简化版"\n❌ "数组总是更快"\n\n【追问】什么时候用数组？什么是切片？',
    difficulty: '简单',
    tags: ['集合类型', '内存', '基础']
  },
  {
    id: 'i18',
    question: '⭐⭐ 什么是 Trait？如何定义和使用？',
    answer: '【核心要点】\n• Trait 类似于接口，定义共享行为\n• 可以为类型实现 Trait（impl Trait for Type）\n• 可以使用 Trait Bound 约束泛型\n• 可以定义默认实现\n\n【常见错误回答】\n❌ "Trait 就是类"\n❌ "只能为自定义类型实现 Trait"\n\n【代码推理】\nimpl Display for MyType { ... }\n→ 为自定义类型实现标准库 Trait',
    difficulty: '简单',
    tags: ['Trait', '类型系统', '基础']
  },
  {
    id: 'i19',
    question: '⭐⭐ 迭代器的特点是什么？',
    answer: '【核心要点】\n• 惰性求值（Lazy Evaluation）\n• 零成本抽象，编译优化后性能高\n• 链式调用，代码可读性好\n• collect() 才真正执行\n\n【常见错误回答】\n❌ "迭代器比 for 循环慢"\n❌ "每次 map 都会创建新 Vec"\n\n【代码推理】\n(0..100).map(|x| x * 2).filter(|&x| x > 10).collect::<Vec<_>>()\n→ 链式调用，collect 才执行',
    difficulty: '中等',
    tags: ['迭代器', '函数式', '性能']
  },
  {
    id: 'i20',
    question: '⭐⭐⭐ 什么是移动（Move）语义？',
    answer: '【核心要点】\n• 所有权转移，不是复制\n• 移动后原变量不再可用\n• Copy 类型（如 i32）使用复制语义\n• 移动是零成本的，只复制指针\n\n【常见错误回答】\n❌ "移动就是深拷贝"\n❌ "移动后变量还在"\n\n【代码推理】\nlet s1 = String::from("hello");\nlet s2 = s1;\nprintln!("{}", s1); // 编译失败！s1 已被移动',
    difficulty: '简单',
    tags: ['所有权', '移动', '核心概念']
  },
  {
    id: 'i21',
    question: '⭐⭐ 什么是切片（Slice）？',
    answer: '【核心要点】\n• 切片是对集合连续部分的引用\n• 类型为 &[T] 或 &str\n• 不拥有数据，只是视图\n• 大小在运行时确定\n\n【常见错误回答】\n❌ "切片拥有数据"\n❌ "切片必须在编译时确定大小"\n\n【代码推理】\nlet s = String::from("hello");\nlet slice = &s[0..3]; // &str 类型',
    difficulty: '简单',
    tags: ['切片', '引用', '基础']
  },
  {
    id: 'i22',
    question: '⭐⭐ 什么是 Copy 和 Clone？区别是什么？',
    answer: '【核心要点】\n• Copy：按位复制，隐式发生，类型标记\n• Clone：显式调用，可以自定义实现\n• Copy 是 Clone 的子集\n• Copy 类型必须实现 Clone\n\n【常见错误回答】\n❌ "Clone 就是深拷贝"\n❌ "所有类型都可以 Copy"\n\n【追问】哪些类型实现了 Copy？为什么 String 不是 Copy？',
    difficulty: '中等',
    tags: ['所有权', 'Trait', '基础']
  },
  {
    id: 'i23',
    question: '⭐⭐ 生命周期省略规则是什么？',
    answer: '【核心要点】\n• 规则1：每个引用参数都有独立生命周期\n• 规则2：如果只有一个输入生命周期，赋给所有输出\n• 规则3：如果 &self 或 &mut self，生命周期赋给所有输出\n• 如果规则无法推断，需要手动标注\n\n【常见错误回答】\n❌ "生命周期省略就是不需要生命周期"\n❌ "所有情况都能省略"\n\n【代码推理】\nfn first_word(s: &str) -> &str\n→ 规则1和规则2自动推断生命周期',
    difficulty: '中等',
    tags: ['生命周期', '编译器', '核心概念']
  },
  {
    id: 'i24',
    question: '⭐⭐ 什么是悬垂引用？Rust 如何防止？',
    answer: '【核心要点】\n• 悬垂引用指向已释放的内存\n• 借用检查器在编译期检查\n• 生命周期确保引用有效\n• 无法编译通过悬垂引用的代码\n\n【常见错误回答】\n❌ "Rust 运行时会检查"\n❌ "悬垂引用会导致 panic"\n\n【代码推理】\nfn dangle() -> &String {\n  let s = String::from("hello");\n  &s  // 编译失败！返回悬垂引用\n}',
    difficulty: '中等',
    tags: ['安全', '生命周期', '内存安全']
  },
  {
    id: 'i25',
    question: '⭐⭐⭐ 什么是所有权三条规则？',
    answer: '【核心要点】\n• 每个值都有一个所有者\n• 同一时间只能有一个所有者\n• 所有者离开作用域，值被丢弃\n• 这三条规则保证内存安全\n\n【常见错误回答】\n❌ "所有权就是移动"\n❌ "规则只在编译期检查"\n\n【代码推理】\n{\n  let s = String::from("hello");\n} // s 在这里被丢弃',
    difficulty: '简单',
    tags: ['所有权', '核心概念', '必问']
  },
  {
    id: 'i26',
    question: '⭐⭐ 枚举（Enum）的特点是什么？',
    answer: '【核心要点】\n• 可以携带不同类型的数据\n• 每个变体可以有不同的关联数据\n• Option 和 Result 是标准库枚举\n• 匹配所有变体才能编译通过\n\n【常见错误回答】\n❌ "枚举就是常量集合"\n❌ "枚举只能包含相同类型"\n\n【代码推理】\nenum Message {\n  Quit,\n  Move { x: i32, y: i32 },\n  Write(String),\n}',
    difficulty: '简单',
    tags: ['枚举', '类型系统', '基础']
  },
  {
    id: 'i27',
    question: '⭐⭐ 什么是结构体（Struct）？',
    answer: '【核心要点】\n• 自定义数据类型，组合相关数据\n• 可以有命名字段或元组结构体\n• 可以定义方法和关联函数\n• 零成本抽象\n\n【常见错误回答】\n❌ "结构体就是类"\n❌ "结构体可以有继承"\n\n【代码推理】\nstruct Point { x: i32, y: i32 }\nimpl Point {\n  fn new(x: i32, y: i32) -> Self { ... }\n}',
    difficulty: '简单',
    tags: ['结构体', '类型系统', '基础']
  },
  {
    id: 'i28',
    question: '⭐⭐ 什么是模块系统？如何组织代码？',
    answer: '【核心要点】\n• mod 声明模块\n• pub 控制可见性\n• use 导入项目\n• 模块可以嵌套和拆分到文件\n\n【常见错误回答】\n❌ "模块就是命名空间"\n❌ "所有内容默认公开"\n\n【追问】私有模块和公有模块的区别？什么是 crate？',
    difficulty: '简单',
    tags: ['模块', '代码组织', '基础']
  },
  {
    id: 'i29',
    question: '⭐⭐⭐ Mutex 和 RwLock 的区别？',
    answer: '【核心要点】\n• Mutex：互斥锁，一次只有一个线程\n• RwLock：读写锁，多个读或一个写\n• RwLock 读场景性能更好\n• 都需要配合 Arc 使用\n\n【常见错误回答】\n❌ "Mutex 就是互斥量"\n❌ "RwLock 总是更快"\n\n【代码推理】\nlet data = Arc::new(Mutex::new(0));\nlet data = Arc::new(RwLock::new(0));',
    difficulty: '中等',
    tags: ['并发', '同步', '必问']
  },
  {
    id: 'i30',
    question: '⭐⭐ 什么是 Channel？如何使用？',
    answer: '【核心要点】\n• 用于线程间通信\n• mpsc（多生产者单消费者）\n• 发送端和接收端\n• 可以发送所有权\n\n【常见错误回答】\n❌ "Channel 就是消息队列"\n❌ "只能发送引用"\n\n【代码推理】\nlet (tx, rx) = mpsc::channel();\ntx.send(data).unwrap();\nlet received = rx.recv().unwrap();',
    difficulty: '中等',
    tags: ['并发', '通信', '线程']
  },
  {
    id: 'i31',
    question: '⭐⭐ 什么是 Pin？为什么需要？',
    answer: '【核心要点】\n• 固定数据在内存中的位置\n• 用于自引用结构体\n• Future 需要 Pin\n• 防止移动导致悬垂指针\n\n【常见错误回答】\n❌ "Pin 就是指针"\n❌ "Pin 防止数据被修改"\n\n【追问】为什么 Future 需要 Pin？什么是自引用结构？',
    difficulty: '困难',
    tags: ['异步', '内存安全', '高级']
  },
  {
    id: 'i32',
    question: '⭐⭐ 什么是宏（Macro）？声明宏和过程宏的区别？',
    answer: '【核心要点】\n• 宏是代码生成工具\n• 声明宏：macro_rules!\n• 过程宏：派生宏、属性宏、函数宏\n• 宏在编译期展开\n\n【常见错误回答】\n❌ "宏就是函数"\n❌ "宏在运行时执行"\n\n【追问】什么时候用宏？宏的优缺点？',
    difficulty: '困难',
    tags: ['宏', '元编程', '高级']
  },
  {
    id: 'i33',
    question: '⭐⭐ 什么是 RAII？Rust 如何实现？',
    answer: '【核心要点】\n• 资源获取即初始化\n• 对象析构时自动释放资源\n• Drop trait 实现析构\n• 确定性资源管理\n\n【常见错误回答】\n❌ "RAII 就是垃圾回收"\n❌ "需要手动调用 drop"\n\n【代码推理】\nstruct Guard;\nimpl Drop for Guard {\n  fn drop(&mut self) { ... }\n}',
    difficulty: '中等',
    tags: ['资源管理', 'RAII', '核心概念']
  },
  {
    id: 'i34',
    question: '⭐⭐ 什么是 Cow（Clone on Write）？',
    answer: '【核心要点】\n• 写时克隆智能指针\n• Borrowed 或 Owned 状态\n• 只在需要修改时才克隆\n• 减少不必要的分配\n\n【常见错误回答】\n❌ "Cow 总是克隆数据"\n❌ "Cow 只能用于字符串"\n\n【代码推理】\nlet mut cow: Cow<str> = Cow::Borrowed("hello");\ncow.to_mut().push_str(" world");',
    difficulty: '中等',
    tags: ['智能指针', '性能优化', '高级']
  },
  {
    id: 'i35',
    question: '⭐⭐ 什么是 PhantomData？什么时候用？',
    answer: '【核心要点】\n• 零大小的标记类型\n• 用于表达所有权关系\n• 不影响运行时，只影响类型检查\n• 用于泛型参数约束\n\n【常见错误回答】\n❌ "PhantomData 占用内存"\n❌ "PhantomData 是实际数据"\n\n【追问】为什么需要 PhantomData？有什么实际应用？',
    difficulty: '困难',
    tags: ['类型系统', '泛型', '高级']
  },
  {
    id: 'i36',
    question: '⭐⭐ 什么是 Deref 和 DerefMut？',
    answer: '【核心要点】\n• 重载解引用运算符\n• Deref：不可变解引用\n• DerefMut：可变解引用\n• 自动解引用（Deref Coercion）\n\n【常见错误回答】\n❌ "Deref 就是指针解引用"\n❌ "自动解引用总是发生"\n\n【代码推理】\nstruct MyBox<T>(T);\nimpl<T> Deref for MyBox<T> {\n  type Target = T;\n  fn deref(&self) -> &Self::Target { ... }\n}',
    difficulty: '中等',
    tags: ['操作符重载', '智能指针', '高级']
  },
  {
    id: 'i37',
    question: '⭐⭐ 什么是 AsRef 和 AsMut？',
    answer: '【核心要点】\n• 提供廉价引用转换\n• AsRef：转换为不可变引用\n• AsMut：转换为可变引用\n• 用于泛型函数参数\n\n【常见错误回答】\n❌ "AsRef 就是引用转换"\n❌ "所有类型都实现 AsRef"\n\n【代码推理】\nfn process<T: AsRef<str>>(s: T) { ... }\nprocess("hello");\nprocess(String::from("world"));',
    difficulty: '中等',
    tags: ['Trait', '类型转换', '高级']
  },
  {
    id: 'i38',
    question: '⭐⭐ 什么是 Iterator 和 IntoIterator？',
    answer: '【核心要点】\n• Iterator：迭代器 trait\n• IntoIterator：转换为迭代器\n• for 循环使用 IntoIterator\n• 迭代器是惰性的\n\n【常见错误回答】\n❌ "Iterator 就是 for 循环"\n❌ "迭代器总是执行计算"\n\n【追问】如何自定义迭代器？什么是适配器方法？',
    difficulty: '中等',
    tags: ['迭代器', 'Trait', '函数式']
  },
  {
    id: 'i39',
    question: '⭐⭐ 什么是 Sized trait？',
    answer: '【核心要点】\n• 标记类型在编译时大小已知\n• 大多数类型自动实现\n• ?Sized 表示大小可能未知\n• 用于动态大小类型（DST）\n\n【常见错误回答】\n❌ "所有类型都实现 Sized"\n❌ "?Sized 表示大小可变"\n\n【追问】什么是动态大小类型？str 和 [T] 为什么是 DST？',
    difficulty: '困难',
    tags: ['类型系统', '编译期', '高级']
  },
  {
    id: 'i40',
    question: '⭐⭐ 什么是 Box<dyn Trait>？',
    answer: '【核心要点】\n• 动态分发 trait 对象\n• 存储在堆上\n• 运行时查找方法\n• 用于异构集合\n\n【常见错误回答】\n❌ "Box<dyn Trait> 就是多态"\n❌ "总是应该用 Box<dyn Trait>"\n\n【代码推理】\nlet v: Vec<Box<dyn Display>> = vec![...];\n→ 可以存储不同实现 Display 的类型',
    difficulty: '中等',
    tags: ['Trait Object', '动态分发', '高级']
  },
  {
    id: 'i41',
    question: '⭐⭐ 什么是关联类型（Associated Types）？',
    answer: '【核心要点】\n• Trait 中的类型占位符\n• 每个实现指定具体类型\n• 避免重复泛型参数\n• 更清晰的 API 设计\n\n【常见错误回答】\n❌ "关联类型就是类型别名"\n❌ "关联类型可以是任意类型"\n\n【代码推理】\npub trait Iterator {\n  type Item;\n  fn next(&mut self) -> Option<Self::Item>;\n}',
    difficulty: '中等',
    tags: ['Trait', '泛型', '高级']
  },
  {
    id: 'i42',
    question: '⭐⭐ 什么是高阶生命周期（HRTB）？',
    answer: '【核心要点】\n• 用于生命周期参数本身是泛型的情况\n• for<\'a> 语法\n• 表达"对所有生命周期"\n• 用于闭包和函数指针\n\n【常见错误回答】\n❌ "HRTB 就是生命周期参数"\n❌ "总是需要 HRTB"\n\n【追问】什么时候需要 HRTB？什么是 Fn trait 的生命周期？',
    difficulty: '困难',
    tags: ['生命周期', '高级特性', '高级']
  },
  {
    id: 'i43',
    question: '⭐⭐ 什么是 const 泛型？',
    answer: '【核心要点】\n• 使用常量值作为泛型参数\n• 可以参数化数组大小\n• 编译期计算\n• 零成本抽象\n\n【常见错误回答】\n❌ "const 泛型就是常量"\n❌ "const 泛型影响运行时"\n\n【代码推理】\nfn foo<const N: usize>() -> [i32; N] { ... }\n→ 编译期确定数组大小',
    difficulty: '困难',
    tags: ['泛型', '编译期计算', '高级']
  },
  {
    id: 'i44',
    question: '⭐⭐ 什么是 Never 类型（!）？',
    answer: '【核心要点】\n• 表示永远不会返回的类型\n• 用于 panic!、return、loop\n• 可以强制转换为任何类型\n• 用于穷尽性检查\n\n【常见错误回答】\n❌ "Never 类型就是 void"\n❌ "Never 类型是空类型"\n\n【代码推理】\nlet x: ! = panic!();\nlet y: i32 = x; // 可以转换',
    difficulty: '困难',
    tags: ['类型系统', '控制流', '高级']
  },
  {
    id: 'i45',
    question: '⭐⭐ 什么是类型别名（Type Alias）？',
    answer: '【核心要点】\n• 为现有类型创建别名\n• type 关键字定义\n• 不影响类型系统\n• 用于简化复杂类型\n\n【常见错误回答】\n❌ "类型别名创建新类型"\n❌ "类型别名影响运行时"\n\n【代码推理】\ntype Kilometers = i32;\nlet distance: Kilometers = 5;',
    difficulty: '简单',
    tags: ['类型系统', '语法', '基础']
  },
  {
    id: 'i46',
    question: '⭐⭐ 什么是 NewType 模式？',
    answer: '【核心要点】\n• 使用元组结构体包装类型\n• 创建不同的类型但不增加运行时开销\n• 用于类型安全和 API 清晰\n• 可以实现不同的 trait\n\n【常见错误回答】\n❌ "NewType 就是类型别名"\n❌ "NewType 增加运行时开销"\n\n【代码推理】\nstruct Meters(f64);\nstruct Kilometers(f64);\n→ 防止混用不同的单位',
    difficulty: '中等',
    tags: ['设计模式', '类型安全', '高级']
  },
  {
    id: 'i47',
    question: '⭐⭐ 什么是 Builder 模式？',
    answer: '【核心要点】\n• 用于构建复杂对象\n• 链式调用设置参数\n• 可选参数处理\n• 编译期检查必填参数\n\n【常见错误回答】\n❌ "Builder 模式就是构造函数"\n❌ "Builder 总是需要链式调用"\n\n【追问】什么时候用 Builder 模式？有什么替代方案？',
    difficulty: '中等',
    tags: ['设计模式', 'API 设计', '工程']
  },
  {
    id: 'i48',
    question: '⭐⭐ 什么是内部可变性模式？',
    answer: '【核心要点】\n• 在不可变引用中修改数据\n• 使用 Cell 或 RefCell\n• 运行时借用检查\n• 用于需要可变性的不可变接口\n\n【常见错误回答】\n❌ "内部可变性违反 Rust 规则"\n❌ "应该总是避免使用"\n\n【代码推理】\nstruct Counter { value: RefCell<i32> }\n→ 即使 Counter 不可变，也能修改 value',
    difficulty: '中等',
    tags: ['设计模式', '内部可变性', '高级']
  },
  {
    id: 'i49',
    question: '⭐⭐ 什么是 RAII 守卫模式？',
    answer: '【核心要点】\n• 使用 Drop trait 自动清理\n• 确保资源总是被释放\n• 即使发生 panic 也能清理\n• 用于锁、文件、网络连接等\n\n【常见错误回答】\n❌ "守卫模式就是析构函数"\n❌ "需要在 finally 中手动清理"\n\n【代码推理】\n{\n  let _guard = lock.lock().unwrap();\n  // 使用锁\n} // 自动释放',
    difficulty: '中等',
    tags: ['设计模式', '资源管理', '最佳实践']
  },
  {
    id: 'i50',
    question: '⭐⭐ 什么是错误处理的最佳实践？',
    answer: '【核心要点】\n• 使用 Result 而不是 panic\n• 自定义错误类型\n• 使用 ? 运算符传播错误\n• 区分可恢复和不可恢复错误\n\n【常见错误回答】\n❌ "应该总是用 unwrap()"\n❌ "panic 在测试代码中 OK"\n\n【追问】什么时候该 panic？如何设计错误类型层次？',
    difficulty: '中等',
    tags: ['错误处理', '最佳实践', '工程']
  },
  {
    id: 'i51',
    question: '⭐⭐ 什么是测试策略？如何组织测试？',
    answer: '【核心要点】\n• #[cfg(test)] 模块\n• #[test] 标记测试函数\n• 单元测试和集成测试\n• 使用 assert!、assert_eq! 等\n\n【常见错误回答】\n❌ "测试必须放在单独文件"\n❌ "测试总是需要 mock"\n\n【追问】如何测试私有函数？什么是测试模块？',
    difficulty: '简单',
    tags: ['测试', '开发工具', '工程']
  },
  {
    id: 'i52',
    question: '⭐⭐ 什么是文档注释？如何使用？',
    answer: '【核心要点】\n• /// 用于文档注释\n• //! 用于模块级文档\n• 支持 Markdown\n• cargo doc 生成文档\n\n【常见错误回答】\n❌ "文档注释就是普通注释"\n❌ "文档注释不影响编译"\n\n【代码推理】\n/// 这是一个函数\n///\n/// # Examples\n/// ```\n/// let x = 1;\n/// ```',
    difficulty: '简单',
    tags: ['文档', '开发工具', '基础']
  },
  {
    id: 'i53',
    question: '⭐⭐ 什么是 Cargo？如何使用？',
    answer: '【核心要点】\n• Rust 的包管理器和构建工具\n• Cargo.toml 配置文件\n• cargo build、cargo run、cargo test\n• 依赖管理\n\n【常见错误回答】\n❌ "Cargo 就是编译器"\n❌ "不需要 Cargo 也能编译"\n\n【追问】什么是 workspace？如何发布 crate？',
    difficulty: '简单',
    tags: ['工具链', '包管理', '基础']
  },
  {
    id: 'i54',
    question: '⭐⭐ 什么是条件编译？',
    answer: '【核心要点】\n• #[cfg(...)] 属性\n• 根据条件编译代码\n• 用于平台特定代码\n• cfg! 宏检查编译条件\n\n【常见错误回答】\n❌ "条件编译是运行时检查"\n❌ "所有代码都会编译"\n\n【代码推理】\n#[cfg(target_os = "linux")]\nfn linux_only() { ... }',
    difficulty: '中等',
    tags: ['编译期', '条件编译', '系统编程']
  },
  {
    id: 'i55',
    question: '⭐⭐ 什么是 FFI（Foreign Function Interface）？',
    answer: '【核心要点】\n• 调用其他语言的函数\n• extern 块声明外部函数\n• 使用 unsafe 调用\n• 用于 C 库绑定\n\n【常见错误回答】\n❌ "FFI 是安全的"\n❌ "FFI 不需要 unsafe"\n\n【追问】如何绑定 C 库？什么是 bindgen？',
    difficulty: '困难',
    tags: ['FFI', '系统编程', '高级']
  },
  {
    id: 'i56',
    question: '⭐⭐ 什么是裸指针（Raw Pointer）？',
    answer: '【核心要点】\n• *const T 和 *mut T\n• 不受借用检查器保护\n• 必须在 unsafe 块中解引用\n• 用于底层编程和 FFI\n\n【常见错误回答】\n❌ "裸指针就是普通指针"\n❌ "裸指针是安全的"\n\n【代码推理】\nlet raw: *const i32 = &5;\nunsafe { println!("{}", *raw); }',
    difficulty: '困难',
    tags: ['unsafe', '指针', '系统编程']
  },
  {
    id: 'i57',
    question: '⭐⭐ 什么是内存布局？',
    answer: '【核心要点】\n• 数据在内存中的排列\n• #[repr(C)] 指定 C 兼容布局\n• #[repr(packed)] 紧凑布局\n• 对齐（Alignment）的重要性\n\n【常见错误回答】\n❌ "内存布局总是最优的"\n❌ "布局不影响性能"\n\n【追问】为什么需要控制内存布局？对齐是什么？',
    difficulty: '困难',
    tags: ['内存', '系统编程', '性能']
  },
  {
    id: 'i58',
    question: '⭐⭐ 什么是内联汇编（Inline Assembly）？',
    answer: '【核心要点】\n• 在 Rust 中嵌入汇编代码\n• asm! 宏（需要 nightly）\n• 用于极致性能优化\n• 需要深入理解底层\n\n【常见错误回答】\n• "内联汇编总是更快"\n• "内联汇编是安全的"\n\n【追问】什么时候需要内联汇编？有什么风险？',
    difficulty: '困难',
    tags: ['系统编程', '性能', '高级']
  },
  {
    id: 'i59',
    question: '⭐⭐ 什么是 SIMD（Single Instruction Multiple Data）？',
    answer: '【核心要点】\n• 单指令多数据并行处理\n• 用于向量化计算\n• std::arch 模块\n• 大幅提升数值计算性能\n\n【常见错误回答】\n❌ "SIMD 总是更快"\n❌ "SIMD 是自动的"\n\n【追问】如何使用 SIMD？有什么限制？',
    difficulty: '困难',
    tags: ['性能优化', '并行计算', '高级']
  },
  {
    id: 'i60',
    question: '⭐⭐ 什么是零大小类型（ZST）？',
    answer: '【核心要点】\n• 不占用内存的类型\n• 如 ()、PhantomData\n• 编译期优化掉\n• 用于类型系统标记\n\n【常见错误回答】\n❌ "ZST 占用 0 字节内存"\n❌ "ZST 没有运行时表示"\n\n【代码推理】\nstruct Marker;\nlet x: Marker; // 不占用栈空间',
    difficulty: '中等',
    tags: ['类型系统', '编译器优化', '高级']
  },
  {
    id: 'i61',
    question: '⭐⭐ 什么是类型擦除（Type Erasure）？',
    answer: '【核心要点】\n• 隐藏具体类型信息\n• 使用 trait object 实现\n• 运行时动态分发\n• 用于异构集合\n\n【常见错误回答】\n❌ "类型擦除就是泛型"\n❌ "类型擦除不影响性能"\n\n【追问】什么时候需要类型擦除？有什么代价？',
    difficulty: '困难',
    tags: ['类型系统', '动态分发', '高级']
  },
  {
    id: 'i62',
    question: '⭐⭐ 什么是闭包捕获？',
    answer: '【核心要点】\n• 闭包可以捕获环境变量\n• 按值、按引用、按可变引用\n• move 关键字强制按值捕获\n• 影响闭包的 Fn trait\n\n【常见错误回答】\n❌ "闭包总是按引用捕获"\n❌ "move 闭包就是 FnOnce"\n\n【代码推理】\nlet x = 5;\nlet f = || x + 1; // 按值捕获',
    difficulty: '中等',
    tags: ['闭包', '所有权', '函数式']
  },
  {
    id: 'i63',
    question: '⭐⭐ 什么是函数指针和函数项？',
    answer: '【核心要点】\n• 函数指针：fn(i32) -> i32\n• 函数项：函数名，可以转换为函数指针\n• 函数项有零大小\n• 用于回调和高阶函数\n\n【常见错误回答】\n❌ "函数指针就是闭包"\n❌ "函数指针总是需要 Box"\n\n【代码推理】\nlet f: fn(i32) -> i32 = add;\nlet g: fn(i32) -> i32 = |x| x + 1; // 闭包需要显式类型',
    difficulty: '中等',
    tags: ['函数', '类型系统', '高级']
  },
  {
    id: 'i64',
    question: '⭐⭐ 什么是高阶类型（Higher-Kinded Types）？',
    answer: '【核心要点】\n• Rust 不直接支持 HKT\n• 可以通过 trait 模拟\n• 用于表达泛型容器\n• 更高级的类型抽象\n\n【常见错误回答】\n❌ "Rust 支持 HKT"\n❌ "HKT 就是泛型"\n\n【追问】为什么 Rust 没有 HKT？如何模拟？',
    difficulty: '困难',
    tags: ['类型系统', '高级特性', '理论']
  },
  {
    id: 'i65',
    question: '⭐⭐ 什么是泛型特化（Specialization）？',
    answer: '【核心要点】\n• 为特定类型提供特殊实现\n• 目前是实验性特性\n• 允许覆盖默认实现\n• 用于性能优化\n\n【常见错误回答】\n❌ "特化是稳定特性"\n❌ "所有类型都能特化"\n\n【追问】特化的限制是什么？为什么是实验性的？',
    difficulty: '困难',
    tags: ['泛型', '编译器特性', '高级']
  },
  {
    id: 'i66',
    question: '⭐⭐ 什么是 UnsafeCell？',
    answer: '【核心要点】\n• 提供内部可变性的底层类型\n• Cell 和 RefCell 基于它实现\n• 唯一可以在 &T 中获取 &mut T 的方式\n• 需要 unsafe 使用\n\n【常见错误回答】\n❌ "UnsafeCell 是不安全的"\n❌ "应该直接使用 UnsafeCell"\n\n【追问】为什么需要 UnsafeCell？如何安全使用？',
    difficulty: '困难',
    tags: ['unsafe', '内部可变性', '系统编程']
  },
  {
    id: 'i67',
    question: '⭐⭐ 什么是 MaybeUninit？',
    answer: '【核心要点】\n• 表示可能未初始化的内存\n• 用于手动内存管理\n• 避免未初始化内存的 UB\n• 需要 unsafe 使用\n\n【常见错误回答】\n❌ "MaybeUninit 就是 Option"\n❌ "MaybeUninit 是安全的"\n\n【代码推理】\nlet mut x = MaybeUninit::uninit();\nunsafe { x.as_mut_ptr().write(5); }',
    difficulty: '困难',
    tags: ['unsafe', '内存管理', '系统编程']
  },
  {
    id: 'i68',
    question: '⭐⭐ 什么是 ManuallyDrop？',
    answer: '【核心要点】\n• 防止自动调用 Drop\n• 用于手动控制析构时机\n• 需要手动调用 drop\n• 用于内存布局优化\n\n【常见错误回答】\n❌ "ManuallyDrop 就是不需要 Drop"\n❌ "ManuallyDrop 防止内存泄漏"\n\n【追问】什么时候需要 ManuallyDrop？有什么风险？',
    difficulty: '困难',
    tags: ['资源管理', '内存', '高级']
  },
  {
    id: 'i69',
    question: '⭐⭐ 什么是跨 crate 内联？',
    answer: '【核心要点】\n• #[inline] 属性提示编译器内联\n• #[inline(always)] 强制内联\n• #[inline(never)] 禁止内联\n• 影响代码大小和性能\n\n【常见错误回答】\n❌ "inline 总是更快"\n❌ "应该给所有函数加 inline"\n\n【追问】什么时候应该使用 inline？有什么代价？',
    difficulty: '中等',
    tags: ['性能优化', '编译器', '工程']
  },
  {
    id: 'i70',
    question: '⭐⭐ 什么是内存对齐（Alignment）？',
    answer: '【核心要点】\n• 数据在内存中的起始地址要求\n• 对齐可以提高访问效率\n• #[repr(align(n))] 指定对齐\n• 未对齐访问可能导致性能下降或错误\n\n【常见错误回答】\n❌ "对齐总是越大越好"\n❌ "对齐不影响性能"\n\n【追问】如何检查对齐？为什么需要对齐？',
    difficulty: '中等',
    tags: ['内存', '性能', '系统编程']
  },
  {
    id: 'i71',
    question: '⭐⭐ 什么是生命周期子类型（Subtyping）？',
    answer: '【核心要点】\n• 生命周期之间的关系\n• \'a: \'b 表示 \'a 至少和 \'b 一样长\n• 用于函数参数和返回值\n• 保证引用有效性\n\n【常见错误回答】\n❌ "子类型就是继承"\n❌ "生命周期没有关系"\n\n【代码推理】\nfn longest<\'a: \'b, \'b>(x: &\'a str, y: &\'b str) -> &\'b str',
    difficulty: '困难',
    tags: ['生命周期', '类型系统', '高级']
  },
  {
    id: 'i72',
    question: '⭐⭐ 什么是 GAT（Generic Associated Types）？',
    answer: '【核心要点】\n• 关联类型可以是泛型的\n• 更强大的抽象能力\n• 用于迭代器、异步等场景\n• 是稳定特性\n\n【常见错误回答】\n❌ "GAT 是实验性的"\n❌ "GAT 就是关联类型"\n\n【代码推理】\ntrait Iterator { type Item<\'a>; }',
    difficulty: '困难',
    tags: ['Trait', '泛型', '高级']
  },
  {
    id: 'i73',
    question: '⭐⭐ 什么是 trait bounds 和 where 子句？',
    answer: '【核心要点】\n• 约束泛型参数必须实现的 trait\n• 可以使用 + 组合多个 bounds\n• where 子句提供更清晰的语法\n• 用于复杂约束\n\n【常见错误回答】\n❌ "trait bounds 就是继承"\n❌ "where 子句是必须的"\n\n【代码推理】\nfn foo<T, U>()\nwhere\n  T: Display + Clone,\n  U: Debug,\n{ ... }',
    difficulty: '中等',
    tags: ['泛型', 'Trait', '语法']
  },
  {
    id: 'i74',
    question: '⭐⭐ 什么是 Turbofish 语法（::<>）？',
    answer: '【核心要点】\n• 显式指定泛型类型参数\n• 格式：func::<Type>()\n• 当类型推断失败时使用\n• 用于明确指定类型\n\n【常见错误回答】\n❌ "Turbofish 总是需要的"\n❌ "Turbofish 影响运行时"\n\n【代码推理】\nlet v = Vec::<i32>::new();\nlet x = "42".parse::<i32>();',
    difficulty: '简单',
    tags: ['泛型', '语法', '基础']
  },
  {
    id: 'i75',
    question: '⭐⭐ 什么是类型转换（Type Coercion）？',
    answer: '【核心要点】\n• 自动将一种类型转换为另一种\n• Deref Coercion：通过 Deref trait\n• 数值类型转换\n• 函数指针转换\n\n【常见错误回答】\n❌ "类型转换总是发生的"\n❌ "类型转换影响性能"\n\n【追问】什么是强制转换点？什么时候发生转换？',
    difficulty: '中等',
    tags: ['类型系统', '编译器', '高级']
  },
  {
    id: 'i76',
    question: '⭐⭐ 什么是堆栈溢出（Stack Overflow）？如何避免？',
    answer: '【核心要点】\n• 栈空间耗尽导致崩溃\n• 递归过深、大对象在栈上\n• 使用 Box 将大对象移到堆\n• 使用迭代替代递归\n\n【常见错误回答】\n❌ "栈溢出就是内存不足"\n❌ "应该总是用 Box"\n\n【追问】如何估算栈大小？什么时候该用堆？',
    difficulty: '中等',
    tags: ['内存', '错误处理', '最佳实践']
  },
  {
    id: 'i77',
    question: '⭐⭐ 什么是内存泄漏？Rust 能防止吗？',
    answer: '【核心要点】\n• 分配的内存无法释放\n• Rust 不能完全防止（如 Rc 循环引用）\n• 但防止了大多数常见情况\n• 需要手动检查循环引用\n\n【常见错误回答】\n❌ "Rust 完全防止内存泄漏"\n❌ "内存泄漏就是悬垂指针"\n\n【代码推理】\nlet a = Rc::new(RefCell::new(5));\nlet b = Rc::new(RefCell::new(10));\na.borrow_mut() = Rc::clone(&b);\nb.borrow_mut() = Rc::clone(&a); // 循环引用',
    difficulty: '中等',
    tags: ['内存管理', '资源管理', '高级']
  },
  {
    id: 'i78',
    question: '⭐⭐ 什么是数据竞争（Data Race）？Rust 如何防止？',
    answer: '【核心要点】\n• 多个线程同时访问数据且至少一个写入\n• 导致未定义行为\n• 借用检查器防止编译期数据竞争\n• 使用 Sync trait 标记线程安全类型\n\n【常见错误回答】\n❌ "数据竞争就是竞态条件"\n❌ "Rust 运行时检查数据竞争"\n\n【追问】为什么 Rc 不是 Sync？如何保证线程安全？',
    difficulty: '中等',
    tags: ['并发', '线程安全', '内存安全']
  },
  {
    id: 'i79',
    question: '⭐⭐ 什么是死锁？如何避免？',
    answer: '【核心要点】\n• 多个线程互相等待资源\n• Rust 不能防止逻辑死锁\n• 使用一致的锁顺序\n• 考虑使用 try_lock 或超时\n\n【常见错误回答】\n❌ "Rust 防止所有死锁"\n❌ "死锁就是数据竞争"\n\n【追问】如何检测死锁？有哪些最佳实践？',
    difficulty: '中等',
    tags: ['并发', '错误处理', '最佳实践']
  },
  {
    id: 'i80',
    question: '⭐⭐ 什么是 Rust 的内存模型？',
    answer: '【核心要点】\n• 基于所有权和借用的内存安全模型\n• 编译期检查，零运行时开销\n• 防止悬垂指针、数据竞争等\n• 确定性内存管理\n\n【常见错误回答】\n❌ "Rust 使用垃圾回收"\n❌ "内存模型是运行时的"\n\n【追问】Rust 的内存模型与其他语言有何不同？',
    difficulty: '困难',
    tags: ['内存模型', '设计哲学', '核心概念']
  },
  {
    id: 'i81',
    question: '⭐⭐ 什么是 Rust 的并发模型？',
    answer: '【核心要点】\n• 基于所有权和类型系统的并发安全\n• Send 和 Sync trait 标记线程安全\n• 多种并发方式：线程、async、channel\n• 编译期保证线程安全\n\n【常见错误回答】\n❌ "Rust 只有一种并发方式"\n❌ "并发安全是运行时检查"\n\n【追问】什么时候用线程？什么时候用 async？',
    difficulty: '中等',
    tags: ['并发', '设计哲学', '核心概念']
  },
  {
    id: 'i82',
    question: '⭐⭐ 什么是 Rust 的错误处理哲学？',
    answer: '【核心要点】\n• 使用 Result 而不是异常\n• 显式错误处理\n• 区分可恢复和不可恢复错误\n• panic 用于不可恢复错误\n\n【常见错误回答】\n❌ "应该总是 panic"\n❌ "Result 就是异常处理"\n\n【追问】为什么 Rust 没有异常？Result 的优势？',
    difficulty: '简单',
    tags: ['错误处理', '设计哲学', '基础']
  },
  {
    id: 'i83',
    question: '⭐⭐ 什么是 Rust 的性能特点？',
    answer: '【核心要点】\n• 零成本抽象\n• 无运行时开销\n• 内存安全和性能兼得\n• 可以接近 C/C++ 的性能\n\n【常见错误回答】\n❌ "Rust 总是最快的"\n❌ "抽象总是有代价"\n\n【追问】Rust 如何实现零成本抽象？什么时候可能慢？',
    difficulty: '简单',
    tags: ['性能', '设计哲学', '核心概念']
  },
  {
    id: 'i84',
    question: '⭐⭐ 什么是 Rust 的生态系统？',
    answer: '【核心要点】\n• crates.io 是包注册中心\n• 标准库小而精\n• 第三方库丰富\n• 社区活跃，工具链完善\n\n【常见错误回答】\n❌ "Rust 生态系统不成熟"\n❌ "标准库包含一切"\n\n【追问】常用的 Rust 库有哪些？如何选择库？',
    difficulty: '简单',
    tags: ['生态系统', '工具链', '工程']
  },
  {
    id: 'i85',
    question: '⭐⭐ 什么是 Rust 的学习曲线？',
    answer: '【核心要点】\n• 所有权和生命周期是主要难点\n• 需要改变编程思维\n• 但一旦掌握，开发效率高\n• 编译器错误信息友好\n\n【常见错误回答】\n❌ "Rust 太难学"\n❌ "需要精通系统编程"\n\n【追问】如何学习 Rust？有什么建议？',
    difficulty: '简单',
    tags: ['学习', '入门', '基础']
  },
  {
    id: 'i86',
    question: '⭐⭐ 什么是 Vec 的容量（Capacity）和长度（Length）？',
    answer: '【核心要点】\n• 长度：实际元素数量（len）\n• 容量：分配的内存能容纳的元素数（capacity）\n• 容量 >= 长度\n• 超过容量时会重新分配\n\n【常见错误回答】\n❌ "容量就是长度"\n❌ "容量总是精确的"\n\n【代码推理】\nlet mut v = Vec::with_capacity(10);\nv.push(1); // len=1, capacity=10',
    difficulty: '中等',
    tags: ['集合类型', '内存', '性能']
  },
  {
    id: 'i87',
    question: '⭐⭐ 什么是 HashMap 的哈希冲突？如何解决？',
    answer: '【核心要点】\n• 不同键映射到同一索引\n• Rust 使用开放寻址和 Robin Hood 哈希\n• 需要实现 Hash 和 Eq trait\n• 影响查找性能\n\n【常见错误回答】\n❌ "HashMap 没有冲突"\n❌ "冲突会导致错误"\n\n【追问】如何设计好的 Hash 函数？什么是负载因子？',
    difficulty: '中等',
    tags: ['集合类型', '算法', '性能']
  },
  {
    id: 'i88',
    question: '⭐⭐ 什么是 VecDeque？什么时候用？',
    answer: '【核心要点】\n• 双端队列（Double-ended queue）\n• 支持 O(1) 的前后插入和删除\n• Vec 只支持后端高效操作\n• 用于需要两端操作的场景\n\n【常见错误回答】\n❌ "VecDeque 总是比 Vec 快"\n❌ "VecDeque 就是 Vec"\n\n【追问】VecDeque 的实现原理？什么时候应该用？',
    difficulty: '中等',
    tags: ['集合类型', '数据结构', '算法']
  },
  {
    id: 'i89',
    question: '⭐⭐ 什么是 BTreeMap 和 BTreeSet？',
    answer: '【核心要点】\n• 基于 B 树的排序集合\n• 键有序，支持范围查询\n• 比 HashMap 慢但有序\n• 用于需要排序的场景\n\n【常见错误回答】\n❌ "BTreeMap 总是比 HashMap 慢"\n❌ "BTreeMap 就是排序的 HashMap"\n\n【追问】什么时候用 BTreeMap？范围查询的优势？',
    difficulty: '中等',
    tags: ['集合类型', '数据结构', '算法']
  },
  {
    id: 'i90',
    question: '⭐⭐ 什么是 Cow<str> 和 Cow<[T]>？',
    answer: '【核心要点】\n• Clone on Write 的字符串和切片\n• Borrowed 或 Owned 状态\n• 只在需要修改时克隆\n• 减少不必要的分配\n\n【常见错误回答】\n❌ "Cow 总是克隆"\n❌ "Cow 只能用于字符串"\n\n【代码推理】\nlet s = "hello";\nlet cow: Cow<str> = Cow::Borrowed(s);\nlet owned = cow.into_owned(); // 转换为 String',
    difficulty: '中等',
    tags: ['智能指针', '字符串', '性能优化']
  },
  {
    id: 'i91',
    question: '⭐⭐ 什么是 Once 和 OnceLock？',
    answer: '【核心要点】\n• 确保只执行一次的同步原语\n• Once：执行一次代码块\n• OnceLock：延迟初始化的全局变量\n• 线程安全\n\n【常见错误回答】\n❌ "Once 就是 Mutex"\n❌ "OnceLock 需要手动初始化"\n\n【代码推理】\nstatic INIT: Once = Once::new();\nINIT.call_once(|| { /* 初始化代码 */ });',
    difficulty: '中等',
    tags: ['并发', '同步', '初始化']
  },
  {
    id: 'i92',
    question: '⭐⭐ 什么是 Condvar（条件变量）？',
    answer: '【核心要点】\n• 用于线程间等待和通知\n• 配合 Mutex 使用\n• wait 阻塞，notify_one/notify_all 唤醒\n• 用于生产者-消费者模式\n\n【常见错误回答】\n❌ "Condvar 就是 Mutex"\n❌ "Condvar 不需要 Mutex"\n\n【代码推理】\nlet pair = Arc::new((Mutex::new(false), Condvar::new()));\npair.1.wait(pair.0.lock().unwrap()).unwrap();',
    difficulty: '困难',
    tags: ['并发', '同步', '线程通信']
  },
  {
    id: 'i93',
    question: '⭐⭐ 什么是 Barrier？',
    answer: '【核心要点】\n• 同步多个线程到达同一执行点\n• 所有线程到达后才继续\n• 用于并行计算的同步\n• 可以重用\n\n【常见错误回答】\n❌ "Barrier 就是 Mutex"\n❌ "Barrier 只能使用一次"\n\n【追问】Barrier 的使用场景？与其他同步原语的区别？',
    difficulty: '中等',
    tags: ['并发', '同步', '并行计算']
  },
  {
    id: 'i94',
    question: '⭐⭐ 什么是 Lazy 和 LazyStatic？',
    answer: '【核心要点】\n• 延迟初始化的全局变量\n• 第一次访问时初始化\n• 线程安全\n• 避免静态初始化的限制\n\n【常见错误回答】\n❌ "Lazy 就是 lazy_static"\n❌ "Lazy 总是初始化"\n\n【追问】once_cell 和 lazy_static 的区别？什么时候用？',
    difficulty: '中等',
    tags: ['初始化', '全局变量', '并发']
  },
  {
    id: 'i95',
    question: '⭐⭐ 什么是 Atomic 类型？',
    answer: '【核心要点】\n• 原子操作的无锁类型\n• AtomicBool、AtomicI32 等\n• 线程安全的无锁操作\n• 性能比 Mutex 更好\n\n【常见错误回答】\n❌ "Atomic 就是 Mutex"\n❌ "Atomic 总是更快"\n\n【代码推理】\nlet counter = Arc::new(AtomicI32::new(0));\ncounter.fetch_add(1, Ordering::SeqCst);',
    difficulty: '中等',
    tags: ['并发', '原子操作', '性能']
  },
  {
    id: 'i96',
    question: '⭐⭐ 什么是 Ordering（内存顺序）？',
    answer: '【核心要点】\n• 原子操作的内存排序语义\n• Relaxed、Acquire、Release、AcqRel、SeqCst\n• 控制可见性和顺序\n• 影响性能和正确性\n\n【常见错误回答】\n❌ "Ordering 不影响正确性"\n❌ "总是用 SeqCst 最安全"\n\n【追问】各种 Ordering 的区别？什么时候用哪个？',
    difficulty: '困难',
    tags: ['并发', '内存模型', '高级']
  },
  {
    id: 'i97',
    question: '⭐⭐ 什么是 async trait？',
    answer: '【核心要点】\n• Trait 中的异步方法\n• 使用 async-trait 库（稳定前）\n• 或者使用关联类型\n• 用于异步接口抽象\n\n【常见错误回答】\n❌ "async trait 是稳定特性"\n❌ "trait 不能有 async 方法"\n\n【追问】为什么 async trait 需要额外支持？有什么限制？',
    difficulty: '困难',
    tags: ['异步', 'Trait', '高级']
  },
  {
    id: 'i98',
    question: '⭐⭐ 什么是 Stream？',
    answer: '【核心要点】\n• 异步版本的 Iterator\n• 异步序列的抽象\n• 用于处理异步数据流\n• futures crate 提供\n\n【常见错误回答】\n❌ "Stream 就是 Iterator"\n❌ "Stream 是标准库类型"\n\n【追问】如何使用 Stream？与 Iterator 的对应关系？',
    difficulty: '困难',
    tags: ['异步', '迭代器', '高级']
  },
  {
    id: 'i99',
    question: '⭐⭐ 什么是 ? 运算符？',
    answer: '【核心要点】\n• 简化错误传播的语法糖\n• 如果 Err 则提前返回\n• 如果 Ok 则解包值\n• 必须返回 Result 或 Option\n\n【常见错误回答】\n❌ "? 运算符就是 unwrap"\n❌ "? 运算符捕获异常"\n\n【代码推理】\nfn foo() -> Result<i32, Error> {\n  let x = bar()?; // 如果 Err，提前返回\n  Ok(x + 1)\n}',
    difficulty: '简单',
    tags: ['错误处理', '语法', '基础']
  },
  {
    id: 'i100',
    question: '⭐⭐ 什么是 Rust 的稳定性保证？',
    answer: '【核心要点】\n• 稳定版本不会破坏向后兼容\n• 新版本可以添加功能\n• 不会删除或修改稳定 API\n• 保证代码长期可用\n\n【常见错误回答】\n❌ "Rust 会破坏性更新"\n❌ "稳定版本不会改变"\n\n【追问】什么是 Rust 版本策略？edition 是什么？',
    difficulty: '简单',
    tags: ['语言特性', '工程', '基础']
  }
] as InterviewItem[]);

