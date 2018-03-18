//
//  MSKCarViewModel.h
//  TestReactiveCocoa
//
//  Created by 马士奎 on 16/1/27.
//  Copyright (c) 2016年 LD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSKCarModel.h"
@interface MSKCarViewModel : NSObject
/*!
 *  购买数量
 */
@property (nonatomic,copy) NSString *buyNumber;
/*!
 *  商品名称
 */
@property (nonatomic,copy) NSString *goodName;
/*!
 *  购买所需金额
 */
@property (nonatomic,copy) NSString *buyTotalMoney;
/*!
 *  单价
 */
@property (nonatomic,copy) NSString *goodPrice;
/*!
 *  是否选择
 */
@property (nonatomic,assign) BOOL goodSeleted;
/*!
 *  是否显示删除按钮
 */
@property (nonatomic,assign) BOOL isShowCanDelete;

-(instancetype)initWithCellModel:(MSKCarModel *)model;
-(MSKCarModel *)carModel;
/*!
 *  计算总价
 *
 *  @return
 */
-(NSString *)calculationTotalMoney;
/*!
 *  获取购物车数据
 *
 *  @return
 */
-(NSMutableArray *)receiveDataSource;
/*!
 *  购物车中商家数据
 *
 *  @return
 */
-(NSMutableArray *)receiveHeaderViewSource;
/*!
 *  设置是否全部显示删除按钮
 *
 *  @param isCanDelete 是否显示
 */
-(void)resetAllCanDelete:(BOOL) isCanDelete;

@end
