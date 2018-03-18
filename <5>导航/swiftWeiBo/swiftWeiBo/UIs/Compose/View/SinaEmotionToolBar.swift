//
//  SinaEmotionToolBar.swift
//  swiftWeiBo
//
//  Created by yuan on 16/3/8.
//  Copyright © 2016年 yuan. All rights reserved.
//

import UIKit
protocol SinaEmotionToolBarDelegate : NSObjectProtocol {
    func EmotionButtonClick(button : UIButton)
}
enum IWEmotionToolBarType : Int{
    case Recent = 1
    case Default = 2
    case Emoji = 3
    case Lxh = 4
}
class SinaEmotionToolBar: UIView {
    weak var delegate : SinaEmotionToolBarDelegate? {
        didSet{
            self.emotionButtonClick(self.viewWithTag(IWEmotionToolBarType.Default.rawValue) as! UIButton)
        }
    }
    var selectedButton : UIButton?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.height = EmotionToolBarHeight
        self.width = SCREENW
//        backgroundColor = UIColor.grayColor()
        addChildView("最近表情", imageName: "left", type: IWEmotionToolBarType.Recent)
        addChildView("默认", imageName: "mid", type: IWEmotionToolBarType.Default)
        addChildView("Emoji", imageName: "mid", type: IWEmotionToolBarType.Emoji)
        addChildView("浪小花", imageName: "right", type: IWEmotionToolBarType.Lxh)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addChildView(title : String, imageName : String, type : IWEmotionToolBarType){
        
        let button = UIButton()
        button.removeHighlightEffect = true
        button.setTitle(title, forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage(named: String(format: "compose_emotion_table_%@_normal",imageName)), forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage(named: String(format: "compose_emotion_table_%@_selected",imageName)), forState: UIControlState.Disabled)
        button.addTarget(self, action: "emotionButtonClick:", forControlEvents: UIControlEvents.TouchUpInside)
        button.tag = type.rawValue
        button.setTitleColor(UIColor.grayColor(), forState: UIControlState.Disabled)
        button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)

        addSubview(button)
        
    }
    
    func emotionButtonClick(button : UIButton){
        selectedButton?.enabled = true
        button.enabled = false
        selectedButton = button
        self.delegate?.EmotionButtonClick(button)
        
    }
    override func layoutSubviews() {
        
        super.layoutSubviews()
        let width = self.width / 4
        for var i = 0; i < self.subviews.count; i++ {
            let button = self.subviews[i] as! UIButton
            button.width = width
            button.height = self.height
            button.x = CGFloat(i) * width
            
        }
    }
}
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com