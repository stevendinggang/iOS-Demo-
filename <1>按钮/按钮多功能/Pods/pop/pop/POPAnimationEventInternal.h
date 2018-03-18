/**
 Copyright (c) 2014-present, Facebook, Inc.
 All rights reserved.
 
 This source code is licensed under the BSD-style license found in the
 LICENSE file in the root directory of this source tree. An additional grant
 of patent rights can be found in the PATENTS file in the same directory.
 */

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com

#import <Foundation/Foundation.h>

#import "POPAnimationEvent.h"

@interface POPAnimationEvent ()

/**
 @abstract Default initializer.
 */
- (instancetype)initWithType:(POPAnimationEventType)type time:(CFTimeInterval)time;

/**
 @abstract Readwrite redefinition of public property.
 */
@property (readwrite, nonatomic, copy) NSString *animationDescription;

@end

@interface POPAnimationValueEvent ()

/**
 @abstract Default initializer.
 */
- (instancetype)initWithType:(POPAnimationEventType)type time:(CFTimeInterval)time value:(id)value;

/**
 @abstract Readwrite redefinition of public property.
 */
@property (readwrite, nonatomic, strong) id velocity;

@end

