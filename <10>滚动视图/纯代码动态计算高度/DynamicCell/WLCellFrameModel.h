//
//  WLCellFrameModel.h
//  DynamicCell
//
//  Created by chiyu on 16/2/16.
//  Copyright © 2016年 wangli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLCellModel.h"

@interface WLCellFrameModel : NSObject

@property (nonatomic, assign, readonly) CGRect iconF;
@property (nonatomic, assign,readonly) CGRect nameF;
@property (nonatomic,assign,readonly) CGRect textF;
@property (nonatomic,assign,readonly) CGRect pictureF;


@property (nonatomic,assign,readonly) CGFloat cellHeight;
@property (nonatomic,strong) WLCellModel *cellModel;


@end
