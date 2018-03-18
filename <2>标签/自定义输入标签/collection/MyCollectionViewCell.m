//
//  MyCollectionViewCell.m
//  collection
//
//  Created by 徐茂怀 on 16/2/23.
//  Copyright © 2016年 徐茂怀. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _label = [[UILabel alloc]init];
        _imageView = [[UIImageView alloc]init];
        
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [_label setFrame:self.bounds];
    _label.textAlignment = 1;
    _label.font = [UIFont systemFontOfSize:15];
    _imageView.frame = self.bounds;
    switch (_cellStyle) {
        case cellStyleDefault:
            self.layer.borderColor = [UIColor colorWithRed:0 green:0.68 blue:0.94 alpha:1].CGColor;
            self.layer.masksToBounds = YES;
            self.layer.borderWidth = 1.8;
            self.layer.cornerRadius = 20;
            self.label.textColor = [UIColor colorWithRed:0 green:0.68 blue:0.94 alpha:1];
            self.backgroundColor = [UIColor whiteColor];
            [self.contentView addSubview:_label];
            break;
        case cellStyleSelected:
            self.layer.borderColor = [UIColor colorWithRed:0 green:0.68 blue:0.94 alpha:1].CGColor;
            self.layer.masksToBounds = YES;
            self.layer.borderWidth = 1.8;
            self.layer.cornerRadius = 20;
            self.label.textColor = [UIColor whiteColor];
            self.backgroundColor = [UIColor colorWithRed:0 green:0.68 blue:0.94 alpha:1];
            [self.contentView addSubview:_label];
            break;
        case cellStyleAdd:
            [self.imageView setImage:[UIImage imageNamed:@"屏幕快照 2016-02-22 下午7.29.08.png"]];
            self.backgroundColor = [UIColor whiteColor];
            [self.contentView addSubview:_imageView];
            break;
        default:
            break;
    }
    
}

@end
