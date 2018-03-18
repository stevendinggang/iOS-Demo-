//
//  AttachedCell.m
//  AddressBook
//
//  Created by 邵俞鹏 on 15/12/15.
//  Copyright © 2015年 YPShao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SYPDelegate <NSObject>

//拨打电话
-(void)makePhoneCall:(UIButton *)button;

@end

@interface AttachedCell : UITableViewCell



@property (nonatomic,weak) id<SYPDelegate> delegate;

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com