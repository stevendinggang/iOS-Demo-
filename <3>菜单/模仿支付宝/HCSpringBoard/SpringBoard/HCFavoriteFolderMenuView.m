//
//  HCFavoriteFolderMenuView.m
//  HCSpringBoard
//
//  Created by 刘海川 on 16/3/7.
//  Copyright © 2016年 Haichuan Liu. All rights reserved.
//

#import "HCFavoriteFolderMenuView.h"
#import "AppDelegate.h"
#import "HCFavoriteFolderFloatView.h"
#import "ViewController.h"

#define ICON_WIDTH_FOLDER ([[UIScreen mainScreen] bounds].size.width-20-2)/3
@implementation HCFavoriteFolderMenuView {
    NSMutableArray *allFrame;
    
    UIScrollView *loveScrollView;
    UIPageControl *lovePageControl;
    
    CGPoint lastPoint;
    NSMutableArray *indexRectArray;
    
    NSInteger pageCount;
    NSArray *iconsOnePageFrameArray;
    NSInteger onePageSize ;
    
    NSMutableArray *pages;
}

- (instancetype)initWithFrame:(CGRect)frame
                   menuModels:(NSMutableArray *)modelsArray
                    menuIcons:(NSMutableArray *)iconsArray
{
    self = [super initWithFrame:frame];
    if (self) {
        _folderMenuModelArray = modelsArray;
        _folderMenuIconArray = iconsArray;
        
        self.userInteractionEnabled = YES;
        allFrame = [[NSMutableArray alloc]init];
        
        NSInteger rowOnePage = [self getOnePageRomByDevice];
        iconsOnePageFrameArray = [self getOnePageIconsFrameArrayWithRowNumber:rowOnePage];
        //单页icon数
        onePageSize = rowOnePage * 3;
        NSInteger allPageSize = [modelsArray count];
        pageCount = [self getPagesNumberWithAllIcon:allPageSize
                                     andOnePageIcon:onePageSize];
        
        //根据有多少页，创建对应的frame，icon直接加到scrollView上。
        allFrame = [self getAllPageIconsFrameArrayWithOnePageRect:iconsOnePageFrameArray
                                                        pageCount:pageCount
                                                   andOnePageIcon:onePageSize];
        
        CGRect scrollRect = CGRectMake(0, 0, ScreenWidth-20, rowOnePage*(ICONIMG_HEIGHT_Float+0.5)+1);
        loveScrollView = [[UIScrollView alloc]initWithFrame:scrollRect];
        loveScrollView.bounces = NO;
        loveScrollView.pagingEnabled = YES;
        loveScrollView.backgroundColor = [UIColor whiteColor];
        loveScrollView.showsHorizontalScrollIndicator = NO;
        loveScrollView.showsVerticalScrollIndicator = NO;
        loveScrollView.delegate = self;
        [self addSubview:loveScrollView];
        
        lovePageControl = [[UIPageControl alloc]
                           initWithFrame:CGRectMake(0, CGRectGetMaxY(loveScrollView.frame)+5, ScreenWidth, 20)];
        [lovePageControl setPageIndicatorTintColor:[UIColor lightGrayColor]];
        [lovePageControl setCurrentPageIndicatorTintColor:[UIColor colorWithRed:0.00f green:0.48f blue:0.88f alpha:1.00f]];
        [self addSubview: lovePageControl];
        
        pages = [[NSMutableArray alloc]init];
        for (int i = 0; i < pageCount; i++) {
            UIView *page = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width-20, CGRectGetHeight(loveScrollView.frame))];
            page.userInteractionEnabled = YES;
            [self addLineAtPageWithOnePageRow:rowOnePage andPageView:page];
            [pages addObject:page];
        }
        [self layoutWithPages:scrollRect];
        
        _folderMenuIconArray = [[NSMutableArray alloc]init];
        for (int i = 0; i < allPageSize; i++) {
            CGRect loveIconRect = CGRectFromString(allFrame[i]);
            
            HCFavoriteIconModel *loveModel = _folderMenuModelArray[i];
            
            HCFavoriteIconView *loveIconView = [[HCFavoriteIconView alloc]initWithFrame:loveIconRect model:loveModel];
            //先代理到这里
            loveIconView.favoriteIconDelegate = self;
            loveIconView.favoriteIconLongGestureDelegate = self;
            loveIconView.tag = i;
            [_folderMenuIconArray addObject:loveIconView];
            [loveScrollView addSubview:loveIconView];
        }
    }
    return self;
}


- (void)layoutWithPages:(CGRect)pageRect{
    loveScrollView.contentOffset = CGPointMake(0.0, 0.0);
    loveScrollView.contentSize = CGSizeMake(CGRectGetWidth(pageRect) * [pages count], 0);
    lovePageControl.numberOfPages = [pages count];
    lovePageControl.currentPage = 0;
    
    for(int i=0;i<[pages count];i++) {
        UIView *page = [pages objectAtIndex: i];
        CGRect bounds = page.bounds;
        CGRect frame = CGRectMake(CGRectGetWidth(pageRect) * i, 0.0, CGRectGetWidth(pageRect), CGRectGetHeight(pageRect));
        page.frame = frame;
        page.bounds = bounds;
        [loveScrollView addSubview: page];
    }
}

//重新布局
- (void)deleteIconLayoutWithMenuIcons:(NSMutableArray *)array {
    [UIView animateWithDuration:.5 animations:^{
        for (int i = 0; i < array.count; i++) {
            CGRect rect = CGRectFromString(allFrame[i]);
            
            UIView *iconView = array[i];
            iconView.frame = rect;
        }
    }];
}

- (HCFavoriteIconView *)drawIconWithCurrentIcon:(HCFavoriteIconView *)icon {
    
    self.isDraw = YES;
    _drawLoveIconView = [AppWindow viewWithTag:drawIconTag];
    if (_drawLoveIconView) {
        return _drawLoveIconView;
    }
    
    CGRect iconRect = icon.frame;
    CGRect drawIconRect = [loveScrollView convertRect:iconRect toView:AppWindow];
    
    _drawLoveIconView = [[HCFavoriteIconView alloc]initWithFrame:drawIconRect model:icon.loveIconModel];
    HCFavoriteIconView *drawIconView = (HCFavoriteIconView *)_drawLoveIconView;
    _drawLoveIconView.tag = drawIconTag;
    drawIconView.isEditing = YES;
    [AppWindow addSubview:_drawLoveIconView];
    [_drawLoveIconView.layer removeAnimationForKey:@"rocking"];
    
    _loveFromIndex = icon.tag;
    
    return _drawLoveIconView;
    
}

-(void)setCurrentPage:(NSInteger)pageIndex;
{
    lovePageControl.currentPage = pageIndex;
}
-(NSInteger)getCurrentPage;
{
    return lovePageControl.currentPage;
}
#pragma mark -
#define angelToRandian(x) ((x)/180.0*M_PI)
- (void)showEditButton;
{
    CAKeyframeAnimation *rockAnimation = [CAKeyframeAnimation animation];
    rockAnimation.keyPath = @"transform.rotation";
    rockAnimation.values = @[@(angelToRandian(-3)),@(angelToRandian(3)),@(angelToRandian(-3))];
    rockAnimation.repeatCount = MAXFLOAT;
    rockAnimation.duration = 0.3;
    
    for (int i=0; i<[_folderMenuIconArray count]; i++) {
        UIView *menuItemView = [_folderMenuIconArray objectAtIndex:i];
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
}
#pragma mark - CSIILoveIconDelegate
- (void)deleteIconOfLoveIconView:(HCFavoriteIconView *)iconView {
    [UIView animateWithDuration:.3 animations:^{
        iconView.transform = CGAffineTransformMakeScale(0.1, 0.1);
    } completion:^(BOOL finished) {
        //这里删除要记得判断是不是文件夹的，这里要记得给CSIILoveIconView增加所属文件夹的属性，要不找不到没法删除文件夹的。
        
        [_folderMenuModelArray removeObjectAtIndex:iconView.tag];
        [_folderMenuIconArray removeObjectAtIndex:iconView.tag];
        
        //同步tag很重要，因为下标是用tag取的。
        [self updateTags];
        
        //        [loveSpringBoard.loveModelArray removeObjectAtIndex:iconView.tag];
        //        [loveSpringBoard.loveIconArray removeObjectAtIndex:iconView.tag];
        [self deleteIconLayoutWithMenuIcons:_folderMenuIconArray];
        [iconView removeFromSuperview];
        
        //        [self.folderMenuDelegate setCurrentPage:currentPage];
        if (_isEdit) {
            [self showEditButton];
        }
        
        [self updateIconModelDisplay:iconView.loveIconModel];
        [self verifyFolderIconsCount];
        
    }];
}
- (void)pushPageOfLoveIconView:(HCFavoriteIconView *)iconView {
    
    if (_folderMenuDelegate && [_folderMenuDelegate isKindOfClass:[HCFavoriteFolderFloatView class]]) {
        HCFavoriteFolderFloatView *floatView = _folderMenuDelegate;
        [floatView hideFloatView:[[UIControl alloc] init]];
        
        if (floatView.mySpringBoardDelegate && [floatView.mySpringBoardDelegate isKindOfClass:[HCSpringBoardView class]]) {
            HCSpringBoardView *sb = floatView.mySpringBoardDelegate;
            [sb pushPageOfLoveIconView:iconView];
        }
    }
}

- (void)intoEditingModeOfLoveIconView:(HCFavoriteIconView *)iconView{
    HCFavoriteIconView *drawIcon = [self drawIconWithCurrentIcon:iconView];
    
    [UIView animateWithDuration:0.3 animations:^{
        drawIcon.transform = CGAffineTransformMakeScale(1.5, 1.5);
        drawIcon.alpha = .8f;
    }];
    
    if (!_isEdit) {
        [self showEditButton];
        
        //通知浮层下面的进入编辑模式
        if (_folderMenuDelegate && [_folderMenuDelegate isKindOfClass:[HCFavoriteFolderFloatView class]]) {
            HCFavoriteFolderFloatView *floatView = _folderMenuDelegate;
            [floatView.mySpringBoardDelegate showEditButton];
            
            if (floatView.mySpringBoardDelegate && [floatView.mySpringBoardDelegate isKindOfClass:[HCSpringBoardView class]]) {
                HCSpringBoardView *sb = floatView.mySpringBoardDelegate;
                sb.isEdit = YES;
            }
        }
        _isEdit = YES;
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    lovePageControl.currentPage = scrollView.contentOffset.x/CGRectGetWidth(scrollView.frame);
}

#pragma mark - CSIILoveIconLongGestureDelegate
- (void)longGestureStateBegin:(UILongPressGestureRecognizer *)gesture forLoveView:(HCFavoriteIconView *)loveView{
    loveView.hidden = YES;
    
    CGPoint beginPoint = [gesture locationInView:loveView];
    lastPoint = CGPointMake(beginPoint.x*1.5, beginPoint.y*1.5);
    
    CGPoint pointAtWindow = [gesture locationInView:AppWindow];
    _previousWindowMovePoint = pointAtWindow;
}
- (void)longGestureStateMove:(UILongPressGestureRecognizer *)gesture forLoveView:(HCFavoriteIconView *)loveView{
    CGPoint pointAtWindow = [gesture locationInView:AppWindow];
    
    CGPoint currentOrigin = CGPointMake(pointAtWindow.x-lastPoint.x, pointAtWindow.y-lastPoint.y);
    if (_isDraw) {
        
        _drawLoveIconView.frame = CGRectMake(currentOrigin.x, currentOrigin.y, _drawLoveIconView.frame.size.width, _drawLoveIconView.frame.size.height);
        
        CGPoint scrollPoint = [gesture locationInView:loveScrollView];
        
        NSInteger fromIndex = _loveFromIndex;
        
        //检测速度
        double fingerSpeed = [self fingerMoveSpeadWithPreviousPoint:_previousWindowMovePoint andNowPoint:pointAtWindow];
        //上次的移动点，为计算速度。使用过后更新点
        _previousWindowMovePoint = pointAtWindow;
        
        NSDictionary *toIndexDict = [self toIndexWithPoint:scrollPoint];
        NSInteger toIndex = [toIndexDict[@"toIndex"] integerValue];
        
        //一旦进入文件夹外模式就 调用改代理方法。
        if (_isDrawOutside) {
            if (_outsideFolderGestureDelegate && [_outsideFolderGestureDelegate isKindOfClass:[HCSpringBoardView class]]) {
                if ([_outsideFolderGestureDelegate respondsToSelector:@selector(loveFolderOutsideMoveGesture:menuView:fromView:)]) {
                    [_outsideFolderGestureDelegate loveFolderOutsideMoveGesture:gesture menuView:self fromView:loveView];
                }
            }
        }
        
        //2以下的慢速过程中进入的判断，此时可能点已经进入到了文件夹的区域内。
        if (fingerSpeed < 2) {//是否合并
            NSLog(@"menu view toindex:%ld",toIndex);
            if (toIndex == -1) {
                //图标拖到了外面
                if (_isDrawOutside == NO) {
                    _isDrawOutside = YES;
                    if (_folderMenuDelegate && [_folderMenuDelegate isKindOfClass:[HCFavoriteFolderFloatView class]]) {
                        HCFavoriteFolderFloatView *floatView = _folderMenuDelegate;
                        [floatView hideFloatView:nil];
                        //此时，在主页创建一个图标，添加到第一个。
                    }
                    
                    if (_outsideFolderGestureDelegate && [_outsideFolderGestureDelegate isKindOfClass:[HCSpringBoardView class]]) {
                        if ([_outsideFolderGestureDelegate respondsToSelector:@selector(loveFolderOutsideBeginGesture:menuView:fromView:)]) {
                            [_outsideFolderGestureDelegate loveFolderOutsideBeginGesture:gesture menuView:self fromView:loveView];
                        }
                    }
                    
                    if (_outsideFolderGestureDelegate && [_outsideFolderGestureDelegate isKindOfClass:[HCSpringBoardView class]]) {
                        HCSpringBoardView *springBoard = _outsideFolderGestureDelegate;
                        if (![springBoard.favoriteModelArray containsObject:loveView.loveIconModel]) {
                            
                            [springBoard.favoriteModelArray insertObject:loveView.loveIconModel atIndex:0];
                            [springBoard.favoriteViewArray insertObject:loveView atIndex:0];
                            
                            [_folderMenuModelArray removeObjectAtIndex:loveView.tag];
                            [_folderMenuIconArray removeObjectAtIndex:loveView.tag];
                            
                            //刷新最爱文件夹的小图标图案
                            [self updateLoveFolderLittleIcon];
                            
                            //翻到第一页，把图标默认加到第一个。
                            [springBoard updateMenuIconsFrame];
                            springBoard.currentPage = 0;
                        }
                        
                    }
                    self.userInteractionEnabled = NO;
                }
            }
            
            if (toIndex != -1 && toIndex < (_folderMenuModelArray.count) && fromIndex < (_folderMenuModelArray.count)) {
                _toLoveIconView = _folderMenuIconArray[toIndex];
                if (toIndex != fromIndex) {
                    [_folderMenuModelArray removeObjectAtIndex:fromIndex];
                    [_folderMenuModelArray insertObject:loveView.loveIconModel atIndex:toIndex];
                    [_folderMenuIconArray removeObjectAtIndex:fromIndex];
                    [_folderMenuIconArray insertObject:loveView atIndex:toIndex];
                    //更新Tag重要
                    _loveFromIndex = toIndex;
                    [self updateTags];
                    
                    [self deleteIconLayoutWithMenuIcons:_folderMenuIconArray];
                }
            }
        }
        
        [self toPageWithPoint:scrollPoint];
    }
}

- (void)longGestureStateEnd:(UILongPressGestureRecognizer *)gesture forLoveView:(HCFavoriteIconView *)loveView{
    loveView.hidden = NO;
    NSLog(@"end");
    if (_isDraw) {
        _isDraw = NO;
        //拖到了外面，且手势结束，去删除floatView。
        if (_isDrawOutside) {
            if (_outsideFolderGestureDelegate && [_outsideFolderGestureDelegate isKindOfClass:[HCSpringBoardView class]]) {
                if ([_outsideFolderGestureDelegate respondsToSelector:@selector(loveFolderOutsideEndGesture:menuView:fromView:)]) {
                    [_outsideFolderGestureDelegate loveFolderOutsideEndGesture:gesture menuView:self fromView:loveView];
                }
            }
            if (_folderMenuDelegate && [_folderMenuDelegate isKindOfClass:[HCFavoriteFolderFloatView class]]) {
                HCFavoriteFolderFloatView *floatView = _folderMenuDelegate;
                [floatView removeFromSuperview];
            }
            [self verifyFolderIconsCount];
            _isDrawOutside = NO;
        }
        
        [_drawLoveIconView removeFromSuperview];
    }
}
- (void)longGestureStateCancel:(UILongPressGestureRecognizer *)gesture forLoveView:(HCFavoriteIconView *)loveView{
    loveView.hidden = NO;
    if (_isDraw) {
        _isDraw = NO;
        //拖到了外面，且手势结束，去删除floatView。
        if (_isDrawOutside) {
            if (_outsideFolderGestureDelegate && [_outsideFolderGestureDelegate isKindOfClass:[HCSpringBoardView class]]) {
                if ([_outsideFolderGestureDelegate respondsToSelector:@selector(loveFolderOutsideCancelGesture:menuView:fromView:)]) {
                    [_outsideFolderGestureDelegate loveFolderOutsideCancelGesture:gesture menuView:self fromView:loveView];
                }
            }
            if (_folderMenuDelegate && [_folderMenuDelegate isKindOfClass:[HCFavoriteFolderFloatView class]]) {
                HCFavoriteFolderFloatView *floatView = _folderMenuDelegate;
                [floatView removeFromSuperview];
            }
            [self verifyFolderIconsCount];
            _isDrawOutside = NO;
        }
        
        [_drawLoveIconView removeFromSuperview];
    }
}
#pragma mark - 更新全菜单的display属性
- (void)updateIconModelDisplay:(HCFavoriteIconModel *)model {
    
    if (_folderMenuDelegate && [_folderMenuDelegate isKindOfClass:[HCFavoriteFolderFloatView class]]) {
        HCFavoriteFolderFloatView *floatView = _folderMenuDelegate;
        if (floatView.mySpringBoardDelegate && [floatView.mySpringBoardDelegate isKindOfClass:[HCSpringBoardView class]]) {
            HCSpringBoardView *sb = floatView.mySpringBoardDelegate;
            [sb updateIconModelDisplay:sb.favoriteMainMenu nodeIndex:model.nodeIndex];
        }
        
    }
}
#pragma mark - 判断是否该文件夹需要删除－顺便同步全菜单
- (void)verifyFolderIconsCount {
    //如果文件夹没有图标，则删除文件夹
    if (_folderMenuModelArray.count == 0) {
        if (_folderMenuDelegate && [_folderMenuDelegate isKindOfClass:[HCFavoriteFolderFloatView class]]) {
            HCFavoriteFolderFloatView *floatView = _folderMenuDelegate;
            [floatView.loveMainModels removeObject:floatView.loveFolderModel];
            //刷新前腰序列化
            [floatView.mySpringBoardDelegate archiverIconModelsArray];
            [floatView.mySpringBoardDelegate archiverLoveMenuMainModel];
            
            if ([floatView.myControllerDelegate isKindOfClass:[ViewController class]]) {
                [floatView.myControllerDelegate displayMenu];
            }
            //有值传入就会删除removeFromSuperView
            [floatView hideFloatView:[[UIControl alloc] init]];
        }
    }
}

#pragma mark - 更新Tags和更新MenuUI
- (void)updateTags {
    for (int i = 0; i < _folderMenuIconArray.count; i++) {
        HCFavoriteIconView *loveView = _folderMenuIconArray[i];
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
    
    for (int i = 0; i < _folderMenuIconArray.count; i++) {
        UIView *obj = _folderMenuIconArray[i];
        obj.frame = CGRectFromString(allFrame[i]);
        [loveScrollView addSubview:obj];
    }
}

- (void)updateAllFramesArray:(NSArray *)allIcons {
    pageCount = [self getPagesNumberWithAllIcon:allIcons.count
                                 andOnePageIcon:onePageSize];
    allFrame = [self getAllPageIconsFrameArrayWithOnePageRect:iconsOnePageFrameArray
                                                    pageCount:pageCount
                                               andOnePageIcon:onePageSize];
}

- (void)updateLoveFolderLittleIcon {
    if (_folderMenuDelegate && [_folderMenuDelegate isKindOfClass:[HCFavoriteFolderFloatView class]]) {
        HCFavoriteFolderFloatView *floatView = _folderMenuDelegate;
        [floatView.loveFolderView updateLittleIconImage];
        
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
    CGRect scrollViewLiftSideRect = CGRectMake(0+loveScrollView.contentOffset.x, 0+loveScrollView.contentOffset.y, 40, CGRectGetHeight(loveScrollView.frame));
    CGRect scrollViewRightSideRect = CGRectMake(CGRectGetWidth(loveScrollView.frame)-40+loveScrollView.contentOffset.x, 0+loveScrollView.contentOffset.y, 40, CGRectGetHeight(loveScrollView.frame));
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
    //sqrt((x1-x2)^2+(y1-y2)^2)
    CGFloat x = (prePoint.x - nowPoint.x)*(prePoint.x - nowPoint.x);
    CGFloat y = (prePoint.y - nowPoint.y)*(prePoint.y - nowPoint.y);
    return sqrt(x+y);
}

#pragma mark - 给pageView加横竖线
- (void)addLineAtPageWithOnePageRow:(NSInteger)rowOnePage andPageView:(UIView *)page {
    //横线
    for (int i=0; i<rowOnePage+1; i++) {
        UIView *line = nil;
        line = [[UILabel alloc] initWithFrame:CGRectMake(0, i*(ICONIMG_HEIGHT_Float+ICONIMG_VERTICAL_SPACE), ScreenWidth-20, 0.5)];
        line.backgroundColor = [UIColor lightGrayColor];
        line.alpha = 0.5;
        [page addSubview:line];
    }
    //竖线
    for (int i=0; i<3; i++) {
        UIView *line = nil;
        line = [[UIView alloc] initWithFrame:CGRectMake((ICONIMG_WIDTH_Float+0.5)*i, 0.5, 0.5, rowOnePage*(ICONIMG_HEIGHT_Float+ICONIMG_VERTICAL_SPACE))];
        line.backgroundColor = [UIColor lightGrayColor];
        line.alpha = 0.5;
        [page addSubview:line];
    }
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
    return 3;
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
            iconRect.origin.x += i * (ScreenWidth-20);//屏幕宽既是scrollview的宽
            NSString *iconRectString = NSStringFromCGRect(iconRect);
            
            [pagesFramesArray addObject:iconRectString];
            
            NSInteger index = j + onePage*i;
            
            //组织判断区域
            iconRect.size.width += 5;
            iconRect.size.height += 5;
            HCIndexRect *indexRect = [[HCIndexRect alloc]initWithIndex:index rect:iconRect];
            [indexRectArray addObject:indexRect];
        }
    }
    
    
    
    return pagesFramesArray;
}
#pragma mark - 计算九宫格Frame
- (NSArray *)getOnePageIconsFrameArrayWithRowNumber:(NSInteger)row {
    NSMutableArray *iconRectArray = [[NSMutableArray alloc]init];
    for (int i = 0; i < row; i++) {
        for (int j = 0;j < 3; j++) {
            CGRect rect = CGRectMake(j*(ICONIMG_WIDTH_Float+ICONIMG_LEVEL_SPACE), i*(ICONIMG_HEIGHT_Float+ICONIMG_VERTICAL_SPACE)+0.5, ICONIMG_WIDTH_Float, ICONIMG_HEIGHT_Float);
            [iconRectArray addObject:NSStringFromCGRect(rect)];
        }
    }
    return iconRectArray;
}
@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com