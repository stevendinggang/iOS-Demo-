//
//  KVORepresentable+Swift.swift
//  Rx
//
//  Created by Krunoslav Zaher on 11/14/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

extension Int : KVORepresentable {
    public typealias KVOType = NSNumber

    /**
     Constructs `Self` using KVO value.
     */
    public init?(KVOValue: KVOType) {
        self.init(KVOValue.integerValue)
    }
}

extension Int32 : KVORepresentable {
    public typealias KVOType = NSNumber

    /**
     Constructs `Self` using KVO value.
     */
    public init?(KVOValue: KVOType) {
        self.init(KVOValue.intValue)
    }
}

extension Int64 : KVORepresentable {
    public typealias KVOType = NSNumber

    /**
     Constructs `Self` using KVO value.
     */
    public init?(KVOValue: KVOType) {
        self.init(KVOValue.longLongValue)
    }
}

extension UInt : KVORepresentable {
    public typealias KVOType = NSNumber

    /**
     Constructs `Self` using KVO value.
     */
    public init?(KVOValue: KVOType) {
        self.init(KVOValue.unsignedLongValue)
    }
}

extension UInt32 : KVORepresentable {
    public typealias KVOType = NSNumber

    /**
     Constructs `Self` using KVO value.
     */
    public init?(KVOValue: KVOType) {
        self.init(KVOValue.unsignedIntValue)
    }
}

extension UInt64 : KVORepresentable {
    public typealias KVOType = NSNumber

    /**
     Constructs `Self` using KVO value.
     */
    public init?(KVOValue: KVOType) {
        self.init(KVOValue.unsignedLongLongValue)
    }
}


extension RawRepresentable where RawValue: KVORepresentable {
    /**
     Constructs `Self` using optional KVO value.
    */
    init?(KVOValue: RawValue.KVOType?) {
        guard let KVOValue = KVOValue else {
            return nil
        }

        guard let rawValue = RawValue(KVOValue: KVOValue) else {
            return nil
        }

        self.init(rawValue: rawValue)
    }
}// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com