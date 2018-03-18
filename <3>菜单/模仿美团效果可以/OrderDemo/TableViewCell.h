//
//  TableViewCell.h
//  OrderDemo
//
//  Created by king on 16/2/25.
//  Copyright © 2016年 king. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol numberDelegate;
@interface TableViewCell : UITableViewCell

@property (nonatomic,retain)UIButton *addBut;
@property (nonatomic,retain)UIButton *cutBut;
@property (nonatomic,retain)UILabel  *numberLab;
@property (nonatomic,retain)UIImageView *goodsImg;
@property (nonatomic,retain)UILabel  *titleLab;
@property (nonatomic,retain)UILabel  *priceLab;
@property (nonatomic,assign)id<numberDelegate>delegate;
@end

@protocol numberDelegate <NSObject>

- (void)customCell:(TableViewCell *)cell buttom:(UIButton *)but numberLab:(UILabel *)lab;

@end
