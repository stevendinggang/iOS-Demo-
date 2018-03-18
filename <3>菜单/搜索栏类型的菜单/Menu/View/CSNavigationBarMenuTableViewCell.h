//
//  CSNavigationBarMenuTableViewCell.h
//  test
//
//  Created by sangcixiang on 16/2/20.
//  Copyright © 2016年 sangcixiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSNavgationBarMenuItem.h"
#import "CSModel.h"
@interface CSNavigationBarMenuTableViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView * itemImageView;

@property(nonatomic,strong)UILabel * itemTitleLabel;

//@property(nonatomic,strong)CSNavgationBarMenuItem * model;


-(void)getMenuItemInfo:(CSModel *)model;















@end
