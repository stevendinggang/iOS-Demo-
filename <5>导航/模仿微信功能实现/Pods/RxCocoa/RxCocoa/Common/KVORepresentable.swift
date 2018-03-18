//
//  KVORepresentable.swift
//  Rx
//
//  Created by Krunoslav Zaher on 11/14/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

/**
Type that is KVO representable (KVO mechanism can be used to observe it).
*/
public protocol KVORepresentable {
    /**
    Associated KVO type.
    */
    typealias KVOType

    /**
    Constructs `Self` using KVO value.
    */
    init?(KVOValue: KVOType)
}

extension KVORepresentable {
    /**
    Initializes `KVORepresentable` with optional value.
    */
    init?(KVOValue: KVOType?) {
        guard let KVOValue = KVOValue else {
            return nil
        }

        self.init(KVOValue: KVOValue)
    }
}

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com