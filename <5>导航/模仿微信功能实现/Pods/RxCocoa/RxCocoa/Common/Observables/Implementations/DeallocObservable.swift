//
//  DeallocObservable.swift
//  Rx
//
//  Created by Krunoslav Zaher on 12/19/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation
#if !RX_NO_MODULE
import RxSwift
#endif

class DeallocObservable {
    let _subject = ReplaySubject<Void>.create(bufferSize: 1)

    init() {
    }

    deinit {
        _subject.on(.Next(()))
        _subject.on(.Completed)
    }
}
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com