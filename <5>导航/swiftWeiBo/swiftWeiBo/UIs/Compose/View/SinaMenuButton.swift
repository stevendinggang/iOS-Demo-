//
//  SinaMenuButton.swift
//  swiftWeiBo
//
//  Created by yuan on 16/3/3.
//  Copyright © 2016年 yuan. All rights reserved.
//

import UIKit

class SinaMenuButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.size = CGSizeMake(CGFloat(COMPOSEW), CGFloat(COMPOSEH))
        self.titleLabel?.textAlignment = NSTextAlignment.Center
        self.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        self.imageView?.contentMode = UIViewContentMode.Center
//        self.titleLabel?.font = UIFont.systemFontOfSize(14)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView!.x = 0
        self.imageView!.y = 0
        self.imageView?.width = CGFloat(COMPOSEW)
        self.imageView?.height = CGFloat(COMPOSEW)
        
        self.titleLabel?.x = 0
        self.titleLabel?.y = CGRectGetHeight(self.imageView!.frame)
        self.titleLabel?.width = self.imageView!.width
        self.titleLabel?.height = CGFloat(COMPOSEH) - CGFloat(COMPOSEW)
        
    }
    func startAnimation(beginTime : Double, type : IWComposeButtonAnimType){
        
        let animation = POPSpringAnimation(propertyNamed: kPOPViewCenter)
        var result :CGFloat = -350
        if type == IWComposeButtonAnimType.Down{
            result = 350
        }
        animation.toValue = NSValue(CGPoint: CGPointMake(self.centerX, self.centerY + result))
        animation.springBounciness = 10
        animation.springSpeed = 12
        animation.beginTime = beginTime
        self.pop_addAnimation(animation, forKey: nil)
    }

}
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com