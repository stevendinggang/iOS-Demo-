//
//  Event.swift
//  Rx
//
//  Created by Krunoslav Zaher on 2/8/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation


/**
Represents sequence event

Sequence grammar:
Next\* (Error | Completed)
*/
public enum Event<Element> : CustomDebugStringConvertible {
    /**
    Next element is produced
    */
    case Next(Element)
    
    /**
    Sequence terminates with error
    */
    case Error(ErrorType)
    
    /**
    Sequence completes sucessfully
    */
    case Completed
}

extension Event {
    /**
    - returns: Description of event
    */
    public var debugDescription: String {
        get {
            switch self {
            case .Next(let value):
                return "Next(\(value))"
            case .Error(let error):
                return "Error(\(error))"
            case .Completed:
                return "Completed"
            }
        }
    }
}

extension Event {
    /**
    - returns: Is `Completed` or `Error` event
    */
    public var isStopEvent: Bool {
        get {
            switch self {
            case .Next: return false
            case .Error, .Completed: return true
            }
        }
    }
    
    /**
    - returns: If `Next` event, returns element value.
    */
    public var element: Element? {
        get {
            if case .Next(let value) = self {
                return value
            }
            return nil
        }
    }
    
    /**
    - returns: If `Error` event, returns error.
    */
    public var error: ErrorType? {
        get {
            if case .Error(let error) = self {
                return error
            }
            return nil
        }
    }
}// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com