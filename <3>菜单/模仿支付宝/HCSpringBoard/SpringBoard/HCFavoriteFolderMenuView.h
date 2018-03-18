//
//  HCFavoriteFolderMenuView.h
//  HCSpringBoard
//
//  Created by 刘海川 on 16/3/7.
//  Copyright © 2016年 Haichuan Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HCFavoriteIconView.h"
#import "HCSpringBoardView.h"



@class HCFavoriteFolderMenuView;
@protocol CSIIOutsideFolderGestureDelegate <NSObject>

- (void)loveFolderOutsideBeginGesture:(UILongPressGestureRecognizer *)gesture
                             menuView:(HCFavoriteFolderMenuView *)menuView
                             fromView:(HCFavoriteIconView *)iconView;
- (void)loveFolderOutsideMoveGesture:(UILongPressGestureRecognizer *)gesture
                            menuView:(HCFavoriteFolderMenuView *)menuView
                            fromView:(HCFavoriteIconView *)iconView;
- (void)loveFolderOutsideEndGesture:(UILongPressGestureRecognizer *)gesture
                           menuView:(HCFavoriteFolderMenuView *)menuView
                           fromView:(HCFavoriteIconView *)iconView;
- (void)loveFolderOutsideCancelGesture:(UILongPressGestureRecognizer *)gesture
                              menuView:(HCFavoriteFolderMenuView *)menuView
                              fromView:(HCFavoriteIconView *)iconView;

@end

@interface HCFavoriteFolderMenuView : UIView
<
UIScrollViewDelegate,
HCFavoriteIconLongGestureDelegate,
HCFavoriteIconDelegate
>

@property (nonatomic, weak) id folderMenuDelegate;//代理的CSIILoveFolderFloatView
@property (nonatomic, weak) id outsideFolderGestureDelegate;

@property (nonatomic, strong) NSMutableArray *folderMenuModelArray;
@property (nonatomic, strong) NSMutableArray *folderMenuIconArray;

@property (nonatomic, assign) BOOL isDraw;
@property (nonatomic, assign) BOOL isEdit;
@property (nonatomic, assign) BOOL isDrawOutside;
@property (nonatomic, assign) NSInteger loveFromIndex;
@property (nonatomic, assign) CGPoint previousWindowMovePoint;

@property (nonatomic, strong) HCFavoriteIconView *drawLoveIconView;
@property (nonatomic, strong) HCFavoriteIconView *toLoveIconView;

- (instancetype)initWithFrame:(CGRect)frame menuModels:(NSMutableArray *)modelsArray menuIcons:(NSMutableArray *)iconsArray;

- (void)showEditButton;

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com