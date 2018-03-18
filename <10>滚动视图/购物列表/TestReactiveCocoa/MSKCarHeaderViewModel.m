//
//  MSKCarHeaderViewModel.m
//  TestReactiveCocoa
//
//  Created by 马士奎 on 16/1/28.
//  Copyright (c) 2016年 LD. All rights reserved.
//

#import "MSKCarHeaderViewModel.h"
#import "MSKCarViewModel.h"
@interface MSKCarHeaderViewModel()
@end
@implementation MSKCarHeaderViewModel
/**
 *  返回是否全选
 *
 *  @return 是否全选
 */
-(BOOL)receiveIsSelectedSelectedAll{
    BOOL selected = YES;
    for (MSKCarViewModel *viewModel in self.dataSource) {
        if (!viewModel.goodSeleted) {
            selected = NO;
        }
    }
    self.isSelectedAll = selected;
    return selected;
}

/**
 *  组全选/取消全选
 *
 *  @param selected 是否全选
 */
-(void)resetModelSelected:(BOOL)selected{
    for (MSKCarViewModel *viewModel in self.dataSource) {
        viewModel.goodSeleted = selected;
    }
    
    self.isSelectedAll = selected;
}

@end
