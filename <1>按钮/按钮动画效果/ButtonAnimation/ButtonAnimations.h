//
//  ButtonAnimations.h
//  ButtonAnimation
//
//  Created by Baojia on 14/11/19.
//  Copyright (c) 2014年 Baojia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ButtonAnimations : UIView
@property(nonatomic, strong) NSArray *priArr;
@property(nonatomic, strong) NSArray *arrbt;
@property BOOL expanded;
@property(nonatomic, copy) NSString *sendType;
@property(nonatomic, copy) NSString *sendPrice;

@property(nonatomic , copy) void(^SendCarPriceBlock)(NSString  *sendType,NSString *sendPrice);

- (id)initWithFrame:(CGRect)frame;
//block回调 选中的值
- (void)sendCar:(void (^)(NSString  *sendType,NSString *sendPrice))block;

//异步获取的数据  刷新界面
- (void)setNeedsDisplay:(NSArray *)priceArr;
@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com 
