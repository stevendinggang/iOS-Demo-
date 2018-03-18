//
//  MainViewController.h
//  vipshop
//
//  Created by Mind is important  on 15/12/15.
//  Copyright (c) 2015年 iovo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CenterViewController.h"
@interface MainViewController : UIViewController
@property (nonatomic, strong)  CenterViewController *root;
- (instancetype)initWithCenterViewController:(UIViewController*)centerCtl leftViewController:(UIViewController*)leftCtl;
@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com