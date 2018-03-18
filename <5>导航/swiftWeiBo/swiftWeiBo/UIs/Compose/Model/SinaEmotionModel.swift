//
//  SinaEmotionModel.swift
//  swiftWeiBo
//
//  Created by yuan on 16/3/9.
//  Copyright © 2016年 yuan. All rights reserved.
//

import UIKit

class SinaEmotionModel: NSObject {
    

    var chs : NSString?
    var cht : NSString?
    var png : NSString?
    var type : NSString? {
        didSet{
            if type == "1" {
                isEmoji = true
            }else{
                isEmoji = false
            }
        }
    }
    var code : NSString?
    var fullPath : NSString?
    var isEmoji : Bool?
    var path : NSString? {
        didSet{
            fullPath = NSString(format: "%@%@",path!,png!)
        }
    }
//    func encodeWithCoder(aCoder: NSCoder){
//        self.encodeWithCoder(aCoder)
//    }
//    required init?(coder aDecoder: NSCoder) {
//        super.init()
//        
//    }
}
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com