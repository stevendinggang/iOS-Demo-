//
//  StableCompositeDisposable.swift
//  RxSwift
//
//  Created by Krunoslav Zaher on 6/12/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

public final class StableCompositeDisposable {
    public static func create(disposable1: Disposable, _ disposable2: Disposable) -> Disposable {
        return BinaryDisposable(disposable1, disposable2)
    }
}// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com