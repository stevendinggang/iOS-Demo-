//
//  SinaEmotionPopView.swift
//  swiftWeiBo
//
//  Created by yuan on 16/3/9.
//  Copyright © 2016年 yuan. All rights reserved.
//

import UIKit

class SinaEmotionPopView: UIView {
    
    @IBOutlet weak var emotionButton: SinaEmotionButton!
    var emotionModel : SinaEmotionModel? {
        didSet{
            self.emotionButton.emotionModel = emotionModel
        }
    }
    
    class func popView()->AnyObject{
        return NSBundle.mainBundle().loadNibNamed("SinaEmotionPopView", owner: self, options: nil).last!
    }
    
    
    
    
}
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com