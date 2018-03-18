//
//  MSKBuyCarCell.h
//  TestReactiveCocoa
//
//  Created by 马士奎 on 16/1/27.
//  Copyright (c) 2016年 LD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSKCarViewModel.h"
typedef void (^CalculationMoney)();
typedef void (^DeleteCarGood)();
/*!
 *
 */
@interface MSKBuyCarCell : UITableViewCell
@property (nonatomic,copy) CalculationMoney calculationBlock;
@property (nonatomic,copy) DeleteCarGood deleteCarGood;
@property (nonatomic,strong) MSKCarViewModel *carViewModel;
@property (nonatomic,assign) BOOL isDelete;
@end
