//
//  MSKCarModel.h
//  TestReactiveCocoa
//
//  Created by 马士奎 on 16/1/27.
//  Copyright (c) 2016年 LD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSKCarCellSubModel.h"
@interface MSKCarModel : NSObject
/**
 *  所属商家id
 */
@property (nonatomic,copy) NSString *businessId;
/**
 *  所属商家名称
 */
@property (nonatomic,copy) NSString *businessName;
/**
 *  商品id
 */
@property (nonatomic,copy) NSString *goodId;
/**
 *  商品名称
 */
@property (nonatomic,copy) NSString *goodName;
/**
 *  商品价格
 */
@property (nonatomic,strong) NSNumber *goodPrice;
/**
 *  购买数量
 */
@property (nonatomic,strong) NSNumber *buyNumber;
/**
 *  商品图片
 */
@property (nonatomic,copy) NSString *goodImg;
/**
 *  是否选择
 */
@property (nonatomic,assign) BOOL isSelected;
/**
 *  组合商品
 */
@property (nonatomic,strong) NSArray *groupGoods;

@end
