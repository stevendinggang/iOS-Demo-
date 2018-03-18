//
//  KFScrollContentView.h
//  KFScrollViewDemo
//
//  Created by apple on 16/4/12.
//  Copyright © 2016年 吴凯锋 QQ:24272779. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"

typedef void(^SelectedButton) (id button,id title);
@interface SelectButton :UIView
@property (nonatomic,strong)UIButton * button;
@property (nonatomic,strong)UILabel *label;
@property (nonatomic,strong)SelectedButton selectedButton;
-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title identifier:(NSString *)idenfier;

@end


typedef void(^SelectedMiddleItem) (UIButton *btn,Second *model);
@interface KFScrollContentView : UIScrollView
@property (nonatomic,strong)SelectedMiddleItem selectedMiddleItem;

-(instancetype)initWithFrame:(CGRect)frame data:(DataModel *)model rowCount:(NSInteger)count;

@end
