import { CourseChapter, CourseUnit, QuizModule, ReferenceCategory, InterviewItem, QuestionType } from './RustTypes';

export const DAILY_TIPS: string[] = [
  "ArkTS 是 HarmonyOS 的主力开发语言，基于 TypeScript 扩展。",
  "使用 @Entry 装饰器标记页面的入口组件。",
  "使用 @Component 装饰器标记自定义组件。",
  "状态管理是 ArkTS 的核心，@State 用于组件内部状态。",
  "使用 @Link 装饰器在父子组件间建立双向同步。",
  "build() 函数中只能包含一个根节点（除 Text 等特定组件外）。",
  "ArkUI 使用声明式语法构建 UI，代码即界面。",
  "使用 router.pushUrl() 进行页面跳转。",
  "List 组件用于展示列表数据，配合 ForEach 使用更佳。",
  "使用 @Builder 装饰器定义复用的 UI 构建函数。",
  "AppStorage 用于应用全局状态管理。",
  "使用 promptAction.showToast() 显示简短提示。",
  "Column 和 Row 是最常用的布局容器。",
  "Stack 容器用于堆叠布局，后添加的元素在上层。",
  "Flex 布局提供了强大的弹性布局能力。",
  "使用 .width() 和 .height() 设置尺寸，单位默认 vp。",
  "vp (virtual pixel) 是屏幕密度无关像素。",
  "fp (font pixel) 用于字体大小，随系统字体设置缩放。",
  "resources 目录存放图片、字符串等资源。",
  "使用 $r('app.string.name') 引用资源文件。",
  "@Prop 装饰器用于父子组件单向同步。",
  "@Provide 和 @Consume 用于跨层级组件状态共享。",
  "@Watch 装饰器用于监听状态变量的变化。",
  "使用 .onClick() 添加点击事件监听。",
  "Image 组件支持加载本地资源和网络图片。",
  "TextInput 组件用于接收用户文本输入。",
  "Toggle 组件用于开关选择。",
  "Slider 组件用于滑动选择数值。",
  "Progress 组件用于显示进度。",
  "使用 .padding() 和 .margin() 控制间距。"
];

export const COURSE_UNITS: CourseUnit[] = [
  { id: 'unit1', name: 'ArkTS 基础', description: '了解 ArkTS 语言特性与基本语法', order: 1 },
  { id: 'unit2', name: '声明式 UI', description: '学习 ArkUI 的基础组件与布局', order: 2 },
  { id: 'unit3', name: '状态管理', description: '掌握组件状态与数据传递机制', order: 3 },
  { id: 'unit4', name: '页面路由', description: '学习页面跳转与参数传递', order: 4 },
  { id: 'unit5', name: '网络与数据', description: '数据请求与持久化存储', order: 5 }
];

export const COURSE_CHAPTERS: CourseChapter[] = [
  {
    id: '1',
    unitId: 'unit1',
    title: '初识 ArkTS',
    description: 'ArkTS 简介及其与 TypeScript 的关系',
    difficulty: '入门',
    content: `ArkTS 是 HarmonyOS 优选的主力应用开发语言。它在 TypeScript（TS）的基础上，匹配 ArkUI 框架，扩展了声明式 UI、状态管理等相应的能力。

## 核心特性

1.  **声明式 UI**：基于 ArkUI 框架，使用声明式语法描述界面。
2.  **状态管理**：提供了 @State, @Link, @Prop 等装饰器管理状态。
3.  **高性能**：方舟编译器（ArkCompiler）对 ArkTS 进行了深度优化。

## Hello World

一个简单的 ArkTS 组件如下：`,
    exampleCode: `@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}`,
    summary: [
      'ArkTS 是 HarmonyOS 开发语言。',
      '基于 TypeScript 扩展。',
      '使用声明式语法构建 UI。'
    ]
  },
  {
    id: '2',
    unitId: 'unit2',
    title: '基础组件',
    description: 'Text, Button, Image 等常用组件',
    difficulty: '入门',
    content: `ArkUI 提供了丰富的基础组件。

## 常用组件

- **Text**: 显示文本。
- **Button**: 按钮，可响应点击。
- **Image**: 显示图片。
- **TextInput**: 文本输入框。

## 属性设置

通过链式调用设置属性：`,
    exampleCode: `Column() {
  Text('Blue Text')
    .fontColor(Color.Blue)
    .fontSize(20)
  
  Button('Click Me')
    .width(100)
    .height(40)
    .backgroundColor(Color.Red)
}`,
    summary: [
      'Text 用于显示文本。',
      'Button 用于交互。',
      '属性通过链式调用设置。'
    ]
  },
  {
    id: '3',
    unitId: 'unit3',
    title: '@State 装饰器',
    description: '组件内部状态管理',
    difficulty: '进阶',
    content: `@State 装饰的变量是组件内部的状态数据，当这些数据被修改时，会触发 UI 的更新。

## 特点

- **内部私有**：只能在组件内部访问。
- **UI 驱动**：变化会触发 build() 重新渲染。
- **初始化**：必须本地初始化。`,
    exampleCode: `@Component
struct Counter {
  @State count: number = 0;

  build() {
    Button(\`Count: \${this.count}\`)
      .onClick(() => {
        this.count += 1;
      })
  }
}`,
    summary: [
      '@State 管理组件内部状态。',
      '状态变化触发 UI 刷新。',
      '必须在声明时初始化。'
    ]
  }
];

export const QUIZ_MODULES: QuizModule[] = [
  {
    id: 'q1',
    title: 'ArkTS 基础测验',
    questions: [
      {
        id: 'q1_1',
        type: QuestionType.SINGLE_CHOICE,
        question: 'ArkTS 是基于哪种语言扩展的？',
        options: ['Java', 'JavaScript', 'TypeScript', 'C++'],
        correctIndices: [2],
        explanation: 'ArkTS 是在 TypeScript (TS) 的基础上扩展的。'
      },
      {
        id: 'q1_2',
        type: QuestionType.TRUE_FALSE,
        question: '@State 装饰的变量变化会触发 UI 更新吗？',
        options: ['会', '不会'],
        correctIndices: [0],
        explanation: '@State 变量变化会驱动 UI 重新渲染。'
      }
    ]
  }
];

export const REFERENCE_DATA: ReferenceCategory[] = [
  {
    title: "装饰器",
    items: [
      { keyword: "@Entry", description: "标记页面入口组件。" },
      { keyword: "@Component", description: "标记自定义组件。" },
      { keyword: "@State", description: "组件内部状态。" },
      { keyword: "@Prop", description: "父子单向同步。" },
      { keyword: "@Link", description: "父子双向同步。" },
      { keyword: "@Builder", description: "轻量级 UI 复用函数。" },
      { keyword: "@Styles", description: "样式复用。" }
    ]
  },
  {
    title: "基础组件",
    items: [
      { keyword: "Text", description: "文本显示组件。" },
      { keyword: "Button", description: "按钮组件。" },
      { keyword: "Image", description: "图片组件。" },
      { keyword: "TextInput", description: "单行文本输入。" },
      { keyword: "Column", description: "垂直布局容器。" },
      { keyword: "Row", description: "水平布局容器。" },
      { keyword: "Stack", description: "堆叠布局容器。" }
    ]
  }
];

export const INTERVIEW_QUESTIONS: InterviewItem[] = [
  {
    id: 'i1',
    question: '⭐⭐ ArkTS 与 TypeScript 的关系？',
    answer: 'ArkTS 是 TypeScript 的超集（扩展）也是子集（限制）。\n\n1. **扩展**：增加了声明式 UI 描述、状态管理装饰器等能力。\n2. **限制**：为了更高的性能（静态类型优化），限制了 TS 中部分动态特性（如 any 类型的部分使用、运行时动态改变对象布局等）。',
    difficulty: '简单',
    tags: ['基础', '概念']
  },
  {
    id: 'i2',
    question: '⭐⭐ @State, @Prop, @Link 的区别？',
    answer: '1. **@State**：组件内部私有状态，初始化必须赋值，变化触发 UI 更新。\n2. **@Prop**：父组件单向同步给子组件，子组件修改不回传。\n3. **@Link**：父子组件双向同步，子组件修改会同步给父组件。',
    difficulty: '中等',
    tags: ['状态管理', '装饰器']
  },
  {
    id: 'i3',
    question: '⭐⭐⭐ ArkUI 的渲染机制是怎样的？',
    answer: 'ArkUI 采用声明式开发范式。当状态（State）发生变化时，框架会自动识别依赖该状态的组件，并仅重新渲染这些受影响的组件（脏区刷新），而不是重绘整个页面，从而保证高性能。',
    difficulty: '困难',
    tags: ['原理', '渲染']
  }
];
