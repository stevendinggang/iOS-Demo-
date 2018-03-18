//
//  HCAssistant.h
//  HCSpringBoard
//
//  Created by 刘海川 on 16/3/4.
//  Copyright © 2016年 Haichuan Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

#define angelToRandian(x) ((x)/180.0*M_PI)

#pragma mark - window
#define AppWindow ((AppDelegate *)[[UIApplication sharedApplication] delegate]).window

#pragma mark - Tags
#define SpringBoardTag 90

#pragma mark - UserDefaultKey
#define kUserDefaultSuiteNameLoveMenu @"kUserDefaultSuiteNameLoveMenu"
#define kUserDefaultLoveMenuKey @"kUserDefaultLoveMenuKey"
#define kIsFirst @"kIsFirst"

#pragma mark - 尺寸
#define kScreenSize [[UIScreen mainScreen] bounds].size
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

#define IPHONE4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(320, 480), [[UIScreen mainScreen] currentMode].size) : NO)

#define IPHONE4S ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

#define IPHONE5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define IPHONE6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define IPHONE6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define ICONIMG_WIDTH ([[UIScreen mainScreen] bounds].size.width-1)/3
#define ICONIMG_HEIGHT ICONIMG_WIDTH
#define ICONIMG_WIDTH_Float ([[UIScreen mainScreen] bounds].size.width-21)/3
#define ICONIMG_HEIGHT_Float ICONIMG_WIDTH_Float+5

#define ICONIMG_LEVEL 1
#define ICONIMG_LEVEL_SPACE 0.5
#define ICONIMG_VERTICAL 30
#define ICONIMG_VERTICAL_SPACE 0.5

#pragma mark - 文件路径
#define kMenuFileName @"menu.json"
#define DOCUMENT_FOLDER(fileName) [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]stringByAppendingPathComponent:fileName]

#pragma mark - 宏定义
#pragma mark - 菜单Key
#define kWebLocal @"WebLocal"
#define kWebNetwork @"WebNetwork"
#define kMenuIcons @"MenuIcons"
#define kMenuList @"MenuList"
#define kViewcontroller @"Viewcontroller"
#define kNodeType @"kNodeType"
#define kActionId @"kActionId"
#define kImage @"kImage"
#define kImageSeleted @"kImageSeleted"
#define kMenuListImage @"kMenuListImage"
#define kItems @"kItems"
#define kTarget @"kTarget"
#define kNeedLogin @"kNeedLogin"
#define kIsDisplay @"kIsDisplay"
#define kIsReadOnly @"kIsReadOnly"
#define kTabIndex @"kTabIndex"
#define kNodeName @"kNodeName"
#define kNodeIndex @"kNodeIndex"
#define kLoginName @"kLoginName"
#define kSendController @"kSendController"
#define kSortNum @"kSortNum"
#define kNavigationObject @"kNavigationObject"

@interface HCAssistant : NSObject
//生成菜单结构
+ (void)initMainMenu;

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com