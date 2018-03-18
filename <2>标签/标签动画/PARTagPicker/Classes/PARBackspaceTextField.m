//
//  RBBackspaceTextField.m
//  ResourceBooking
//
//  Created by Anbita Siregar on 6/26/15.
//  Copyright (c) 2015 Intrepid Pursuits. All rights reserved.
//

#import "PARBackspaceTextField.h"

@implementation PARBackspaceTextField

- (void)deleteBackward {
    [self.backspaceDelegate textFieldDidBackspace:self];
    [super deleteBackward];
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com