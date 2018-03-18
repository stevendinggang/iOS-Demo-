//
//  BlockingObservable.swift
//  Rx
//
//  Created by Krunoslav Zaher on 10/19/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation
#if !RX_NO_MODULE
    import RxSwift
#endif

/**
`BlockingObservable` is a variety of `Observable` that provides blocking operators. 

It can be useful for testing and demo purposes, but is generally inappropriate for production applications.

If you think you need to use a `BlockingObservable` this is usually a sign that you should rethink your
design.
*/
public struct BlockingObservable<E> {
    let source: Observable<E>
}// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com