//
//  ObservableConvertibleType.swift
//  Rx
//
//  Created by Krunoslav Zaher on 9/17/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

/**
Type that can be converted to observable sequence (`Observer<E>`).
*/
public protocol ObservableConvertibleType {
    /**
    Type of elements in sequence.
    */
    typealias E
    
    /**
    Converts `self` to `Observable` sequence.
    
    - returns: Observable sequence that represents `self`.
    */
    func asObservable() -> Observable<E>
}
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com