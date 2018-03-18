//
//  NetWorking.m
//  BV_WeiBo
//
//  Created by mac on 16/1/7.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import "NetWorking.h"
#import "AFNetworking.h"

@implementation NetWorking

//获取当前登录用户及关注好友的最新微博信息
+(void)getHomeTimeLineWithURLString:(NSString *)urlString success:(SuccessBlock)block{

//    NSString *urlString = @"https://api.weibo.com/2/statuses/home_timeline.json";
    
//    NSDictionary *parameters = @{@"access_token":kAccessToken};
    
    //创建网路请求的管理者
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        block(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error is %@",error);
    }];
}

@end
