//
//  _RXKVOObserver.h
//  RxCocoa
//
//  Created by Krunoslav Zaher on 7/11/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 ################################################################################
 This file is part of RX private API
 ################################################################################
 */

typedef void (^KVOCallback)(id);

// Exists because if written in Swift, reading unowned is disabled during dealloc process
@interface _RXKVOObserver : NSObject

-(instancetype)initWithTarget:(id)target
                 retainTarget:(BOOL)retainTarget
                      keyPath:(NSString*)keyPath
                      options:(NSKeyValueObservingOptions)options
                     callback:(KVOCallback)callback;

-(void)dispose;

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com