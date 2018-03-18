//
//  SinaKeyBordView.swift
//  swiftWeiBo
//
//  Created by yuan on 16/3/8.
//  Copyright © 2016年 yuan. All rights reserved.
//

import UIKit

class SinaKeyBordView: UIView {
    lazy var defaultView : SinaEmotionListview = {
        let defview = SinaEmotionListview()
//        defview.backgroundColor = UIColor.redColor()
        let path : String = NSBundle.mainBundle().pathForResource("EmotionIcons/default/info.plist", ofType: nil)!
        let emotions : NSArray = SinaEmotionModel.mj_objectArrayWithFile(path)
        
        
//        emotions.
        for i in 0..<emotions.count{
            let model : SinaEmotionModel = emotions[i] as! SinaEmotionModel
            model.performSelector("setPath:", withObject: "EmotionIcons/default/")
        }
        defview.emotionsArray = emotions
        return defview
        }()
    
    
    lazy var recentView : SinaEmotionListview = {
        let defview = SinaEmotionListview()
//        let emotions = SinaEmotionTool.recentEmotions()
//        defview.emotionsArray = emotions
        return defview
        }()
    
    
    lazy var emjView : SinaEmotionListview = {
        let defview = SinaEmotionListview()
//        defview.backgroundColor = UIColor.yellowColor()
        let path : String = NSBundle.mainBundle().pathForResource("EmotionIcons/emoji/info.plist", ofType: nil)!
        let emotions : NSArray = SinaEmotionModel.mj_objectArrayWithFile(path)
        defview.emotionsArray = emotions
        
        return defview
        }()
    
    
    lazy var LXHView : SinaEmotionListview = {
        let defview = SinaEmotionListview()
//        defview.backgroundColor = UIColor.greenColor()
        let path : String = NSBundle.mainBundle().pathForResource("EmotionIcons/lxh/info.plist", ofType: nil)!
        let emotions : NSArray = SinaEmotionModel.mj_objectArrayWithFile(path)
        for i in 0..<emotions.count{
            let model : SinaEmotionModel = emotions[i] as! SinaEmotionModel
            model.performSelector("setPath:", withObject: "EmotionIcons/lxh/")
        }
        defview.emotionsArray = emotions
        return defview
        }()
    
    var currentListView : SinaEmotionListview?
    var toolBar : SinaEmotionToolBar?
    var listView : SinaEmotionListview?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(patternImage: UIImage(named: "emoticon_keyboard_background")!)
        addToolBar()
//        addListView()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addToolBar(){
        toolBar = SinaEmotionToolBar()
        toolBar?.delegate = self
        toolBar?.y = self.height - toolBar!.height
        
        addSubview(toolBar!)
    }
    func addListView(){
        listView = SinaEmotionListview(frame: CGRectMake(0, 0, SCREENW, self.height - EmotionToolBarHeight))
        addSubview(listView!)
        
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        currentListView?.width = SCREENW
        currentListView?.height = self.height - EmotionToolBarHeight
    }
}

extension SinaKeyBordView : SinaEmotionToolBarDelegate {
    func EmotionButtonClick(button: UIButton) {
        currentListView?.removeFromSuperview()
        switch button.tag {
            case IWEmotionToolBarType.Recent.rawValue:
                addSubview(recentView)
            
            case IWEmotionToolBarType.Default.rawValue:
                addSubview(defaultView)
            case IWEmotionToolBarType.Emoji.rawValue:
                addSubview(emjView)
            case IWEmotionToolBarType.Lxh.rawValue:
                addSubview(LXHView)
            default:
                break
        }
        currentListView = (self.subviews.last as! SinaEmotionListview)
        layoutIfNeeded()
        
        }
    }

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com