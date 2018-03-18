//
//  SpringValueAnimation.swift
//  DynamicView
//
//  Created by YiLun Zhao on 2016-01-17.
//  Copyright © 2016 lkzhao. All rights reserved.
//

import UIKit


public class SpringValueAnimation:ValueAnimation {
  public var threshold:CGFloat = 0.001
  public var stiffness:CGFloat = 150
  public var damping:CGFloat = 10
  
  //from https://github.com/chenglou/react-motion
  public override func update(dt:CGFloat) -> Bool{
    let x = getter?() ?? 0

    // Force
    let Fspring = -stiffness * (x - target);
    
    // Damping
    let Fdamper = -damping * velocity;
    
    let a = Fspring + Fdamper;
    
    let newV = velocity + a * dt;
    let newX = x + newV * dt;
    
    if abs(velocity) < threshold && abs(target - newX) < threshold {
      setter?(target)
      velocity = 0
      return false
    }else{
      setter?(newX)
      velocity = newV
      return true
    }
  }
}// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com