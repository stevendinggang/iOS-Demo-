//
//  MSKCarViewModel.m
//  TestReactiveCocoa
//
//  Created by 马士奎 on 16/1/27.
//  Copyright (c) 2016年 LD. All rights reserved.
//

#import "MSKCarViewModel.h"
#import "MSKCarHeaderViewModel.h"
@interface MSKCarViewModel()
@property (nonatomic,strong) MSKCarModel *carBuyModel;
@property (nonatomic,strong) NSMutableArray *headerViewModels;
@property (nonatomic,strong) NSMutableArray *source;
@end
@implementation MSKCarViewModel
-(instancetype)initWithCellModel:(MSKCarModel *)model{
    self = [super init];
    if (self) {
        self.carBuyModel = model;
        self.goodPrice = [NSString stringWithFormat:@"¥ %.2f",model.goodPrice.floatValue];
        self.goodName = model.goodName;
        self.buyNumber = [NSString stringWithFormat:@"%d",model.buyNumber.intValue];
        self.buyTotalMoney = [NSString stringWithFormat:@"%.2f",self.buyNumber.intValue * self.carBuyModel.goodPrice.floatValue];
        self.goodSeleted = model.isSelected;
    }
    return self;
}

-(MSKCarModel *)carModel{
    return self.carBuyModel;
}

-(NSString *)calculationTotalMoney{
   
    return  self.buyTotalMoney = [NSString stringWithFormat:@"%.2f",self.buyNumber.intValue * self.carBuyModel.goodPrice.floatValue];
}

-(NSMutableArray *)receiveDataSource{
    self.source = [[NSMutableArray alloc] init];
    for (int j = 0; j < 3; j++) {
        NSMutableArray *goods = [[NSMutableArray alloc] init];
        for (int i = 0; i < 5; i++) {
            MSKCarModel *carModel = [MSKCarModel alloc];
            carModel.businessId = @"12";
            carModel.businessName = @"商家1";
            carModel.goodId = @"121";
            carModel.goodName = @"商品名称";
            carModel.buyNumber = @(i+1);
            carModel.goodPrice = @(i + 1.6);
            carModel.goodImg = @"http://img2.3lian.com/2014/f5/158/d/86.jpg";
            carModel.isSelected = YES;
            MSKCarViewModel *viewModel = [[MSKCarViewModel alloc] initWithCellModel:carModel];
            [goods addObject:viewModel];
            if (i == 2) {
                NSMutableArray *subGoods = [[NSMutableArray alloc] init];
                for (int k = 0; k < 5; k++) {
                    MSKCarCellSubModel *subModel = [MSKCarCellSubModel alloc];
                    subModel.goodId = @"1212";
                    subModel.goodImg = @"http://img2.3lian.com/2014/f5/158/d/87.jpg";
                    subModel.goodName = @"美女";
                    subModel.goodPrice = @(33);
                    [subGoods addObject:subModel];
                }
                carModel.groupGoods = subGoods;
            }else if (i == 3){
                
                NSMutableArray *subGoods = [[NSMutableArray alloc] init];
                for (int k = 0; k < 3; k++) {
                    MSKCarCellSubModel *subModel = [MSKCarCellSubModel alloc];
                    subModel.goodId = @"1212";
                    subModel.goodImg = @"http://img2.3lian.com/2014/f5/158/d/91.jpg";
                    subModel.goodName = @"美女";
                    subModel.goodPrice = @(33);
                    [subGoods addObject:subModel];
                }
                carModel.groupGoods = subGoods;
            }
            if (i == 0) {
                MSKCarHeaderViewModel *headerView = [[MSKCarHeaderViewModel alloc] init];
                headerView.businessId = carModel.businessId;
                headerView.businessName = carModel.businessName;
                headerView.dataSource = goods;
                headerView.isSelectedAll = NO;
                [self.headerViewModels addObject:headerView];
            }
        }
        [self.source addObject:goods];
    }
    return self.source;
}

//headerview model
-(NSMutableArray *)headerViewModels{
    if (!_headerViewModels) {
        _headerViewModels = [[NSMutableArray alloc] init];
    }
    return _headerViewModels;
}

-(NSMutableArray *)receiveHeaderViewSource{
    return self.headerViewModels;
}

/**
 *  设置是否全部显示删除按钮
 *
 *  @param isCanDelete 是否显示
 */
-(void)resetAllCanDelete:(BOOL) isCanDelete{
    for (NSArray *modes in self.source) {
        for (MSKCarViewModel *carViewModel in modes) {
            carViewModel.isShowCanDelete = isCanDelete;
        }
    }
}
@end
