//
//  QQPhoneOnLineViewController.h
//  QSImitateQQPhoneAnimation
//
//  Created by JosQiao on 16/5/19.
//  Copyright © 2016年 QiaoShi. All rights reserved.
//

#define PHONE_VIEW_TAG 100

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,QQPhonePressentType) {
    
    QQPhoneTransitionPressentTypeNormal = 0,
    QQPhoneTransitionPressentTypeMask = 1,
};

@interface QQPhoneOnLineViewController : UIViewController

/** 上部分试图 */
@property(nonatomic,strong)UIView *viewTop;

/** 头像试图，一般封装在viewTop */
@property(nonatomic,strong)UIImageView *imgIconView;

/** 下部分试图 */
@property(nonatomic,strong)UIView *viewBottom;

/** 跳转类型 */
@property (nonatomic ,assign) QQPhonePressentType pressentType;

/** 电话试图展开前的位置 */
@property (nonatomic ,assign) CGPoint lastDismissPoint;


/** 开始波浪动画 */
- (void)starLayerAnimation;

/** 停止波浪动画 */
- (void)stopLayerAnimation;

@end
