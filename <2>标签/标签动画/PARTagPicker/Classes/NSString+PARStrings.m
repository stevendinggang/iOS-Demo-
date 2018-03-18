//
//  NSString+PARStrings.m
//  PARTagPicker
//
//  Created by Paul Rolfe on 7/21/15.
//  Copyright (c) 2015 Paul Rolfe. All rights reserved.
//

#import "NSString+PARStrings.h"

@implementation NSString (PARStrings)

- (NSString *)similarStringFromArray:(NSArray *)strings {
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"self LIKE %@", self];
    NSArray *similarStrings = [strings filteredArrayUsingPredicate:pred];
    return similarStrings.firstObject;
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com