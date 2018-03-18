//
//  SubscribeOn.swift
//  RxSwift
//
//  Created by Krunoslav Zaher on 6/14/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

class SubscribeOnSink<Ob: ObservableType, O: ObserverType where Ob.E == O.E> : Sink<O>, ObserverType {
    typealias Element = O.E
    typealias Parent = SubscribeOn<Ob>
    
    let parent: Parent
    
    init(parent: Parent, observer: O) {
        self.parent = parent
        super.init(observer: observer)
    }
    
    func on(event: Event<Element>) {
        forwardOn(event)
        
        if event.isStopEvent {
            self.dispose()
        }
    }
    
    func run() -> Disposable {
        let disposeEverything = SerialDisposable()
        let cancelSchedule = SingleAssignmentDisposable()
        
        disposeEverything.disposable = cancelSchedule
        
        cancelSchedule.disposable = parent.scheduler.schedule(()) { (_) -> Disposable in
            let subscription = self.parent.source.subscribe(self)
            disposeEverything.disposable = ScheduledDisposable(scheduler: self.parent.scheduler, disposable: subscription)
            return NopDisposable.instance
        }
    
        return disposeEverything
    }
}

class SubscribeOn<Ob: ObservableType> : Producer<Ob.E> {
    let source: Ob
    let scheduler: ImmediateSchedulerType
    
    init(source: Ob, scheduler: ImmediateSchedulerType) {
        self.source = source
        self.scheduler = scheduler
    }
    
    override func run<O : ObserverType where O.E == Ob.E>(observer: O) -> Disposable {
        let sink = SubscribeOnSink(parent: self, observer: observer)
        sink.disposable = sink.run()
        return sink
    }
}// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com