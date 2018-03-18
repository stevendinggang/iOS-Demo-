//
//  TBPopupFolderView.h
//  TBSpringboard
//
//  Created by baotim on 16/1/5.
//  Copyright © 2016年 tbao. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString* DequeueReusableCell = @"TBSpringBoardCellReuseIdentifier";

@class TBSpringBoardView;
@interface TBPopupFolderView : UIView

@property (nonatomic, strong) NSMutableArray    *dataSource;
@property (nonatomic, strong) UITextField       *nameField;
@property (nonatomic, strong) TBSpringBoardView *collectionView;
@property (nonatomic, weak  ) NSIndexPath       *dataSourceItemPath;

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com