//
//  TBCollectionViewCell.h
//  TBSpringboard
//
//  Created by baotim on 16/1/5.
//  Copyright © 2016年 tbao. All rights reserved.
//

#import <UIKit/UIKit.h>

static CGFloat const DELETE_ICON_CORNER_RADIUS = 10;

@class TBCollectionViewCell;
@protocol TBCollectionViewCellDelegate <NSObject>

- (void)deleteButtonClickedInCollectionViewCell:(TBCollectionViewCell *)deletedCell;

@end

@interface TBCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak  ) id<TBCollectionViewCellDelegate> delegate;
@property (nonatomic, strong) UIImageView            *iconImageView;
@property (nonatomic, copy  ) NSString               *title;
@property (nonatomic, assign) BOOL                   editing;
@property (nonatomic, strong) NSMutableArray         *icons;

- (void)reset;
- (UIView *)snapshotView;

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com