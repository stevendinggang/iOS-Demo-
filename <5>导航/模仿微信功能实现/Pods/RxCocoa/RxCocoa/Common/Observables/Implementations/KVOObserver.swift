//
//  KVOObserver.swift
//  RxCocoa
//
//  Created by Krunoslav Zaher on 7/12/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation
#if !RX_NO_MODULE
import RxSwift
#endif

protocol KVOObservableProtocol {
    var target: AnyObject { get }
    var keyPath: String { get }
    var retainTarget: Bool { get }
    var options: NSKeyValueObservingOptions { get }
}

class KVOObserver : _RXKVOObserver
                  , Disposable {
    typealias Callback = (AnyObject?) -> Void

    var retainSelf: KVOObserver? = nil

    init(parent: KVOObservableProtocol, callback: Callback) {
    #if TRACE_RESOURCES
        OSAtomicIncrement32(&resourceCount)
    #endif
        
        super.init(target: parent.target, retainTarget: parent.retainTarget, keyPath: parent.keyPath, options: parent.options, callback: callback)
        self.retainSelf = self
    }
    
    override func dispose() {
        super.dispose()
        self.retainSelf = nil
    }
    
    deinit {
    #if TRACE_RESOURCES
        OSAtomicDecrement32(&resourceCount)
    #endif
    }
}// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com