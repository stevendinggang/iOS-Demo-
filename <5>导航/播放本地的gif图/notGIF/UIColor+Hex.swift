//
//  UIColor+Hex.swift
//  notGIF
//
//  Created by Atuooo on 12/31/15.
//  Copyright © 2015 HBGHZ85ABK. All rights reserved.
//

import Foundation

extension UIColor {
    public class func color(withHex hex: NSInteger, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: ((CGFloat)((hex & 0xFF0000) >> 16))/255.0,
            green: ((CGFloat)((hex & 0xFF00) >> 8))/255.0,
            blue: ((CGFloat)(hex & 0xFF))/255.0, alpha: alpha)
    }
}
