//
//  SinaImageView.swift
//  swiftWeiBo
//
//  Created by yuan on 16/3/8.
//  Copyright © 2016年 yuan. All rights reserved.
//

import UIKit
protocol SinaImageViewDelegate : NSObjectProtocol {
    func addImageViewOrNot()
}
class SinaImageView: UIImageView {
    weak var delegate : SinaImageViewDelegate?
    var deletebutton : UIButton?
    
    override init(image: UIImage?) {
        super.init(image: image)
        self.userInteractionEnabled = true
        deletebutton = UIButton()
        deletebutton!.setImage(UIImage(named: "compose_photo_close"), forState: UIControlState.Normal)
        deletebutton!.size = deletebutton!.currentImage!.size
        deletebutton!.addTarget(self, action: "deleteButtonClick:", forControlEvents: UIControlEvents.TouchUpInside)
        addSubview(deletebutton!)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func deleteButtonClick(button : UIButton){
        UIView.animateWithDuration(0.25, animations: { () -> Void in
            self.alpha = 0
            }) { (finish) -> Void in
                self.removeFromSuperview()
                self.delegate?.addImageViewOrNot()
                
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        deletebutton!.x = self.width - deletebutton!.width
        deletebutton!.y = 0
    }
}
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com