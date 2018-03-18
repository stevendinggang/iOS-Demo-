//
//  HCFavoriteIconModel.m
//  HCSpringBoard
//
//  Created by 刘海川 on 16/3/4.
//  Copyright © 2016年 Haichuan Liu. All rights reserved.
//

#import "HCFavoriteIconModel.h"
#import "NSObject+YYModel.h"

@implementation HCFavoriteIconModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"image" : @"kImage",
             @"imageSeleted" : @"kImageSeleted",
             @"name" : @"kNodeName",
             @"display" : @"kIsDisplay",
             @"isReadOnly" : @"kIsReadOnly",
             @"menuListImage" : @"kMenuListImage",
             @"navigationPointing" : @"kNavigationObject",
             @"isNeedLogin" : @"kNeedLogin",
             @"nodeIndex" : @"kNodeIndex",
             @"sortNum" : @"kSortNum",
             @"targetController" : @"kSendController",
             @"type" : @"kNodeType",
             @"itemList" : @"kItems"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"itemList" : HCFavoriteIconModel.class};
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self modelEncodeWithCoder:aCoder];
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    return [self modelInitWithCoder:aDecoder];
}

- (NSUInteger)hash {
    return [self modelHash];
}
- (BOOL)isEqual:(id)object {
    return [self modelIsEqual:object];
}


@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com