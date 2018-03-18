//
//  HistoricalSchedulerTimeConverter.swift
//  Rx
//
//  Created by Krunoslav Zaher on 12/27/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

/**
 Converts historial virtual time into real time. 
 
 Since historical virtual time is also measured in `NSDate`, this converter is identity function.
 */
public struct HistoricalSchedulerTimeConverter : VirtualTimeConverterType {
    /**
     Virtual time unit used that represents ticks of virtual clock.
     */
    public typealias VirtualTimeUnit = RxTime

    /**
     Virtual time unit used to represent differences of virtual times.
     */
    public typealias VirtualTimeIntervalUnit = RxTimeInterval

    /**
     Returns identical value of argument passed because historical virtual time is equal to real time, just 
     decoupled from local machine clock.
    */
    public func convertFromVirtualTime(virtualTime: VirtualTimeUnit) -> RxTime {
        return virtualTime
    }

    /**
     Returns identical value of argument passed because historical virtual time is equal to real time, just 
     decoupled from local machine clock.
    */
    public func convertToVirtualTime(time: RxTime) -> VirtualTimeUnit {
        return time
    }

    /**
     Returns identical value of argument passed because historical virtual time is equal to real time, just 
     decoupled from local machine clock.
    */
    public func convertFromVirtualTimeInterval(virtualTimeInterval: VirtualTimeIntervalUnit) -> RxTimeInterval {
        return virtualTimeInterval
    }

    /**
     Returns identical value of argument passed because historical virtual time is equal to real time, just 
     decoupled from local machine clock.
    */
    public func convertToVirtualTimeInterval(timeInterval: RxTimeInterval) -> VirtualTimeIntervalUnit {
        return timeInterval
    }

    /**
     Offsets `NSDate` by time interval.
     
     - parameter time: Time.
     - parameter timeInterval: Time interval offset.
     - returns: Time offsetted by time interval.
    */
    public func offsetVirtualTime(time time: VirtualTimeUnit, offset: VirtualTimeIntervalUnit) -> VirtualTimeUnit {
        return time.dateByAddingTimeInterval(offset)
    }

    /**
     Compares two `NSDate`s.
    */
    public func compareVirtualTime(lhs: VirtualTimeUnit, _ rhs: VirtualTimeUnit) -> VirtualTimeComparison {
        switch lhs.compare(rhs) {
        case .OrderedAscending:
            return .LessThan
        case .OrderedSame:
            return .Equal
        case .OrderedDescending:
            return .GreaterThan
        }
    }
}// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com