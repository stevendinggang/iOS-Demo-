//
//  KFScrollView.h
//  KFScrollViewDemo
//
//  Created by apple on 16/4/11.
//  Copyright © 2016年 吴凯锋 QQ:24272779. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"
@interface KFScrollView : UIView
-(instancetype)initWithFrame:(CGRect)frame headerHeight:(float)headerHeight withArray:(NSArray *)dataArray;
-(void)didSelectedTop:(void (^)(id item))selectedTop selectedMiddle:(void (^)(UIButton* item,Second *model))selectedMiddle;
@end
