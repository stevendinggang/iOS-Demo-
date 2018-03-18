//
//  MSKCarTableviewHeaderView.h
//  TestReactiveCocoa
//
//  Created by 马士奎 on 16/1/27.
//  Copyright (c) 2016年 LD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSKCarViewModel.h"
#import "MSKCarHeaderViewModel.h"

typedef void (^SelectedORCancel)();
@interface MSKCarTableviewHeaderView : UITableViewHeaderFooterView
@property (nonatomic,copy) SelectedORCancel selectedOrCancel;
@property (nonatomic,strong) MSKCarHeaderViewModel *carHeaderViewModel;
-(void)restAllSelectedState;
@end
