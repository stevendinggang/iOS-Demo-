//
//  NSObject+Rx+KVORepresentable.swift
//  Rx
//
//  Created by Krunoslav Zaher on 11/14/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation
#if !RX_NO_MODULE
    import RxSwift
#endif

extension NSObject {

    /**
     Specialization of generic `rx_observe` method.

     This is a special overload because to observe values of some type (for example `Int`), first values of KVO type
     need to be observed (`NSNumber`), and then converted to result type.

     For more information take a look at `rx_observe` method.
     */
    @warn_unused_result(message="http://git.io/rxs.uo")
    public func rx_observe<E: KVORepresentable>(type: E.Type, _ keyPath: String, options: NSKeyValueObservingOptions = [.New, .Initial], retainSelf: Bool = true) -> Observable<E?> {
        return rx_observe(E.KVOType.self, keyPath, options: options, retainSelf: retainSelf)
            .map(E.init)
    }
}

#if !DISABLE_SWIZZLING
    // KVO
    extension NSObject {
        /**
        Specialization of generic `rx_observeWeakly` method.

        For more information take a look at `rx_observeWeakly` method.
        */
        @warn_unused_result(message="http://git.io/rxs.uo")
        public func rx_observeWeakly<E: KVORepresentable>(type: E.Type, _ keyPath: String, options: NSKeyValueObservingOptions = [.New, .Initial]) -> Observable<E?> {
            return rx_observeWeakly(E.KVOType.self, keyPath, options: options)
                .map(E.init)
        }
    }
#endif
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com