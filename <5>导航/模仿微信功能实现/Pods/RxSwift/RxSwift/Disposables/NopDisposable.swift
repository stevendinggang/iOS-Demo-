//
//  NopDisposable.swift
//  Rx
//
//  Created by Krunoslav Zaher on 2/15/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

/**
Represents a disposable that does nothing on disposal.

Nop = No Operation
*/
public struct NopDisposable : Disposable {
 
    /**
    Singleton instance of `NopDisposable`.
    */
    public static let instance: Disposable = NopDisposable()
    
    init() {
        
    }
    
    /**
    Does nothing.
    */
    public func dispose() {
    }
}// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com