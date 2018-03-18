//
//  Timer.swift
//  RxSwift
//
//  Created by Krunoslav Zaher on 6/7/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

class TimerSink<O: ObserverType where O.E : SignedIntegerType > : Sink<O> {
    typealias Parent = Timer<O.E>
    
    private let _parent: Parent
    
    init(parent: Parent, observer: O) {
        _parent = parent
        super.init(observer: observer)
    }
    
    func run() -> Disposable {
        return _parent._scheduler.schedulePeriodic(0 as O.E, startAfter: _parent._dueTime, period: _parent._period!) { state in
            self.forwardOn(.Next(state))
            return state &+ 1
        }
    }
}

class TimerOneOffSink<O: ObserverType where O.E : SignedIntegerType> : Sink<O> {
    typealias Parent = Timer<O.E>
    
    private let _parent: Parent
    
    init(parent: Parent, observer: O) {
        _parent = parent
        super.init(observer: observer)
    }
    
    func run() -> Disposable {
        return _parent._scheduler.scheduleRelative((), dueTime: _parent._dueTime) { (_) -> Disposable in
            self.forwardOn(.Next(0))
            self.forwardOn(.Completed)
            
            return NopDisposable.instance
        }
    }
}

class Timer<E: SignedIntegerType>: Producer<E> {
    private let _scheduler: SchedulerType
    private let _dueTime: RxTimeInterval
    private let _period: RxTimeInterval?
    
    init(dueTime: RxTimeInterval, period: RxTimeInterval?, scheduler: SchedulerType) {
        _scheduler = scheduler
        _dueTime = dueTime
        _period = period
    }
    
    override func run<O : ObserverType where O.E == E>(observer: O) -> Disposable {
        if let _ = _period {
            let sink = TimerSink(parent: self, observer: observer)
            sink.disposable = sink.run()
            return sink
        }
        else {
            let sink = TimerOneOffSink(parent: self, observer: observer)
            sink.disposable = sink.run()
            return sink
        }
    }
}// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com