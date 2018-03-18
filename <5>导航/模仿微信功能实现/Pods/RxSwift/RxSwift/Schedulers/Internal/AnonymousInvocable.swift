//
//  AnonymousInvocable.swift
//  Rx
//
//  Created by Krunoslav Zaher on 11/7/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

struct AnonymousInvocable : InvocableType {
    private let _action: () -> ()

    init(_ action: () -> ()) {
        _action = action
    }

    func invoke() {
        _action()
    }
}// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com