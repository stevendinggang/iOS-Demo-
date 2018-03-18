//
//  HCFavoriteIconView.h
//  HCSpringBoard
//
//  Created by 刘海川 on 16/3/6.
//  Copyright © 2016年 Haichuan Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HCFavoriteIconModel.h"

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

@interface HCFavoriteIconView : UIControl

@property (nonatomic, assign) id <HCFavoriteIconDelegate> favoriteIconDelegate;
@property (nonatomic, assign) id <HCFavoriteIconLongGestureDelegate> favoriteIconLongGestureDelegate;
@property (nonatomic, strong) HCFavoriteIconModel *loveIconModel;
@property (nonatomic, assign) BOOL isEditing;
@property (nonatomic, assign) BOOL isShowFolderFlag;

- (instancetype)initWithFrame:(CGRect)frame model:(HCFavoriteIconModel *)model;

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com