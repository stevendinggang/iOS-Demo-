//
//  WLCell.h
//  DynamicCell
//
//  Created by chiyu on 16/2/16.
//  Copyright © 2016年 wangli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLCellFrameModel.h"

@interface WLCell : UITableViewCell


@property (nonatomic,strong) WLCellFrameModel *modelFrame;



-(void)showCellWithModel:(WLCellFrameModel *)frameModel indexPath:(NSIndexPath *)indexPath;

@end
