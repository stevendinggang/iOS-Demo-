//
//  HCFavoriteFolderModel.m
//  HCSpringBoard
//
//  Created by 刘海川 on 16/3/6.
//  Copyright © 2016年 Haichuan Liu. All rights reserved.
//

#import "HCFavoriteFolderModel.h"
#import "NSObject+YYModel.h"
#import "HCFavoriteFolderView.h"
#import "HCFavoriteIconModel.h"
#import "HCFavoriteIconView.h"

@implementation HCFavoriteFolderModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _iconModelsFolderArray = [[NSMutableArray alloc]init];
        _iconViewsFolderArray = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)updateTagFolderModel {
    [_iconViewsFolderArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        HCFavoriteFolderView *folderView = obj;
        folderView.tag = idx;
    }];
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"iconModelsFolderArray" : HCFavoriteIconModel.class,
             @"iconViewsFolderArray" : HCFavoriteIconView.class};
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