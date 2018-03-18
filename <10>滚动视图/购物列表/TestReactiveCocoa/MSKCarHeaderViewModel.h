//
//  MSKCarHeaderViewModel.h
//  TestReactiveCocoa
//
//  Created by 马士奎 on 16/1/28.
//  Copyright (c) 2016年 LD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSKCarHeaderViewModel : NSObject
/**
 *  商家名称
 */
@property (nonatomic,copy) NSString *businessName;
/**
 *  商家id
 */
@property (nonatomic,copy) NSString *businessId;
/**
 *  商家Img
 */
@property (nonatomic,copy) NSString *businessImg;
/**
 *  是否全选
 */
@property (nonatomic,assign) BOOL isSelectedAll;
/**
 *  下属所有商品
 */
@property (nonatomic,strong) NSArray *dataSource;

/**
 *  返回是否全选
 *
 *  @return 是否全选
 */
-(BOOL)receiveIsSelectedSelectedAll;
/**
 *  组全选/取消全选
 *
 *  @param selected 是否全选
 */
-(void)resetModelSelected:(BOOL)selected;

@end
