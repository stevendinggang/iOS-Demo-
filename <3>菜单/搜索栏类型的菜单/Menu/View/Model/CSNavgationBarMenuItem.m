//
//  CSNavgationBarMenuItem.m
//  test
//
//  Created by sangcixiang on 16/2/20.
//  Copyright © 2016年 sangcixiang. All rights reserved.
//

#import "CSNavgationBarMenuItem.h"

@implementation CSNavgationBarMenuItem

+(instancetype)navigationBarMenuItemWithImage:(UIImage *)image andTitle:(NSString *)title
{
    return [[CSNavgationBarMenuItem alloc]initWithImage:image andTitle:title];
}
/**  初始化内容 */
-(instancetype)initWithImage:(UIImage *)image andTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        self.image = image;
        self.title = title;
        self.titleColor = [UIColor whiteColor];
        self.titleFont = [UIFont systemFontOfSize:15];
    }
    return self;
}
@end
