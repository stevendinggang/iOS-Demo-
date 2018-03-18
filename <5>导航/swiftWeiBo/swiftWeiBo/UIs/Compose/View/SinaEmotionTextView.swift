//
//  SinaEmotionTextView.swift
//  swiftWeiBo
//
//  Created by yuan on 16/3/10.
//  Copyright © 2016年 yuan. All rights reserved.
//

import UIKit

class SinaEmotionTextView: SinaTextView {

    func insertEmotion(model : SinaEmotionModel){
        if model.isEmoji == true {
            self.insertText((model.code?.emoji())!)
        }else{
            let image = UIImage(named: model.fullPath as! String)
            
            let attachment = NSTextAttachment()
            attachment.image = image
            
            let imageWH = self.font?.lineHeight
            
            attachment.bounds = CGRectMake(0, -4, imageWH!, imageWH!)
            
            let emotionAttr = NSAttributedString(attachment: attachment)
            let textViewAttr = NSMutableAttributedString(attributedString: self.attributedText)
            textViewAttr.appendAttributedString(emotionAttr)
            
            textViewAttr.addAttribute(NSFontAttributeName, value: self.font!, range: NSMakeRange(0, textViewAttr.length))
            self.attributedText = textViewAttr
            
            NSNotificationCenter.defaultCenter().postNotificationName(UITextViewTextDidChangeNotification, object: self)
        }
    }


}
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com