//
//  DispatchQueueSchedulerQOS.swift
//  RxSwift
//
//  Created by John C. "Hsoi" Daub on 12/30/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

/**
Identifies one of the global concurrent dispatch queues with specified quality of service class.
*/
public enum DispatchQueueSchedulerQOS {
    
    /**
    Identifies global dispatch queue with `QOS_CLASS_USER_INTERACTIVE`
    */
    case UserInteractive
    
    /**
    Identifies global dispatch queue with `QOS_CLASS_USER_INITIATED`
    */
    case UserInitiated
    
    /**
    Identifies global dispatch queue with `QOS_CLASS_DEFAULT`
    */
    case Default

    /**
     Identifies global dispatch queue with `QOS_CLASS_UTILITY`
     */
    case Utility
    
    /**
     Identifies global dispatch queue with `QOS_CLASS_BACKGROUND`
     */
    case Background
}


@available(iOS 8, OSX 10.10, *)
extension DispatchQueueSchedulerQOS {
    var QOSClass: qos_class_t {
        switch self {
        case .UserInteractive: return QOS_CLASS_USER_INTERACTIVE
        case .UserInitiated:   return QOS_CLASS_USER_INITIATED
        case .Default:         return QOS_CLASS_DEFAULT
        case .Utility:         return QOS_CLASS_UTILITY
        case .Background:      return QOS_CLASS_BACKGROUND
        }
    }
}
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com