//
//  DisposeBase.swift
//  Rx
//
//  Created by Krunoslav Zaher on 4/4/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

/**
Base class for all disposables.
*/
public class DisposeBase {
    init() {
#if TRACE_RESOURCES
    AtomicIncrement(&resourceCount)
#endif
    }
    
    deinit {
#if TRACE_RESOURCES
    AtomicDecrement(&resourceCount)
#endif
    }
}// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com