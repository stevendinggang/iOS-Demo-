//
//  QQPhoneTransition.h
//  QSImitateQQPhoneAnimation
//
//  Created by JosQiao on 16/5/19.
//  Copyright © 2016年 QiaoShi. All rights reserved.
//



#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "QQPhoneOnLineViewController.h"

typedef NS_ENUM(NSInteger,QSTransitionType)
{
    QSTransitionTypePresent = 0,
    QSTransitionTypeDismiss  = 1
};


@interface QQPhoneTransition : NSObject <UIViewControllerAnimatedTransitioning>

/** 过渡类型 */
@property (nonatomic ,assign) QSTransitionType transitionType;

/** 跳转类型 */
@property (nonatomic ,assign) QQPhonePressentType pressetTyp;


/** 界面消失的位置 */
@property (nonatomic ,assign) CGRect endRect;

/** 按钮悬停位置 */
@property(nonatomic,assign)CGPoint lastPoint;

/** 控制点 */
@property (nonatomic ,assign) CGPoint controlPoint;


+ (instancetype)transitionWithQSTransitionType:(QSTransitionType)transitionType presentType:(QQPhonePressentType)presentType;

@end
