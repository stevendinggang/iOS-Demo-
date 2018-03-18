//
//  DeviceCommonParameter.swift
//  UINavigationBarExtention
//
//  Created by Aiguang.Li@gmail.com on 16/4/22.
//  Copyright © 2016年 mooeen. All rights reserved.
//

import UIKit

@objc public class DeviceCommonParameter: NSObject {
    
    public static let ScreenBounds = UIScreen.mainScreen().bounds
    public static let ScreenWidth = DeviceCommonParameter.ScreenBounds.width
    public static let ScreenHeight = DeviceCommonParameter.ScreenBounds.height
    
    public static let ApplicationFrame = UIScreen.mainScreen().applicationFrame
    public static let ApplicationWidth = DeviceCommonParameter.ApplicationFrame.size.width
    public static let ApplicationHeight = DeviceCommonParameter.ApplicationFrame.size.height
    
    public static let NavigationBarHeight:CGFloat = 44.0
    public static let StatusBarHeight:CGFloat = 20.0
    
    public static let KeyboardHeight:CGFloat = 216.0
    
    public static let StatusBarSize = UIApplication.sharedApplication().statusBarFrame.size
    
}
