//
//  UINavigationBarExtention.swift
//  UINavigationBarExtention
//
//  Created by Aiguang.Li@gmail.com on 16/4/22.
//  Inspired by https://github.com/ltebean/LTNavigationBar/
//  Copyright © 2016年 mooeen. All rights reserved.
//

import Foundation
import UIKit


extension UINavigationBar {
    
    private struct AssociatedKeys {
        static var DescriptiveName = "CustomNavigationBar"
    }
    
    var overlayer:UIView? {
        get {
            let anyObj = objc_getAssociatedObject(self, &AssociatedKeys.DescriptiveName)
            return anyObj as? UIView
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.DescriptiveName, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func setCustomBackgroundColor(color:UIColor) {
        if(self.overlayer == nil) {
            self.setBackgroundImage(UIImage.init(), forBarMetrics: UIBarMetrics.Default)
            self.shadowImage = UIImage.init()
            self.overlayer = UIView.init(frame: CGRect(x: 0, y: -DeviceCommonParameter.StatusBarHeight,
                width: DeviceCommonParameter.ScreenWidth,
                height: DeviceCommonParameter.StatusBarHeight + DeviceCommonParameter.NavigationBarHeight))
            self.overlayer?.userInteractionEnabled = false
            self.overlayer?.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
            self.insertSubview(self.overlayer!, atIndex: 0)
        }
        self.overlayer?.backgroundColor = color
    }
    
}
