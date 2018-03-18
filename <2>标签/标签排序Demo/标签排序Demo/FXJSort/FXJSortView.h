//
//  FXJSortView.h
//  标签排序Demo
//
//  Created by 冯学杰 on 16/4/5.
//  Copyright © 2016年 冯学杰. All rights reserved.
//

#import <UIKit/UIKit.h>

//屏幕相关
#define  SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define  SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height


@interface FXJSortView : UIView

-(void)firstTitleBtns:(NSArray *)arr;//创建已选Buttons

-(void)secondTitleBtns:(NSArray *)arr;

@property (nonatomic , strong) NSMutableArray *newtitleArr; //已选中的

@property (nonatomic , strong) UIImageView *lineImageView ;


@end

@interface MyButton : UIButton

@property (nonatomic , assign) BOOL isDown;

@end