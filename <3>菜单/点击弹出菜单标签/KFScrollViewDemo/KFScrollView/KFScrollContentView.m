//
//  KFScrollContentView.m
//  KFScrollViewDemo
//
//  Created by apple on 16/4/12.
//  Copyright © 2016年 吴凯锋 QQ:24272779. All rights reserved.
//

#import "KFScrollContentView.h"
#import "UIColor+MLPFlatColors.h"
@implementation SelectButton

-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title identifier:(NSString *)idenfier
{
    if (self = [super initWithFrame:frame]) {
        _button = [[UIButton alloc]initWithFrame:CGRectMake(10, 0, 15, 15)];
        [_button setImage:[UIImage imageNamed:@"publish_noSelected"] forState:UIControlStateNormal];
        _button.userInteractionEnabled = NO;
        [self addSubview:_button];
        
        _label = [[UILabel alloc]initWithFrame:CGRectMake(_button.frame.origin.x+_button.frame.size.width+5, 0, 50, 15)];
        _label.text =title;
        _label.textColor = [UIColor blackColor];
        _label.font = [UIFont systemFontOfSize:12.0];
        [self addSubview:_label];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapSelected:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

-(void)tapSelected:(UIGestureRecognizer *)guesture
{
    if (_selectedButton) {
        _selectedButton(self.button,self.label.text);
    }
}

@end


#define kMarginDefaultLeftRight 15
#define kMarginDefaultTopButtom 10

#define kItemDefaultHeight 30
#define KMainScreenWidth [UIScreen mainScreen].bounds.size.width
@interface KFScrollContentView ()
{
    DataModel *_contentModel;
    NSInteger _rowCount;
}

@end

@implementation KFScrollContentView
-(instancetype)initWithFrame:(CGRect)frame data:(DataModel *)model rowCount:(NSInteger)count
{
    if (self = [super initWithFrame:frame]) {
        _contentModel = model;
        _rowCount = count;
        [self loadItems];
    }
    return self;
}

-(void)loadItems
{
    float itemWidth = (KMainScreenWidth-(kMarginDefaultLeftRight*(_rowCount+1)))/_rowCount;
    float tatolHeight=0;
    
    for (int i = 0; i < _contentModel.second.count; i++) {
        Second *sec = _contentModel.second[i];
        UIButton *item = [[UIButton alloc]initWithFrame:CGRectMake(kMarginDefaultLeftRight+(kMarginDefaultLeftRight+itemWidth)*(i%_rowCount), kMarginDefaultTopButtom+(kMarginDefaultTopButtom+kItemDefaultHeight)*(i/_rowCount), itemWidth, kItemDefaultHeight)];
        [item setTitle:sec.kindName forState:UIControlStateNormal];
        item.backgroundColor = [UIColor whiteColor];
        item.tag = 1000+i;
        item.layer.cornerRadius = 3.0;
        [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
        item.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [item setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:item];
        
        //获取上半部分item view 的高度，
        if (i == _contentModel.second.count-1) {
            tatolHeight = item.frame.origin.y+item.frame.size.height;
        }
    }
    
    self.contentSize = CGSizeMake(self.frame.size.width, tatolHeight+20);
    
}

-(void)itemClick:(UIButton *)btn
{
    if (self.selectedMiddleItem) {
        NSInteger tag = btn.tag-1000;
        Second *model = _contentModel.second[tag];
        self.selectedMiddleItem(btn,model);
    }
}

@end
