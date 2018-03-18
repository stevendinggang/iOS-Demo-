//
//  ViewController.swift
//  MCCircleView
//
//  Created by 马超 on 16/5/16.
//  Copyright © 2016年 qq 714080794. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sliderView: UISlider!
    
    @IBOutlet weak var circleView: CircleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

  

    @IBAction func sliderChanged(sender: UISlider) {
        
        self.circleView.circleLayer.updataWithProgress(CGFloat(sender.value))
        
    }

}

