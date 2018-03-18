//
//  QQPhoneViewController.h
//  QSImitateQQPhoneAnimation
//
//  Created by JosQiao on 16/5/19.
//  Copyright © 2016年 QiaoShi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QQPhoneViewController : UIViewController

/** 通话状态按钮 */
@property(nonatomic,strong)UIButton *btnOnLinePhone;

/** 初始按钮的位置 */
@property (nonatomic ,assign) CGPoint firstCenter;


@end
