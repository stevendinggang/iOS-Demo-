//
//  Scan.swift
//  RxSwift
//
//  Created by Krunoslav Zaher on 6/14/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

class ScanSink<ElementType, Accumulate, O: ObserverType where O.E == Accumulate> : Sink<O>, ObserverType {
    typealias Parent = Scan<ElementType, Accumulate>
    typealias E = ElementType
    
    private let _parent: Parent
    private var _accumulate: Accumulate
    
    init(parent: Parent, observer: O) {
        _parent = parent
        _accumulate = parent._seed
        super.init(observer: observer)
    }
    
    func on(event: Event<ElementType>) {
        switch event {
        case .Next(let element):
            do {
                _accumulate = try _parent._accumulator(_accumulate, element)
                forwardOn(.Next(_accumulate))
            }
            catch let error {
                forwardOn(.Error(error))
                dispose()
            }
        case .Error(let error):
            forwardOn(.Error(error))
            dispose()
        case .Completed:
            forwardOn(.Completed)
            dispose()
        }
    }
    
}

class Scan<Element, Accumulate>: Producer<Accumulate> {
    typealias Accumulator = (Accumulate, Element) throws -> Accumulate
    
    private let _source: Observable<Element>
    private let _seed: Accumulate
    private let _accumulator: Accumulator
    
    init(source: Observable<Element>, seed: Accumulate, accumulator: Accumulator) {
        _source = source
        _seed = seed
        _accumulator = accumulator
    }
    
    override func run<O : ObserverType where O.E == Accumulate>(observer: O) -> Disposable {
        let sink = ScanSink(parent: self, observer: observer)
        sink.disposable = _source.subscribe(sink)
        return sink
    }
}// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com