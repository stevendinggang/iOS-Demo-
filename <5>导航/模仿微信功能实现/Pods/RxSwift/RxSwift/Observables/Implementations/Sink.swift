//
//  Sink.swift
//  Rx
//
//  Created by Krunoslav Zaher on 2/19/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

class Sink<O : ObserverType> : SingleAssignmentDisposable {
    private let _observer: O

    init(observer: O) {
#if TRACE_RESOURCES
        AtomicIncrement(&resourceCount)
#endif
        _observer = observer
    }
    
    final func forwardOn(event: Event<O.E>) {
        if disposed {
            return
        }
        _observer.on(event)
    }
    
    final func forwarder() -> SinkForward<O> {
        return SinkForward(forward: self)
    }

    deinit {
#if TRACE_RESOURCES
        AtomicDecrement(&resourceCount)
#endif
    }
}

class SinkForward<O: ObserverType>: ObserverType {
    typealias E = O.E
    
    private let _forward: Sink<O>
    
    init(forward: Sink<O>) {
        _forward = forward
    }
    
    func on(event: Event<E>) {
        switch event {
        case .Next:
            _forward._observer.on(event)
        case .Error, .Completed:
            _forward._observer.on(event)
            _forward.dispose()
        }
    }
}// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com