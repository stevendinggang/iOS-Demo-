//
//  ItemButton.m
//  玻璃易购
//
//  Created by apple on 16/4/9.
//  Copyright © 2016年 艾磊. All rights reserved.
//

#import "ItemButton.h"
#import "UIColor+MLPFlatColors.h"

@implementation ItemButton

-(instancetype)initWithFrame:(CGRect)frame item:(DataModel *)model
{
    if (self = [super initWithFrame:frame]) {
        _itemModel = model;
        
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake((frame.size.width-frame.size.height/2)/2, 5, frame.size.height/2, frame.size.height/2)];
        //自行替换网络加载图片
     //   [button sd_setImageWithURL:[NSURL URLWithString:[IMAGEURL stringByAppendingString:model.kindLogo]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"no_picture"]];
        [button setImage:[self randImage] forState:UIControlStateNormal];
        [self addSubview:button];
        button.userInteractionEnabled = NO;
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, button.frame.origin.y+button.frame.size.height, frame.size.width, frame.size.height/2-5)];
        label.text = model.kindName;
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor flatBlackColor];
        label.font = [UIFont systemFontOfSize:12.0];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickOnSelf:)];
        [self addGestureRecognizer:tap];
        
        [self addSubview:label];
        self.backgroundColor = [UIColor flatWhiteColor];
        
    }
    return self;
}

-(UIImage *)randImage
{
    NSString *imageString = [NSString stringWithFormat:@"me%d",[self getRandomNumber:1 to:6]];
    UIImage *image = [UIImage imageNamed:imageString];
    return image;
}

-(int)getRandomNumber:(int)from to:(int)to
{
    return (int)(from + (arc4random() % (to - from + 1)));
}

-(void)setItemSected:(BOOL)itemSected
{
    if (itemSected) {
        self.backgroundColor = [UIColor whiteColor];
    }else
    {
        self.backgroundColor = [UIColor flatWhiteColor];
    }
}

-(void)clickOnSelf:(UIGestureRecognizer *)gestureRecognizer
{
    if (_selectItem) {
        self.selectItem(self);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
