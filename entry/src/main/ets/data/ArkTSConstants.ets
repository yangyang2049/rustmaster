
import { CourseChapter, CourseUnit, QuizModule, ReferenceCategory, InterviewItem, QuestionType } from './RustTypes';

export const DAILY_TIPS: string[] = [
  "ArkTS 是 HarmonyOS 的主力开发语言，基于 TypeScript 扩展。",
  "使用 @Entry 装饰器标记页面的入口组件，每个页面有且仅有一个 @Entry。",
  "使用 @Component 装饰器标记自定义组件，实现 UI 封装和复用。",
  "状态管理是 ArkTS 的核心，@State 用于组件内部状态，变化自动触发 UI 刷新。",
  "使用 @Link 装饰器在父子组件间建立双向同步，无需手动回调。",
  "build() 函数中只能包含一个根节点（除 Text、Image 等基础组件外，容器组件通常作为根节点）。",
  "ArkUI 使用声明式语法构建 UI，代码结构即界面结构，直观易懂。",
  "使用 router.pushUrl() 进行页面跳转，支持传递参数。",
  "List 组件用于展示列表数据，配合 ForEach 渲染，性能优于 Column 循环。",
  "使用 @Builder 装饰器定义轻量级的 UI 构建函数，实现局部 UI 复用。",
  "AppStorage 用于应用全局状态管理，可以在不同页面和组件间共享数据。",
  "使用 promptAction.showToast() 显示简短提示，非阻塞式提醒。",
  "Column 和 Row 是最常用的线性布局容器，控制主轴和交叉轴对齐。",
  "Stack 容器用于堆叠布局，后添加的元素显示在上层，常用于覆盖遮罩。",
  "Flex 布局提供了强大的弹性布局能力，适合复杂的自适应场景。",
  "使用 .width() 和 .height() 设置尺寸，单位默认 vp (virtual pixel)，适配不同屏幕密度。",
  "vp (virtual pixel) 是屏幕密度无关像素，1vp 约等于 160dpi 屏幕上的 1px。",
  "fp (font pixel) 用于字体大小，随系统字体设置缩放，保证可读性。",
  "resources 目录存放图片、字符串等资源，支持多语言和多设备适配。",
  "使用 $r('app.string.name') 引用资源文件，编译时会进行类型检查。",
  "@Prop 装饰器用于父子组件单向同步，子组件修改不会影响父组件。",
  "@Provide 和 @Consume 用于跨层级组件状态共享，避免逐层传递。",
  "@Watch 装饰器用于监听状态变量的变化，执行额外的逻辑。",
  "使用 .onClick() 添加点击事件监听，支持点击效果配置。",
  "Image 组件支持加载本地资源($r)和网络图片(url)，支持缓存和占位图。",
  "TextInput 组件用于接收用户文本输入，支持密码模式和输入类型限制。",
  "Toggle 组件用于开关选择，支持 Switch、Checkbox 和 Button 样式。",
  "Slider 组件用于滑动选择数值，常用于音量、亮度调节。",
  "Progress 组件用于显示进度，支持线性、环形等多种样式。",
  "使用 .padding() 和 .margin() 控制内边距和外边距，调整布局间隙。",
  "Grid 布局适合网格状排列，支持固定列数或自适应列宽。",
  "RelativeContainer 支持相对布局，通过锚点定位子元素。",
  "使用 .layoutWeight() 设置剩余空间分配权重，常用于自适应布局。",
  "Navigation 组件提供了标准的导航栏和路由管理能力。",
  "Tabs 和 TabContent 实现标签页切换，支持底部或顶部导航。",
  "使用 PersistentStorage 持久化存储简单数据，重启应用后依然存在。",
  "Preferences 用于存储轻量级的键值对数据，适合配置项。",
  "RdbStore (关系型数据库) 用于存储复杂的结构化数据。",
  "HTTP 数据请求使用 http.createHttp()，支持 GET、POST 等方法。",
  "Web 组件可以加载网页，支持 JS 交互。",
  "Worker 线程用于执行耗时操作，避免阻塞 UI 主线程。",
  "TaskPool 是更轻量级的并发任务池，推荐用于并计算。",
  "使用 animateTo 显式动画，简单实现属性变化的过渡效果。",
  "属性动画 .animation() 绑定到特定属性，属性变化时自动应用动画。",
  "自定义组件的生命周期：aboutToAppear (创建), aboutToDisappear (销毁)。",
  "页面的生命周期：onPageShow (显示), onPageHide (隐藏), onBackPress (返回)。",
  "Ability 生命周期：onCreate, onWindowStageCreate, onForeground, onBackground, onDestroy。",
  "使用 hilog 打印日志，支持分级和过滤，便于调试。",
  "DevEco Studio 提供了强大的预览器，支持实时预览 UI 效果。",
  "ArkTS 限制了 TypeScript 的部分动态特性（如 any），以支持 AOT 编译优化。"
];

export const COURSE_UNITS: CourseUnit[] = [
  { id: 'unit1', name: 'ArkTS 基础', description: '了解 ArkTS 语言特性、基本语法与开发环境', order: 1 } as CourseUnit,
  { id: 'unit2', name: '声明式 UI', description: '学习 ArkUI 的基础组件、布局容器与样式设置', order: 2 } as CourseUnit,
  { id: 'unit3', name: '状态管理', description: '掌握 @State, @Link, @Prop 等状态装饰器', order: 3 } as CourseUnit,
  { id: 'unit4', name: '交互与动画', description: '处理用户交互事件与实现基础动画效果', order: 4 } as CourseUnit,
  { id: 'unit5', name: '页面路由与导航', description: '学习 Router, Navigation 与 Tabs 导航', order: 5 } as CourseUnit,
  { id: 'unit6', name: '列表与网格', description: '使用 List 和 Grid 高效展示集合数据', order: 6 } as CourseUnit,
  { id: 'unit7', name: '网络与数据持久化', description: 'HTTP 请求、Preferences 与数据库存储', order: 7 } as CourseUnit,
  { id: 'unit8', name: '并发与线程', description: '使用 Worker 和 TaskPool 进行多线程开发', order: 8 } as CourseUnit,
  { id: 'unit9', name: '应用模型', description: '理解 Stage 模型、Ability 生命周期与上下文', order: 9 } as CourseUnit,
  { id: 'unit10', name: '实战项目', description: '综合运用所学知识开发完整应用', order: 10 } as CourseUnit
];

export const COURSE_CHAPTERS: CourseChapter[] = [
  // 单元1：ArkTS 基础
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
3.  **高性能**：方舟编译器（ArkCompiler）对 ArkTS 进行了深度优化，支持 AOT（Ahead-Of-Time）编译。

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
      '基于 TypeScript 扩展，但有静态限制。',
      '使用声明式语法构建 UI。'
    ]
  },
  {
    id: '2',
    unitId: 'unit1',
    title: '基本语法',
    description: '变量声明、类型系统与函数定义',
    difficulty: '入门',
    content: `ArkTS 继承了 TypeScript 的大部分语法，但为了性能优化，实施了更严格的静态类型检查。

## 变量声明

- **let**: 声明可变变量。
- **const**: 声明常量。

## 类型系统

ArkTS 强制类型检查，不支持 	\`any\` 类型（部分场景除外）。

- **基本类型**: string, number, boolean
- **引用类型**: Object, Array, class, interface

## 函数定义

函数必须声明参数和返回值类型。`,
    exampleCode: `// 变量声明
let name: string = "ArkTS";
const version: number = 1.0;

// 函数定义
function add(x: number, y: number): number {
  return x + y;
}

// 箭头函数
const multiply = (x: number, y: number): number => {
  return x * y;
}`,
    summary: [
      '使用 let 和 const 声明变量。',
      '必须显式标注类型或通过推断确定。',
      '不支持 any 类型，强调静态类型安全。'
    ]
  },
  // 单元2：声明式 UI
  {
    id: '3',
    unitId: 'unit2',
    title: '基础组件',
    description: 'Text, Button, Image 等常用组件',
    difficulty: '入门',
    content: `ArkUI 提供了丰富的基础组件，是构建界面的基石。

## 常用组件

- **Text**: 显示文本，支持样式设置。
- **Button**: 按钮，可响应点击事件。
- **Image**: 显示图片，支持本地资源和网络图片。
- **TextInput**: 单行文本输入框。

## 属性设置

通过链式调用设置属性，返回组件本身。`,
    exampleCode: `Column() {
  Text('Blue Text')
    .fontColor(Color.Blue)
    .fontSize(20)
    .margin({ bottom: 10 })
  
  Button('Click Me')
    .width(100)
    .height(40)
    .backgroundColor(Color.Red)
    .onClick(() => {
      console.info('Button clicked');
    })
    
  Image($r('app.media.icon'))
    .width(50)
    .height(50)
}`,
    summary: [
      'Text 用于显示文本。',
      'Button 用于交互。',
      'Image 用于显示图片。',
      '属性通过链式调用设置。'
    ]
  },
  {
    id: '4',
    unitId: 'unit2',
    title: '线性布局',
    description: 'Column 和 Row 布局容器',
    difficulty: '入门',
    content: `线性布局是最常用的布局方式，控制子元素在水平或垂直方向上的排列。

## Column (垂直布局)

子元素从上到下垂直排列。
- **alignItems**: 水平方向对齐方式 (HorizontalAlign)。
- **justifyContent**: 垂直方向对齐方式 (FlexAlign)。

## Row (水平布局)

子元素从左到右水平排列。
- **alignItems**: 垂直方向对齐方式 (VerticalAlign)。
- **justifyContent**: 水平方向对齐方式 (FlexAlign)。`,
    exampleCode: `// 垂直居中
Column() {
  Text('Top')
  Text('Bottom')
}
.width('100%')
.height(200)
.justifyContent(FlexAlign.Center)
.alignItems(HorizontalAlign.Center)

// 水平分布
Row() {
  Button('Left')
  Button('Right')
}
.width('100%')
.justifyContent(FlexAlign.SpaceBetween)`,
    summary: [
      'Column 实现垂直排列。',
      'Row 实现水平排列。',
      '使用 justifyContent 控制主轴对齐。',
      '使用 alignItems 控制交叉轴对齐。'
    ]
  },
  {
    id: '5',
    unitId: 'unit2',
    title: '层叠与弹性布局',
    description: 'Stack 和 Flex 布局容器',
    difficulty: '进阶',
    content: `除了线性布局，ArkUI 还提供了层叠布局和弹性布局。

## Stack (层叠布局)

子元素堆叠在一起，后添加的元素显示在上层。常用于背景图上叠加文字、加载遮罩等。
- **alignContent**: 设置所有子元素的对齐方式。

## Flex (弹性布局)

提供了更加灵活的布局能力，类似于 CSS 的 Flexbox。
- **direction**: 主轴方向 (Row/Column)。
- **wrap**: 是否换行。
- **justifyContent**: 主轴对齐。
- **alignItems**: 交叉轴对齐。`,
    exampleCode: `// Stack 示例
Stack({ alignContent: Alignment.Bottom }) {
  Image($r('app.media.bg'))
    .width('100%')
    .height('100%')
  
  Text('Overlay Text')
    .fontColor(Color.White)
    .margin({ bottom: 20 })
}
.width(200)
.height(200)

// Flex 示例
Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.SpaceAround }) {
  Text('1').width('30%').height(50).backgroundColor(0xF5DEB3)
  Text('2').width('30%').height(50).backgroundColor(0xD2B48C)
  Text('3').width('30%').height(50).backgroundColor(0xF5DEB3)
}`,
    summary: [
      'Stack 用于元素重叠显示。',
      'Flex 提供类似 Web 的弹性布局。',
      'Flex 支持自动换行 (wrap)。'
    ]
  },
  // 单元3：状态管理
  {
    id: '6',
    unitId: 'unit3',
    title: '@State 装饰器',
    description: '组件内部状态管理',
    difficulty: '进阶',
    content: `@State 装饰的变量是组件内部的状态数据，当这些数据被修改时，会触发 UI 的更新。

## 特点

- **内部私有**：只能在组件内部访问。
- **UI 驱动**：变化会触发 build() 重新渲染。
- **初始化**：必须本地初始化。
- **支持类型**：基本类型、Object、Array。`,
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
      '状态变化自动触发 UI 刷新。',
      '必须在声明时初始化。'
    ]
  },
  {
    id: '7',
    unitId: 'unit3',
    title: '@Prop 与 @Link',
    description: '父子组件间的数据同步',
    difficulty: '进阶',
    content: `父子组件之间经常需要传递数据。

## @Prop (单向同步)

- 父组件传递给子组件。
- 子组件修改 @Prop 变量，**不会**同步回父组件。
- 父组件修改源数据，**会**同步给子组件。
- 支持深拷贝。

## @Link (双向同步)

- 父子组件双向数据同步。
- 子组件修改 @Link 变量，**会**同步回父组件。
- 必须使用 	\`$	\` 操作符创建引用传递给子组件。`,
    exampleCode: `@Component
struct Parent {
  @State count: number = 1;
  @State toggle: boolean = false;

  build() {
    Column() {
      // 传递引用 $count
      Child({ count: $count, toggle: this.toggle })
    }
  }
}

@Component
struct Child {
  @Link count: number; // 双向
  @Prop toggle: boolean; // 单向

  build() {
    Button(\`Child Count: \${this.count}\`)
      .onClick(() => {
        this.count++; // 父组件也会变
      })
  }
}`,
    summary: [
      '@Prop 是单向同步（父 -> 子）。',
      '@Link 是双向同步。',
      '传值给 @Link 需使用 $ 前缀。'
    ]
  },
  {
    id: '8',
    unitId: 'unit3',
    title: '@Provide 与 @Consume',
    description: '跨组件层级状态共享',
    difficulty: '进阶',
    content: `当组件层级较深时，逐层传递 @Link 比较麻烦。@Provide 和 @Consume 用于跨层级的数据同步。

## 机制

- **@Provide**: 祖先组件提供状态，兼具 @State 的功能。
- **@Consume**: 后代组件消费状态，自动建立双向同步。
- 通过变量名或别名进行匹配。`,
    exampleCode: `@Entry
@Component
struct GrandParent {
  @Provide('themeColor') color: string = 'red';

  build() {
    Column() {
      Parent()
    }
  }
}

@Component
struct Parent {
  build() {
    Child() // 无需传递参数
  }
}

@Component
struct Child {
  @Consume('themeColor') color: string; // 自动获取 GrandParent 的 color

  build() {
    Text('Hello').fontColor(this.color)
      .onClick(() => {
        this.color = 'blue'; // 双向同步，GrandParent 也会变
      })
  }
}`,
    summary: [
      '解决跨层级传值问题。',
      '@Provide 在祖先组件声明。',
      '@Consume 在后代组件使用。',
      '实现双向数据同步。'
    ]
  },
  // 单元4：交互与动画
  {
    id: '9',
    unitId: 'unit4',
    title: '事件处理',
    description: '点击、触摸与手势事件',
    difficulty: '入门',
    content: `ArkUI 提供了丰富的事件监听能力。

## 基础事件

- **onClick**: 点击事件。
- **onTouch**: 触摸事件 (Down, Up, Move, Cancel)。

## 手势事件 (Gesture)

使用 	\`.gesture()\` 方法绑定手势。
- **TapGesture**: 点击手势（支持多次点击）。
- **LongPressGesture**: 长按手势。
- **PanGesture**: 拖动手势。
- **PinchGesture**: 捏合手势。
- **SwipeGesture**: 滑动手势。`,
    exampleCode: `Column() {
  Text('Touch Area')
    .width(200).height(200).backgroundColor(Color.Gray)
    .onClick((event: ClickEvent) => {
      console.info('Clicked at: ' + event.screenX);
    })
    .gesture(
      LongPressGesture({ repeat: true })
        .onAction((event: GestureEvent) => {
          console.info('Long press action');
        })
    )`,
    summary: [
      '.onClick 处理点击。',
      '.onTouch 处理原始触摸。',
      '.gesture 绑定复杂手势。'
    ]
  },
  {
    id: '10',
    unitId: 'unit4',
    title: '属性动画',
    description: '使用 animation 实现平滑过渡',
    difficulty: '进阶',
    content: `属性动画是最简单的动画方式。当组件的属性发生变化时，如果该属性绑定了 	\`.animation()\`, 则会自动产生过渡动画。

## 使用方法

1. 定义 @State 变量控制属性（如宽度、颜色）。
2. 在组件属性上使用该变量。
3. 在该属性后链式调用 	\`.animation()\`, 配置时长、曲线等。
4. 修改 @State 变量，动画自动触发。`,
    exampleCode: `@Component
struct AnimExample {
  @State widthSize: number = 100;

  build() {
    Column() {
      Button('Animate')
        .width(this.widthSize)
        .height(50)
        // 绑定动画配置
        .animation({
          duration: 1000, // 1秒
          curve: Curve.EaseOut, // 缓出曲线
          playMode: PlayMode.Normal
        })
        .onClick(() => {
          // 修改状态，触发动画
          this.widthSize = this.widthSize === 100 ? 200 : 100;
        })
    }
  }
}`,
    summary: [
      '监听属性变化自动产生动画。',
      '使用 .animation() 配置动画参数。',
      '只需修改状态变量即可触发。'
    ]
  },
  {
    id: '11',
    unitId: 'unit4',
    title: '显式动画',
    description: '使用 animateTo 控制状态变化',
    difficulty: '进阶',
    content: `显式动画使用全局函数 	\`animateTo\` 来触发。

它允许你指定哪些状态变化应该产生动画，而不仅仅是依赖属性绑定。

## 语法

	\`\`\`typescript
animateTo(value: AnimateParam, event: () => void): void
	\`\`\`

- **value**: 动画配置（时长、曲线等）。
- **event**: 在这个闭包内修改状态变量。`,
    exampleCode: `@Component
struct ExplicitAnim {
  @State rotateAngle: number = 0;

  build() {
    Image($r('app.media.icon'))
      .width(100).height(100)
      .rotate({ angle: this.rotateAngle })
      .onClick(() => {
        // 显式动画
        animateTo({
          duration: 1000,
          curve: Curve.EaseInOut
        }, () => {
          // 在闭包内修改状态
          this.rotateAngle += 90;
        })
      })
  }
}`,
    summary: [
      '使用 animateTo() 函数。',
      '闭包内修改状态触发动画。',
      '比属性动画更灵活控制范围。'
    ]
  },
  // 单元5：页面路由与导航
  {
    id: '12',
    unitId: 'unit5',
    title: 'Router 页面跳转',
    description: '使用 @ohos.router 进行页面栈管理',
    difficulty: '入门',
    content: `Router 模块提供了基于页面栈的导航能力，适用于应用内不同页面文件（@Entry）之间的跳转。

## 常用方法

- **router.pushUrl()**: 跳转到新页面，压入栈。
- **router.replaceUrl()**: 用新页面替换当前页面，不保留当前页在栈中。
- **router.back()**: 返回上一页。
- **router.getParams()**: 获取传递的参数。

## 配置文件

页面必须在 	\`resources/base/profile/main_pages.json\` 中注册。`,
    exampleCode: `import router from '@ohos.router';

// 跳转并传参
router.pushUrl({
  url: 'pages/SecondPage',
  params: {
    data: 'Hello from Index'
  }
});

// 在目标页面接收参数
const params = router.getParams();
const data = params['data'];

// 返回
router.back();`,
    summary: [
      'pushUrl 跳转，back 返回。',
      'replaceUrl 替换当前页。',
      'params 用于传递参数。',
      '页面需在 main_pages.json 注册。'
    ]
  },
  {
    id: '13',
    unitId: 'unit5',
    title: 'Navigation 组件',
    description: '组件级导航容器',
    difficulty: '进阶',
    content: `Navigation 是 ArkUI 提供的组件级导航容器，支持单栏、分栏（侧边栏）等模式，适合平板和折叠屏适配。

它通常作为页面的根容器，包含标题栏、工具栏和内容区。

## 主要属性

- **title**: 标题。
- **menus**: 顶部菜单。
- **toolBar**: 底部工具栏。
- **mode**: 导航模式 (Stack, Split, Auto)。`,
    exampleCode: `Navigation() {
  Column() {
    Text('Page Content')
  }
}
.title('My App')
.titleMode(NavigationTitleMode.Mini)
.mode(NavigationMode.Auto) // 自动适配分栏
.menus([
  { value: 'Settings', icon: '...', action: () => {} }
])`,
    summary: [
      '组件级导航容器。',
      '自带标题栏和工具栏。',
      '支持 Stack 和 Split 模式。',
      '适合多设备响应式布局。'
    ]
  },
  // 单元6：列表与网格
  {
    id: '14',
    unitId: 'unit6',
    title: 'List 列表',
    description: '高性能列表组件',
    difficulty: '进阶',
    content: `List 组件用于展示大量同类数据。配合 ListItem 和 ForEach（或 LazyForEach）使用。

## 特点

- **懒加载**: 仅渲染屏幕可见区域的项（需配合 LazyForEach）。
- **方向**: 支持垂直和水平列表。
- **分割线**: 支持设置 divider。
- **分组**: 支持 ListItemGroup。

## 性能优化

对于大数据量列表，务必使用 **LazyForEach** 而不是普通的 ForEach，以减少内存占用和渲染时间。`,
    exampleCode: `List() {
  ForEach(this.arr, (item: string) => {
    ListItem() {
      Text(item)
        .width('100%')
        .height(100)
        .fontSize(20)
    }
  }, (item: string) => item) // 键值生成函数
}
.width('100%')
.height('100%')
.divider({ strokeWidth: 1, color: Color.Gray })`,
    summary: [
      'List 包含多个 ListItem。',
      '配合 ForEach 循环渲染。',
      '大数据量推荐 LazyForEach。',
      '支持垂直和水平滚动。'
    ]
  },
  {
    id: '15',
    unitId: 'unit6',
    title: 'Grid 网格',
    description: '二维网格布局',
    difficulty: '进阶',
    content: `Grid 组件用于构建二维网格布局，如相册、九宫格菜单等。

## 布局控制

- **columnsTemplate**: 设置列宽比例，如 	\`'1fr 1fr 1fr'\` 表示三列等宽。
- **rowsTemplate**: 设置行高比例。
- **columnsGap** / **rowsGap**: 设置网格间距。

GridItem 是 Grid 的子组件，代表每个网格项。`,
    exampleCode: `Grid() {
  ForEach(this.numbers, (day: string) => {
    GridItem() {
      Text(day)
        .fontSize(16)
        .backgroundColor(0xF9CF93)
        .width('100%')
        .height('100%')
        .textAlign(TextAlign.Center)
    }
  }, (day: string) => day)
}
.columnsTemplate('1fr 1fr 1fr 1fr') // 4列
.rowsGap(10)
.columnsGap(10)
.height(300)`,
    summary: [
      'Grid 实现二维布局。',
      'columnsTemplate 控制列数。',
      'GridItem 包裹子元素。',
      '支持滚动和固定布局。'
    ]
  },
  // 单元7：网络与数据持久化
  {
    id: '16',
    unitId: 'unit7',
    title: 'HTTP 网络请求',
    description: '使用 @ohos.net.http 发起请求',
    difficulty: '进阶',
    content: `HarmonyOS 提供了 \`@ohos.net.http\` 模块进行网络通信。

## 步骤

1. 导入模块。
2. 创建 httpRequest 对象。
3. 调用 	\`request()\` 方法。
4. 处理响应和错误。
5. 销毁 httpRequest 对象。

**注意**：需要在 module.json5 中申请 	\`ohos.permission.INTERNET\` 权限。`,
    exampleCode: `import http from '@ohos.net.http';

let httpRequest = http.createHttp();
httpRequest.request(
  'https://api.example.com/data',
  {
    method: http.RequestMethod.GET,
    header: { 'Content-Type': 'application/json' }
  },
  (err, data) => {
    if (!err) {
      console.info('Result:' + data.result);
      // 解析 JSON
      let result = JSON.parse(data.result as string);
    } else {
      console.info('error:' + JSON.stringify(err));
    }
    httpRequest.destroy();
  }
);`,
    summary: [
      '需申请 INTERNET 权限。',
      'http.createHttp() 创建请求。',
      'request() 发起异步请求。',
      '用完需 destroy() 释放资源。'
    ]
  },
  {
    id: '17',
    unitId: 'unit7',
    title: 'Preferences 首选项',
    description: '轻量级键值对存储',
    difficulty: '入门',
    content: `Preferences 用于存储应用配置等轻量级数据（Key-Value）。数据会持久化到本地文件。

## 常用操作

- **getPreferences()**: 获取实例。
- **put()**: 保存数据（内存）。
- **get()**: 读取数据。
- **flush()**: 持久化到文件（必须调用）。
- **delete()**: 删除数据。`,
    exampleCode: `import dataPreferences from '@ohos.data.preferences';

// 获取实例
let context = getContext(this);
let promise = dataPreferences.getPreferences(context, 'myStore');

promise.then((prefs) => {
  // 写入
  prefs.put('fontSize', 18);
  // 持久化
  prefs.flush();
  
  // 读取
  prefs.get('fontSize', 14).then((value) => {
    console.info('FontSize: ' + value);
  });
});`,
    summary: [
      '适合存储简单配置。',
      'put() 后必须 flush() 才能持久化。',
      '异步操作，返回 Promise。'
    ]
  },
  // 单元8：并发与线程
  {
    id: '18',
    unitId: 'unit8',
    title: 'TaskPool 并发',
    description: '使用 TaskPool 运行后台任务',
    difficulty: '高阶',
    content: `TaskPool 是鸿蒙推荐的轻量级多线程并发机制。它自动管理线程生命周期，比 Worker 更易用。

## 适用场景

- 耗时的计算任务（如图片处理、大数据分析）。
- 需要立即执行的并发任务。

## 使用

1. 定义一个 	\`@Concurrent\` 装饰的函数。
2. 使用 	\`taskpool.execute()\` 执行该函数。`,
    exampleCode: `import taskpool from '@ohos.taskpool';

@Concurrent
function compute(args: number): number {
  // 耗时计算
  return args * 2;
}

@Entry
@Component
struct TaskExample {
  build() {
    Button('Run Task')
      .onClick(async () => {
        let task = new taskpool.Task(compute, 100);
        let result = await taskpool.execute(task);
        console.info('Result: ' + result);
      })
  }
}`,
    summary: [
      'TaskPool 自动管理线程。',
      '并发函数需 @Concurrent 装饰。',
      'taskpool.execute() 执行任务。',
      '适合独立耗时任务。'
    ]
  },
  // 单元9：应用模型
  {
    id: '19',
    unitId: 'unit9',
    title: 'Stage 模型',
    description: '深入理解 Stage 模型与 UIAbility',
    difficulty: '进阶',
    content: `Stage 模型是 HarmonyOS 3.1+ 推出的新一代应用开发模型。

## 核心概念

- **UIAbility**: 包含 UI 的应用组件，负责与用户交互。
- **WindowStage**: 窗口管理器，管理 UIAbility 的窗口生命周期。
- **Context**: 上下文环境，提供访问资源、启动 Ability 等能力。

## 生命周期

onCreate -> onWindowStageCreate -> onForeground <-> onBackground -> onWindowStageDestroy -> onDestroy`,
    exampleCode: `import UIAbility from '@ohos.app.ability.UIAbility';
import window from '@ohos.window';

export default class EntryAbility extends UIAbility {
  onCreate(want, launchParam) {
    // 应用初始化
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // 加载页面
    windowStage.loadContent('pages/Index');
  }

  onForeground() {
    // 切到前台
  }

  onBackground() {
    // 切到后台
  }
}`,
    summary: [
      'UIAbility 是应用的核心组件。',
      'WindowStage 管理窗口显示。',
      'Context 提供系统能力访问。',
      '生命周期管理应用状态。'
    ]
  },
  {
    id: '20',
    unitId: 'unit9',
    title: 'ExtensionAbility',
    description: '后台服务与卡片开发',
    difficulty: '高阶',
    content: `ExtensionAbility 是基于 Stage 模型的扩展能力，用于特定场景。

## 常见类型

- **ServiceExtensionAbility**: 后台服务，无 UI。
- **FormExtensionAbility**: 服务卡片，显示在桌面上。
- **WorkSchedulerExtensionAbility**: 延迟任务调度。

注意：ServiceExtensionAbility 仅限系统应用，三方应用推荐使用 TaskPool 或 BackgroundTask。`,
    exampleCode: `// 这是一个概念示例，具体实现需继承特定 Extension 类
// 并在 module.json5 中配置 type

/*
module.json5:
{
  "extensionAbilities": [
    {
      "name": "MyService",
      "type": "service",
      "srcEntry": "./ets/service/MyService.ts"
    }
  ]
}
*/`,
    summary: [
      'ExtensionAbility 用于特定场景。',
      'FormExtension 用于开发卡片。',
      '三方应用后台能力受限，需合规。'
    ]
  },
  // 单元10：实战项目
  {
    id: '21',
    unitId: 'unit10',
    title: '待办事项应用',
    description: '从零构建一个 ToDo List 应用',
    difficulty: '进阶',
    content: `本章将综合运用所学知识，开发一个待办事项（ToDo List）应用。

## 功能需求

1.  **列表展示**: 使用 List 组件展示待办事项。
2.  **添加任务**: 使用 TextInput 和 Button 添加新任务。
3.  **状态管理**: 使用 @State 和 @Link 管理任务状态（完成/未完成）。
4.  **数据持久化**: 使用 Preferences 保存任务数据。

## 代码结构

- **model/Task.ts**: 任务数据模型。
- **view/TaskItem.ets**: 单个任务组件。
- **pages/ToDoPage.ets**: 主页面。`,
    exampleCode: `// view/TaskItem.ets
@Component
struct TaskItem {
  @ObjectLink task: Task;
  
  build() {
    Row() {
      Checkbox({ name: 'checkbox', group: 'checkboxGroup' })
        .select(this.task.isFinished)
        .onChange((value: boolean) => {
          this.task.isFinished = value;
        })
      Text(this.task.name)
        .decoration({ type: this.task.isFinished ? TextDecorationType.LineThrough : TextDecorationType.None })
    }
  }
}`,
    summary: [
      '综合运用 List, State, Preferences。',
      '组件化开发思想。',
      '数据持久化保证体验。'
    ]
  },
  {
    id: '22',
    unitId: 'unit10',
    title: '网络新闻客户端',
    description: '开发一个简单的 API 数据展示应用',
    difficulty: '高阶',
    content: `开发一个从网络 API 获取新闻列表并展示的应用。

## 关键技术

1.  **网络请求**: 使用 http 模块获取 JSON 数据。
2.  **异步处理**: 使用 async/await 处理网络响应。
3.  **JSON 解析**: 将 JSON 字符串转换为 ArkTS 对象。
4.  **列表渲染**: 使用 LazyForEach 渲染大量新闻数据。
5.  **页面跳转**: 点击新闻跳转到详情页 (Web 组件)。`,
    exampleCode: `// 获取数据示例
async function getNews() {
  let httpReq = http.createHttp();
  let response = await httpReq.request('https://api.example.com/news');
  if (response.responseCode === 200) {
    return JSON.parse(response.result as string);
  }
  return [];
}`,
    summary: [
      '真实网络请求实战。',
      '异步编程与 JSON 处理。',
      'LazyForEach 性能优化。',
      'Web 组件加载详情。'
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
      },
      {
        id: 'q1_3',
        type: QuestionType.SINGLE_CHOICE,
        question: '哪个装饰器用于标记页面的入口组件？',
        options: ['@Component', '@Entry', '@Builder', '@Preview'],
        correctIndices: [1],
        explanation: '@Entry 标记页面的入口组件。'
      },
      {
        id: 'q1_4',
        type: QuestionType.SINGLE_CHOICE,
        question: 'ArkTS 中声明常量的关键字是？',
        options: ['var', 'let', 'const', 'final'],
        correctIndices: [2],
        explanation: 'ArkTS 使用 const 声明常量。'
      },
      {
        id: 'q1_5',
        type: QuestionType.SINGLE_CHOICE,
        question: 'ArkTS 支持 any 类型吗？',
        options: ['完全支持', '部分支持，有限制', '完全不支持', '仅在某些场景支持'],
        correctIndices: [1],
        explanation: 'ArkTS 为了性能优化，限制了 any 类型的使用，仅在特定场景下允许。'
      },
      {
        id: 'q1_6',
        type: QuestionType.TRUE_FALSE,
        question: 'ArkTS 支持运行时动态修改对象结构吗？',
        options: ['支持', '不支持'],
        correctIndices: [1],
        explanation: 'ArkTS 为了静态类型优化，不支持运行时动态修改对象结构。'
      },
      {
        id: 'q1_7',
        type: QuestionType.SINGLE_CHOICE,
        question: 'ArkTS 的编译方式是？',
        options: ['解释执行', 'JIT 编译', 'AOT 编译', '混合编译'],
        correctIndices: [2],
        explanation: 'ArkTS 通过方舟编译器进行 AOT（Ahead-Of-Time）编译，提前编译为机器码，提升性能。'
      },
      {
        id: 'q1_8',
        type: QuestionType.MULTIPLE_CHOICE,
        question: 'ArkTS 的核心特性包括哪些？',
        options: ['声明式 UI', '状态管理', '高性能编译', '动态类型系统'],
        correctIndices: [0, 1, 2],
        explanation: 'ArkTS 的核心特性包括声明式 UI、状态管理和高性能 AOT 编译，但不支持完全动态的类型系统。'
      },
      {
        id: 'q1_9',
        type: QuestionType.SINGLE_CHOICE,
        question: 'ArkTS 的函数必须声明什么？',
        options: ['参数类型', '返回值类型', '参数和返回值类型', '不需要声明类型'],
        correctIndices: [2],
        explanation: 'ArkTS 的函数必须声明参数类型和返回值类型，强调静态类型安全。'
      },
      {
        id: 'q1_10',
        type: QuestionType.TRUE_FALSE,
        question: 'ArkTS 支持箭头函数吗？',
        options: ['支持', '不支持'],
        correctIndices: [0],
        explanation: 'ArkTS 支持箭头函数，语法与 TypeScript 相同。'
      },
      {
        id: 'q1_11',
        type: QuestionType.SINGLE_CHOICE,
        question: '方舟编译器对 ArkTS 进行了什么优化？',
        options: ['仅语法检查', '深度优化，支持 AOT 编译', '仅运行时优化', '仅代码压缩'],
        correctIndices: [1],
        explanation: '方舟编译器对 ArkTS 进行了深度优化，支持 AOT（Ahead-Of-Time）编译，提前编译为机器码。'
      },
      {
        id: 'q1_12',
        type: QuestionType.MULTIPLE_CHOICE,
        question: 'ArkTS 限制了 TypeScript 的哪些特性？',
        options: ['any 类型', '运行时动态修改对象', '部分动态特性', '所有特性'],
        correctIndices: [0, 1, 2],
        explanation: 'ArkTS 限制了 any 类型的使用、运行时动态修改对象结构等动态特性，以支持静态类型优化。'
      },
      {
        id: 'q1_13',
        type: QuestionType.SINGLE_CHOICE,
        question: 'ArkTS 的 build() 函数中只能包含几个根节点？',
        options: ['0个', '1个', '多个', '没有限制'],
        correctIndices: [1],
        explanation: 'build() 函数中只能包含一个根节点（除 Text、Image 等基础组件外，容器组件通常作为根节点）。'
      },
      {
        id: 'q1_14',
        type: QuestionType.TRUE_FALSE,
        question: 'ArkTS 是 HarmonyOS 的唯一开发语言吗？',
        options: ['是', '否'],
        correctIndices: [1],
        explanation: 'ArkTS 是 HarmonyOS 优选的主力开发语言，但不是唯一的，还支持 Java、C++ 等。'
      },
      {
        id: 'q1_15',
        type: QuestionType.SINGLE_CHOICE,
        question: 'ArkTS 匹配哪个框架？',
        options: ['React', 'Vue', 'ArkUI', 'Flutter'],
        correctIndices: [2],
        explanation: 'ArkTS 匹配 ArkUI 框架，扩展了声明式 UI、状态管理等相应的能力。'
      },
      {
        id: 'q1_16',
        type: QuestionType.MULTIPLE_CHOICE,
        question: 'ArkTS 支持哪些基本类型？',
        options: ['string', 'number', 'boolean', 'any'],
        correctIndices: [0, 1, 2],
        explanation: 'ArkTS 支持 string、number、boolean 等基本类型，但限制了 any 类型的使用。'
      }
    ]
  },
  {
    id: 'q2',
    title: 'UI 与布局测验',
    questions: [
      {
        id: 'q2_1',
        type: QuestionType.SINGLE_CHOICE,
        question: '想要子元素垂直排列，应该使用哪个容器？',
        options: ['Row', 'Column', 'Stack', 'Flex'],
        correctIndices: [1],
        explanation: 'Column 容器使子元素垂直排列。'
      },
      {
        id: 'q2_2',
        type: QuestionType.SINGLE_CHOICE,
        question: 'Stack 容器中，后添加的元素会显示在哪里？',
        options: ['最底层', '最上层', '左侧', '右侧'],
        correctIndices: [1],
        explanation: 'Stack 是堆叠布局，后添加的元素覆盖在先添加的元素之上。'
      },
      {
        id: 'q2_3',
        type: QuestionType.SINGLE_CHOICE,
        question: 'vp 单位的含义是？',
        options: ['物理像素', '字体像素', '虚拟像素', '百分比'],
        correctIndices: [2],
        explanation: 'vp (virtual pixel) 是虚拟像素，与屏幕密度无关。'
      },
      {
        id: 'q2_4',
        type: QuestionType.SINGLE_CHOICE,
        question: 'fp 单位主要用于什么？',
        options: ['设置组件尺寸', '设置字体大小', '设置间距', '设置颜色'],
        correctIndices: [1],
        explanation: 'fp (font pixel) 用于设置字体大小，会随系统字体设置缩放。'
      },
      {
        id: 'q2_5',
        type: QuestionType.TRUE_FALSE,
        question: 'Text 组件可以显示多行文本吗？',
        options: ['可以', '不可以'],
        correctIndices: [0],
        explanation: 'Text 组件支持多行文本，可以通过 .maxLines() 限制行数，或使用 .textOverflow() 处理溢出。'
      },
      {
        id: 'q2_6',
        type: QuestionType.SINGLE_CHOICE,
        question: 'Image 组件支持哪些图片源？',
        options: ['仅本地资源', '仅网络图片', '本地资源和网络图片', '仅 Base64'],
        correctIndices: [2],
        explanation: 'Image 组件支持加载本地资源（$r）和网络图片（url），还支持 Base64 等格式。'
      },
      {
        id: 'q2_7',
        type: QuestionType.MULTIPLE_CHOICE,
        question: 'Row 容器可以控制哪些对齐方式？',
        options: ['水平对齐（justifyContent）', '垂直对齐（alignItems）', '交叉轴对齐', '主轴对齐'],
        correctIndices: [0, 1],
        explanation: 'Row 容器通过 justifyContent 控制水平（主轴）对齐，通过 alignItems 控制垂直（交叉轴）对齐。'
      },
      {
        id: 'q2_8',
        type: QuestionType.SINGLE_CHOICE,
        question: 'TextInput 组件支持哪些输入类型？',
        options: ['仅文本', '文本和密码', '文本、密码和数字', '所有类型'],
        correctIndices: [2],
        explanation: 'TextInput 支持文本、密码（.type(InputType.Password)）和数字（.type(InputType.Number)）等输入类型。'
      },
      {
        id: 'q2_9',
        type: QuestionType.TRUE_FALSE,
        question: 'Button 组件可以响应点击事件吗？',
        options: ['可以', '不可以'],
        correctIndices: [0],
        explanation: 'Button 组件可以通过 .onClick() 方法响应点击事件。'
      },
      {
        id: 'q2_10',
        type: QuestionType.SINGLE_CHOICE,
        question: 'Toggle 组件支持哪些样式？',
        options: ['仅 Switch', '仅 Checkbox', 'Switch、Checkbox 和 Button', '仅 Button'],
        correctIndices: [2],
        explanation: 'Toggle 组件支持 Switch、Checkbox 和 Button 三种样式，通过 .type() 设置。'
      },
      {
        id: 'q2_11',
        type: QuestionType.MULTIPLE_CHOICE,
        question: '以下哪些是 Column 容器支持的属性？',
        options: ['justifyContent', 'alignItems', 'space', 'direction'],
        correctIndices: [0, 1, 2],
        explanation: 'Column 容器支持 justifyContent（垂直对齐）、alignItems（水平对齐）和 space（子元素间距）。'
      },
      {
        id: 'q2_12',
        type: QuestionType.SINGLE_CHOICE,
        question: 'Progress 组件支持哪些样式？',
        options: ['仅线性', '仅环形', '线性和环形', '仅圆形'],
        correctIndices: [2],
        explanation: 'Progress 组件支持线性（Linear）和环形（Ring）两种样式。'
      },
      {
        id: 'q2_13',
        type: QuestionType.TRUE_FALSE,
        question: 'Slider 组件可以用于音量调节吗？',
        options: ['可以', '不可以'],
        correctIndices: [0],
        explanation: 'Slider 组件常用于音量、亮度等数值的滑动选择。'
      },
      {
        id: 'q2_14',
        type: QuestionType.SINGLE_CHOICE,
        question: 'Divider 组件的作用是？',
        options: ['分割内容', '显示进度', '输入文本', '显示图片'],
        correctIndices: [0],
        explanation: 'Divider 组件用于分割内容，在列表或布局中创建视觉分隔线。'
      },
      {
        id: 'q2_15',
        type: QuestionType.MULTIPLE_CHOICE,
        question: 'Stack 容器的特点包括？',
        options: ['子元素堆叠', '后添加的元素在上层', '支持对齐方式', '支持换行'],
        correctIndices: [0, 1, 2],
        explanation: 'Stack 容器子元素堆叠，后添加的元素显示在上层，支持通过 alignContent 设置对齐方式，但不支持换行。'
      }
    ]
  },
  {
    id: 'q3',
    title: '状态管理测验',
    questions: [
      {
        id: 'q3_1',
        type: QuestionType.SINGLE_CHOICE,
        question: '父组件传递数据给子组件，且子组件不需要回传，使用哪个装饰器？',
        options: ['@State', '@Link', '@Prop', '@Provide'],
        correctIndices: [2],
        explanation: '@Prop 实现父到子的单向同步。'
      },
      {
        id: 'q3_2',
        type: QuestionType.SINGLE_CHOICE,
        question: '跨多层级组件共享数据，应该使用哪对装饰器？',
        options: ['@State/@Link', '@Prop/@Link', '@Provide/@Consume', '@ObjectLink/@Observed'],
        correctIndices: [2],
        explanation: '@Provide 和 @Consume 用于跨层级数据共享。'
      },
      {
        id: 'q3_3',
        type: QuestionType.TRUE_FALSE,
        question: '@Link 需要使用 $ 前缀传递引用吗？',
        options: ['需要', '不需要'],
        correctIndices: [0],
        explanation: '初始化 @Link 变量时，父组件需使用 $ 操作符传递引用。'
      },
      {
        id: 'q3_4',
        type: QuestionType.SINGLE_CHOICE,
        question: '@State 变量必须在什么时候初始化？',
        options: ['可以在任何时候初始化', '必须在声明时初始化', '可以在 aboutToAppear 中初始化', '不需要初始化'],
        correctIndices: [1],
        explanation: '@State 变量必须在声明时初始化，不能延迟初始化。'
      },
      {
        id: 'q3_5',
        type: QuestionType.SINGLE_CHOICE,
        question: '@ObjectLink 需要配合哪个装饰器使用？',
        options: ['@State', '@Observed', '@Link', '@Prop'],
        correctIndices: [1],
        explanation: '@ObjectLink 用于观察 @Observed 装饰的类的实例，当实例属性变化时触发 UI 更新。'
      },
      {
        id: 'q3_6',
        type: QuestionType.TRUE_FALSE,
        question: 'AppStorage 是应用全局的状态存储吗？',
        options: ['是', '否'],
        correctIndices: [0],
        explanation: 'AppStorage 是应用全局的状态存储，在整个应用运行期间存在，所有页面都能访问。'
      },
      {
        id: 'q3_7',
        type: QuestionType.MULTIPLE_CHOICE,
        question: '以下哪些装饰器支持双向数据同步？',
        options: ['@State', '@Link', '@Provide', '@Consume'],
        correctIndices: [1, 2, 3],
        explanation: '@Link 实现父子双向同步，@Provide 和 @Consume 实现跨层级双向同步。'
      },
      {
        id: 'q3_8',
        type: QuestionType.SINGLE_CHOICE,
        question: '@Watch 装饰器用于什么？',
        options: ['监听状态变化', '管理状态', '传递状态', '初始化状态'],
        correctIndices: [0],
        explanation: '@Watch 用于监听状态变量的变化，当变量改变时执行回调函数。'
      },
      {
        id: 'q3_9',
        type: QuestionType.TRUE_FALSE,
        question: '@Prop 变量在子组件中修改会同步回父组件吗？',
        options: ['会', '不会'],
        correctIndices: [1],
        explanation: '@Prop 是单向同步，子组件修改 @Prop 变量不会同步回父组件。'
      },
      {
        id: 'q3_10',
        type: QuestionType.SINGLE_CHOICE,
        question: 'LocalStorage 的作用范围是？',
        options: ['应用全局', '页面级或 UIAbility 级', '组件级', '模块级'],
        correctIndices: [1],
        explanation: 'LocalStorage 是页面级或 UIAbility 级的状态存储，数据在特定实例内共享。'
      },
      {
        id: 'q3_11',
        type: QuestionType.MULTIPLE_CHOICE,
        question: '@State 支持哪些数据类型？',
        options: ['基本类型', 'Object', 'Array', '函数'],
        correctIndices: [0, 1, 2],
        explanation: '@State 支持基本类型、Object 和 Array，但不支持函数类型。'
      },
      {
        id: 'q3_12',
        type: QuestionType.SINGLE_CHOICE,
        question: 'PersistentStorage 的作用是？',
        options: ['内存存储', '持久化 AppStorage 数据', '临时存储', '网络存储'],
        correctIndices: [1],
        explanation: 'PersistentStorage 用于将 AppStorage 中的数据持久化到本地文件，应用重启后数据依然存在。'
      },
      {
        id: 'q3_13',
        type: QuestionType.TRUE_FALSE,
        question: '@Consume 必须配合 @Provide 使用吗？',
        options: ['是', '否'],
        correctIndices: [0],
        explanation: '@Consume 必须配合 @Provide 使用，通过变量名或别名进行匹配，实现跨层级数据同步。'
      },
      {
        id: 'q3_14',
        type: QuestionType.SINGLE_CHOICE,
        question: '@ObjectLink 用于观察什么？',
        options: ['基本类型', '@Observed 装饰的类实例', '函数', '常量'],
        correctIndices: [1],
        explanation: '@ObjectLink 用于观察 @Observed 装饰的类的实例，当实例的属性变化时触发 UI 更新。'
      },
      {
        id: 'q3_15',
        type: QuestionType.MULTIPLE_CHOICE,
        question: '以下哪些是状态管理的方式？',
        options: ['@State', 'AppStorage', 'LocalStorage', '全局变量'],
        correctIndices: [0, 1, 2],
        explanation: '@State、AppStorage 和 LocalStorage 都是状态管理方式，全局变量不是推荐的状态管理方式。'
      }
    ]
  }
,
{
    id: 'q4',
    title: 'ArkUI 高级特性测验',
    questions: [
      {
        id: 'q4_1',
        type: QuestionType.SINGLE_CHOICE,
        question: '如何实现自定义组件的生命周期回调？',
        options: ['Implementing Lifecycle', 'aboutToAppear/aboutToDisappear', 'onCreate/onDestroy', 'onShow/onHide'],
        correctIndices: [1],
        explanation: '自定义组件的生命周期回调函数是 aboutToAppear 和 aboutToDisappear。'
      },
      {
        id: 'q4_2',
        type: QuestionType.TRUE_FALSE,
        question: '@Builder 装饰的函数可以包含状态管理逻辑吗？',
        options: ['可以', '不可以'],
        correctIndices: [1],
        explanation: '@Builder 装饰的函数主要用于 UI 构建复用，内部不应包含复杂的状态管理逻辑，状态应由组件管理。'
      },
      {
        id: 'q4_3',
        type: QuestionType.SINGLE_CHOICE,
        question: '哪种动画方式适合简单的属性渐变？',
        options: ['转场动画', '属性动画 (.animation)', '粒子动画', '帧动画'],
        correctIndices: [1],
        explanation: '属性动画 (.animation) 是实现组件属性（如尺寸、颜色、位置）平滑渐变的最简单方式。'
      },
      {
        id: 'q4_4',
        type: QuestionType.SINGLE_CHOICE,
        question: '@Builder 装饰的函数主要用于什么？',
        options: ['状态管理', 'UI 构建复用', '数据计算', '网络请求'],
        correctIndices: [1],
        explanation: '@Builder 装饰的函数主要用于 UI 构建复用，实现局部 UI 的封装和复用。'
      },
      {
        id: 'q4_5',
        type: QuestionType.TRUE_FALSE,
        question: '自定义组件可以有多个 @Entry 装饰器吗？',
        options: ['可以', '不可以'],
        correctIndices: [1],
        explanation: '一个页面只能有一个 @Entry 装饰的组件，它是页面的入口点。'
      },
      {
        id: 'q4_6',
        type: QuestionType.SINGLE_CHOICE,
        question: '@Reusable 装饰器的作用是？',
        options: ['标记组件为可复用', '标记组件为单例', '标记组件为静态', '标记组件为异步'],
        correctIndices: [0],
        explanation: '@Reusable 用于标记自定义组件为可复用组件，配合 LazyForEach 可以缓存组件节点，提升性能。'
      },
      {
        id: 'q4_7',
        type: QuestionType.MULTIPLE_CHOICE,
        question: '以下哪些是组件生命周期函数？',
        options: ['aboutToAppear', 'onCreate', 'aboutToDisappear', 'onDestroy'],
        correctIndices: [0, 2],
        explanation: '自定义组件的生命周期函数是 aboutToAppear 和 aboutToDisappear，onCreate 和 onDestroy 是 Ability 的生命周期。'
      },
      {
        id: 'q4_8',
        type: QuestionType.SINGLE_CHOICE,
        question: '@BuilderParam 的作用是？',
        options: ['接收外部传入的 UI 结构', '管理状态', '处理事件', '存储数据'],
        correctIndices: [0],
        explanation: '@BuilderParam 用于在自定义组件中接收外部传入的 @Builder 函数，实现类似 Slot 的功能。'
      },
      {
        id: 'q4_9',
        type: QuestionType.TRUE_FALSE,
        question: '@Styles 可以定义可重用的样式函数吗？',
        options: ['可以', '不可以'],
        correctIndices: [0],
        explanation: '@Styles 用于定义可重用的样式函数，可以在多个组件中复用相同的样式设置。'
      },
      {
        id: 'q4_10',
        type: QuestionType.SINGLE_CHOICE,
        question: '@Extend 用于什么？',
        options: ['扩展原生组件样式', '扩展自定义组件', '扩展函数', '扩展类'],
        correctIndices: [0],
        explanation: '@Extend 用于扩展原生组件的样式，为原生组件添加自定义样式方法。'
      },
      {
        id: 'q4_11',
        type: QuestionType.MULTIPLE_CHOICE,
        question: '以下哪些是页面生命周期函数？',
        options: ['onPageShow', 'onPageHide', 'onBackPress', 'aboutToAppear'],
        correctIndices: [0, 1, 2],
        explanation: 'onPageShow、onPageHide 和 onBackPress 是页面生命周期函数，aboutToAppear 是组件生命周期函数。'
      },
      {
        id: 'q4_12',
        type: QuestionType.SINGLE_CHOICE,
        question: '@Preview 装饰器的作用是？',
        options: ['预览组件', '运行组件', '编译组件', '打包组件'],
        correctIndices: [0],
        explanation: '@Preview 用于在 DevEco Studio 的预览器中预览组件，方便开发时快速查看 UI 效果。'
      },
      {
        id: 'q4_13',
        type: QuestionType.TRUE_FALSE,
        question: '自定义组件可以有多个 @Component 装饰器吗？',
        options: ['可以', '不可以'],
        correctIndices: [1],
        explanation: '一个组件只能有一个 @Component 装饰器，它是组件的唯一标识。'
      },
      {
        id: 'q4_14',
        type: QuestionType.SINGLE_CHOICE,
        question: '@Reusable 配合什么使用可以提升性能？',
        options: ['ForEach', 'LazyForEach', '普通循环', '条件渲染'],
        correctIndices: [1],
        explanation: '@Reusable 配合 LazyForEach 使用，可以缓存离屏组件节点，提升列表滚动性能。'
      },
      {
        id: 'q4_15',
        type: QuestionType.MULTIPLE_CHOICE,
        question: '以下哪些是装饰器？',
        options: ['@State', '@Builder', '@Watch', '@Concurrent'],
        correctIndices: [0, 1, 2, 3],
        explanation: '@State、@Builder、@Watch 和 @Concurrent 都是 ArkTS 的装饰器。'
      }
    ]
  },
  {
    id: 'q5',
    title: '网络与数据测验',
    questions: [
      {
        id: 'q5_1',
        type: QuestionType.SINGLE_CHOICE,
        question: 'HTTP 请求需要在 module.json5 中申请什么权限？',
        options: ['ohos.permission.READ_MEDIA', 'ohos.permission.INTERNET', 'ohos.permission.LOCATION', 'ohos.permission.CAMERA'],
        correctIndices: [1],
        explanation: '发起网络请求必须申请 ohos.permission.INTERNET 权限。'
      },
      {
        id: 'q5_2',
        type: QuestionType.SINGLE_CHOICE,
        question: 'Preferences 适合存储什么类型的数据？',
        options: ['大量图片', '复杂的关系型数据', '轻量级配置项 (Key-Value)', '视频文件'],
        correctIndices: [2],
        explanation: 'Preferences 设计用于存储轻量级的键值对数据，如应用配置、用户偏好设置。'
      },
      {
        id: 'q5_3',
        type: QuestionType.SINGLE_CHOICE,
        question: 'HTTP 请求的默认方法是？',
        options: ['GET', 'POST', 'PUT', 'DELETE'],
        correctIndices: [0],
        explanation: 'HTTP 请求如果不指定 method，默认使用 GET 方法。'
      },
      {
        id: 'q5_4',
        type: QuestionType.TRUE_FALSE,
        question: 'HTTP 请求是同步的还是异步的？',
        options: ['同步', '异步'],
        correctIndices: [1],
        explanation: 'HTTP 请求是异步的，通过回调函数处理响应，不会阻塞 UI 线程。'
      },
      {
        id: 'q5_5',
        type: QuestionType.SINGLE_CHOICE,
        question: 'RelationalStore 主要用于存储什么类型的数据？',
        options: ['简单配置', '复杂的关系型数据', '图片文件', '视频文件'],
        correctIndices: [1],
        explanation: 'RelationalStore 基于 SQLite，适合存储复杂的关系型结构化数据。'
      },
      {
        id: 'q5_6',
        type: QuestionType.SINGLE_CHOICE,
        question: 'HTTP POST 请求用于什么？',
        options: ['获取数据', '提交数据', '删除数据', '更新数据'],
        correctIndices: [1],
        explanation: 'HTTP POST 请求用于向服务器提交数据，如创建新资源。'
      },
      {
        id: 'q5_7',
        type: QuestionType.TRUE_FALSE,
        question: 'HTTP 请求需要申请权限才能使用吗？',
        options: ['需要', '不需要'],
        correctIndices: [0],
        explanation: 'HTTP 请求需要在 module.json5 中申请 ohos.permission.INTERNET 权限。'
      },
      {
        id: 'q5_8',
        type: QuestionType.SINGLE_CHOICE,
        question: 'Preferences 的数据类型支持哪些？',
        options: ['仅字符串', '字符串和数字', '字符串、数字和布尔', '所有类型'],
        correctIndices: [2],
        explanation: 'Preferences 支持字符串、数字和布尔等基本类型的键值对存储。'
      },
      {
        id: 'q5_9',
        type: QuestionType.MULTIPLE_CHOICE,
        question: 'HTTP 请求可以设置哪些内容？',
        options: ['请求方法', '请求头', '请求体', '超时时间'],
        correctIndices: [0, 1, 2, 3],
        explanation: 'HTTP 请求可以设置 method（请求方法）、header（请求头）、extraData（请求体）和 connectTimeout（超时时间）等。'
      },
      {
        id: 'q5_10',
        type: QuestionType.SINGLE_CHOICE,
        question: '文件存储的路径通常在哪里？',
        options: ['应用安装目录', '应用沙箱目录', '系统目录', '外部存储'],
        correctIndices: [1],
        explanation: '文件存储通常在应用沙箱目录中，保证数据安全和应用隔离。'
      },
      {
        id: 'q5_11',
        type: QuestionType.TRUE_FALSE,
        question: 'Preferences 支持嵌套对象存储吗？',
        options: ['支持', '不支持'],
        correctIndices: [1],
        explanation: 'Preferences 只支持简单的键值对存储，不支持嵌套对象，复杂数据需要序列化为字符串。'
      },
      {
        id: 'q5_12',
        type: QuestionType.SINGLE_CHOICE,
        question: 'HTTP 请求的错误处理应该在哪里？',
        options: ['仅在成功回调', '仅在错误回调', '成功和错误回调都要处理', '不需要处理'],
        correctIndices: [2],
        explanation: 'HTTP 请求应该在成功和错误回调中都进行适当的处理，确保应用的健壮性。'
      },
      {
        id: 'q5_13',
        type: QuestionType.MULTIPLE_CHOICE,
        question: '以下哪些是数据持久化的方式？',
        options: ['Preferences', 'RelationalStore', 'File', '内存变量'],
        correctIndices: [0, 1, 2],
        explanation: 'Preferences、RelationalStore 和 File 都是数据持久化方式，内存变量不是持久化的。'
      }
    ]
  },
  {
    id: 'q6',
    title: '并发编程测验',
    questions: [
      {
        id: 'q6_1',
        type: QuestionType.SINGLE_CHOICE,
        question: 'TaskPool 和 Worker 的主要区别是什么？',
        options: ['TaskPool 是单线程', 'Worker 自动管理生命周期', 'TaskPool 适合短时任务，自动扩缩容', 'Worker 无法进行通信'],
        correctIndices: [2],
        explanation: 'TaskPool 适合独立、耗时较短的任务，系统自动管理线程生命周期和负载；Worker 适合长时间运行的后台任务，需手动管理。'
      },
      {
        id: 'q6_2',
        type: QuestionType.TRUE_FALSE,
        question: '在 TaskPool 中执行的函数必须使用 @Concurrent 装饰吗？',
        options: ['是', '否'],
        correctIndices: [0],
        explanation: '是的，传递给 TaskPool 执行的函数必须标记为 @Concurrent，且必须是顶层函数或静态方法。'
      },
      {
        id: 'q6_3',
        type: QuestionType.SINGLE_CHOICE,
        question: 'Worker 适合什么场景？',
        options: ['短时计算任务', '长时间运行的后台任务', 'UI 更新', '网络请求'],
        correctIndices: [1],
        explanation: 'Worker 适合长时间运行的后台任务，需要手动管理生命周期。'
      },
      {
        id: 'q6_4',
        type: QuestionType.TRUE_FALSE,
        question: 'TaskPool 可以自动管理线程生命周期吗？',
        options: ['可以', '不可以'],
        correctIndices: [0],
        explanation: 'TaskPool 可以自动管理线程生命周期和负载，比 Worker 更轻量。'
      },
      {
        id: 'q6_5',
        type: QuestionType.SINGLE_CHOICE,
        question: '@Concurrent 装饰的函数可以访问外部变量吗？',
        options: ['可以', '不可以', '仅可以访问常量', '仅可以访问全局变量'],
        correctIndices: [1],
        explanation: '@Concurrent 装饰的函数不能访问外部变量，只能使用参数传入的数据。'
      },
      {
        id: 'q6_6',
        type: QuestionType.SINGLE_CHOICE,
        question: 'Worker 和 TaskPool 哪个更轻量？',
        options: ['Worker', 'TaskPool', '一样', '都不轻量'],
        correctIndices: [1],
        explanation: 'TaskPool 更轻量，自动管理线程生命周期，适合短时任务；Worker 需要手动管理，适合长时间任务。'
      },
      {
        id: 'q6_7',
        type: QuestionType.TRUE_FALSE,
        question: '@Concurrent 装饰的函数必须是顶层函数或静态方法吗？',
        options: ['是', '否'],
        correctIndices: [0],
        explanation: '是的，@Concurrent 装饰的函数必须是顶层函数或静态方法，不能是实例方法。'
      },
      {
        id: 'q6_8',
        type: QuestionType.SINGLE_CHOICE,
        question: 'TaskPool 适合什么场景？',
        options: ['长时间运行的任务', '短时计算任务', 'UI 更新', '网络请求'],
        correctIndices: [1],
        explanation: 'TaskPool 适合短时计算任务，系统自动管理线程生命周期和负载。'
      },
      {
        id: 'q6_9',
        type: QuestionType.MULTIPLE_CHOICE,
        question: '@Concurrent 函数的限制包括？',
        options: ['不能访问外部变量', '参数必须可序列化', '不能调用 UI API', '不能返回值'],
        correctIndices: [0, 1, 2],
        explanation: '@Concurrent 函数不能访问外部变量、参数必须可序列化、不能调用 UI API，但可以返回值。'
      },
      {
        id: 'q6_10',
        type: QuestionType.SINGLE_CHOICE,
        question: 'Worker 的通信方式是？',
        options: ['直接共享内存', '序列化传递', '事件总线', '全局变量'],
        correctIndices: [1],
        explanation: 'Worker 通过序列化传递数据，参数和返回值都需要序列化，有一定的通信开销。'
      },
      {
        id: 'q6_11',
        type: QuestionType.TRUE_FALSE,
        question: 'TaskPool 可以自动扩缩容吗？',
        options: ['可以', '不可以'],
        correctIndices: [0],
        explanation: 'TaskPool 可以自动管理线程生命周期和负载，根据任务量自动扩缩容。'
      },
      {
        id: 'q6_12',
        type: QuestionType.SINGLE_CHOICE,
        question: '并发编程的主要目的是？',
        options: ['提升 UI 性能', '避免阻塞主线程', '减少内存占用', '简化代码'],
        correctIndices: [1],
        explanation: '并发编程的主要目的是避免阻塞主线程，将耗时操作移至后台线程执行。'
      },
      {
        id: 'q6_13',
        type: QuestionType.MULTIPLE_CHOICE,
        question: '以下哪些是并发编程的方式？',
        options: ['TaskPool', 'Worker', 'Promise', 'async/await'],
        correctIndices: [0, 1],
        explanation: 'TaskPool 和 Worker 是并发编程方式，Promise 和 async/await 是异步编程方式。'
      }
    ]
  },
  {
    id: 'q7',
    title: '路由与导航测验',
    questions: [
      {
        id: 'q7_1',
        type: QuestionType.SINGLE_CHOICE,
        question: 'router.pushUrl() 和 router.replaceUrl() 的区别是？',
        options: ['没有区别', 'pushUrl 会保留当前页在栈中，replaceUrl 不会', 'replaceUrl 会保留当前页，pushUrl 不会', '两者都会清空页面栈'],
        correctIndices: [1],
        explanation: 'pushUrl 会将新页面压入栈，当前页保留；replaceUrl 会用新页面替换当前页，当前页不保留在栈中。'
      },
      {
        id: 'q7_2',
        type: QuestionType.SINGLE_CHOICE,
        question: '页面路由配置应该写在哪个文件中？',
        options: ['module.json5', 'main_pages.json', 'app.json', 'config.json'],
        correctIndices: [1],
        explanation: '页面路由配置需要写在 resources/base/profile/main_pages.json 文件中。'
      },
      {
        id: 'q7_3',
        type: QuestionType.MULTIPLE_CHOICE,
        question: 'Navigation 组件支持哪些导航模式？',
        options: ['Stack', 'Split', 'Auto', 'Tab'],
        correctIndices: [0, 1, 2],
        explanation: 'Navigation 支持 Stack（单栏）、Split（分栏）和 Auto（自动适配）三种模式。'
      },
      {
        id: 'q7_4',
        type: QuestionType.SINGLE_CHOICE,
        question: 'router.getParams() 返回什么类型？',
        options: ['string', 'number', 'Object', 'Array'],
        correctIndices: [2],
        explanation: 'router.getParams() 返回 Object 类型，包含传递的参数。'
      },
      {
        id: 'q7_5',
        type: QuestionType.TRUE_FALSE,
        question: 'router.replaceUrl() 会保留当前页面在栈中吗？',
        options: ['会', '不会'],
        correctIndices: [1],
        explanation: 'router.replaceUrl() 会用新页面替换当前页面，当前页面不会保留在栈中。'
      },
      {
        id: 'q7_6',
        type: QuestionType.SINGLE_CHOICE,
        question: 'Tabs 组件支持哪些导航位置？',
        options: ['仅顶部', '仅底部', '顶部和底部', '仅中间'],
        correctIndices: [2],
        explanation: 'Tabs 组件支持顶部和底部两种导航位置。'
      },
      {
        id: 'q7_7',
        type: QuestionType.SINGLE_CHOICE,
        question: 'router.back() 的作用是？',
        options: ['前进', '返回上一页', '刷新当前页', '关闭应用'],
        correctIndices: [1],
        explanation: 'router.back() 用于返回上一页，从页面栈中弹出当前页面。'
      },
      {
        id: 'q7_8',
        type: QuestionType.TRUE_FALSE,
        question: '页面路由参数可以是任意类型吗？',
        options: ['可以', '不可以'],
        correctIndices: [1],
        explanation: '页面路由参数必须是可序列化的类型（基本类型、对象、数组等），不能是函数。'
      },
      {
        id: 'q7_9',
        type: QuestionType.SINGLE_CHOICE,
        question: 'Navigation 的 Split 模式适合什么设备？',
        options: ['手机', '平板和折叠屏', '手表', '所有设备'],
        correctIndices: [1],
        explanation: 'Navigation 的 Split（分栏）模式适合平板和折叠屏等大屏设备，可以同时显示多个页面。'
      },
      {
        id: 'q7_10',
        type: QuestionType.MULTIPLE_CHOICE,
        question: 'router 模块支持哪些操作？',
        options: ['pushUrl', 'replaceUrl', 'back', 'forward'],
        correctIndices: [0, 1, 2],
        explanation: 'router 模块支持 pushUrl（跳转）、replaceUrl（替换）和 back（返回），不支持 forward。'
      },
      {
        id: 'q7_11',
        type: QuestionType.SINGLE_CHOICE,
        question: 'Tabs 组件必须配合哪个组件使用？',
        options: ['TabContent', 'TabBar', 'TabItem', 'TabPanel'],
        correctIndices: [0],
        explanation: 'Tabs 组件必须配合 TabContent 组件使用，TabContent 包含每个标签页的内容。'
      },
      {
        id: 'q7_12',
        type: QuestionType.TRUE_FALSE,
        question: 'Navigation 组件可以自定义标题栏吗？',
        options: ['可以', '不可以'],
        correctIndices: [0],
        explanation: 'Navigation 组件支持自定义标题栏，通过 .title() 和 .menus() 等方法设置。'
      },
      {
        id: 'q7_13',
        type: QuestionType.SINGLE_CHOICE,
        question: '页面栈的最大深度有限制吗？',
        options: ['没有限制', '有固定限制', '根据设备内存', '根据应用配置'],
        correctIndices: [2],
        explanation: '页面栈的最大深度通常根据设备内存和应用配置，但建议控制页面栈深度，避免内存问题。'
      },
      {
        id: 'q7_14',
        type: QuestionType.MULTIPLE_CHOICE,
        question: '以下哪些是路由相关的方法？',
        options: ['pushUrl', 'getParams', 'back', 'navigate'],
        correctIndices: [0, 1, 2],
        explanation: 'pushUrl、getParams 和 back 都是 router 模块的方法，navigate 不是标准方法。'
      }
    ]
  },
  {
    id: 'q8',
    title: '动画与交互测验',
    questions: [
      {
        id: 'q8_1',
        type: QuestionType.SINGLE_CHOICE,
        question: '属性动画和显式动画的主要区别是？',
        options: ['没有区别', '属性动画自动触发，显式动画需要调用 animateTo', '显式动画更简单', '属性动画需要手动调用'],
        correctIndices: [1],
        explanation: '属性动画在属性变化时自动触发，显式动画需要调用 animateTo() 函数在闭包内修改状态。'
      },
      {
        id: 'q8_2',
        type: QuestionType.SINGLE_CHOICE,
        question: '手势事件应该使用哪个方法绑定？',
        options: ['.onClick()', '.gesture()', '.onTouch()', '.onSwipe()'],
        correctIndices: [1],
        explanation: '手势事件（如长按、拖动、捏合等）需要使用 .gesture() 方法绑定。'
      },
      {
        id: 'q8_3',
        type: QuestionType.TRUE_FALSE,
        question: 'animateTo 可以在闭包外修改状态吗？',
        options: ['可以', '不可以'],
        correctIndices: [1],
        explanation: 'animateTo 的动画效果只对闭包内修改的状态生效，闭包外的状态变化不会产生动画。'
      },
      {
        id: 'q8_4',
        type: QuestionType.SINGLE_CHOICE,
        question: '手势事件中，长按手势是哪个？',
        options: ['TapGesture', 'LongPressGesture', 'PanGesture', 'PinchGesture'],
        correctIndices: [1],
        explanation: 'LongPressGesture 是长按手势，用于检测长按操作。'
      },
      {
        id: 'q8_5',
        type: QuestionType.TRUE_FALSE,
        question: '属性动画可以同时应用于多个属性吗？',
        options: ['可以', '不可以'],
        correctIndices: [0],
        explanation: '属性动画可以同时应用于多个属性，每个属性都可以有自己的 .animation() 配置。'
      },
      {
        id: 'q8_6',
        type: QuestionType.SINGLE_CHOICE,
        question: '动画曲线 Curve.EaseOut 表示什么？',
        options: ['匀速', '先快后慢', '先慢后快', '先快后慢再快'],
        correctIndices: [1],
        explanation: 'Curve.EaseOut 表示缓出曲线，动画开始时快，结束时慢。'
      },
      {
        id: 'q8_7',
        type: QuestionType.SINGLE_CHOICE,
        question: 'PanGesture 用于什么手势？',
        options: ['点击', '长按', '拖动', '捏合'],
        correctIndices: [2],
        explanation: 'PanGesture 是拖动手势，用于检测手指在屏幕上的拖动操作。'
      },
      {
        id: 'q8_8',
        type: QuestionType.TRUE_FALSE,
        question: '属性动画可以设置动画时长吗？',
        options: ['可以', '不可以'],
        correctIndices: [0],
        explanation: '属性动画可以通过 .animation() 的 duration 参数设置动画时长。'
      },
      {
        id: 'q8_9',
        type: QuestionType.SINGLE_CHOICE,
        question: 'PinchGesture 用于什么手势？',
        options: ['点击', '拖动', '捏合缩放', '滑动'],
        correctIndices: [2],
        explanation: 'PinchGesture 是捏合手势，用于检测两指捏合缩放操作。'
      },
      {
        id: 'q8_10',
        type: QuestionType.MULTIPLE_CHOICE,
        question: '以下哪些是动画曲线类型？',
        options: ['Curve.EaseIn', 'Curve.EaseOut', 'Curve.Linear', 'Curve.EaseInOut'],
        correctIndices: [0, 1, 2, 3],
        explanation: 'Curve.EaseIn（缓入）、Curve.EaseOut（缓出）、Curve.Linear（线性）和 Curve.EaseInOut（缓入缓出）都是动画曲线类型。'
      },
      {
        id: 'q8_11',
        type: QuestionType.SINGLE_CHOICE,
        question: 'SwipeGesture 用于什么手势？',
        options: ['点击', '拖动', '滑动', '长按'],
        correctIndices: [2],
        explanation: 'SwipeGesture 是滑动手势，用于检测快速滑动操作（如左滑、右滑）。'
      },
      {
        id: 'q8_12',
        type: QuestionType.TRUE_FALSE,
        question: 'animateTo 可以在同一个闭包内修改多个状态吗？',
        options: ['可以', '不可以'],
        correctIndices: [0],
        explanation: 'animateTo 可以在同一个闭包内修改多个状态，这些状态变化都会产生动画效果。'
      },
      {
        id: 'q8_13',
        type: QuestionType.SINGLE_CHOICE,
        question: '动画的 PlayMode.Normal 表示什么？',
        options: ['正常播放', '反向播放', '循环播放', '往返播放'],
        correctIndices: [0],
        explanation: 'PlayMode.Normal 表示正常播放，动画从开始到结束播放一次。'
      },
      {
        id: 'q8_14',
        type: QuestionType.MULTIPLE_CHOICE,
        question: '以下哪些是手势类型？',
        options: ['TapGesture', 'LongPressGesture', 'PanGesture', 'PinchGesture'],
        correctIndices: [0, 1, 2, 3],
        explanation: 'TapGesture（点击）、LongPressGesture（长按）、PanGesture（拖动）和 PinchGesture（捏合）都是手势类型。'
      }
    ]
  },
  {
    id: 'q9',
    title: '数据存储测验',
    questions: [
      {
        id: 'q9_1',
        type: QuestionType.SINGLE_CHOICE,
        question: 'Preferences.put() 后必须调用什么方法才能持久化？',
        options: ['save()', 'flush()', 'commit()', 'persist()'],
        correctIndices: [1],
        explanation: 'Preferences 的 put() 只是将数据写入内存，必须调用 flush() 才能持久化到文件。'
      },
      {
        id: 'q9_2',
        type: QuestionType.MULTIPLE_CHOICE,
        question: '以下哪些是 HarmonyOS 支持的持久化存储方式？',
        options: ['Preferences', 'RelationalStore (RDB)', 'File', 'SharedPreferences'],
        correctIndices: [0, 1, 2],
        explanation: 'HarmonyOS 支持 Preferences（键值对）、RelationalStore（关系型数据库）和 File（文件存储）。'
      },
      {
        id: 'q9_3',
        type: QuestionType.SINGLE_CHOICE,
        question: 'RelationalStore 基于什么数据库？',
        options: ['MySQL', 'PostgreSQL', 'SQLite', 'MongoDB'],
        correctIndices: [2],
        explanation: 'RelationalStore 基于 SQLite 数据库，提供关系型数据存储能力。'
      },
      {
        id: 'q9_4',
        type: QuestionType.TRUE_FALSE,
        question: 'Preferences.put() 后必须调用 flush() 才能持久化吗？',
        options: ['是', '否'],
        correctIndices: [0],
        explanation: '是的，Preferences.put() 只是将数据写入内存，必须调用 flush() 才能持久化到文件。'
      },
      {
        id: 'q9_5',
        type: QuestionType.SINGLE_CHOICE,
        question: '文件存储适合存储什么类型的数据？',
        options: ['简单配置', '关系型数据', '文档、图片等非结构化数据', '仅文本'],
        correctIndices: [2],
        explanation: '文件存储适合存储文档、图片、视频等非结构化数据。'
      },
      {
        id: 'q9_6',
        type: QuestionType.MULTIPLE_CHOICE,
        question: '以下哪些是持久化存储方式？',
        options: ['Preferences', 'RelationalStore', 'AppStorage', 'File'],
        correctIndices: [0, 1, 3],
        explanation: 'Preferences、RelationalStore 和 File 都是持久化存储，AppStorage 是内存存储。'
      },
      {
        id: 'q9_7',
        type: QuestionType.SINGLE_CHOICE,
        question: 'Preferences.get() 的第二个参数是什么？',
        options: ['键名', '默认值', '类型', '回调函数'],
        correctIndices: [1],
        explanation: 'Preferences.get() 的第二个参数是默认值，当键不存在时返回该默认值。'
      },
      {
        id: 'q9_8',
        type: QuestionType.TRUE_FALSE,
        question: 'RelationalStore 支持 SQL 查询吗？',
        options: ['支持', '不支持'],
        correctIndices: [0],
        explanation: 'RelationalStore 基于 SQLite，支持完整的 SQL 查询语句。'
      },
      {
        id: 'q9_9',
        type: QuestionType.SINGLE_CHOICE,
        question: '文件存储适合存储什么？',
        options: ['简单配置', '关系型数据', '大文件和非结构化数据', '仅文本'],
        correctIndices: [2],
        explanation: '文件存储适合存储大文件和非结构化数据，如图片、视频、文档等。'
      },
      {
        id: 'q9_10',
        type: QuestionType.MULTIPLE_CHOICE,
        question: 'Preferences 的操作包括？',
        options: ['put', 'get', 'delete', 'flush'],
        correctIndices: [0, 1, 2, 3],
        explanation: 'Preferences 支持 put（写入）、get（读取）、delete（删除）和 flush（持久化）等操作。'
      },
      {
        id: 'q9_11',
        type: QuestionType.SINGLE_CHOICE,
        question: 'RelationalStore 的事务操作用于什么？',
        options: ['提升性能', '保证数据一致性', '简化代码', '减少内存'],
        correctIndices: [1],
        explanation: 'RelationalStore 的事务操作用于保证数据一致性，要么全部成功，要么全部回滚。'
      },
      {
        id: 'q9_12',
        type: QuestionType.TRUE_FALSE,
        question: 'Preferences 的数据会立即持久化吗？',
        options: ['会', '不会'],
        correctIndices: [1],
        explanation: 'Preferences.put() 只是将数据写入内存，必须调用 flush() 才会持久化到文件。'
      },
      {
        id: 'q9_13',
        type: QuestionType.SINGLE_CHOICE,
        question: '文件读取操作是同步还是异步？',
        options: ['同步', '异步', '都可以', '根据文件大小'],
        correctIndices: [1],
        explanation: '文件读取操作是异步的，返回 Promise，避免阻塞 UI 线程。'
      },
      {
        id: 'q9_14',
        type: QuestionType.MULTIPLE_CHOICE,
        question: '以下哪些是数据存储的考虑因素？',
        options: ['数据大小', '访问频率', '数据结构', '持久化需求'],
        correctIndices: [0, 1, 2, 3],
        explanation: '选择存储方式时需要考虑数据大小、访问频率、数据结构和持久化需求等因素。'
      }
    ]
  },
  {
    id: 'q10',
    title: '组件生命周期测验',
    questions: [
      {
        id: 'q10_1',
        type: QuestionType.SINGLE_CHOICE,
        question: '组件创建后，build() 之前执行的生命周期函数是？',
        options: ['onCreate', 'aboutToAppear', 'onPageShow', 'onInit'],
        correctIndices: [1],
        explanation: 'aboutToAppear 在组件创建后、首次 build() 之前执行，适合做数据初始化。'
      },
      {
        id: 'q10_2',
        type: QuestionType.SINGLE_CHOICE,
        question: '页面从后台切回前台时，会触发哪个生命周期？',
        options: ['aboutToAppear', 'onPageShow', 'onForeground', 'onResume'],
        correctIndices: [1],
        explanation: 'onPageShow 在页面显示时触发，包括从后台切回前台的情况。'
      },
      {
        id: 'q10_3',
        type: QuestionType.TRUE_FALSE,
        question: 'aboutToDisappear 在组件销毁后执行？',
        options: ['是', '否'],
        correctIndices: [1],
        explanation: 'aboutToDisappear 在组件销毁前执行，用于清理资源，销毁后无法执行任何代码。'
      },
      {
        id: 'q10_4',
        type: QuestionType.SINGLE_CHOICE,
        question: 'onPageShow 什么时候触发？',
        options: ['仅页面首次显示时', '页面显示时（包括从后台切回）', '仅从后台切回时', '页面隐藏时'],
        correctIndices: [1],
        explanation: 'onPageShow 在页面显示时触发，包括首次显示和从后台切回前台的情况。'
      },
      {
        id: 'q10_5',
        type: QuestionType.TRUE_FALSE,
        question: 'onBackPress 可以阻止页面返回吗？',
        options: ['可以', '不可以'],
        correctIndices: [0],
        explanation: 'onBackPress 返回 true 可以阻止页面返回，返回 false 允许返回。'
      },
      {
        id: 'q10_6',
        type: QuestionType.SINGLE_CHOICE,
        question: 'Ability 的生命周期函数 onCreate 在什么时候执行？',
        options: ['窗口创建时', '应用启动时', '页面显示时', '应用初始化时'],
        correctIndices: [1],
        explanation: 'Ability 的 onCreate 在应用启动时执行，用于应用初始化。'
      },
      {
        id: 'q10_7',
        type: QuestionType.SINGLE_CHOICE,
        question: 'onWindowStageCreate 在什么时候执行？',
        options: ['应用启动时', '窗口创建时', '页面显示时', '应用初始化时'],
        correctIndices: [1],
        explanation: 'onWindowStageCreate 在窗口创建时执行，用于加载页面内容。'
      },
      {
        id: 'q10_8',
        type: QuestionType.TRUE_FALSE,
        question: 'onForeground 在应用切到前台时触发吗？',
        options: ['是', '否'],
        correctIndices: [0],
        explanation: 'onForeground 在应用从后台切到前台时触发。'
      },
      {
        id: 'q10_9',
        type: QuestionType.SINGLE_CHOICE,
        question: 'onBackPress 返回什么类型？',
        options: ['void', 'boolean', 'number', 'string'],
        correctIndices: [1],
        explanation: 'onBackPress 返回 boolean 类型，true 表示阻止返回，false 表示允许返回。'
      },
      {
        id: 'q10_10',
        type: QuestionType.MULTIPLE_CHOICE,
        question: '以下哪些是 Ability 的生命周期函数？',
        options: ['onCreate', 'onWindowStageCreate', 'onForeground', 'onBackground'],
        correctIndices: [0, 1, 2, 3],
        explanation: 'onCreate、onWindowStageCreate、onForeground 和 onBackground 都是 Ability 的生命周期函数。'
      },
      {
        id: 'q10_11',
        type: QuestionType.SINGLE_CHOICE,
        question: 'aboutToAppear 适合做什么？',
        options: ['清理资源', '数据初始化', 'UI 更新', '网络请求'],
        correctIndices: [1],
        explanation: 'aboutToAppear 在组件创建后、build 之前执行，适合做数据初始化。'
      },
      {
        id: 'q10_12',
        type: QuestionType.TRUE_FALSE,
        question: 'onPageHide 在页面隐藏时立即触发吗？',
        options: ['是', '否'],
        correctIndices: [0],
        explanation: 'onPageHide 在页面隐藏时立即触发，用于保存数据或暂停操作。'
      },
      {
        id: 'q10_13',
        type: QuestionType.SINGLE_CHOICE,
        question: 'onWindowStageDestroy 在什么时候执行？',
        options: ['窗口创建时', '窗口销毁时', '应用启动时', '应用关闭时'],
        correctIndices: [1],
        explanation: 'onWindowStageDestroy 在窗口销毁时执行，用于清理窗口相关资源。'
      },
      {
        id: 'q10_14',
        type: QuestionType.MULTIPLE_CHOICE,
        question: '以下哪些是页面生命周期函数？',
        options: ['onPageShow', 'onPageHide', 'onBackPress', 'aboutToAppear'],
        correctIndices: [0, 1, 2],
        explanation: 'onPageShow、onPageHide 和 onBackPress 是页面生命周期函数，aboutToAppear 是组件生命周期函数。'
      }
    ]
  },
  {
    id: 'q11',
    title: '布局与样式测验',
    questions: [
      {
        id: 'q11_1',
        type: QuestionType.SINGLE_CHOICE,
        question: '想要子元素平均分配剩余空间，应该使用哪个属性？',
        options: ['.width()', '.layoutWeight()', '.flexGrow()', '.flexShrink()'],
        correctIndices: [1],
        explanation: '.layoutWeight() 用于设置子元素在剩余空间中的分配权重，实现平均分配。'
      },
      {
        id: 'q11_2',
        type: QuestionType.SINGLE_CHOICE,
        question: 'Grid 组件的 columnsTemplate 中 "1fr 2fr" 表示什么？',
        options: ['两列等宽', '第一列是第二列的两倍宽', '第二列是第一列的两倍宽', '固定宽度'],
        correctIndices: [2],
        explanation: '"1fr 2fr" 表示两列，第二列的宽度是第一列的两倍（fr 是分数单位）。'
      },
      {
        id: 'q11_3',
        type: QuestionType.MULTIPLE_CHOICE,
        question: '以下哪些是 Flex 布局支持的属性？',
        options: ['direction', 'wrap', 'justifyContent', 'alignItems'],
        correctIndices: [0, 1, 2, 3],
        explanation: 'Flex 布局支持 direction（方向）、wrap（换行）、justifyContent（主轴对齐）和 alignItems（交叉轴对齐）。'
      },
      {
        id: 'q11_4',
        type: QuestionType.SINGLE_CHOICE,
        question: 'GridRow 和 GridCol 主要用于什么？',
        options: ['网格布局', '响应式布局', '弹性布局', '相对布局'],
        correctIndices: [1],
        explanation: 'GridRow 和 GridCol 用于响应式布局，根据屏幕断点自动调整列数，实现多设备适配。'
      },
      {
        id: 'q11_5',
        type: QuestionType.TRUE_FALSE,
        question: '.layoutWeight() 可以用于平均分配剩余空间吗？',
        options: ['可以', '不可以'],
        correctIndices: [0],
        explanation: '.layoutWeight() 用于设置子元素在剩余空间中的分配权重，设置为相同值可以实现平均分配。'
      },
      {
        id: 'q11_6',
        type: QuestionType.SINGLE_CHOICE,
        question: 'RelativeContainer 通过什么方式定位子元素？',
        options: ['绝对坐标', '锚点（anchor）', '相对坐标', '网格'],
        correctIndices: [1],
        explanation: 'RelativeContainer 通过锚点（anchor）定位子元素，子元素通过 .align() 设置相对于父容器或其他子元素的锚点。'
      },
      {
        id: 'q11_7',
        type: QuestionType.SINGLE_CHOICE,
        question: 'GridRow 的断点用于什么？',
        options: ['设置网格大小', '响应式布局适配', '设置颜色', '设置动画'],
        correctIndices: [1],
        explanation: 'GridRow 的断点用于响应式布局适配，根据屏幕宽度自动调整列数。'
      },
      {
        id: 'q11_8',
        type: QuestionType.TRUE_FALSE,
        question: '.layoutWeight() 可以用于所有容器吗？',
        options: ['可以', '不可以'],
        correctIndices: [1],
        explanation: '.layoutWeight() 主要用于 Column 和 Row 等线性布局容器，不是所有容器都支持。'
      },
      {
        id: 'q11_9',
        type: QuestionType.SINGLE_CHOICE,
        question: 'Grid 的 columnsTemplate "1fr 1fr 1fr" 表示什么？',
        options: ['1列', '2列', '3列等宽', '3列不等宽'],
        correctIndices: [2],
        explanation: '"1fr 1fr 1fr" 表示3列，每列宽度相等（1fr 是分数单位）。'
      },
      {
        id: 'q11_10',
        type: QuestionType.MULTIPLE_CHOICE,
        question: '以下哪些是布局容器？',
        options: ['Column', 'Row', 'Stack', 'Flex'],
        correctIndices: [0, 1, 2, 3],
        explanation: 'Column（垂直）、Row（水平）、Stack（层叠）和 Flex（弹性）都是布局容器。'
      },
      {
        id: 'q11_11',
        type: QuestionType.SINGLE_CHOICE,
        question: 'Flex 的 wrap 属性用于什么？',
        options: ['设置方向', '设置换行', '设置对齐', '设置间距'],
        correctIndices: [1],
        explanation: 'Flex 的 wrap 属性用于设置是否换行，FlexWrap.Wrap 表示允许换行。'
      },
      {
        id: 'q11_12',
        type: QuestionType.TRUE_FALSE,
        question: 'Grid 组件支持滚动吗？',
        options: ['支持', '不支持'],
        correctIndices: [0],
        explanation: 'Grid 组件支持滚动，当内容超出可视区域时可以滚动查看。'
      },
      {
        id: 'q11_13',
        type: QuestionType.SINGLE_CHOICE,
        question: 'Scroll 组件用于什么？',
        options: ['显示列表', '显示网格', '显示可滚动内容', '显示固定内容'],
        correctIndices: [2],
        explanation: 'Scroll 组件用于显示可滚动内容，当内容超出可视区域时可以滚动查看。'
      },
      {
        id: 'q11_14',
        type: QuestionType.MULTIPLE_CHOICE,
        question: '以下哪些是 Flex 布局的属性？',
        options: ['direction', 'wrap', 'justifyContent', 'alignItems'],
        correctIndices: [0, 1, 2, 3],
        explanation: 'Flex 布局支持 direction（方向）、wrap（换行）、justifyContent（主轴对齐）和 alignItems（交叉轴对齐）。'
      }
    ]
  },
  {
    id: 'q12',
    title: '网络请求测验',
    questions: [
      {
        id: 'q12_1',
        type: QuestionType.SINGLE_CHOICE,
        question: 'HTTP 请求完成后，应该调用什么方法释放资源？',
        options: ['close()', 'destroy()', 'release()', 'dispose()'],
        correctIndices: [1],
        explanation: 'httpRequest 使用完毕后必须调用 destroy() 方法释放资源，避免内存泄漏。'
      },
      {
        id: 'q12_2',
        type: QuestionType.SINGLE_CHOICE,
        question: 'HTTP 请求的响应数据在哪个字段中？',
        options: ['data', 'result', 'body', 'content'],
        correctIndices: [1],
        explanation: 'HTTP 请求的回调函数中，响应数据在 data.result 字段中（类型为 string）。'
      },
      {
        id: 'q12_3',
        type: QuestionType.TRUE_FALSE,
        question: 'HTTP 请求默认是异步的？',
        options: ['是', '否'],
        correctIndices: [0],
        explanation: '是的，httpRequest.request() 是异步方法，通过回调函数处理响应，不会阻塞 UI 线程。'
      },
      {
        id: 'q12_4',
        type: QuestionType.SINGLE_CHOICE,
        question: 'HTTP 请求的错误信息在哪个参数中？',
        options: ['data', 'err', 'result', 'response'],
        correctIndices: [1],
        explanation: 'HTTP 请求的回调函数中，错误信息在 err 参数中，成功时 err 为 null。'
      },
      {
        id: 'q12_5',
        type: QuestionType.TRUE_FALSE,
        question: 'HTTP 请求完成后必须调用 destroy() 吗？',
        options: ['必须', '不需要'],
        correctIndices: [0],
        explanation: '是的，httpRequest 使用完毕后必须调用 destroy() 释放资源，避免内存泄漏。'
      },
      {
        id: 'q12_6',
        type: QuestionType.SINGLE_CHOICE,
        question: 'HTTP 请求的响应状态码在哪个字段中？',
        options: ['data.code', 'data.responseCode', 'err.code', 'result.code'],
        correctIndices: [1],
        explanation: 'HTTP 请求的响应状态码在 data.responseCode 字段中，200 表示成功。'
      },
      {
        id: 'q12_7',
        type: QuestionType.SINGLE_CHOICE,
        question: 'HTTP 请求的 method 参数可以设置什么？',
        options: ['仅 GET', '仅 POST', 'GET、POST、PUT、DELETE 等', '仅 GET 和 POST'],
        correctIndices: [2],
        explanation: 'HTTP 请求的 method 可以设置 GET、POST、PUT、DELETE 等多种请求方法。'
      },
      {
        id: 'q12_8',
        type: QuestionType.TRUE_FALSE,
        question: 'HTTP 请求的 header 可以设置自定义请求头吗？',
        options: ['可以', '不可以'],
        correctIndices: [0],
        explanation: 'HTTP 请求的 header 可以设置自定义请求头，如 Content-Type、Authorization 等。'
      },
      {
        id: 'q12_9',
        type: QuestionType.SINGLE_CHOICE,
        question: 'HTTP 请求的 connectTimeout 用于什么？',
        options: ['设置连接超时', '设置读取超时', '设置写入超时', '设置总超时'],
        correctIndices: [0],
        explanation: 'connectTimeout 用于设置连接超时时间，超过该时间未连接成功会返回错误。'
      },
      {
        id: 'q12_10',
        type: QuestionType.MULTIPLE_CHOICE,
        question: 'HTTP 请求可以设置哪些参数？',
        options: ['method', 'header', 'extraData', 'connectTimeout'],
        correctIndices: [0, 1, 2, 3],
        explanation: 'HTTP 请求可以设置 method（方法）、header（请求头）、extraData（请求体）和 connectTimeout（超时）等参数。'
      },
      {
        id: 'q12_11',
        type: QuestionType.SINGLE_CHOICE,
        question: 'HTTP 请求的响应数据是什么类型？',
        options: ['string', 'Object', 'Array', '根据 Content-Type'],
        correctIndices: [0],
        explanation: 'HTTP 请求的响应数据在 data.result 字段中，类型为 string，需要手动解析 JSON。'
      },
      {
        id: 'q12_12',
        type: QuestionType.TRUE_FALSE,
        question: 'HTTP 请求必须调用 destroy() 释放资源吗？',
        options: ['必须', '不需要'],
        correctIndices: [0],
        explanation: '是的，httpRequest 使用完毕后必须调用 destroy() 释放资源，避免内存泄漏。'
      },
      {
        id: 'q12_13',
        type: QuestionType.SINGLE_CHOICE,
        question: 'HTTP 请求的错误处理应该在哪个回调中？',
        options: ['仅在成功回调', '仅在错误回调', '成功和错误回调都要处理', '不需要处理'],
        correctIndices: [2],
        explanation: 'HTTP 请求应该在成功和错误回调中都进行适当的处理，确保应用的健壮性。'
      },
      {
        id: 'q12_14',
        type: QuestionType.MULTIPLE_CHOICE,
        question: '以下哪些是 HTTP 请求的常见状态码？',
        options: ['200', '404', '500', '302'],
        correctIndices: [0, 1, 2, 3],
        explanation: '200（成功）、404（未找到）、500（服务器错误）和 302（重定向）都是常见的 HTTP 状态码。'
      }
    ]
  }
];

export const REFERENCE_DATA: ReferenceCategory[] = [
  {
    title: "装饰器",
    items: [
      { keyword: "@Entry", description: "标记页面入口组件，一个页面只能有一个。" },
      { keyword: "@Component", description: "标记自定义组件，UI 构建的基本单元。" },
      { keyword: "@State", description: "组件内部状态，变化触发 UI 刷新。" },
      { keyword: "@Prop", description: "父子单向同步，父->子。" },
      { keyword: "@Link", description: "父子双向同步，父<=>子。" },
      { keyword: "@Provide", description: "祖先组件提供状态，跨层级共享。" },
      { keyword: "@Consume", description: "后代组件消费状态，与 @Provide 双向同步。" },
      { keyword: "@Builder", description: "定义轻量级 UI 复用函数。" },
      { keyword: "@Styles", description: "定义组件重用样式。" },
      { keyword: "@Extend", description: "扩展原生组件样式。" },
      { keyword: "@Watch", description: "监听状态变量变化。" },
      { keyword: "@Concurrent", description: "标记并发执行的函数 (TaskPool)。" }
    ]
  },
  {
    title: "基础组件",
    items: [
      { keyword: "Text", description: "显示文本内容。", code: "Text('Hello')" },
      { keyword: "Button", description: "按钮组件。", code: "Button('Click')" },
      { keyword: "Image", description: "图片组件。", code: "Image($r('app.media.icon'))" },
      { keyword: "TextInput", description: "单行文本输入。", code: "TextInput()" },
      { keyword: "Toggle", description: "开关/复选框。", code: "Toggle({ type: ToggleType.Switch })" },
      { keyword: "Slider", description: "滑动条。", code: "Slider()" },
      { keyword: "Progress", description: "进度条。", code: "Progress({ value: 50 })" },
      { keyword: "Divider", description: "分割线。", code: "Divider()" },
      { keyword: "Blank", description: "空白填充，自动占位。", code: "Blank()" }
    ]
  },
  {
    title: "容器组件",
    items: [
      { keyword: "Column", description: "垂直线性布局。", code: "Column() { ... }" },
      { keyword: "Row", description: "水平线性布局。", code: "Row() { ... }" },
      { keyword: "Stack", description: "层叠布局。", code: "Stack() { ... }" },
      { keyword: "Flex", description: "弹性布局。", code: "Flex() { ... }" },
      { keyword: "List", description: "列表容器。", code: "List() { ListItem() { ... } }" },
      { keyword: "Grid", description: "网格容器。", code: "Grid() { GridItem() { ... } }" },
      { keyword: "Scroll", description: "滚动容器。", code: "Scroll() { ... }" },
      { keyword: "Tabs", description: "标签页容器。", code: "Tabs() { TabContent() { ... } }" },
      { keyword: "Navigation", description: "导航容器。", code: "Navigation() { ... }" }
    ]
  },
  {
    title: "系统 API",
    items: [
      { keyword: "router", description: "页面路由模块。", code: "import router from '@ohos.router'" },
      { keyword: "promptAction", description: "弹窗提示模块。", code: "import promptAction from '@ohos.promptAction'" },
      { keyword: "http", description: "网络请求模块。", code: "import http from '@ohos.net.http'" },
      { keyword: "preferences", description: "首选项存储。", code: "import dataPreferences from '@ohos.data.preferences'" },
      { keyword: "taskpool", description: "多线程任务池。", code: "import taskpool from '@ohos.taskpool'" },
      { keyword: "hilog", description: "日志打印。", code: "import hilog from '@ohos.hilog'" }
    ]
  }
];

export const INTERVIEW_QUESTIONS: InterviewItem[] = [
  {
    id: 'i1',
    question: 'ArkTS 与 TypeScript 的关系？',
    answer: 'ArkTS 是 TypeScript 的超集（扩展）也是子集（限制）。\n\n1. **扩展**：增加了声明式 UI 描述、状态管理装饰器等能力。\n2. **限制**：为了更高的性能（静态类型优化），限制了 TS 中部分动态特性（如 any 类型的部分使用、运行时动态改变对象布局等）。',
    difficulty: '简单',
    tags: ['基础', '概念']
  },
  {
    id: 'i2',
    question: '@State, @Prop, @Link 的区别？',
    answer: '1. **@State**：组件内部私有状态，初始化必须赋值，变化触发 UI 更新。\n2. **@Prop**：父组件单向同步给子组件，子组件修改不回传。\n3. **@Link**：父子组件双向同步，子组件修改会同步给父组件，需要用 $ 传递引用。',
    difficulty: '中等',
    tags: ['状态管理', '装饰器', '必问']
  },
  {
    id: 'i3',
    question: 'ArkUI 的渲染机制是怎样的？',
    answer: 'ArkUI 采用声明式开发范式。当状态（State）发生变化时，框架会自动识别依赖该状态的组件，并仅重新渲染这些受影响的组件（脏区刷新），而不是重绘整个页面，从而保证高性能。',
    difficulty: '困难',
    tags: ['原理', '渲染']
  },
  {
    id: 'i4',
    question: '什么是 LazyForEach？为什么使用它？',
    answer: 'LazyForEach 是用于 List 或 Grid 组件的数据懒加载机制。\n\n**原因**：当列表数据量很大（如上千条）时，普通的 ForEach 会一次性创建所有组件，导致启动慢、内存高。LazyForEach 只渲染屏幕可见区域及少量预加载区域的组件，滑动时按需创建和销毁，极大提高性能。',
    difficulty: '中等',
    tags: ['性能优化', 'List']
  },
  {
    id: 'i5',
    question: '页面生命周期有哪些？',
    answer: '1. **aboutToAppear**：组件创建后，build 之前执行。适合做数据初始化。\n2. **onPageShow**：页面显示时触发（包括切后台回来）。\n3. **onPageHide**：页面隐藏时触发。\n4. **onBackPress**：用户点击返回键时触发。\n5. **aboutToDisappear**：组件销毁前触发。',
    difficulty: '简单',
    tags: ['生命周期', '基础']
  },
  {
    id: 'i6',
    question: 'Stage 模型和 FA 模型有什么区别？',
    answer: 'Stage 模型是 HarmonyOS 3.1+ 推出的新应用模型。\n\n1. **设计思想**：Stage 模型更加规范，类名更清晰（UIAbility vs Ability）。\n2. **上下文**：Stage 模型有独立的 Context（AbilityContext, WindowStageContext），隔离性更好。\n3. **多实例**：Stage 模型原生支持多实例。\n目前推荐使用 Stage 模型开发。',
    difficulty: '中等',
    tags: ['应用模型', '概念']
  },
  {
    id: 'i7',
    question: '如何实现跨组件层级的数据共享？',
    answer: '1. **@Provide/@Consume**：适合组件树内部跨层级同步。\n2. **AppStorage**：应用全局状态，适合跨页面共享。\n3. **LocalStorage**：页面级 UIAbility 存储。\n4. **EventHub/Emitter**：基于事件的通信（订阅/发布模式）。',
    difficulty: '中等',
    tags: ['状态管理', '通信']
  },
  {
    id: 'i8',
    question: '什么是 vp 和 fp？',
    answer: '1. **vp (virtual pixel)**：虚拟像素，屏幕密度无关。在不同像素密度的屏幕上，1vp 对应的物理像素不同，保证视觉大小一致。\n2. **fp (font pixel)**：字体像素。类似 vp，但会随系统字体大小设置缩放。设置字体大小时应使用 fp。',
    difficulty: '简单',
    tags: ['UI', '基础']
  },
  {
    id: 'i9',
    question: 'Worker 和 TaskPool 的区别？',
    answer: '1. **TaskPool**：更轻量，自动管理线程生命周期。适合执行耗时较短的独立任务。函数需 @Concurrent 装饰。\n2. **Worker**：常驻线程，生命周期由开发者管理。适合长时间运行的后台任务。通信开销略大（序列化）。\n**推荐**：优先使用 TaskPool。',
    difficulty: '困难',
    tags: ['并发', '多线程']
  },
  {
    id: 'i10',
    question: '如何做持久化存储？',
    answer: '1. **Preferences**：轻量级 Key-Value 存储，适合配置项。\n2. **RelationalStore (RDB)**：关系型数据库 (SQLite)，适合复杂结构化数据。\n3. **File**：文件存储，适合存储文档、图片等非结构化数据。',
    difficulty: '简单',
    tags: ['数据存储', '基础']
  }
,
  {
    id: 'i11',
    question: 'ArkTS 中如何优化列表滚动的性能？',
    answer: '1. **使用 LazyForEach**：替代 ForEach，按需加载和复用列表项，大幅降低内存占用。\n2. **组件复用 (@Reusable)**：标记自定义组件为可复用，配合 LazyForEach 的 cachedCount 属性，缓存离屏组件节点。\n3. **减少组件层级**：扁平化布局，减少嵌套。\n4. **固定尺寸**：给 List item 设置固定宽高，减少测量开销。',
    difficulty: '困难',
    tags: ['性能优化', 'List', '实战']
  },
  {
    id: 'i12',
    question: 'Ability 和 UIAbility 的区别？',
    answer: '在 Stage 模型中，Ability 是一个抽象概念。UIAbility 是包含 UI 界面的应用组件，继承自 Ability。它是用户与应用交互的入口，负责页面路由和生命周期管理。ExtensionAbility 也是 Ability 的一种，但用于特定场景（如服务卡片、输入法），通常无主 UI。',
    difficulty: '中等',
    tags: ['应用模型', '概念']
  },
  {
    id: 'i13',
    question: '什么是 AppStorage 和 LocalStorage？',
    answer: '1. **AppStorage**：应用全局的状态存储，在整个应用运行期间存在，所有 UIAbility 和页面都能访问，适合存储用户信息、全局配置。\n2. **LocalStorage**：页面级或 UIAbility 级的状态存储，数据在特定的 UIAbility 实例或页面树内共享，不同实例间数据隔离。',
    difficulty: '中等',
    tags: ['状态管理', '数据共享']
  },
  {
    id: 'i14',
    question: '如何防止“回调地狱” (Callback Hell)？',
    answer: '1. **使用 Promise**：将异步操作封装为 Promise，使用 .then().catch() 链式调用。\n2. **async/await**：ArkTS 支持 async/await 语法，用同步的写法编写异步代码，可读性最好。\n3. **TaskPool**：将复杂的计算逻辑移至后台线程，主线程通过 Promise 等待结果。',
    difficulty: '简单',
    tags: ['异步编程', '代码质量']
  },
  {
    id: 'i15',
    question: 'ArkUI 的 @BuilderParam 是什么？',
    answer: '@BuilderParam 用于在自定义组件中接收外部传入的 UI 结构（@Builder 函数）。它类似于 Vue 的 Slot 或 React 的 render props。允许父组件在调用子组件时，动态注入一段 UI 内容，极大地提高了组件的灵活性和复用性。',
    difficulty: '中等',
    tags: ['装饰器', '组件封装']
  },
  {
    id: 'i16',
    question: '鸿蒙应用如何进行多设备适配？',
    answer: '1. **响应式布局**：使用 GridRow/GridCol 栅格布局，根据屏幕断点自动调整列数。\n2. **自适应布局**：使用 Flex、RelativeContainer、百分比宽高、layoutWeight 等，让界面随窗口大小变化。\n3. **资源限定词**：在 resources 目录下创建 element-tablet, element-dark 等限定词目录，自动加载对应资源。\n4. **Navigation**：使用 Navigation 组件的自适应分栏模式。',
    difficulty: '困难',
    tags: ['适配', '布局', '实战']
  },
  {
    id: 'i17',
    question: 'ArkTS 的 NAPI 是什么？',
    answer: 'NAPI (Native API) 是 ArkTS 与 C/C++ 代码交互的桥梁。当 ArkTS 需要调用高性能的 C++ 库（如音视频处理、OpenCV）或系统底层能力时，通过 NAPI 封装 C++ 接口，暴露给 ArkTS 调用。',
    difficulty: '困难',
    tags: ['NDK', 'C++', '底层']
  },
  {
    id: 'i18',
    question: '什么是 HVIGOR？',
    answer: 'Hvigor 是 HarmonyOS 的构建系统，基于 TypeScript 编写。它负责管理项目的构建流程，包括依赖管理、任务调度、编译打包等。类似于 Android 的 Gradle。开发者可以通过修改 hvigorfile.ts 来自定义构建脚本。',
    difficulty: '中等',
    tags: ['构建工具', '工程化']
  },
  {
    id: 'i19',
    question: '@ObjectLink 和 @Observed 的作用？',
    answer: '@Observed 装饰类，使其属性变化可被观察。@ObjectLink 用于观察 @Observed 类的实例，当实例的属性变化时，会触发 UI 更新。\n\n**使用场景**：当需要观察对象内部属性变化时（如数组元素、对象属性），必须使用 @Observed + @ObjectLink，而不能直接用 @State。',
    difficulty: '中等',
    tags: ['状态管理', '装饰器']
  },
  {
    id: 'i20',
    question: '什么是 @Reusable 装饰器？',
    answer: '@Reusable 用于标记自定义组件为可复用组件。配合 LazyForEach 使用时，系统会缓存离屏的组件节点，当相同类型的组件再次进入可视区域时，会复用已缓存的节点，而不是重新创建，从而提升列表滚动性能。',
    difficulty: '困难',
    tags: ['性能优化', '组件复用']
  },
  {
    id: 'i21',
    question: '如何实现自定义弹窗？',
    answer: '1. **使用 CustomDialog**：继承 CustomDialog 类，实现 build() 方法定义 UI。\n2. **使用 @CustomDialog 装饰器**：标记自定义组件，通过 showDialog() 显示。\n3. **使用 promptAction.showDialog()**：系统提供的标准弹窗，适合简单场景。',
    difficulty: '简单',
    tags: ['UI', '弹窗']
  },
  {
    id: 'i22',
    question: '什么是 GridRow 和 GridCol？',
    answer: 'GridRow 和 GridCol 是响应式栅格布局组件，用于实现多设备适配。\n\n- **GridRow**：栅格容器，根据屏幕断点自动调整列数。\n- **GridCol**：栅格列，通过 span 属性控制占据的列数。\n\n**优势**：在不同屏幕尺寸下自动适配，无需写多套布局代码。',
    difficulty: '中等',
    tags: ['布局', '响应式', '适配']
  },
  {
    id: 'i23',
    question: '如何实现下拉刷新和上拉加载？',
    answer: '使用 Refresh 组件包裹 Scroll 或 List：\n\n1. **下拉刷新**：设置 .refreshing() 和 .onRefreshing()。\n2. **上拉加载**：使用 List 的 .onReachEnd() 回调。\n3. **加载状态**：通过 @State 变量控制 loading 状态和提示文字。',
    difficulty: '中等',
    tags: ['List', '交互', '实战']
  },
  {
    id: 'i24',
    question: '什么是 @Styles 和 @Extend？',
    answer: '1. **@Styles**：定义可重用的样式函数，可以在多个组件中复用相同的样式设置。\n2. **@Extend**：扩展原生组件的样式，为原生组件添加自定义样式方法。\n\n**区别**：@Styles 用于组件样式复用，@Extend 用于扩展原生组件能力。',
    difficulty: '中等',
    tags: ['样式', '装饰器']
  },
  {
    id: 'i25',
    question: '如何实现页面间数据传递？',
    answer: '1. **路由参数**：使用 router.pushUrl() 的 params 参数传递简单数据。\n2. **AppStorage**：全局状态存储，适合跨页面共享数据。\n3. **EventHub**：基于事件的通信机制，适合解耦的场景。\n4. **单例模式**：创建数据管理类，在多个页面间共享实例。',
    difficulty: '简单',
    tags: ['路由', '数据传递', '通信']
  },
  {
    id: 'i26',
    question: '什么是 @BuilderParam？如何使用？',
    answer: '@BuilderParam 用于在自定义组件中接收外部传入的 @Builder 函数，实现类似 Slot 的功能。\n\n**使用**：\n1. 在子组件中声明 @BuilderParam 变量。\n2. 在 build() 中调用该变量。\n3. 父组件传入 @Builder 函数。\n\n**优势**：提高组件灵活性，允许父组件自定义子组件的部分 UI。',
    difficulty: '中等',
    tags: ['装饰器', '组件封装', '高级特性']
  },
  {
    id: 'i27',
    question: '如何实现自定义手势识别？',
    answer: '使用 GestureGroup 组合多个手势：\n\n1. **定义手势**：创建 TapGesture、PanGesture 等。\n2. **组合手势**：使用 GestureGroup 的 .parallel() 或 .sequence() 组合。\n3. **绑定组件**：通过 .gesture() 方法绑定到组件。\n\n**示例**：长按后拖动、双击缩放等复杂手势。',
    difficulty: '困难',
    tags: ['手势', '交互', '高级特性']
  },
  {
    id: 'i28',
    question: '什么是 LocalStorage 和 PersistentStorage？',
    answer: '1. **LocalStorage**：页面级或 UIAbility 级的状态存储，数据在特定实例内共享，不同实例间隔离。适合页面内状态共享。\n2. **PersistentStorage**：持久化存储，将 AppStorage 中的数据持久化到本地文件，应用重启后数据依然存在。适合需要持久化的全局配置。',
    difficulty: '中等',
    tags: ['状态管理', '持久化', '存储']
  },
  {
    id: 'i29',
    question: '如何优化应用启动速度？',
    answer: '1. **延迟加载**：非关键页面使用懒加载，减少初始 bundle 大小。\n2. **减少初始化任务**：将耗时操作移至后台线程或延迟执行。\n3. **优化资源**：压缩图片、使用 WebP 格式、按需加载资源。\n4. **代码分割**：使用动态 import 按需加载模块。\n5. **预加载**：使用 TaskPool 预加载关键数据。',
    difficulty: '困难',
    tags: ['性能优化', '启动速度', '实战']
  },
  {
    id: 'i30',
    question: '什么是 AbilityContext 和 WindowStageContext？',
    answer: '在 Stage 模型中，Context 分为两类：\n\n1. **AbilityContext**：UIAbility 的上下文，提供启动 Ability、获取资源等能力。通过 getContext(this) 获取。\n2. **WindowStageContext**：窗口阶段的上下文，提供窗口管理、显示控制等能力。通过 windowStage.getMainWindow() 获取。\n\n**区别**：AbilityContext 关注应用能力，WindowStageContext 关注窗口显示。',
    difficulty: '困难',
    tags: ['应用模型', 'Context', 'Stage模型']
  },
  {
    id: 'i31',
    question: '如何实现主题切换（深色模式）？',
    answer: '1. **使用系统主题**：通过 Configuration.getColorMode() 获取系统主题，动态切换资源。\n2. **自定义主题**：使用 AppStorage 存储主题状态，通过资源限定词（如 element-dark）加载对应资源。\n3. **动态样式**：根据主题状态动态设置组件颜色。\n\n**推荐**：结合系统主题和自定义主题，提供最佳用户体验。',
    difficulty: '中等',
    tags: ['主题', 'UI', '实战']
  },
  {
    id: 'i32',
    question: '什么是 @Preview 装饰器？',
    answer: '@Preview 用于在 DevEco Studio 的预览器中预览组件。可以设置预览参数（如设备类型、主题、语言等），方便开发时快速查看 UI 效果，无需运行完整应用。\n\n**注意**：@Preview 仅在开发阶段生效，不会影响实际运行。',
    difficulty: '简单',
    tags: ['开发工具', '预览器']
  },
  {
    id: 'i33',
    question: '如何处理列表项的点击事件？',
    answer: '1. **ListItem 的 onClick**：直接在 ListItem 上绑定 onClick 事件。\n2. **子组件事件冒泡**：在 ListItem 内的组件上绑定事件，事件会冒泡到 ListItem。\n3. **使用 .onClick() 链式调用**：在 ListItem 的子组件上链式调用 onClick。\n\n**推荐**：使用 ListItem 的 onClick，语义更清晰，性能更好。',
    difficulty: '简单',
    tags: ['List', '事件处理', '交互']
  },
  {
    id: 'i34',
    question: '什么是 @Concurrent 装饰器的限制？',
    answer: '@Concurrent 装饰的函数有以下限制：\n\n1. **必须是顶层函数或静态方法**：不能是实例方法。\n2. **参数和返回值必须可序列化**：支持基本类型、可序列化对象，不支持函数、闭包。\n3. **不能访问外部变量**：只能使用参数传入的数据。\n4. **不能调用 UI 相关 API**：不能操作 UI 组件或状态。',
    difficulty: '困难',
    tags: ['并发', 'TaskPool', '限制']
  },
  {
    id: 'i35',
    question: '如何实现图片的懒加载和缓存？',
    answer: '1. **Image 组件自动缓存**：Image 组件支持自动缓存网络图片。\n2. **使用占位图**：通过 .alt() 设置加载中的占位图。\n3. **自定义缓存策略**：使用 http 模块下载图片，手动管理缓存。\n4. **使用第三方库**：集成图片加载库（如支持 HarmonyOS 的图片库）。\n\n**推荐**：优先使用 Image 组件的内置缓存能力。',
    difficulty: '中等',
    tags: ['图片', '性能优化', '缓存']
  },
  {
    id: 'i36',
    question: '什么是 @Watch 装饰器？如何使用？',
    answer: "@Watch 用于监听状态变量的变化，当变量改变时执行回调函数。\n\n**使用场景**：\n1. 数据变化时执行副作用（如保存数据、发送日志）。\n2. 多个状态变量联动。\n3. 数据验证和转换。\n\n**语法**：@Watch('variableName') callback() { 在回调中执行逻辑 }",
    difficulty: '中等',
    tags: ['装饰器', '状态管理', '监听']
  },
  {
    id: 'i37',
    question: '如何实现自定义 TabBar？',
    answer: '1. **使用 Tabs 组件**：系统提供的标签页组件，支持底部和顶部导航。\n2. **自定义实现**：使用 Row + Button 组合，通过 @State 控制选中状态。\n3. **结合 Navigation**：在 Navigation 内使用自定义 TabBar。\n\n**推荐**：优先使用 Tabs 组件，功能完善且性能好。',
    difficulty: '简单',
    tags: ['导航', 'TabBar', 'UI']
  },
  {
    id: 'i38',
    question: '什么是 RelativeContainer 相对布局？',
    answer: 'RelativeContainer 是相对布局容器，通过锚点（anchor）定位子元素。\n\n**特点**：\n1. 子元素通过 .align() 设置相对于父容器或其他子元素的锚点。\n2. 支持复杂的相对定位关系。\n3. 适合实现不规则布局。\n\n**使用场景**：卡片式布局、浮动按钮、自定义图表等。',
    difficulty: '困难',
    tags: ['布局', 'RelativeContainer', '高级特性']
  },
  {
    id: 'i39',
    question: '如何实现搜索功能？',
    answer: '1. **使用 TextInput**：设置 .type(InputType.Search) 显示搜索图标。\n2. **监听输入**：通过 .onChange() 监听输入变化。\n3. **防抖处理**：使用 setTimeout 实现防抖，避免频繁搜索。\n4. **过滤数据**：根据关键词过滤列表数据。\n5. **高亮显示**：使用 Text 的 .decoration() 高亮匹配文本。',
    difficulty: '中等',
    tags: ['搜索', '交互', '实战']
  },
  {
    id: 'i40',
    question: '什么是 @Entry 和 @Component 的区别？',
    answer: '1. **@Entry**：标记页面入口组件，一个页面只能有一个 @Entry。它是应用的入口点，系统会为其创建页面实例。\n2. **@Component**：标记自定义组件，可以有多个。用于封装可复用的 UI 逻辑。\n\n**关系**：@Entry 组件本身也是 @Component，但具有页面级别的生命周期。',
    difficulty: '简单',
    tags: ['装饰器', '基础', '概念']
  }
];
