//
//  DataModel.h
//  KFScrollViewDemo
//
//  Created by apple on 16/4/12.
//  Copyright © 2016年 吴凯锋 QQ:24272779. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Second;
@interface DataModel : NSObject

@property (nonatomic, copy) NSString *kindCode;

@property (nonatomic, copy) NSString *kindName;

@property (nonatomic, copy) NSString *kindLogo;

@property (nonatomic, strong) NSArray<Second *> *second;

-(instancetype)initWithDictionary:(NSDictionary *)dict;

@end
@interface Second : NSObject

@property (nonatomic, copy) NSString *kindName;
@property (nonatomic, copy) NSString *KindCode;
-(instancetype)initWithDictionary:(NSDictionary *)dict;
@end
