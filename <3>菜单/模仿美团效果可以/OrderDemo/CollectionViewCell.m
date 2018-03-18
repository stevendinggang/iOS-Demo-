//
//  CollectionViewCell.m
//  OrderDemo
//
//  Created by king on 16/2/25.
//  Copyright © 2016年 king. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _titleLab = [[UILabel alloc]initWithFrame:self.bounds];
        _titleLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLab];
    }
    return self;
}
@end
