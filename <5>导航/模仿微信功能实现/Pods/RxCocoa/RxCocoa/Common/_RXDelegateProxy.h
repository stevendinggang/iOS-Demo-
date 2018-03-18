//
//  _RXDelegateProxy.h
//  RxCocoa
//
//  Created by Krunoslav Zaher on 7/4/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface _RXDelegateProxy : NSObject

@property (nonatomic, assign, readonly) id _forwardToDelegate;

-(void)_setForwardToDelegate:(id)forwardToDelegate retainDelegate:(BOOL)retainDelegate;

-(BOOL)hasWiredImplementationForSelector:(SEL)selector;

-(void)interceptedSelector:(SEL)selector withArguments:(NSArray*)arguments;

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com