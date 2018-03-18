//
//  SinaEmotionButton.swift
//  swiftWeiBo
//
//  Created by yuan on 16/3/9.
//  Copyright © 2016年 yuan. All rights reserved.
//

import UIKit

class SinaEmotionButton: UIButton {
    var emotionModel : SinaEmotionModel? {
        didSet{
            if (emotionModel?.isEmoji == false){
                self.setImage(UIImage(named: emotionModel!.fullPath! as String), forState: UIControlState.Normal)
            }else{
                self.setTitle(emotionModel!.code?.emoji(), forState: UIControlState.Normal)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.removeHighlightEffect = true
        self.titleLabel?.font = UIFont.systemFontOfSize(32)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.removeHighlightEffect = true
        self.titleLabel?.font = UIFont.systemFontOfSize(32)
    }
    
    
}
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com