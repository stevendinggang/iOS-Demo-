//
//  UIButton+RemoveHighlightEffect.m
//  WeiBo17
//
//  Created by teacher on 15/8/26.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "UIButton+RemoveHighlightEffect.h"
#import <objc/runtime.h>

#define kRemoveHighlightEffect @"RemoveHighlightEffect"

@implementation UIButton (RemoveHighlightEffect)


+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class clazz = [self class];
        
        
        
        
        SEL originalSEL = @selector(setHighlighted:);
        SEL swizzledSEL = @selector(iw_setHighlighted:);
        
        
        Method originalMethod = class_getInstanceMethod(clazz, originalSEL);
        Method swizzledMethod = class_getInstanceMethod(clazz, swizzledSEL);
        
        
        //添加方法
        
        BOOL result = class_addMethod(clazz, swizzledSEL, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (result) {
            class_replaceMethod(clazz, originalSEL, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        }else{
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}


- (void)iw_setHighlighted:(BOOL)highlighted{
    if (!self.removeHighlightEffect) {
        //这句代码代码调用原来的方法
        [self iw_setHighlighted:highlighted];
    }
}



- (void)setRemoveHighlightEffect:(BOOL)removeHighlightEffect{
    objc_setAssociatedObject(self, kRemoveHighlightEffect, @(removeHighlightEffect), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)removeHighlightEffect{
    return objc_getAssociatedObject(self, kRemoveHighlightEffect);
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com