//
//  HCIndexRect.h
//  HCSpringBoard
//
//  Created by 刘海川 on 16/3/6.
//  Copyright © 2016年 Haichuan Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HCIndexRect : NSObject

@property (nonatomic, assign) NSInteger iconIndex;
@property (nonatomic, assign) CGRect iconRect;
@property (nonatomic, assign) CGRect iconFolderRect;

- (instancetype)initWithIndex:(NSInteger)index rect:(CGRect)rect;

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com