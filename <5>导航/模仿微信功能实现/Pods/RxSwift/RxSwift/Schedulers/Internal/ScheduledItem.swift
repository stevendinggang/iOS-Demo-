//
//  ScheduledItem.swift
//  Rx
//
//  Created by Krunoslav Zaher on 9/2/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

struct ScheduledItem<T>
    : ScheduledItemType
    , InvocableType {
    typealias Action = T -> Disposable
    
    private let _action: Action
    private let _state: T

    private let _disposable = SingleAssignmentDisposable()

    var disposed: Bool {
        get {
            return _disposable.disposed
        }
    }
    
    init(action: Action, state: T) {
        _action = action
        _state = state
    }
    
    func invoke() {
         _disposable.disposable = _action(_state)
    }
    
    func dispose() {
        _disposable.dispose()
    }
}// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com