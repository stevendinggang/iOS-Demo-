//
//  SinaEmotionPageView.swift
//  swiftWeiBo
//
//  Created by yuan on 16/3/9.
//  Copyright © 2016年 yuan. All rights reserved.
//

import UIKit

class SinaEmotionPageView: UIView {
    let popView : SinaEmotionPopView = SinaEmotionPopView.popView() as! SinaEmotionPopView
    var buttonArray = NSMutableArray()
    var delButton : UIButton?
    var emotionsArray : NSArray? {
        didSet{
            let count = emotionsArray?.count
            for var i = 0; i < count; i++ {
                let emotionBtn = SinaEmotionButton()
                
                emotionBtn.addTarget(self, action: "emotionButtonClick:", forControlEvents: UIControlEvents.TouchUpInside)
                let model = emotionsArray![i] as! SinaEmotionModel
                emotionBtn.emotionModel = model
                
                addSubview(emotionBtn)
                buttonArray.addObject(emotionBtn)
                
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        delButton = UIButton()
        delButton!.setImage(UIImage(named: "compose_emotion_delete"), forState: UIControlState.Normal)
        delButton!.setImage(UIImage(named: "compose_emotion_delete_highlighted"), forState: UIControlState.Highlighted)
        delButton!.addTarget(self, action: "deleteButtonClick", forControlEvents: UIControlEvents.TouchUpInside)
        addSubview(delButton!)
        
        let longPress = UILongPressGestureRecognizer(target: self, action: "longPressGesture:")
        self.addGestureRecognizer(longPress)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let width = self.width / 7
        let height = self.height / 3
        
        for var i = 0; i < self.buttonArray.count; i++ {
            let btn :UIButton = self.buttonArray[i] as! UIButton
            
            btn.width = width
            btn.height = height
            
            let col : NSInteger = i%7
            let row : NSInteger = i/7
            
            btn.x = CGFloat(col) * width
            btn.y = CGFloat(row) * height
        }
        delButton?.width = width
        delButton?.height = height
        delButton?.x = self.width - width
        delButton?.y = self.height - height
    }
    func deleteButtonClick(){
        NSNotificationCenter.defaultCenter().postNotificationName(EmotionBackButtonClick, object: nil)
    }
    
    
    func emotionButtonClick(button : SinaEmotionButton){
        
//        SinaEmotionTool.saveRecenEmotion(button.emotionModel!)
        
        NSNotificationCenter.defaultCenter().postNotificationName(EmotionNotification, object: nil, userInfo: NSDictionary(object: button.emotionModel!, forKey: kIWEmotion) as [NSObject : AnyObject])
        
        let window = UIApplication.sharedApplication().windows.last
        let rect : CGRect = button.convertRect(button.bounds, toView: window)
        
        popView.emotionModel = button.emotionModel
        popView.centerX = CGRectGetMidX(rect)
        popView.y = CGRectGetMidY(rect) - popView.height
        window?.addSubview(popView)
//        SinaEmotionTool.saveRecenEmotion(button.emotionModel!)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(0.25 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) { () -> Void in
            self.popView.removeFromSuperview()
        }
        
    }
    
    func longPressGesture(recognizer : UIGestureRecognizer){
        if (recognizer.state == UIGestureRecognizerState.Ended || recognizer.state == UIGestureRecognizerState.Cancelled) {
            self.popView.removeFromSuperview()
            return;
        }
        let point = recognizer.locationInView(self)
        var temButton : SinaEmotionButton?
        for button in buttonArray {
            if CGRectContainsPoint(button.frame, point){
                temButton = button as? SinaEmotionButton
            }
        }
        if temButton != nil {
            let window = UIApplication.sharedApplication().windows.last
            let rect = temButton?.convertRect(temButton!.bounds, toView: window)
            
            window?.addSubview(popView)
            popView.emotionModel = temButton?.emotionModel
            popView.centerX = CGRectGetMidX(rect!)
            popView.y = CGRectGetMidY(rect!) - popView.height
        }
    }
}
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com