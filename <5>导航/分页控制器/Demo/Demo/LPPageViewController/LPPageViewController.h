//
//  LPPageViewController.h
//  LPPageViewController
//
//  Created by FineexMac on 16/1/27.
//  Copyright © 2016年 LPiOS. All rights reserved.
//
//  作者GitHub主页 https://github.com/SwiftLiu
//  作者邮箱 1062014109@qq.com
//  下载链接 https://github.com/SwiftLiu/LPPageViewController.git

#import <UIKit/UIKit.h>

@interface LPPageViewController : UIViewController

///菜单主题
@property (strong, nonatomic) NSString *leftMenuTitle;
@property (strong, nonatomic) NSString *rightMenuTitle;
///菜单主色彩
@property (strong, nonatomic) UIColor *themeColor;

///子控制器(左)
@property (strong, nonatomic) UIViewController *leftViewController;
///子控制器(右)
@property (strong, nonatomic) UIViewController *rightViewController;

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com