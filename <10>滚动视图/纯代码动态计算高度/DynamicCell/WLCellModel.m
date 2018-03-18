//
//  WLCell.m
//  DynamicCell
//
//  Created by chiyu on 16/2/16.
//  Copyright © 2016年 wangli. All rights reserved.
//

#import "WLCellModel.h"

@implementation WLCellModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dict];
        
        if (self.picture) {
            [self setValue:@"350" forKey:@"picW"];
            [self setValue:@"44" forKey:@"picH"];
        }
        
    }
    return self;
}
+(instancetype)modelWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}


@end
