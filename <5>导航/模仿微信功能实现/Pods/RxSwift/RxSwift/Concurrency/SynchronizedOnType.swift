//
//  SynchronizedOnType.swift
//  Rx
//
//  Created by Krunoslav Zaher on 10/25/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

protocol SynchronizedOnType : class, ObserverType, Lock {
    func _synchronized_on(event: Event<E>)
}

extension SynchronizedOnType {
    func synchronizedOn(event: Event<E>) {
        lock(); defer { unlock() }
        _synchronized_on(event)
    }
}// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com