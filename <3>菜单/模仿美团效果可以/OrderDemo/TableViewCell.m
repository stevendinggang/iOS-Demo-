//
//  TableViewCell.m
//  OrderDemo
//
//  Created by king on 16/2/25.
//  Copyright © 2016年 king. All rights reserved.
//

#import "TableViewCell.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width-80
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@implementation TableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _goodsImg = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 50, 50)];
        _goodsImg.backgroundColor = [UIColor grayColor];
        [self addSubview:_goodsImg];
        
        _addBut = [UIButton buttonWithType:UIButtonTypeContactAdd];
        _addBut.frame =CGRectMake(WIDTH-32, 60, 22, 22);
        [_addBut addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        _addBut.tag = 10086;
        [self addSubview:_addBut];
        
        _cutBut = [UIButton buttonWithType:UIButtonTypeSystem];
        _cutBut.frame = CGRectMake(WIDTH-87,60, 22, 22);
        [_cutBut addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        _cutBut.tag = 10010;
        [_cutBut setTitle:@"－" forState:UIControlStateNormal];
        _cutBut.hidden = YES;
        _cutBut.layer.cornerRadius = 11;
        _cutBut.layer.borderWidth = 1;
        _cutBut.layer.borderColor = [UIColor blueColor].CGColor;
        [self addSubview:_cutBut];
        
        _numberLab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH-65, 60, 33, 22)];
        _numberLab.textAlignment = NSTextAlignmentCenter;
        _numberLab.text = @"0";
        _numberLab.hidden = YES;
        _numberLab.font = [UIFont boldSystemFontOfSize:14];
        [self addSubview:_numberLab];
        
        _titleLab = [[UILabel alloc]initWithFrame:CGRectMake(57, 5, WIDTH-65, 30)];
        _titleLab.font = [UIFont systemFontOfSize:15];
        _titleLab.text = @"套餐外卖";
        [self addSubview:_titleLab];
        
        _priceLab = [[UILabel alloc]initWithFrame:CGRectMake(5, 60, 100, 22)];
        _priceLab.textColor = [UIColor redColor];
        _priceLab.font = [UIFont systemFontOfSize:15];
        [self addSubview:_priceLab];
    }
    return self;
}
- (void)click:(UIButton *)sender{
    _numberLab.hidden = NO;
    _cutBut.hidden = NO;
    if ([self.delegate respondsToSelector:@selector(customCell:buttom:numberLab:)]) {
        [self.delegate customCell:self buttom:sender numberLab:_numberLab];
    }
}
@end
