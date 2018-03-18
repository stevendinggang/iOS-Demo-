//
//  HCSpringBoardView.m
//  HCSpringBoard
//
//  Created by 刘海川 on 16/3/4.
//  Copyright © 2016年 Haichuan Liu. All rights reserved.
//

#import "HCSpringBoardView.h"
#import "AppDelegate.h"
#import "ViewController.h"
#import "HCBankListViewController.h"
#import "HCFavoriteFolderFloatView.h"
#import "HCFavoriteFolderMenuView.h"

@interface HCSpringBoardView()
{
    NSMutableArray *allFrame;//几页图标的frame
    
    CGPoint lastPoint;
    NSMutableArray *indexRectArray;//存放IndexRect
    
    NSInteger pageCount;
    NSArray *iconsOnePageFrameArray;
    NSInteger onePageSize ;
    
    UIScrollView *loveScrollView;
    UIPageControl *lovePageControl;
    
    NSMutableArray *pagesView;
}

@property (nonatomic, strong) UIView *drawLoveIconView;
@property (nonatomic, assign) NSInteger loveFromIndex;
@property (nonatomic, assign) CGPoint previousWindowMovePoint;
@property (nonatomic, strong) UIView *toLoveIconView;

@end

const NSInteger drawIconTag = 222;
@implementation HCSpringBoardView

- (instancetype)initWithFrame:(CGRect)frame modes:(NSMutableArray *)models {
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        
        allFrame = [[NSMutableArray alloc]init];
        NSInteger rowOnePage = [self getOnePageRomByDevice];
        iconsOnePageFrameArray = [self getOnePageIconsFrameArrayWithRowNumber:rowOnePage];
        //单页icon数
        onePageSize = rowOnePage * 3;
        NSInteger allPageSize = [models count];
        pageCount = [self getPagesNumberWithAllIcon:allPageSize
                                     andOnePageIcon:onePageSize];
        
        //根据有多少页，创建对应的frame，icon直接加到scrollView上。
        allFrame = [self getAllPageIconsFrameArrayWithOnePageRect:iconsOnePageFrameArray
                                                        pageCount:pageCount
                                                   andOnePageIcon:onePageSize];
        
        CGRect scrollRect = CGRectMake(0, 40, ScreenWidth, rowOnePage*(ICONIMG_HEIGHT+ICONIMG_LEVEL_SPACE)+1);
        loveScrollView = [[UIScrollView alloc]initWithFrame:scrollRect];
        loveScrollView.bounces = NO;
        loveScrollView.pagingEnabled = YES;
        loveScrollView.backgroundColor = [UIColor whiteColor];
        loveScrollView.showsHorizontalScrollIndicator = NO;
        loveScrollView.showsVerticalScrollIndicator = NO;
        loveScrollView.delegate = self;
        [self addSubview:loveScrollView];
        
        lovePageControl = [[UIPageControl alloc]
                           initWithFrame:CGRectMake(0, CGRectGetMaxY(loveScrollView.frame)+10, ScreenWidth, 20)];
        [lovePageControl setPageIndicatorTintColor:[UIColor lightGrayColor]];
        [lovePageControl setCurrentPageIndicatorTintColor:[UIColor colorWithRed:0.00f green:0.48f blue:0.88f alpha:1.00f]];
//        lovePageControl.backgroundColor = [UIColor redColor];
        [self addSubview: lovePageControl];
        
        pagesView = [[NSMutableArray alloc]init];
        for (int i = 0; i < pageCount; i++) {
            UIView *page = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, CGRectGetHeight(loveScrollView.frame))];
            page.userInteractionEnabled = YES;
            [self addLineAtPageWithOnePageRow:rowOnePage andPageView:page];
            [pagesView addObject:page];
        }
         [self layoutWithPages:scrollRect];
        
        //根据不同的数据模型创建对应的图标和文件夹
        _favoriteViewArray = [[NSMutableArray alloc]init];
        for (int i = 0; i < allPageSize; i++) {
            CGRect loveIconRect = CGRectFromString(allFrame[i]);
            
            id model = models[i];
            if ([model isKindOfClass:[HCFavoriteFolderModel class]]) {
                HCFavoriteFolderModel *folderModel = model;
                HCFavoriteFolderView *loveFolderView = [[HCFavoriteFolderView alloc]initWithFrame:loveIconRect model:folderModel];
                //代理要处理手势和点击等事件
                loveFolderView.loveFolderDelegate = self;
                loveFolderView.loveFolderLongGestureDelegate = self;
                loveFolderView.tag = i;
                [_favoriteViewArray addObject:loveFolderView];
                [loveScrollView addSubview:loveFolderView];
            }
            else if ([model isKindOfClass:[HCFavoriteIconModel class]]) {
                HCFavoriteIconModel *loveIconModel = model;
                HCFavoriteIconView *loveIconView = [[HCFavoriteIconView alloc]initWithFrame:loveIconRect model:loveIconModel];
                //代理要处理手势和点击等事件
                loveIconView.favoriteIconDelegate = self;
                loveIconView.favoriteIconLongGestureDelegate = self;
                loveIconView.tag = i;
                [_favoriteViewArray addObject:loveIconView];
                [loveScrollView addSubview:loveIconView];
            }
        }
        
        _favoriteModelArray = models;
        
    }
    return self;
}

- (void)setSpringBoardDelegate:(id<HCSpringBoardDelegate>)springBoardDelegate {
    _springBoardDelegate = springBoardDelegate;
    if (_springBoardDelegate && [_springBoardDelegate isKindOfClass:[ViewController class]]) {
        ViewController *controller = (ViewController *)_springBoardDelegate;
        self.favoriteMainMenu = controller.favoriteMainMenu;
    }
}
#pragma mark - HCFavoriteIconLongGestureDelegate
- (void)longGestureStateBegin:(UILongPressGestureRecognizer *)gesture forLoveView:(HCFavoriteIconView *)loveView{
    CGPoint beginPoint = [gesture locationInView:loveView];
    lastPoint = CGPointMake(beginPoint.x*1.5, beginPoint.y*1.5);
    //_isDraw 肯定是yes，进入编辑模式的回调在此回调之前
    CGPoint pointAtWindow = [gesture locationInView:AppWindow];
    _previousWindowMovePoint = pointAtWindow;
    loveView.hidden = YES;
}
- (void)longGestureStateMove:(UILongPressGestureRecognizer *)gesture forLoveView:(HCFavoriteIconView *)loveView{
    //    NSLog(@"change");
    CGPoint pointAtWindow = [gesture locationInView:AppWindow];
    CGPoint currentOrigin = CGPointMake(pointAtWindow.x-lastPoint.x, pointAtWindow.y-lastPoint.y);
    if (_isDraw) {
        //_drawLoveIconView在window上的移动
        _drawLoveIconView.frame = CGRectMake(currentOrigin.x, currentOrigin.y, _drawLoveIconView.frame.size.width, _drawLoveIconView.frame.size.height);
        
        CGPoint scrollPoint = [gesture locationInView:loveScrollView];
        NSInteger fromIndex = _loveFromIndex;
        //检测速度 检测是要换位置还是要合并文件夹 和滑动速度相关
        double fingerSpeed = [self fingerMoveSpeadWithPreviousPoint:_previousWindowMovePoint andNowPoint:pointAtWindow];
        //NSLog(@"速度：%f",fingerSpeed);
        //上次的移动点，为计算速度。使用过后更新点
        _previousWindowMovePoint = pointAtWindow;
        
        NSDictionary *toIndexDict = [self toIndexWithPoint:scrollPoint];
        NSInteger toIndex = [toIndexDict[@"toIndex"] integerValue];
        BOOL isFolder = [toIndexDict[@"isFolder"] boolValue];

        if (toIndex != -1 && toIndex < (_favoriteViewArray.count - 1) && fromIndex < (_favoriteViewArray.count - 1)) {
            _toLoveIconView = _favoriteViewArray[toIndex];
            
            if (isFolder && toIndex != fromIndex) {
                //显示出文件夹四格横线的动画
                if ([_toLoveIconView isKindOfClass:[HCFavoriteIconView class]]) {
                    HCFavoriteIconView *toLoveItemView = (HCFavoriteIconView *)_toLoveIconView;
                    toLoveItemView.isShowFolderFlag = YES;
                }
                else if ([_toLoveIconView isKindOfClass:[HCFavoriteFolderView class]]) {
                    HCFavoriteFolderView *toLoveItemView = (HCFavoriteFolderView *)_toLoveIconView;
                    toLoveItemView.isShowScaleFolderLayer = YES;
                }
            }
            else {
                if ([_toLoveIconView isKindOfClass:[HCFavoriteIconView class]]) {
                    HCFavoriteIconView *toLoveItemView = (HCFavoriteIconView *)_toLoveIconView;
                    toLoveItemView.isShowFolderFlag = NO;
                }
                else if ([_toLoveIconView isKindOfClass:[HCFavoriteFolderView class]]) {
                    HCFavoriteFolderView *toLoveItemView = (HCFavoriteFolderView *)_toLoveIconView;
                    toLoveItemView.isShowScaleFolderLayer = NO;
                }
                //2以下的慢速过程中进入的判断，此时可能点已经进入到了文件夹的区域内。
                //可以调整敏感度
                if (fingerSpeed < 2) {//是否合并
                    NSLog(@"toIndex:%ld",toIndex);
                    if (toIndex != fromIndex) {
                        //操作数据源
                        [_favoriteModelArray removeObjectAtIndex:fromIndex];
                        [_favoriteModelArray insertObject:loveView.loveIconModel atIndex:toIndex];
                        [_favoriteViewArray removeObjectAtIndex:fromIndex];
                        [_favoriteViewArray insertObject:loveView atIndex:toIndex];
                        
                        //更新Tag重要
                        _loveFromIndex = toIndex;
                        [self updateTags];
                        //移动动画
                        [self deleteIconLayoutWithMenuIcons:_favoriteViewArray];
                        
                    }
                }
            }
        }
        //判断是否换页面
        [self toPageWithPoint:scrollPoint];
    }
}

- (void)longGestureStateEnd:(UILongPressGestureRecognizer *)gesture forLoveView:(HCFavoriteIconView *)loveView{
    NSLog(@"end");
    loveView.hidden = NO;
    
    if (_isDraw) {
        _isDraw = NO;
        [_drawLoveIconView removeFromSuperview];
        if ([_toLoveIconView isKindOfClass:[HCFavoriteIconView class]]) {
            HCFavoriteIconView *toLoveItemView = (HCFavoriteIconView *)_toLoveIconView;
            toLoveItemView.isShowFolderFlag = NO;
        }
        else if ([_toLoveIconView isKindOfClass:[HCFavoriteFolderView class]]) {
            HCFavoriteFolderView *toLoveItemView = (HCFavoriteFolderView *)_toLoveIconView;
            toLoveItemView.isShowScaleFolderLayer = NO;
        }
        
        //判断当前点在不在文件夹里
        CGPoint scrollPoint = [gesture locationInView:loveScrollView];
        NSDictionary *toIndexDict = [self toIndexWithPoint:scrollPoint];
        NSInteger toIndex = [toIndexDict[@"toIndex"] integerValue];
        NSInteger fromIndex = _loveFromIndex;
        BOOL isFolder = [toIndexDict[@"isFolder"] boolValue];
        
        if (toIndex != -1 && toIndex < (_favoriteViewArray.count - 1) && fromIndex < (_favoriteViewArray.count - 1)) {
            _toLoveIconView = _favoriteViewArray[toIndex];// ?
            if (isFolder && toIndex != fromIndex) {
                NSLog(@"进行文件夹的合并");
                //操作数据
                /*
                 1，这里先做生成文件夹，之后再做判断落点是不是文件夹。进行已有文件夹的合并。
                 2，在_favoriteModelArray里面只有HCFavoriteIconModel的情况下，插入HCFavoriteIconModel的模型。
                 */
                HCFavoriteIconView *fromView = _favoriteViewArray[fromIndex];
                UIView *toView = _favoriteViewArray[toIndex];
                HCFavoriteIconModel *fromModel = _favoriteModelArray[fromIndex];
                id toModel = _favoriteModelArray[toIndex];
                //合并到已有文件夹
                if ([toView isKindOfClass:[HCFavoriteFolderView class]]) {
                    [_favoriteModelArray removeObjectAtIndex:fromIndex];
                    HCFavoriteFolderModel *folderModel = toModel;
                    [folderModel.iconModelsFolderArray addObject:fromModel];
                    
                    [_favoriteViewArray removeObjectAtIndex:fromIndex];
                    [folderModel.iconViewsFolderArray addObject:fromView];
                    
                    [folderModel updateTagFolderModel];
                    //更新显示的小图标
                    HCFavoriteFolderView *folderView = (HCFavoriteFolderView *)toView;
                    folderView.loveFolderModel = folderModel;
                }
                //两图标合并
                else if ([toView isKindOfClass:[HCFavoriteIconView class]]) {
                    HCFavoriteFolderModel *folderModel = [[HCFavoriteFolderModel alloc]init];
                    folderModel.folderName = @"文件夹";
                    folderModel.iconViewsFolderArray = [@[toView,fromView] mutableCopy];
                    folderModel.iconModelsFolderArray = [@[toModel,fromModel] mutableCopy];
                    
                    CGRect loveFolderRect = CGRectFromString(allFrame[toIndex]);
                    HCFavoriteFolderView *loveFolderView = [[HCFavoriteFolderView alloc]initWithFrame:loveFolderRect model:folderModel];
                    loveFolderView.loveFolderDelegate = self;
                    loveFolderView.loveFolderLongGestureDelegate = self;
                    
                    //加动画
                    CAKeyframeAnimation *rockAnimation = [CAKeyframeAnimation animation];
                    rockAnimation.keyPath = @"transform.rotation";
                    rockAnimation.values = @[@(angelToRandian(-3)),@(angelToRandian(3)),@(angelToRandian(-3))];
                    rockAnimation.repeatCount = MAXFLOAT;
                    rockAnimation.duration = 0.3;
                    [loveFolderView.layer addAnimation:rockAnimation forKey:@"rocking"];
                    
                    [_favoriteModelArray replaceObjectAtIndex:toIndex withObject:folderModel];
                    [_favoriteModelArray removeObjectAtIndex:fromIndex];
                    
                    [_favoriteViewArray replaceObjectAtIndex:toIndex withObject:loveFolderView];
                    [_favoriteViewArray removeObjectAtIndex:fromIndex];
                }
                
                [self updateTags];
                //刷新界面
                [self updateMenuUIWithLoveIconArray];
            }
            else {
                if (toIndex != fromIndex) {
                    [_favoriteModelArray removeObjectAtIndex:fromIndex];
                    [_favoriteModelArray insertObject:loveView atIndex:toIndex];
                    [_favoriteViewArray removeObjectAtIndex:fromIndex];
                    [_favoriteViewArray insertObject:loveView atIndex:toIndex];
                    //更新Tag重要
                    _loveFromIndex = toIndex;
                    [self updateTags];
                    
                    [self deleteIconLayoutWithMenuIcons:_favoriteViewArray];
                    //交换之后本地序列化
                }
            }
        }
    }
}
- (void)longGestureStateCancel:(UILongPressGestureRecognizer *)gesture forLoveView:(HCFavoriteIconView *)loveView{
    NSLog(@"cancel");
    loveView.hidden = NO;
    
    if (_isDraw) {
        _isDraw = NO;
        [_drawLoveIconView removeFromSuperview];
        if ([_toLoveIconView isKindOfClass:[HCFavoriteIconView class]]) {
            HCFavoriteIconView *toLoveItemView = (HCFavoriteIconView *)_toLoveIconView;
            toLoveItemView.isShowFolderFlag = NO;
        }
        else if ([_toLoveIconView isKindOfClass:[HCFavoriteFolderView class]]) {
            HCFavoriteFolderView *toLoveItemView = (HCFavoriteFolderView *)_toLoveIconView;
            toLoveItemView.isShowScaleFolderLayer = NO;
        }
    }
}

#pragma mark - HCLoveFolderLongGestureDelegate
//文件夹的逻辑就是排序，比较简单。
- (void)longGestureStateBegin:(UILongPressGestureRecognizer *)gesture forLoveFolderView:(HCFavoriteFolderView *)loveFolderView{
    loveFolderView.hidden = YES;
    
    CGPoint beginPoint = [gesture locationInView:loveFolderView];
    lastPoint = CGPointMake(beginPoint.x*1.5, beginPoint.y*1.5);
    CGPoint pointAtWindow = [gesture locationInView:AppWindow];
    _previousWindowMovePoint = pointAtWindow;
}
- (void)longGestureStateMove:(UILongPressGestureRecognizer *)gesture forLoveFolderView:(HCFavoriteFolderView *)loveFolderView{
    CGPoint pointAtWindow = [gesture locationInView:AppWindow];
    
    CGPoint currentOrigin = CGPointMake(pointAtWindow.x-lastPoint.x, pointAtWindow.y-lastPoint.y);
    if (_isDraw) {
        
        _drawLoveIconView.frame = CGRectMake(currentOrigin.x, currentOrigin.y, _drawLoveIconView.frame.size.width, _drawLoveIconView.frame.size.height);
        
        CGPoint scrollPoint = [gesture locationInView:loveScrollView];
        
        NSInteger fromIndex = _loveFromIndex;
        
        //检测速度
        double fingerSpeed = [self fingerMoveSpeadWithPreviousPoint:_previousWindowMovePoint andNowPoint:pointAtWindow];
        _previousWindowMovePoint = pointAtWindow;
        if (fingerSpeed < 2) {
            
            NSDictionary *toIndexDict = [self toIndexWithPoint:scrollPoint];
            NSInteger toIndex = [toIndexDict[@"toIndex"] integerValue];
            
            if (toIndex != -1 && toIndex != fromIndex && toIndex < (_favoriteViewArray.count - 1) && fromIndex < (_favoriteViewArray.count - 1)) {
                _toLoveIconView = _favoriteViewArray[toIndex];
                
                [_favoriteModelArray removeObjectAtIndex:fromIndex];
                [_favoriteModelArray insertObject:loveFolderView.loveFolderModel atIndex:toIndex];
                [_favoriteViewArray removeObjectAtIndex:fromIndex];
                [_favoriteViewArray insertObject:loveFolderView atIndex:toIndex];
                //更新Tag重要
                _loveFromIndex = toIndex;
                [self updateTags];
                
                [self deleteIconLayoutWithMenuIcons:_favoriteViewArray];
            }
        }

        [self toPageWithPoint:scrollPoint];
    }
}
- (void)longGestureStateEnd:(UILongPressGestureRecognizer *)gesture forLoveFolderView:(HCFavoriteFolderView *)loveFolderView{
    loveFolderView.hidden = NO;
    
    if (_isDraw) {
        _isDraw = NO;
        [_drawLoveIconView removeFromSuperview];
    }
}
- (void)longGestureStateCancel:(UILongPressGestureRecognizer *)gesture forLoveFolderView:(HCFavoriteFolderView *)loveFolderView{
    loveFolderView.hidden = NO;
    
    if (_isDraw) {
        _isDraw = NO;
        [_drawLoveIconView removeFromSuperview];
    }
}

#pragma mark - OutsideFolderGestureDelegate
//这里比较重要，是从文件夹里拖出来，将那里的手势代理到这里，逻辑和前面的一样。
- (void)loveFolderOutsideBeginGesture:(UILongPressGestureRecognizer *)gesture
                             menuView:(HCFavoriteFolderMenuView *)menuView
                             fromView:(HCFavoriteIconView *)iconView {
    _loveFromIndex = 0;
    _isDraw =  YES;
}
- (void)loveFolderOutsideMoveGesture:(UILongPressGestureRecognizer *)gesture menuView:(HCFavoriteFolderMenuView *)menuView fromView:(HCFavoriteIconView *)iconView{
    
    CGPoint pointAtWindow = [gesture locationInView:AppWindow];
    CGPoint scrollPoint = [gesture locationInView:loveScrollView];
    NSInteger fromIndex =_loveFromIndex;
    double fingerSpeed = [self fingerMoveSpeadWithPreviousPoint:_previousWindowMovePoint andNowPoint:pointAtWindow];
    _previousWindowMovePoint = pointAtWindow;
    
    NSDictionary *toIndexDict = [self toIndexWithPoint:scrollPoint];
    NSInteger toIndex = [toIndexDict[@"toIndex"] integerValue];
    
    BOOL isFolder = [toIndexDict[@"isFolder"] boolValue];
    
    if (toIndex != -1 && toIndex < (_favoriteViewArray.count - 1) && fromIndex < (_favoriteViewArray.count - 1)) {
        _toLoveIconView = _favoriteViewArray[toIndex];
        if (isFolder && toIndex != fromIndex) {
            if ([_toLoveIconView isKindOfClass:[HCFavoriteIconView class]]) {
                HCFavoriteIconView *toLoveItemView = (HCFavoriteIconView *)_toLoveIconView;
                toLoveItemView.isShowFolderFlag = YES;
            }
            else if ([_toLoveIconView isKindOfClass:[HCFavoriteFolderView class]]) {
                HCFavoriteFolderView *toLoveItemView = (HCFavoriteFolderView *)_toLoveIconView;
                toLoveItemView.isShowScaleFolderLayer = YES;
            }
        }
        else {
            if ([_toLoveIconView isKindOfClass:[HCFavoriteIconView class]]) {
                HCFavoriteIconView *toLoveItemView = (HCFavoriteIconView *)_toLoveIconView;
                toLoveItemView.isShowFolderFlag = NO;
            }
            else if ([_toLoveIconView isKindOfClass:[HCFavoriteFolderView class]]) {
                HCFavoriteFolderView *toLoveItemView = (HCFavoriteFolderView *)_toLoveIconView;
                toLoveItemView.isShowScaleFolderLayer = NO;
            }
            
            if (fingerSpeed < 2) {
                if (toIndex != fromIndex) {
                    
                    [_favoriteModelArray removeObjectAtIndex:fromIndex];
                    [_favoriteModelArray insertObject:iconView.loveIconModel atIndex:toIndex];
                    [_favoriteViewArray removeObjectAtIndex:fromIndex];
                    [_favoriteViewArray insertObject:iconView atIndex:toIndex];
                    //更新Tag重要
                    _loveFromIndex = toIndex;
                    [self updateTags];
                    
                    [self deleteIconLayoutWithMenuIcons:_favoriteViewArray];
                }
            }
            
        }
        [self toPageWithPoint:scrollPoint];
    }
    
}
- (void)loveFolderOutsideEndGesture:(UILongPressGestureRecognizer *)gesture menuView:(HCFavoriteFolderMenuView *)menuView fromView:(HCFavoriteIconView *)iconView{
    iconView.hidden = NO;
    
    if (_isDraw) {
        _isDraw = NO;
        [_drawLoveIconView removeFromSuperview];
        if ([_toLoveIconView isKindOfClass:[HCFavoriteIconView class]]) {
            HCFavoriteIconView *toLoveItemView = (HCFavoriteIconView *)_toLoveIconView;
            toLoveItemView.isShowFolderFlag = NO;
        }
        else if ([_toLoveIconView isKindOfClass:[HCFavoriteFolderView class]]) {
            HCFavoriteFolderView *toLoveItemView = (HCFavoriteFolderView *)_toLoveIconView;
            toLoveItemView.isShowScaleFolderLayer = NO;
        }
        
        //判断当前点在不在文件夹里
        CGPoint scrollPoint = [gesture locationInView:loveScrollView];
        NSDictionary *toIndexDict = [self toIndexWithPoint:scrollPoint];
        NSInteger toIndex = [toIndexDict[@"toIndex"] integerValue];
        NSInteger fromIndex = _loveFromIndex;
        BOOL isFolder = [toIndexDict[@"isFolder"] boolValue];
        
        if (toIndex != -1 && toIndex < (_favoriteViewArray.count - 1) && fromIndex < (_favoriteViewArray.count - 1)) {
            _toLoveIconView = _favoriteViewArray[toIndex];
            if (isFolder && toIndex != fromIndex) {
                
                HCFavoriteIconView *fromView = _favoriteViewArray[fromIndex];
                UIView *toView = _favoriteViewArray[toIndex];
                HCFavoriteIconModel *fromModel = _favoriteModelArray[fromIndex];
                id toModel = _favoriteModelArray[toIndex];
                
                //合并到已有文件夹
                if ([toView isKindOfClass:[HCFavoriteFolderView class]]) {
                    [_favoriteModelArray removeObjectAtIndex:fromIndex];
                    HCFavoriteFolderModel *folderModel = toModel;
                    [folderModel.iconModelsFolderArray addObject:fromModel];
                    
                    [_favoriteViewArray removeObjectAtIndex:fromIndex];
                    [folderModel.iconViewsFolderArray addObject:fromView];
                    
                    [folderModel updateTagFolderModel];
                    //更新显示的小图标
                    HCFavoriteFolderView *folderView = (HCFavoriteFolderView *)toView;
                    folderView.loveFolderModel = folderModel;
                }
                //两图标合并
                else if ([toView isKindOfClass:[HCFavoriteIconView class]]) {
                    HCFavoriteFolderModel *folderModel = [[HCFavoriteFolderModel alloc]init];
                    folderModel.folderName = @"文件夹";
                    folderModel.iconViewsFolderArray = [@[toView,fromView] mutableCopy];
                    folderModel.iconModelsFolderArray = [@[toModel,fromModel] mutableCopy];
                    
                    CGRect loveFolderRect = CGRectFromString(allFrame[toIndex]);
                    HCFavoriteFolderView *loveFolderView = [[HCFavoriteFolderView alloc]initWithFrame:loveFolderRect model:folderModel];
                    loveFolderView.loveFolderDelegate = self;
                    loveFolderView.loveFolderLongGestureDelegate = self;
                    
                    //加动画
                    CAKeyframeAnimation *rockAnimation = [CAKeyframeAnimation animation];
                    rockAnimation.keyPath = @"transform.rotation";
                    rockAnimation.values = @[@(angelToRandian(-3)),@(angelToRandian(3)),@(angelToRandian(-3))];
                    rockAnimation.repeatCount = MAXFLOAT;
                    rockAnimation.duration = 0.3;
                    [loveFolderView.layer addAnimation:rockAnimation forKey:@"rocking"];
                    
                    [_favoriteModelArray removeObjectAtIndex:fromIndex];
                    [_favoriteModelArray replaceObjectAtIndex:toIndex withObject:folderModel];
                    
                    [_favoriteViewArray removeObjectAtIndex:fromIndex];
                    [_favoriteViewArray replaceObjectAtIndex:toIndex withObject:loveFolderView];
                }
                
                [self updateTags];
                //刷新界面用_loveIconArray
                [self updateMenuUIWithLoveIconArray];
            }
            else {
                if (toIndex != fromIndex) {
                    [_favoriteModelArray removeObjectAtIndex:fromIndex];
                    [_favoriteModelArray insertObject:iconView atIndex:toIndex];
                    [_favoriteViewArray removeObjectAtIndex:fromIndex];
                    [_favoriteViewArray insertObject:iconView atIndex:toIndex];
                    //更新Tag重要
                    _loveFromIndex = toIndex;
                    [self updateTags];
                    
                    [self deleteIconLayoutWithMenuIcons:_favoriteViewArray];
                    //交换之后本地序列化
                }
            }
        }
    }
    [self updateMenuUIWithLoveIconArray];
    //重要，重设代理
    iconView.favoriteIconDelegate = self;
    iconView.favoriteIconLongGestureDelegate = self;
}
- (void)loveFolderOutsideCancelGesture:(UILongPressGestureRecognizer *)gesture menuView:(HCFavoriteFolderMenuView *)menuView fromView:(HCFavoriteIconView *)iconView{
    iconView.hidden = NO;
    
    [self updateMenuUIWithLoveIconArray];
    //重设代理
    iconView.favoriteIconDelegate = self;
    iconView.favoriteIconLongGestureDelegate = self;
}

#pragma mark - HCLoveFolderDelegate
//进入文件夹
- (void)openLoveFolderOfLoveFolderView:(HCFavoriteFolderView *)loveFolderView {
    HCFavoriteFolderFloatView *folderFloatView = [[HCFavoriteFolderFloatView alloc]initWithModel:loveFolderView.loveFolderModel];
    folderFloatView.loveFolderView = loveFolderView;
    folderFloatView.loveMainModels = _favoriteModelArray;
    folderFloatView.myControllerDelegate = self.springBoardDelegate;
    folderFloatView.mySpringBoardDelegate = self;
    [AppWindow addSubview:folderFloatView];
    
    folderFloatView.alpha = 0;
    [UIView animateWithDuration:0.3 animations:^{
        folderFloatView.alpha = 1;
    }];
}
//编辑模式
- (void)intoEditingModeOfLoveFolderView:(HCFavoriteFolderView *)loveFolderView {
    HCFavoriteFolderView *drawIcon = (HCFavoriteFolderView *)[self drawIconWithCurrentIcon:loveFolderView];
    
    [UIView animateWithDuration:0.3 animations:^{
        drawIcon.transform = CGAffineTransformMakeScale(1.5, 1.5);
        drawIcon.alpha = .8f;
    }];
    
    if (!_isEdit) {
        [self showEditButton];
    }
}
#pragma mark - HCFavoriteIconDelegate 普通图标的编辑模式，删除，下一页操作
- (void)deleteIconOfLoveIconView:(HCFavoriteIconView *)iconView {
    [UIView animateWithDuration:.3 animations:^{
        iconView.transform = CGAffineTransformMakeScale(0.1, 0.1);
    } completion:^(BOOL finished) {
        
        [_favoriteModelArray removeObjectAtIndex:iconView.tag];
        [_favoriteViewArray removeObjectAtIndex:iconView.tag];
        
        [self deleteIconLayoutWithMenuIcons:_favoriteViewArray];
        [iconView removeFromSuperview];
        //这里是更新全部菜单的是否显示属性。
        [self updateIconModelDisplay:self.favoriteMainMenu nodeIndex:iconView.loveIconModel.nodeIndex];
        [self archiverIconModelsArray];
        [self archiverLoveMenuMainModel];
        
        if (_isEdit) {
            [self showEditButton];
        }
    }];
}
- (void)pushPageOfLoveIconView:(HCFavoriteIconView *)iconView {
    if (!_isEdit) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"下一页" message:iconView.loveIconModel.targetController delegate:nil cancelButtonTitle:@"返回" otherButtonTitles:nil, nil];
        [alert show];
    }
    else {
        [self doneButtonAction:nil];
    }
}
- (void)intoEditingModeOfLoveIconView:(HCFavoriteIconView *)iconView {
    if ([iconView.loveIconModel.name isEqualToString:@"添加"]) {
        return;
    }
    
    HCFavoriteIconView *drawIcon = (HCFavoriteIconView *)[self drawIconWithCurrentIcon:iconView];
    
    [UIView animateWithDuration:0.3 animations:^{
        drawIcon.transform = CGAffineTransformMakeScale(1.5, 1.5);
        drawIcon.alpha = .8f;
    }];
    
    if (!_isEdit) {
        [self showEditButton];
    }
}
- (void)addIconOfLoveIconView:(HCFavoriteIconView *)iconView {
    if (_springBoardDelegate && [_springBoardDelegate isKindOfClass:[ViewController class]]) {
        ViewController *controller = (ViewController *)_springBoardDelegate;
        
        HCBankListViewController *menuListViewController = [[HCBankListViewController alloc]initWithMainMenu:controller.favoriteMainMenu.itemList];
        menuListViewController.allMenuModels = _favoriteModelArray;
        menuListViewController.bankListDelegate = controller;
        [controller.navigationController pushViewController:menuListViewController animated:YES];
    }
}

#pragma mark -
- (void)showEditButton;
{
    _isEdit = YES;
    
    CAKeyframeAnimation *rockAnimation = [CAKeyframeAnimation animation];
    rockAnimation.keyPath = @"transform.rotation";
    rockAnimation.values = @[@(angelToRandian(-3)),@(angelToRandian(3)),@(angelToRandian(-3))];
    rockAnimation.repeatCount = MAXFLOAT;
    rockAnimation.duration = 0.3;
    
    for (int i=0; i<[_favoriteViewArray count]-1; i++) {
        UIView *menuItemView = [_favoriteViewArray objectAtIndex:i];
        //更新tag重要
        menuItemView.tag = i;
        if ([menuItemView isKindOfClass:[HCFavoriteIconView class]]) {
            HCFavoriteIconView *itemView = (HCFavoriteIconView *)menuItemView;
            if (itemView.loveIconModel.isReadOnly) {
                itemView.isEditing = NO;
            }
            else {
                itemView.isEditing = YES;
            }
        }
        [menuItemView.layer addAnimation:rockAnimation forKey:@"rocking"];
    }
    
    if (_springBoardDelegate && [_springBoardDelegate isKindOfClass:[ViewController class]]) {
        ViewController *controller = (ViewController *)_springBoardDelegate;
        
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        rightButton.frame  = CGRectMake(0, 0, 30, 25);
        [rightButton setTitleColor:[UIColor colorWithRed:0.02f green:0.45f blue:0.88f alpha:1.00f] forState:UIControlStateNormal];
        rightButton.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [rightButton setTitle:@"完成" forState:UIControlStateNormal];
        [rightButton addTarget:self action:@selector(doneButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
        controller.navigationItem.rightBarButtonItem = rightItem;
    }
}
- (void)deleteIconLayoutWithMenuIcons:(NSMutableArray *)array {
    [UIView animateWithDuration:.5 animations:^{
        for (int i = 0; i < array.count; i++) {
            CGRect rect = CGRectFromString(allFrame[i]);
            
            UIView *iconView = array[i];
            iconView.frame = rect;
        }
    }];
}
#pragma mark - 变更model display属性
- (void)updateIconModelDisplay:(HCFavoriteIconModel *)allModel nodeIndex:(NSString *)nodel {
    if ([allModel.type isEqualToString:kViewcontroller] || [allModel.type isEqualToString:kWebLocal] || [allModel.type isEqualToString:kWebNetwork]) {
        if ([allModel.nodeIndex isEqualToString:nodel]) {
            allModel.display = NO;
        }
    }
    else if ([allModel.type isEqualToString:kMenuList] || [allModel.type isEqualToString:kMenuIcons]) {
        for (int i = 0; i < allModel.itemList.count; i++) {
            [self updateIconModelDisplay:allModel.itemList[i] nodeIndex:nodel];
        }
    }
}
#pragma mark - doneButtonAction
- (void)doneButtonAction:(id)sender {
    if (_isEdit) {
        [self archiverIconModelsArray];
        for (int i=0; i<[_favoriteViewArray count]-1; i++) {
            UIView *menuItemView = [_favoriteViewArray objectAtIndex:i];
            if ([menuItemView isKindOfClass:[HCFavoriteIconView class]]) {
                HCFavoriteIconView *menuItem = (HCFavoriteIconView *)menuItemView;
                menuItem.isEditing = NO;
            }
            [menuItemView.layer removeAnimationForKey:@"rocking"];
        }
        if (_springBoardDelegate && [_springBoardDelegate isKindOfClass:[ViewController class]]) {
            ViewController *controller = (ViewController *)_springBoardDelegate;
            controller.navigationItem.rightBarButtonItem = nil;
        }
        _isEdit = NO;
        
    }
}
#pragma mark - 序列化 iconModelsArray 数据
//序列化最爱菜单
- (void)archiverIconModelsArray{
    NSUserDefaults *userDefaultsLoveMenu = [[NSUserDefaults alloc]initWithSuiteName:kUserDefaultSuiteNameLoveMenu];
    NSData *iconModelsArrayData = [NSKeyedArchiver archivedDataWithRootObject:_favoriteModelArray];
    [userDefaultsLoveMenu setObject:iconModelsArrayData forKey:kUserDefaultLoveMenuKey];
    [userDefaultsLoveMenu synchronize];
}

//序列化总菜单
- (void)archiverLoveMenuMainModel{
    if (_springBoardDelegate && [_springBoardDelegate isKindOfClass:[ViewController class]]) {
        ViewController *controller = (ViewController *)_springBoardDelegate;
        NSDictionary *dict = [[controller.favoriteMainMenu modelToJSONObject] mutableCopy];
        [dict writeToFile:DOCUMENT_FOLDER(kMenuFileName) atomically:YES];
    }
}
#pragma mark - 拖动View
- (UIView *)drawIconWithCurrentIcon:(UIView *)icon {
    
    self.isDraw = YES;
    _drawLoveIconView = [AppWindow viewWithTag:drawIconTag];
    if (_drawLoveIconView) {
        return _drawLoveIconView;
    }
    
    CGRect iconRect = icon.frame;
    CGRect drawIconRect = [loveScrollView convertRect:iconRect toView:AppWindow];
    
    if ([icon isKindOfClass:[HCFavoriteFolderView class]]) {
        HCFavoriteFolderView *folderCopyView = (HCFavoriteFolderView *)icon;
        _drawLoveIconView = [[HCFavoriteFolderView alloc]initWithFrame:drawIconRect model:folderCopyView.loveFolderModel];
        _drawLoveIconView.tag = drawIconTag;
        [AppWindow addSubview:_drawLoveIconView];
        [_drawLoveIconView.layer removeAnimationForKey:@"rocking"];
    }
    else if ([icon isKindOfClass:[HCFavoriteIconView class]]) {
        HCFavoriteIconView *iconCopyView = (HCFavoriteIconView *)icon;
        _drawLoveIconView = [[HCFavoriteIconView alloc]initWithFrame:drawIconRect model:iconCopyView.loveIconModel];
        HCFavoriteIconView *drawIconView = (HCFavoriteIconView *)_drawLoveIconView;
        _drawLoveIconView.tag = drawIconTag;
        drawIconView.isEditing = YES;
        [AppWindow addSubview:_drawLoveIconView];
        [_drawLoveIconView.layer removeAnimationForKey:@"rocking"];
    }
    
    _loveFromIndex = icon.tag;
    
    return _drawLoveIconView;
    
}
#pragma mark - 更新Tags和更新MenuUI
- (void)updateTags {
    for (int i = 0; i < _favoriteViewArray.count; i++) {
        HCFavoriteIconView *loveView = _favoriteViewArray[i];
        loveView.tag = i;
    }
}
- (void)updateMenuUIWithLoveIconArray {
    NSArray *scrollSubviews = [loveScrollView subviews];
    for (int i = 0; i < scrollSubviews.count; i++) {
        UIView *obj = scrollSubviews[i];
        if ([obj isKindOfClass:[HCFavoriteIconView class]] || [obj isKindOfClass:[HCFavoriteFolderView class]]) {
            [obj removeFromSuperview];
        }
    }
    
    for (int i = 0; i < _favoriteViewArray.count; i++) {
        UIView *obj = _favoriteViewArray[i];
        obj.frame = CGRectFromString(allFrame[i]);
        [loveScrollView addSubview:obj];
    }
    
    pageCount = [self getPagesNumberWithAllIcon:_favoriteViewArray.count
                                 andOnePageIcon:onePageSize];
    lovePageControl.numberOfPages = pageCount;
    loveScrollView.contentSize = CGSizeMake(ScreenWidth * pageCount, CGRectGetHeight(loveScrollView.frame));
    if (loveScrollView.contentOffset.x >= loveScrollView.contentSize.width) {
        lovePageControl.currentPage = lovePageControl.numberOfPages-1;
    }
    
    [self setCurrentPage:lovePageControl.currentPage];
}
- (void)updateAllFramesArray:(NSArray *)allIcons {
    pageCount = [self getPagesNumberWithAllIcon:allIcons.count
                                 andOnePageIcon:onePageSize];
    allFrame = [self getAllPageIconsFrameArrayWithOnePageRect:iconsOnePageFrameArray
                                                    pageCount:pageCount
                                               andOnePageIcon:onePageSize];
}
- (void)updateMenuIconsFrame {
    [self updateAllFramesArray:_favoriteViewArray];
    for (int i = 0; i < _favoriteViewArray.count; i++) {
        UIView *iconView = _favoriteViewArray[i];
        iconView.tag = i;
        iconView.frame = CGRectFromString(allFrame[i]);
    }
}
#pragma mark - 判断是那个toIndex
/*
 字典：{toIndex:NSNumber, isFolder,NSNumber}
 暂时不用
 */
- (NSDictionary *)toIndexWithPoint:(CGPoint)scrollPoint{
    //-1不判断增加的那个icon
    scrollPoint = CGPointMake(scrollPoint.x, scrollPoint.y);
    for (int i = 0; i < indexRectArray.count-1; i++) {
        HCIndexRect *indexRect = indexRectArray[i];
        if (CGRectContainsPoint(indexRect.iconFolderRect, scrollPoint)) {
            return @{@"toIndex":@(indexRect.iconIndex),@"isFolder":@YES};
        }
        else if (CGRectContainsPoint(indexRect.iconRect, scrollPoint)) {
            
            return @{@"toIndex":@(indexRect.iconIndex),@"isFolder":@NO};
        }
    }
    return @{@"toIndex":@(-1),@"isFolder":@NO};
}
- (NSInteger)toIndexChangeWithPoint:(CGPoint)scrollPoint{
    scrollPoint = CGPointMake(scrollPoint.x, scrollPoint.y);
    for (int i = 0; i < indexRectArray.count-1; i++) {
        HCIndexRect *indexRect = indexRectArray[i];
        if (CGRectContainsPoint(indexRect.iconRect, scrollPoint)) {
            return indexRect.iconIndex;
        }
    }
    return -1;
}
- (NSInteger)toIndexFolderWithPoint:(CGPoint)scrollPoint{
    scrollPoint = CGPointMake(scrollPoint.x, scrollPoint.y);
    for (int i = 0; i < indexRectArray.count-1; i++) {
        HCIndexRect *indexRect = indexRectArray[i];
        if (CGRectContainsPoint(indexRect.iconFolderRect, scrollPoint)) {
            return indexRect.iconIndex;
        }
    }
    return -1;
}
#pragma mark - 判断是不是要切换页
- (void)toPageWithPoint:(CGPoint)scrollPoint{
    CGRect scrollViewLiftSideRect = CGRectMake(0+loveScrollView.contentOffset.x, 0+loveScrollView.contentOffset.y, 30, CGRectGetHeight(loveScrollView.frame));
    CGRect scrollViewRightSideRect = CGRectMake(CGRectGetWidth(loveScrollView.frame)-30+loveScrollView.contentOffset.x, 0+loveScrollView.contentOffset.y, 30, CGRectGetHeight(loveScrollView.frame));
    if (CGRectContainsPoint(scrollViewLiftSideRect, scrollPoint)) {
        if (lovePageControl.currentPage > 0) {
            //可向左切换切换
            lovePageControl.currentPage -= 1;
            CGPoint offSet = CGPointMake(lovePageControl.currentPage*CGRectGetWidth(loveScrollView.frame), 0);
            [loveScrollView setContentOffset:offSet animated:YES];
        }
    }
    else if (CGRectContainsPoint(scrollViewRightSideRect, scrollPoint)) {
        if (lovePageControl.currentPage < lovePageControl.numberOfPages-1) {
            //可向右切换切换
            lovePageControl.currentPage += 1;
            CGPoint offSet = CGPointMake(lovePageControl.currentPage*CGRectGetWidth(loveScrollView.frame), 0);
            [loveScrollView setContentOffset:offSet animated:YES];
        }
    }
}

#pragma mark - 判断手指滑动速度
- (double)fingerMoveSpeadWithPreviousPoint:(CGPoint)prePoint andNowPoint:(CGPoint)nowPoint {
    CGFloat x = (prePoint.x - nowPoint.x)*(prePoint.x - nowPoint.x);
    CGFloat y = (prePoint.y - nowPoint.y)*(prePoint.y - nowPoint.y);
    return sqrt(x+y);
}
#pragma mark - 设置currentPage
-(void)setCurrentPage:(NSInteger)pageIndex;
{
    lovePageControl.currentPage = pageIndex;
    
    [loveScrollView setContentOffset:CGPointMake(lovePageControl.currentPage*CGRectGetWidth(loveScrollView.frame), 0)];
}
-(NSInteger)getCurrentPage;
{
    return lovePageControl.currentPage;
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    lovePageControl.currentPage = scrollView.contentOffset.x/CGRectGetWidth(scrollView.frame);
}

#pragma mark - 贴上PageView
- (void)layoutWithPages:(CGRect)pageRect{
    loveScrollView.contentOffset = CGPointMake(0.0, 0.0);
    loveScrollView.contentSize = CGSizeMake(CGRectGetWidth(pageRect) * [pagesView count], CGRectGetHeight(loveScrollView.frame));
    lovePageControl.numberOfPages = [pagesView count];
    lovePageControl.currentPage = 0;
    
    for(int i=0;i<[pagesView count];i++) {
        UIView *page = [pagesView objectAtIndex: i];
        CGRect bounds = page.bounds;
        CGRect frame = CGRectMake(CGRectGetWidth(pageRect) * i, 0.0, CGRectGetWidth(pageRect), CGRectGetHeight(pageRect));
        page.frame = frame;
        page.bounds = bounds;
        [loveScrollView addSubview: page];
    }
}
#pragma mark - 给pageView加横竖线 破代码待优化
- (void)addLineAtPageWithOnePageRow:(NSInteger)rowOnePage andPageView:(UIView *)page {
    //横线
    for (int i = 0 ; i < rowOnePage + 1; i++) {
        UIView *line = nil;
        line = [[UIView alloc]initWithFrame:CGRectMake(0, i*(ICONIMG_HEIGHT+ICONIMG_VERTICAL_SPACE), ScreenWidth, 0.5)];
        line.backgroundColor = [UIColor lightGrayColor];
        line.alpha = 0.5;
        [page addSubview:line];
    }
    //竖线
    for (int i = 0 ; i < 3; i++) {
        UILabel *line = nil;
        line = [[UILabel alloc] initWithFrame:CGRectMake((ICONIMG_WIDTH+0.5)*i, 0.5, 0.5, rowOnePage*(ICONIMG_HEIGHT+ICONIMG_VERTICAL))];
        line.backgroundColor = [UIColor lightGrayColor];
        line.alpha = 0.5;
        [page addSubview:line];
    }
}
#pragma mark - 计算需要展示的icon的所有Frame
- (NSMutableArray *)getAllPageIconsFrameArrayWithOnePageRect:(NSArray *)onePageArray
                                                   pageCount:(NSInteger)pageCounts
                                              andOnePageIcon:(NSInteger)onePage{
    NSMutableArray *pagesFramesArray = [[NSMutableArray alloc]init];
    indexRectArray = [[NSMutableArray alloc]init];
    
    for (NSInteger i = 0; i < pageCounts; i++) {
        for (NSInteger j = 0; j < onePage; j++) {
            CGRect iconRect = CGRectFromString(onePageArray[j]);
            iconRect.origin.x += i * ScreenWidth;//屏幕宽既是scrollview的宽
            NSString *iconRectString = NSStringFromCGRect(iconRect);
            
            [pagesFramesArray addObject:iconRectString];
            
            NSInteger index = j + onePage*i;
            
            //组织判断区域
            HCIndexRect *indexRect = [[HCIndexRect alloc]initWithIndex:index rect:iconRect];
            [indexRectArray addObject:indexRect];
        }
    }
    
    
    
    return pagesFramesArray;
}
#pragma mark - 判断需要几页
- (NSInteger)getPagesNumberWithAllIcon:(NSInteger)count andOnePageIcon:(NSInteger)onePageCount{
    NSInteger pageCounts = count / onePageCount;
    if (count % onePageCount != 0) {
        pageCounts += 1;
    }
    return pageCounts;
}
#pragma mark - 判断需要多少行高
- (NSInteger)getOnePageRomByDevice {
    NSInteger row = 3;
    if (IPHONE6Plus){
        row = 4;
    }
    return row;
}
#pragma mark - 计算九宫格Frame
- (NSArray *)getOnePageIconsFrameArrayWithRowNumber:(NSInteger)row {
    NSMutableArray *iconRectArray = [[NSMutableArray alloc]init];
    for (int i = 0; i < row; i++) {
        for (int j = 0;j < 3; j++) {
            CGRect rect = CGRectMake(j*((ScreenWidth/3)+ICONIMG_LEVEL_SPACE), i*(ICONIMG_HEIGHT+ICONIMG_VERTICAL_SPACE), ICONIMG_WIDTH, ICONIMG_HEIGHT);
            [iconRectArray addObject:NSStringFromCGRect(rect)];
        }
    }
    return iconRectArray;
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com