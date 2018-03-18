//
//  ObserveOn.swift
//  RxSwift
//
//  Created by Krunoslav Zaher on 7/25/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

class ObserveOn<E> : Producer<E> {
    let scheduler: ImmediateSchedulerType
    let source: Observable<E>
    
    init(source: Observable<E>, scheduler: ImmediateSchedulerType) {
        self.scheduler = scheduler
        self.source = source
        
#if TRACE_RESOURCES
        AtomicIncrement(&resourceCount)
#endif
    }
    
    override func run<O : ObserverType where O.E == E>(observer: O) -> Disposable {
        let sink = ObserveOnSink(scheduler: scheduler, observer: observer)
        sink._subscription.disposable = source.subscribe(sink)
        return sink
    }
    
#if TRACE_RESOURCES
    deinit {
        AtomicDecrement(&resourceCount)
    }
#endif
}

enum ObserveOnState : Int32 {
    // pump is not running
    case Stopped = 0
    // pump is running
    case Running = 1
}

class ObserveOnSink<O: ObserverType> : ObserverBase<O.E> {
    typealias E = O.E
    
    let _scheduler: ImmediateSchedulerType

    var _lock = SpinLock()

    // state
    var _state = ObserveOnState.Stopped
    var _observer: O?
    var _queue = Queue<Event<E>>(capacity: 10)

    let _scheduleDisposable = SerialDisposable()
    let _subscription = SingleAssignmentDisposable()

    init(scheduler: ImmediateSchedulerType, observer: O) {
        _scheduler = scheduler
        _observer = observer
    }

    override func onCore(event: Event<E>) {
        let shouldStart = _lock.calculateLocked { () -> Bool in
            self._queue.enqueue(event)
            
            switch self._state {
            case .Stopped:
                self._state = .Running
                return true
            case .Running:
                return false
            }
        }
        
        if shouldStart {
            _scheduleDisposable.disposable = self._scheduler.scheduleRecursive((), action: self.run)
        }
    }
    
    func run(state: Void, recurse: Void -> Void) {
        let (nextEvent, observer) = self._lock.calculateLocked { () -> (Event<E>?, O?) in
            if self._queue.count > 0 {
                return (self._queue.dequeue(), self._observer)
            }
            else {
                self._state = .Stopped
                return (nil, self._observer)
            }
        }
        
        if let nextEvent = nextEvent {
            observer?.on(nextEvent)
            if nextEvent.isStopEvent {
                dispose()
            }
        }
        else {
            return
        }
        
        let shouldContinue = _shouldContinue_synchronized()
        
        if shouldContinue {
            recurse()
        }
    }

    func _shouldContinue_synchronized() -> Bool {
        _lock.lock(); defer { _lock.unlock() } // {
            if self._queue.count > 0 {
                return true
            }
            else {
                self._state = .Stopped
                return false
            }
        // }
    }
    
    override func dispose() {
        super.dispose()

        _subscription.dispose()
        _scheduleDisposable.dispose()

        _lock.lock(); defer { _lock.unlock() } // {
            _observer = nil
        
        // }
    }
}// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com