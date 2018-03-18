//
//  MSKCarCellSubModel.h
//  TestReactiveCocoa
//
//  Created by 马士奎 on 16/1/29.
//  Copyright (c) 2016年 LD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSKCarCellSubModel : NSObject
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
 *  商品图片
 */
@property (nonatomic,copy) NSString *goodImg;
@end
