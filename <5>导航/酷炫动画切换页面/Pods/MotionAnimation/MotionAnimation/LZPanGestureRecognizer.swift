//
//  LZPanGestureRecognizer.swift
//  DynamicView
//
//  Created by YiLun Zhao on 2016-01-25.
//  Copyright © 2016 lkzhao. All rights reserved.
//

import UIKit
import UIKit.UIGestureRecognizerSubclass


public class LZPanGestureRecognizer: UIPanGestureRecognizer {
  
  public var startViewCenterPoint:CGPoint?
  
  public var translatedViewCenterPoint:CGPoint{
    if let startViewCenterPoint = startViewCenterPoint{
      var p = startViewCenterPoint + translationInView(self.view!.superview!)
      p.x = clamp(p.x, range:xRange, overflowScale:xOverflowScale)
      p.y = clamp(p.y, range:yRange, overflowScale:yOverflowScale)
      return p
    }else{
      return self.view?.center ?? CGPointZero
    }
  }

  public func clamp(element: CGFloat, range:ClosedInterval<CGFloat>, overflowScale:CGFloat = 0) -> CGFloat {
    if element < range.start{
      return range.start - (range.start - element)*overflowScale
    } else if element > range.end{
      return range.end + (element - range.end)*overflowScale
    }
    return element
  }

  public var xOverflowScale:CGFloat = 0.3
  public var yOverflowScale:CGFloat = 0.3
  public var xRange:ClosedInterval<CGFloat> = CGFloat.min...CGFloat.max
  public var yRange:ClosedInterval<CGFloat> = CGFloat.min...CGFloat.max
  
  override public func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent) {
    super.touchesBegan(touches, withEvent: event)
    
    if state == .Failed{
      return
    }

    startViewCenterPoint = self.view?.center
  }
  
}// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com