# HCSpringBoard
类似SpringBoard,图标的删除，排序，合并文件夹，仿招商银行的最爱菜单功能。

**效果图**：
![](http://upload-images.jianshu.io/upload_images/292794-017cef510596657e.gif?imageMogr2/auto-orient/strip)

### 说明
项目是个手机银行app，要求做一个仿照招商手机银行的最爱菜单功能，没有找到合适的轮子，就只能自己写个了。功能是在原有项目上做的（原来只能添加和删除），后来抽出来一个demo，因为逻辑较复杂，也没有花太多时间休整代码，复用程度不够高，但是按照下面我写的分析流程来集成该功能并没有什么困难。
希望朋友们帮我指正代码问题和bug。

#### 准备工作
组织菜单数据结构在 `HCAssistant` 类中，配置一个菜单要显示的图片，菜单名称，是否默认显示，是否可删除，跳转页面等。

#### 显示菜单
1，获取存到 `NSUserDefaults` 中的最爱菜单数据，如果没有，从配置中的全部菜单中筛选出默认要显示的数据，并存起来，有了数据之后就使用 `HCSpringBoardView` 类来生成菜单。
2，在 `HCSpringBoardView ` 的初始化方法里，根据一页有几行几列，确定需要的页数，和需要的菜单 frame 并创建 UIScrollView 和 UIPageControl。在根据传进来的模型数组，判断是文件夹 `HCFavoriteFolderModel` 还是图标 `HCFavoriteIconModel` 分别创建对应的视图，`HCFavoriteFolderView` 或 `HCFavoriteIconView` 并设置代理。
*这里的适配很简陋，不要做参考*
#### 模型类 `HCFavoriteIconModel` 和 `HCFavoriteFolderModel` 
使用 **YYModel** 做的数据模型转换，很好用。
* HCFavoriteIconModel
image ，name ， targetController等属性。
需要实现 `NSCoding` 协议用于序列化。

* HCFavoriteFolderModel
'folderName' 文件夹名称，'iconModelsFolderArray' 存该文件夹下的菜单模型，'iconViewsFolderArray' 存该文件夹下的菜单视图。
需要实现 `NSCoding` 协议用于序列化。

#### 视图类 `HCFavoriteIconView` 和 `HCFavoriteFolderView`
* HCFavoriteIconView
主要的是下面两个代理
`favoriteIconDelegate`
`favoriteIconLongGestureDelegate`
例如：
```
@class HCFavoriteIconView;
@protocol HCFavoriteIconDelegate <NSObject>
- (void)deleteIconOfLoveIconView:(HCFavoriteIconView *)iconView;
- (void)pushPageOfLoveIconView:(HCFavoriteIconView *)iconView;
- (void)intoEditingModeOfLoveIconView:(HCFavoriteIconView *)iconView;
@optional
- (void)addIconOfLoveIconView:(HCFavoriteIconView *)iconView;
@end
@protocol HCFavoriteIconLongGestureDelegate <NSObject>
- (void)longGestureStateBegin:(UILongPressGestureRecognizer *)gesture forLoveView:(HCFavoriteIconView *)loveView;
- (void)longGestureStateMove:(UILongPressGestureRecognizer *)gesture forLoveView:(HCFavoriteIconView *)loveView;
- (void)longGestureStateEnd:(UILongPressGestureRecognizer *)gesture forLoveView:(HCFavoriteIconView *)loveView;
- (void)longGestureStateCancel:(UILongPressGestureRecognizer *)gesture forLoveView:(HCFavoriteIconView *)loveView;
@end
```
定义了删除，进入下一页，开始编辑，增加和长按手势的协议。

* HCFavoriteFolderView
同上有两个协议方法都是把事件代理到 'HCSpringBoardView' 中。

#### 删除菜单
`HCSpringBoardView`里有两个属性_favoriteModelArray 和 _favoriteViewArray 分别管理最爱菜单的模型和视图，删除就是删掉对应的元素，并更新视图，还要更新全部菜单列表，以至于在添加的时候不是打勾的状态，可以重新加进来。

#### 进入编辑模式
长按菜单会进入编辑模式，此时用该菜单的模型创建一个拖动的视图，在window上。

仔细观察了招商手机银行的最爱菜单实现，发现拖动图标速度较快的时候并不会做任何处理，所以**它是在一定滑动速度之下，开始检测的当前拖动图标的移动点是在其它图标的中间区域还是四周区域，这样就可以判断出该图标是要换位置还是合并文件夹。**

换位置操作在 `longGestureStateMove ` 方法里。
判断是两图标合并还是合并到已有文件夹逻辑在 `longGestureStateEnd` 里。
至于拖动文件夹就只有换位置的逻辑，相对简单多了。

现在能合并，看看怎么从文件夹里拖出去？
#### 拖出文件夹
`HCFavoriteFolderFloatView`和`HCFavoriteFolderMenuView`用于展示文件夹的图标，在文件夹里的排序和删除逻辑也是和外面的一样且不能再合并简单了很多。
至于拖出去的逻辑是这样的，首先在文件夹的编辑模式下，拖动时也会在一定速度下检测点的位置，判断是不是要换位置，如果拖出了菜单面板，隐藏当前`HCFavoriteFolderFloatView `但是并不删除它（如果删掉，拖出去的view会卡在那里，招商就有个拖出去卡在左边的问题，很可能和这个有关系），此时长按手势的回调方法在`HCFavoriteFolderMenuView`里，将移动事件`longGestureStateMove`代理给`HCSpringBoardView`（`HCFavoriteFolderMenuView`有个代理要设置给`HCSpringBoardView`）。在`HCSpringBoardView`里重新获取该点，排序合并的逻辑和在外面是一样的。
待用户松开手指，调用`longGestureStateEnd`时，一样处理合并逻辑，并将重新拖出的菜单设置代理到`HCSpringBoardView`，不要忘了从父视图删除掉`HCFavoriteFolderFloatView `，就此操作完成。
