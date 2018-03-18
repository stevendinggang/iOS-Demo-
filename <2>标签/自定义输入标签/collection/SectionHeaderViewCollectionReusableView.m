//
//  SectionHeaderViewCollectionReusableView.m
//  徐茂怀
//
//  Created by 徐茂怀 on 16/2/22.
//  Copyright © 2016年 徐茂怀. All rights reserved.
//

#import "SectionHeaderViewCollectionReusableView.h"

@implementation SectionHeaderViewCollectionReusableView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createViews];
    }
    return self;
}

-(void)createViews
{
    _titleLabel = [[UILabel alloc]init];
    [self addSubview:_titleLabel];
    
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    _titleLabel.frame = CGRectMake(20, 30, 375, 50);
    _titleLabel.font = [UIFont systemFontOfSize:20];
    

}

@end
