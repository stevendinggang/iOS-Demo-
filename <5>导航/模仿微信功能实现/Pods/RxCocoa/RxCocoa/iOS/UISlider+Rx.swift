//
//  UISlider+Rx.swift
//  RxCocoa
//
//  Created by Alexander van der Werff on 28/05/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

#if os(iOS)

import Foundation
#if !RX_NO_MODULE
import RxSwift
#endif
import UIKit

extension UISlider {
    
    /**
    Reactive wrapper for `value` property.
    */
    public var rx_value: ControlProperty<Float> {
        return rx_value(getter: { [weak self] in
            self?.value ?? 0.0
        }, setter: { [weak self] value in
            self?.value = value
        })
    }
    
}

#endif
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com