//
//  HCIndexRect.m
//  HCSpringBoard
//
//  Created by 刘海川 on 16/3/6.
//  Copyright © 2016年 Haichuan Liu. All rights reserved.
//

#import "HCIndexRect.h"

static const CGFloat sideSize = 15.f;
@implementation HCIndexRect

- (instancetype)initWithIndex:(NSInteger)index rect:(CGRect)rect {
    self = [super init];
    if (self) {
        _iconIndex = index;
        _iconRect = rect;
        
        CGFloat folderX = rect.origin.x+sideSize;
        CGFloat folderY = rect.origin.y+sideSize;
        CGFloat folderWidth = rect.size.width-sideSize*2;
        CGFloat folderHeight = rect.size.height-sideSize*2;
        _iconFolderRect = CGRectMake(folderX, folderY, folderWidth, folderHeight);
    }
    return self;
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com