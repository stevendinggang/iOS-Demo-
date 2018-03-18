//
//  HCFavoriteFolderView.h
//  HCSpringBoard
//
//  Created by 刘海川 on 16/3/6.
//  Copyright © 2016年 Haichuan Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HCFavoriteFolderModel.h"

@class HCFavoriteFolderView;

@protocol HCLoveFolderDelegate <NSObject>

- (void)openLoveFolderOfLoveFolderView:(HCFavoriteFolderView *)loveFolderView;
- (void)intoEditingModeOfLoveFolderView:(HCFavoriteFolderView *)loveFolderView;
@end

@protocol HCLoveFolderLongGestureDelegate <NSObject>

- (void)longGestureStateBegin:(UILongPressGestureRecognizer *)gesture forLoveFolderView:(HCFavoriteFolderView *)loveFolderView;
- (void)longGestureStateMove:(UILongPressGestureRecognizer *)gesture forLoveFolderView:(HCFavoriteFolderView *)loveFolderView;
- (void)longGestureStateEnd:(UILongPressGestureRecognizer *)gesture forLoveFolderView:(HCFavoriteFolderView *)loveFolderView;
- (void)longGestureStateCancel:(UILongPressGestureRecognizer *)gesture forLoveFolderView:(HCFavoriteFolderView *)loveFolderView;

@end

@interface HCFavoriteFolderView : UIControl

@property (nonatomic, assign) id <HCLoveFolderDelegate> loveFolderDelegate;
@property (nonatomic, assign) id <HCLoveFolderLongGestureDelegate> loveFolderLongGestureDelegate;
@property (nonatomic, strong) HCFavoriteFolderModel *loveFolderModel;
@property (nonatomic, copy) NSString *folderName;
@property (nonatomic, assign) BOOL isShowScaleFolderLayer;

- (instancetype)initWithFrame:(CGRect)frame model:(HCFavoriteFolderModel *)model;

- (void)updateLittleIconImage;

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com