//
//  WLCell.h
//  DynamicCell
//
//  Created by chiyu on 16/2/16.
//  Copyright © 2016年 wangli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLCellModel : NSObject

@property (nonatomic ,copy) NSString *text;
@property (nonatomic ,copy) NSString *icon;
@property (nonatomic,copy) NSString *name;
@property (nonatomic ,copy) NSString *picture;
@property (nonatomic, assign) BOOL vip;


@property (nonatomic,copy) NSString *picW;
@property (nonatomic,copy) NSString *picH;



-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)modelWithDict:(NSDictionary *)dict;


@end
