//
//  ObservableConvertibleType+Driver.swift
//  Rx
//
//  Created by Krunoslav Zaher on 9/19/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation
#if !RX_NO_MODULE
import RxSwift
#endif

extension ObservableConvertibleType {
    /**
    Converts anything convertible to `Observable` to `Driver` unit.
    
    - parameter onErrorJustReturn: Element to return in case of error and after that complete the sequence.
    - returns: Driving observable sequence.
    */
    @warn_unused_result(message="http://git.io/rxs.uo")
    public func asDriver(onErrorJustReturn onErrorJustReturn: E) -> Driver<E> {
        let source = self
            .asObservable()
            .observeOn(driverObserveOnScheduler)
            .catchErrorJustReturn(onErrorJustReturn)
        return Driver(source)
    }
    
    /**
    Converts anything convertible to `Observable` to `Driver` unit.
    
    - parameter onErrorDriveWith: Driver that continues to drive the sequence in case of error.
    - returns: Driving observable sequence.
    */
    @warn_unused_result(message="http://git.io/rxs.uo")
    public func asDriver(onErrorDriveWith onErrorDriveWith: Driver<E>) -> Driver<E> {
        let source = self
            .asObservable()
            .observeOn(driverObserveOnScheduler)
            .catchError { _ in
                onErrorDriveWith.asObservable()
            }
        return Driver(source)
    }

    /**
    Converts anything convertible to `Observable` to `Driver` unit.
    
    - parameter onErrorRecover: Calculates driver that continues to drive the sequence in case of error.
    - returns: Driving observable sequence.
    */
    @warn_unused_result(message="http://git.io/rxs.uo")
    public func asDriver(onErrorRecover onErrorRecover: (error: ErrorType) -> Driver<E>) -> Driver<E> {
        let source = self
            .asObservable()
            .observeOn(driverObserveOnScheduler)
            .catchError { error in
                onErrorRecover(error: error).asObservable()
            }
        return Driver(source)
    }
}// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com