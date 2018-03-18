//
//  SinaTabBar.swift
//  swiftWeiBo
//
//  Created by yuan on 16/3/1.
//  Copyright © 2016年 yuan. All rights reserved.
//

import UIKit
//protocol SinaTabBarDelegate : NSObjectProtocol{
//    func tabBarDidSelectPlusButton()
//}
class SinaTabBar: UITabBar {
//    weak var Tabdelegate : SinaTabBarDelegate?
    
    lazy var composeButton : UIButton = {
        
        let btn = UIButton()
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Highlighted)
        
        btn.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
        btn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: UIControlState.Highlighted)
//        btn.addTarget(self, action: "plusButtonClick", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(btn)
        return btn
        }()
    
//    func plusButtonClick(){
//        self.Tabdelegate?.tabBarDidSelectPlusButton()
//    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let width = bounds.size.width / 5
        let height = bounds.size.height
        var index : Int = 0
        for subview in subviews{
            
            if subview is UIControl && !(subview is UIButton){
                subview.frame = CGRectMake(CGFloat(index) * width, 0, width, height)
                
                if index == 1{
                    index += 1
                }
                index++
            }
        }
        composeButton.frame = CGRectMake(2 * width, 0, width, height)
    }


}
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com