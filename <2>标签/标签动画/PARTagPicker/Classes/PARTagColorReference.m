//
//  PARTagColorReference.m
//  PARTagPicker
//
//  Created by Paul Rolfe on 7/21/15.
//  Copyright (c) 2015 Paul Rolfe. All rights reserved.
//

#import "PARTagColorReference.h"

@implementation PARTagColorReference

- (instancetype)initWithDefaultColors {
    self = [super init];
    if (self) {
        self.chosenTagBorderColor = [UIColor blackColor];
        self.chosenTagBackgroundColor = [UIColor blackColor];
        self.chosenTagTextColor = [UIColor whiteColor];
        
        self.defaultTagBorderColor = [UIColor lightGrayColor];
        self.defaultTagBackgroundColor = [UIColor lightGrayColor];
        self.defaultTagTextColor = [UIColor blackColor];
        
        self.highlightedTagBorderColor = [UIColor whiteColor];
        self.highlightedTagBackgroundColor = [UIColor whiteColor];
        self.highlightedTagTextColor = [UIColor blackColor];
    }
    return self;
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com