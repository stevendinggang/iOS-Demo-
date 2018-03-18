//
//  UIButton+Rx.swift
//  RxCocoa
//
//  Created by Krunoslav Zaher on 3/28/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

#if os(iOS)

import Foundation
#if !RX_NO_MODULE
import RxSwift
#endif
import UIKit

extension UIButton {
    
    /**
    Reactive wrapper for `TouchUpInside` control event.
    */
    public var rx_tap: ControlEvent<Void> {
		return rx_controlEvent(.TouchUpInside)
    }
    
}

#endif

#if os(tvOS)

import Foundation
#if !RX_NO_MODULE
    import RxSwift
#endif
import UIKit

extension UIButton {

    /**
     Reactive wrapper for `PrimaryActionTriggered` control event.
     */
    public var rx_primaryAction: ControlEvent<Void> {
        return rx_controlEvent(.PrimaryActionTriggered)
    }
}

#endif
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com