//
//  CSNavigationBarMenuTableViewCell.m
//  test
//
//  Created by sangcixiang on 16/2/20.
//  Copyright © 2016年 sangcixiang. All rights reserved.
//

#import "CSNavigationBarMenuTableViewCell.h"
#import "Masonry.h"
@implementation CSNavigationBarMenuTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self initSubViews];
    }
    return self;
}
-(void)initSubViews
{
    self.itemImageView = [[UIImageView alloc]init];
    self.itemImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:self.itemImageView];
    [self.itemImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(5);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(30);
    }];
    self.itemTitleLabel = [[UILabel alloc]init];
    self.itemTitleLabel.font = [UIFont systemFontOfSize:17];
    self.itemTitleLabel.textColor = [UIColor whiteColor];
    [self.contentView addSubview:self.itemTitleLabel];
    if (self.itemImageView.image != nil) {
        [self.itemTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.itemImageView).offset(40);
            make.centerY.equalTo(self.contentView);
            make.centerX.equalTo(self.contentView);
        }];
    }else{
        [self.itemTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(10);
            make.centerY.equalTo(self.contentView);
            make.centerX.equalTo(self.contentView);
        }];
    }
}
-(void)getMenuItemInfo:(CSModel *)model
{
    self.itemTitleLabel.text = model.subName;
    self.itemTitleLabel.textColor = [UIColor colorWithRed:200/255.0 green:100/255.0 blue:0/255.0 alpha:1];
}


















@end
