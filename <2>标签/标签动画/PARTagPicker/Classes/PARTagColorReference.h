//
//  PARTagColorReference.h
//  PARTagPicker
//
//  Created by Paul Rolfe on 7/21/15.
//  Copyright (c) 2015 Paul Rolfe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface PARTagColorReference : NSObject

- (instancetype)initWithDefaultColors;

@property (nonatomic, strong) UIColor *chosenTagBackgroundColor;
@property (nonatomic, strong) UIColor *chosenTagTextColor;
@property (nonatomic, strong) UIColor *chosenTagBorderColor;

@property (nonatomic, strong) UIColor *defaultTagBackgroundColor;
@property (nonatomic, strong) UIColor *defaultTagTextColor;
@property (nonatomic, strong) UIColor *defaultTagBorderColor;

@property (nonatomic, strong) UIColor *highlightedTagBackgroundColor;
@property (nonatomic, strong) UIColor *highlightedTagTextColor;
@property (nonatomic, strong) UIColor *highlightedTagBorderColor;

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com