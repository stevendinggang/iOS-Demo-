//
//  Cancelable.swift
//  Rx
//
//  Created by Krunoslav Zaher on 3/12/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

/**
Represents disposable resource with state tracking.
*/
public protocol Cancelable : Disposable {
    /**
    - returns: Was resource disposed.
    */
    var disposed: Bool { get }
}// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com