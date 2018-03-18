//
//  CircleView.swift
//  MCCircleView
//
//  Created by 马超 on 16/5/16.
//  Copyright © 2016年 qq 714080794. All rights reserved.
//

import UIKit

class CircleView: UIView {

    var circleLayer: CircleLayer!
    
    override func awakeFromNib() {
        
        circleLayer = CircleLayer()
        circleLayer.frame = CGRectMake(0, 0, frame.size.width, frame.size.height)
        circleLayer.contentsScale = UIScreen.mainScreen().scale
        self.layer.addSublayer(circleLayer)
        
        circleLayer.updataWithProgress(0.5)
    }


}
