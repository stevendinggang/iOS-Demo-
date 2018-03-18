//
//  NetWorking.h
//  BV_WeiBo
//
//  Created by mac on 16/1/7.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import <Foundation/Foundation.h>

//设置block
typedef void(^SuccessBlock)(id result);

@interface NetWorking : NSObject

//获取当前登录用户及关注好友的最新微博信息
+(void)getHomeTimeLineWithURLString:(NSString *)urlString success:(SuccessBlock)block;

@end
