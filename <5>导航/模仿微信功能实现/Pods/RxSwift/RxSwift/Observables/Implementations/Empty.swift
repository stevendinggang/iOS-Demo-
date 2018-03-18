//
//  Empty.swift
//  Rx
//
//  Created by Krunoslav Zaher on 8/30/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

class Empty<Element> : Producer<Element> {
    override func subscribe<O : ObserverType where O.E == Element>(observer: O) -> Disposable {
        observer.on(.Completed)
        return NopDisposable.instance
    }
}// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com