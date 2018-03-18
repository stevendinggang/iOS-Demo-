//
//  AddressBookVC.h
//  AddressBook
//
//  Created by YPShao on 15/12/15.
//  Copyright © 2015年 YPShao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Create)


+ (UIButton*) createButtonWithFrame: (CGRect) frame Target:(id)target Selector:(SEL)selector Image:(NSString *)image ImagePressed:(NSString *)imagePressed;

+ (UIButton *) createButtonWithFrame:(CGRect)frame Title:(NSString *)title Target:(id)target Selector:(SEL)selector;


@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com