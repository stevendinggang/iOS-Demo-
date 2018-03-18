//
//  DataModel.m
//  KFScrollViewDemo
//
//  Created by apple on 16/4/12.
//  Copyright © 2016年 吴凯锋 QQ:24272779. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel
-(instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

-(void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"second"]) {
        NSMutableArray *tmpTable = [[NSMutableArray alloc]init];
        for (NSDictionary *dict in value) {
            Second *second = [[Second alloc]initWithDictionary:dict];
            [tmpTable addObject:second];
        }
        self.second = tmpTable;
    }else
    {
        [super setValue:value forKey:key];
    }
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{}

@end
@implementation Second
-(instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{}
@end
