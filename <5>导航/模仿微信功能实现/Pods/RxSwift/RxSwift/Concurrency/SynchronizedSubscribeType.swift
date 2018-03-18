//
//  SynchronizedSubscribeType.swift
//  Rx
//
//  Created by Krunoslav Zaher on 10/25/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

protocol SynchronizedSubscribeType : class, ObservableType, Lock {
    func _synchronized_subscribe<O: ObserverType where O.E == E>(observer: O) -> Disposable
}

extension SynchronizedSubscribeType {
    func synchronizedSubscribe<O: ObserverType where O.E == E>(observer: O) -> Disposable {
        lock(); defer { unlock() }
        return _synchronized_subscribe(observer)
    }
}// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com