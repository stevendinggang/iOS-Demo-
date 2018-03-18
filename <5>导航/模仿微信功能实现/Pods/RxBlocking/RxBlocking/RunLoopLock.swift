//
//  RunLoopLock.swift
//  Rx
//
//  Created by Krunoslav Zaher on 11/5/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation
#if !RX_NO_MODULE
    import RxSwift
#endif

class RunLoopLock {
    let currentRunLoop: CFRunLoopRef

    init() {
        currentRunLoop = CFRunLoopGetCurrent()
    }

    func dispatch(action: () -> ()) {
        CFRunLoopPerformBlock(currentRunLoop, kCFRunLoopDefaultMode) {
            if CurrentThreadScheduler.isScheduleRequired {
                CurrentThreadScheduler.instance.schedule(()) { _ in
                    action()
                    return NopDisposable.instance
                }
            }
            else {
                action()
            }
        }
        CFRunLoopWakeUp(currentRunLoop)
    }

    func stop() {
        CFRunLoopPerformBlock(currentRunLoop, kCFRunLoopDefaultMode) {
            CFRunLoopStop(self.currentRunLoop)
        }
        CFRunLoopWakeUp(currentRunLoop)
    }

    func run() {
        CFRunLoopRun()
    }
}
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com