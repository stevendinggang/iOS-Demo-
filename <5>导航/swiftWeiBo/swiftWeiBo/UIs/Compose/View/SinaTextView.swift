//
//  SinaTextView.swift
//  swiftWeiBo
//
//  Created by yuan on 16/3/4.
//  Copyright © 2016年 yuan. All rights reserved.
//

import UIKit

class SinaTextView: UITextView {

    lazy var placeHoldeLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.grayColor()
        label.font = self.font
        label.numberOfLines = 0
        self.addSubview(label)
        return label
        }()
    var placeHoldeString : String? {
        didSet{
//            self.placeHoldeLabel.text = String(placeHoldeLabel)
            self.placeHoldeLabel.text = placeHoldeString
            self.placeHoldeLabel.x = 5
            self.placeHoldeLabel.y = 8
            self.placeHoldeLabel.sizeToFit()
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyBordDidChange", name: UITextViewTextDidChangeNotification, object: nil)
        }
    }
    func keyBordDidChange(){
//        self.placeHoldeLabel.hidden = self.text.characters.count as! Bool
        if self.text.characters.count != 0 {
           self.placeHoldeLabel.hidden = true
        }else{
            self.placeHoldeLabel.hidden = false
        }
    }
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        self.font = UIFont.systemFontOfSize(15)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com