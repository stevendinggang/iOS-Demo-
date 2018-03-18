//
//  ObservableConvertibleType+Blocking.swift
//  RxBlocking
//
//  Created by Krunoslav Zaher on 7/12/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation
#if !RX_NO_MODULE
import RxSwift
#endif

extension ObservableConvertibleType {
    /**
    Converts an Observable into a `BlockingObservable` (an Observable with blocking operators).

    - returns: `BlockingObservable` version of `self`
    */
    @warn_unused_result(message="http://git.io/rxs.uo")
    public func toBlocking() -> BlockingObservable<E> {
        return BlockingObservable(source: self.asObservable())
    }
}// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com