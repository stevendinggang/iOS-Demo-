//
//  CSModel.m
//  test
//
//  Created by sangcixiang on 16/2/21.
//  Copyright © 2016年 sangcixiang. All rights reserved.
//

#import "CSModel.h"

@implementation CSModel

+(NSArray *)getAllModelData:(NSArray *)array
{
    NSMutableArray *mutableArray = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        CSModel *model = [CSModel new];
        model.list = dic[@"list"];
        model.parentld = dic[@"parentld"];
        model.name = dic[@"name"];
        [mutableArray addObject:model];
    }
    return [mutableArray copy];
}
+(NSArray *)getAllModelInfo:(NSArray *)array
{
    NSMutableArray *mutableArray = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        CSModel *model = [CSModel new];
        model.subID = dic[@"id"];
        model.subName = dic[@"name"];
        model.subParentld = dic[@"parentld"];
        [mutableArray addObject:model];
    }
    return [mutableArray copy];
}
@end
