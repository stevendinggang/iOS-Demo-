//
//  Observable+Debug.swift
//  RxSwift
//
//  Created by Krunoslav Zaher on 5/2/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

// MARK: debug

extension ObservableType {
    
    /**
    Prints received events for all observers on standard output.

    - seealso: [do operator on reactivex.io](http://reactivex.io/documentation/operators/do.html)
    
    - parameter identifier: Identifier that is printed together with event description to standard output.
    - returns: An observable sequence whose events are printed to standard output.
    */
    @warn_unused_result(message="http://git.io/rxs.uo")
    public func debug(identifier: String? = nil, file: String = __FILE__, line: UInt = __LINE__, function: String = __FUNCTION__)
        -> Observable<E> {
        return Debug(source: self.asObservable(), identifier: identifier, file: file, line: line, function: function)
    }
}// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com