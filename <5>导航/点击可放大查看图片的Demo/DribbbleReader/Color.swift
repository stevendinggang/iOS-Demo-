//
//  Color.swift
//  DribbbleReader
//
//  Created by naoyashiga on 2015/05/17.
//  Copyright (c) 2015年 naoyashiga. All rights reserved.
//

import Foundation

extension UIColor {
    class func hexStr (var hexStr : NSString, alpha : CGFloat) -> UIColor {
        hexStr = hexStr.stringByReplacingOccurrencesOfString("#", withString: "")
        let scanner = NSScanner(string: hexStr as String)
        var color: UInt32 = 0
        if scanner.scanHexInt(&color) {
            let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(color & 0x0000FF) / 255.0
            return UIColor(red:r,green:g,blue:b,alpha:alpha)
        } else {
            print("invalid hex string", terminator: "")
            return UIColor.whiteColor();
        }
    }
    
    class func navigationBarTitleTextColor() -> UIColor {
        return UIColor.hexStr("ffffff", alpha: 1)
    }
    
    class func navigationBarBackgroundColor() -> UIColor {
        return UIColor.hexStr("EA4C89", alpha: 0.85)
    }
    
    class func scrollMenuBackgroundColor() -> UIColor {
        return UIColor.hexStr("ECEFF1", alpha: 1)
    }
    
    class func viewBackgroundColor() -> UIColor {
        return UIColor.hexStr("263238", alpha: 1)
    }
    
    class func selectionIndicatorColor() -> UIColor {
        return UIColor.hexStr("F06292", alpha: 1)
    }
    
    class func bottomMenuHairlineColor() -> UIColor {
        return UIColor.hexStr("F06292", alpha: 1)
    }
    
    class func selectedMenuItemLabelColor() -> UIColor {
        return UIColor.hexStr("37474F", alpha: 1)
    }
    
    class func unselectedMenuItemLabelColor() -> UIColor {
        return UIColor.hexStr("607D8B", alpha: 1)
    }
    
    class func cellLabelColor() -> UIColor {
        return UIColor.hexStr("546E7A", alpha: 1)
    }
}// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com