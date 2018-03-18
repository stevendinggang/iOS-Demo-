//
//  customNavigationBar.m
//  ContextMenu
//
//  Created by 邓梓暄 on 15/9/27.
//  Copyright © 2015年 Dzx. All rights reserved.
//

#import "customNavigationBar.h"

@implementation customNavigationBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (CGSize)sizeThatFits:(CGSize)size{
    CGSize newSize = CGSizeMake(self.window.frame.size.width, 64);
    return newSize;
}

@end
