# Flutter 布局探索

## 紧约束
紧约束 一词来自于 BoxConstraints 类中的 tight 构造。我们知道，通过 BoxConstraints 约束可以设置宽高的取值区间。在 tight 构造中，最小和最大宽都是 size.width ，最小和最大高都是 size.height 。这就说明在该约束下，被约束者的 尺寸 只有一种取值可能。

* 通过 UnconstrainedBox 可以解除约束，变为无约束
* 通过 Align、Flex、Stack 放宽约束，变为松约束
* 通过 CustomSingleChildLayout  施加新的约束

## 盒约束的传递性
* 盒约束会随着渲染树自上而下进行传递，每个渲染节点都会根据自身的布局特点，对接收到的约束进行处理，然后继续向下传递。这就是 Flutter 布局体系构成的要素之一：盒约束传递链。
## 多子组件
* 多子组件 指的是可以容纳多个子组件的组件，它们一般继承自 MultiChildRenderObjectWidget 。多子组件 的重要性不言而喻，它是布局结构能形成 树状 的关键，如果没有 多子组件 ，那就成一条 链 了。其中最常用的三个有 Flex 、 Wrap 和 Stack 组件



### Flex布局特性
* 默认情况下:
在主轴方向上无限约束；在交叉轴方向上放松约。
* crossAxisAlignment 为 stretch 时: 
在主轴方向上无限约束]；在交叉轴方向上为紧约束，其值为交叉轴方向上约束大小的最大值。
* Flex 的 children 列表中的组件，所受到的约束都是一致的。

* Flexible 组件只能在 Flex 布局中使用。
* FlexFit.tight 时: 会为子级在主轴方向上施加紧约束 ，且数值为主轴剩余空间。
* FlexFit.loose 时: 会为子级在主轴方向上施加松约束 ，且最大值为主轴剩余空间。
* Expanded 组件的等价于 FlexFit.tight 时的 Flexible 组件。
* Spacer 组件的等价于内容空白的 Expanded 组件。

### Wrap 
* Wrap 可以实现流布局，单行的 Wrap 跟 Row 表现几乎一致，单列的 Wrap 则跟 Row 表现几乎一致。但 Row 与 Column 都是单行单列的，Wrap 则突破了这个限制，mainAxis 上空间不足时，则向 crossAxis 上去扩展显示。

### Stack
* Stack 是一个容器，允许将其子部件放在彼此的顶部，第一个子部件将放置在底部。Stack是一种节省应用程序空间的解决方案。可以更改子小部件的顺序以创建简单的动画。
* 一个子组件放在底部，最新的子组件放在顶部。当更改子小部件的顺序时，堆栈将被重绘。如果子widget的数量和顺序不断变化，需要为每个子widget提供一个特定且唯一的Key值，帮助Stack高效管理子widget。
#### Positioned
* left、top 、right、 bottom分别代表离Stack左、上、右、底四边的距离。width和height用于指定需要定位元素的宽度和高度。
* 注意，Positioned的width、height 和其它地方的意义稍微有点区别，此处用于配合left、top 、right、 bottom来定位组件。比如，在水平方向时，你只能指定left、right、width三个属性中的两个，如指定left和width后，right会自动算出(left+width)，如果同时指定三个属性则会报错，垂直方向同理。

## 单子组件
* 相对于多子组件而言，单子组件布局功能比较单一。  
### ConstrainedBox 的布局特性
* ConstrainedBox 系列组件可以为子级施加一个 额外约束。 传入一个 BoxConstraints 约束对象，额外施加给子级。
* 在渲染对象没有子级的情况下，其尺寸是受到盒约束的最小尺寸    
* 特点： 传递约束 = 在父级约束范围内，尽可能取与额外(紧)约束的交集。

### SizedBox 的布局特性
* 从本质上来看 SizedBox 和 ConstrainedBox 都是依赖于 RenderConstrainedBox 渲染对象实现功能的。不同的是 SizedBox 的额外约束(额外约束)是一个指定宽高的 紧约束 。
* 传递约束 = 在父级约束范围内，尽可能取与额外(紧)约束的交集。

### LimitedBox 的布局特性
*  仅在父级约束最大宽/高无限时, 传递约束的最大宽/高会取 LimitedBox 中限制的宽高。

### Align布局特性
* Align 可放松其子级的约束。
* 在 父级约束 范围内, widthFactor、heightFactor 乘子级宽高可修改 Align 尺寸。
* 子级通过 alignment 属性在 Align 区域内定位放置。

### OverflowBox 的布局特性
* 指定的最大最小宽高约束，会 无视 父级约束向子级传递。
* 尺寸为 父级约束 范围的最大值。
* 子级通过 alignment 属性在 OverflowBox 区域内定位放置。

###  SizedOverflowBox 的布局特性
* 不提供额外约束，直接将 父级约束 传递给子级。
* 在 父级约束 范围内，尽量取 size 成员尺寸。
* 子级通过 alignment 属性在 SizedOverflowBox 区域内定位放置。

### FractionallySizedBox 的布局特性
* 宽/高分度值非空时，传递 紧约束，值为父级约束 最大宽/高乘分度。
* 宽/高分度值非空时，父级约束 的最大尺寸。
* 子级通过 alignment 属性在 FractionallySizedBox 区域内定位放置。

### AspectRatio 的布局特性
* 会为子级传递一个定比例的紧约束。    

### Padding 的布局特性
* 父级约束的最大宽/高 - padding 水平/竖直方向的边距 作为传递约束。
* 等于子级尺寸 + padding 水平/竖直方向的边距。*

### FittedBox 的布局特性
* FittedBox 是最复杂的一个，它有三个主要的属性，其中最重要的是 fit 属性。
* BoxFit.fitWidth: 保证宽度填充父级区域，高度按自身尺寸比例缩放。
* BoxFit.fitHeight: 保证高度填充父级区域，宽度按自身尺寸比例缩放。
* BoxFit.contain: 在保证自身尺寸比例的情况下，尽量在父级区域中扩展尺寸。
* BoxFit.cover: 在保证自身尺寸比例的情况下，包裹住父级区域，且尺寸尽可能小。
* BoxFit.none: 子级原尺寸呈现，不做任何修改。
* BoxFit.scaleDown: 在保证自身尺寸比例的情况下，如果子级区域大于父级，会缩放，保证子级在父级区域内

### ColoredBox 尺寸的确定
* 在 ColoredBox 没有子级的情况下，其 尺寸 是受到盒约束的 最小尺寸。

### Overlay
* 通过 Overlay 组件可以完成 组件浮动 的功能，浮动的组件会作为 OverlayEntry 在独立的栈中被维护。
* 获取OverlaySate 我们一般没有必要直接使用 Overlay 组件，因为 MaterialApp 中已经集成了 Overlay 。只需要通过组件获取到 OverlayState ，然后插入 OverlayEntry 节点即可显示浮动组件。
*  OverlayEntry 的创建及插入，浮动组件的构建是在 OverlayEntry 的 builder 回调中进行的。