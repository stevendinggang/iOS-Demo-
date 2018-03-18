//
//  SinaComposeToolBar.swift
//  swiftWeiBo
//
//  Created by yuan on 16/3/4.
//  Copyright © 2016年 yuan. All rights reserved.
//

import UIKit
protocol SinaComposeToolBarDelegate : NSObjectProtocol {
    func selectPicture(button : UIButton)
}
enum SinaComposeViewToolBarType : Int{

    case Camera = 0
    case Picture = 1
    case Mention = 2
    case Trend = 3
    case Emotion = 4
}
class SinaComposeToolBar: UIView {
    
    var isSystemKeybord : Bool? {
        didSet{
            let button = self.subviews.last as! UIButton
            if isSystemKeybord == true{
                button.setImage(UIImage(named: "compose_emoticonbutton_background"), forState: UIControlState.Normal)
                button.setImage(UIImage(named: "compose_emoticonbutton_background_highlighted"), forState: UIControlState.Highlighted)
            }else{
                button.setImage(UIImage(named: "compose_keyboardbutton_background"), forState: UIControlState.Normal)
                button.setImage(UIImage(named: "compose_keyboardbutton_background_highlighted"), forState: UIControlState.Highlighted)
            }
        }
    }
    weak var delegate : SinaComposeToolBarDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(patternImage: UIImage(named: "compose_toolbar_background")!)
        self.width = SCREENW
        self.height = 44
        self.x = 0
        self.y = SCREENH - self.height
        addChildButton("compose_camerabutton_background", type: SinaComposeViewToolBarType.Camera)
        
        addChildButton("compose_toolbar_picture", type: SinaComposeViewToolBarType.Picture)
        addChildButton("compose_mentionbutton_background", type: SinaComposeViewToolBarType.Mention)
        addChildButton("compose_trendbutton_background", type: SinaComposeViewToolBarType.Trend)
        addChildButton("compose_emoticonbutton_background", type: SinaComposeViewToolBarType.Emotion)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addChildButton(imageName : String, type : SinaComposeViewToolBarType){
        
        let button = UIButton()
        
        button.setImage(UIImage(named: imageName), forState: UIControlState.Normal)
        button.setImage(UIImage(named: imageName + "_highlighted"), forState: UIControlState.Highlighted)
        
        button.addTarget(self, action: "buttonClick:", forControlEvents: UIControlEvents.TouchUpInside)
        button.tag = type.rawValue
        
        addSubview(button)
        
    }
    
    func buttonClick(button : UIButton){
        
        self.delegate?.selectPicture(button)
    }
//    func selectPhotos(button : UIButton){
//        
//        self.delegate?.selectPicture()
//    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let width = self.width / 5
        
        for i in 0..<self.subviews.count{
            let button = self.subviews[i]
            
            button.x = CGFloat(i) * width
            button.y = 0
            button.width = width
            button.height = height
        }
    }
}
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com