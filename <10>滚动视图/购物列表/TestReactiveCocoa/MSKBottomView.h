//
//  MSKBottomView.h
//  TestReactiveCocoa
//
//  Created by 马士奎 on 16/1/27.
//  Copyright (c) 2016年 LD. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ReloadAll)();
@interface MSKBottomView : UIView
@property (nonatomic,copy) ReloadAll reloadAll;
@property (nonatomic,strong) NSArray *dataSource;
-(void)addOrMinusMoney;
@end
