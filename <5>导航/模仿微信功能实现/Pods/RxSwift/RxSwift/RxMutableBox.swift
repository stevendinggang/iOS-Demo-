//
//  RxMutableBox.swift
//  RxSwift
//
//  Created by Krunoslav Zaher on 5/22/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

/**
Creates mutable reference wrapper for any type.
*/
class RxMutableBox<T> : CustomDebugStringConvertible {
    /**
    Wrapped value
    */
    var value : T
    
    /**
    Creates reference wrapper for `value`.
    
    - parameter value: Value to wrap.
    */
    init (_ value: T) {
        self.value = value
    }
}

extension RxMutableBox {
    /**
    - returns: Box description.
    */
    var debugDescription: String {
        get {
            return "MutatingBox(\(self.value))"
        }
    }
}
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com