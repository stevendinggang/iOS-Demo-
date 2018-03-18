//
//  ShopCollectionViewCell.m
//  商品列表
//
//  Created by mac on 16/1/19.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import "ShopCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@implementation ShopCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    if (self) {
        
        self = [[[NSBundle mainBundle] loadNibNamed:@"ShopCollectionViewCell" owner:nil options:nil] objectAtIndex:0];
    }
    
    return self;
}

-(void)setOneModel:(OneModel *)oneModel{

    _oneModel = oneModel;
    
    [_imgV setImageWithURL:[NSURL URLWithString:_oneModel.icon_url]];
    
    _nameLabel.text = _oneModel.name;
}

@end
