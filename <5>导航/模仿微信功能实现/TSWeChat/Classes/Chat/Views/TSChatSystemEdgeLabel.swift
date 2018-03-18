//
//  TSChatEdgeLabel.swift
//  TSWeChat
//
//  Created by Hilen on 1/21/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import UIKit

final class TSChatEdgeLabel: UILabel {
    var labelEdge: UIEdgeInsets = UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 7)

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    override func drawTextInRect(rect: CGRect) {
        super.drawTextInRect(UIEdgeInsetsInsetRect(rect, labelEdge))
    }
}
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com