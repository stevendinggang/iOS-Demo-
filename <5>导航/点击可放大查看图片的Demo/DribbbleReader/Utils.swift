//
//  Utils.swift
//  DribbbleReader
//
//  Created by naoyashiga on 2015/05/17.
//  Copyright (c) 2015年 naoyashiga. All rights reserved.
//

import Foundation
import UIKit

public class Utils {
    
    public class func getStringFromJSON(data: NSDictionary, key: String) -> String{
//        let info: AnyObject? = data[key]
      
        if let info = data[key] as? String {
            return info
        }
        
        return ""
    }
}// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com