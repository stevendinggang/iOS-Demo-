//
//  HistoricalScheduler.swift
//  Rx
//
//  Created by Krunoslav Zaher on 12/27/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

/**
  Provides a virtual time scheduler that uses `NSDate` for absolute time and `NSTimeInterval` for relative time.
*/
public class HistoricalScheduler : VirtualTimeScheduler<HistoricalSchedulerTimeConverter> {

    /**
      Creates a new historical scheduler with initial clock value.
     
     - parameter initialClock: Initial value for virtual clock.
    */
    public init(initialClock: RxTime = NSDate(timeIntervalSince1970: 0)) {
        super.init(initialClock: initialClock, converter: HistoricalSchedulerTimeConverter())
    }
    
}// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com