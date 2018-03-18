//
//  MSKBottomView.m
//  TestReactiveCocoa
//
//  Created by 马士奎 on 16/1/27.
//  Copyright (c) 2016年 LD. All rights reserved.
//

#import "MSKBottomView.h"
#import <ReactiveCocoa.h>
#import "MSKCarViewModel.h"
@interface MSKBottomView(){
    NSArray *currentDataSource;
    __weak IBOutlet UIButton *selectedAllBtn;
    __weak IBOutlet UILabel *allMoneyLabel;
    //总计金额
    float allMoney;
    //总共多少项
    float allCount;
    //勾选的数据
    float selectedCount;
}
@end

@implementation MSKBottomView
-(void)awakeFromNib{
    [super awakeFromNib];
    [[selectedAllBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(UIButton *sender) {
        selectedAllBtn.selected = !selectedAllBtn.selected;
        [self resetAllSelected:selectedAllBtn.selected];
    }];
}
/**
 *  全选/全不选
 *
 *  @param selected 是否全选
 */
-(void)resetAllSelected:(BOOL)selected{
    allMoney = 0;
    selectedCount = 0;
    for (NSArray *modes in currentDataSource) {
        for (MSKCarViewModel *carViewModel in modes) {
            carViewModel.goodSeleted = selected;
            allMoney += carViewModel.calculationTotalMoney.floatValue;
            if (selected) {
                selectedCount++;
            }
        }
    }
    allMoneyLabel.text = [NSString stringWithFormat:@"¥%.2f",allMoney];
    if (!selected) {
        allMoneyLabel.text = @"¥0.00";
        allMoney = 0;
        selectedCount = 0;
    }
    
    if (self.reloadAll) {
        self.reloadAll();
    }
}

/**
 *  计算总金额
 */
-(void)addOrMinusMoney{
    allMoney = 0;
    selectedCount = 0;
    allCount = 0;
    for (NSArray *modes in currentDataSource) {
        for (MSKCarViewModel *carViewModel in modes) {
            if (carViewModel.goodSeleted) {
                allMoney += carViewModel.calculationTotalMoney.floatValue;
                selectedCount++;
            }
            allCount ++;
        }
    }
    allMoneyLabel.text = [NSString stringWithFormat:@"¥%.2f",allMoney];
    if (selectedCount >= allCount && allCount > 0) {
        selectedAllBtn.selected = YES;
    }else{
        selectedAllBtn.selected = NO;
    }
}

-(void)setDataSource:(NSArray *)dataSource{
    currentDataSource = dataSource;
}

@end
