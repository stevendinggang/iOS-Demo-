//
//  UIScrollView+ChatAdditions.swift
//  TSWeChat
//
//  Created by Hilen on 12/16/15.
//  Copyright © 2015 Hilen. All rights reserved.
//

import Foundation

extension UIScrollView {
    private struct AssociatedKeys {
        static var kKeyScrollViewVerticalIndicator = "_verticalScrollIndicator"
        static var kKeyScrollViewHorizontalIndicator = "_horizontalScrollIndicator"
    }
    
    ///  YES if the scrollView's offset is at the very top.
    public var isAtTop: Bool {
        get { return self.contentOffset.y == 0.0 ? true : false }
    }
    
    ///  YES if the scrollView's offset is at the very bottom.
    public var isAtBottom: Bool {
        get {
            let bottomOffset = self.contentSize.height - self.bounds.size.height
            return self.contentOffset.y == bottomOffset ? true : false
        }
    }
    
    ///  YES if the scrollView can scroll from it's current offset position to the bottom.
    public var canScrollToBottom: Bool {
        get { return self.contentSize.height > self.bounds.size.height ? true : false }
    }
    
    /// The vertical scroll indicator view.
    public var verticalScroller: UIView {
        get {
            if (objc_getAssociatedObject(self, __FUNCTION__) == nil) {
                objc_setAssociatedObject(self, __FUNCTION__, self.safeValueForKey(AssociatedKeys.kKeyScrollViewVerticalIndicator), objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN);
            }
            return objc_getAssociatedObject(self, __FUNCTION__) as! UIView
        }
    }

    /// The horizontal scroll indicator view.
    public var horizontalScroller: UIView {
        get {
            if (objc_getAssociatedObject(self, __FUNCTION__) == nil) {
                objc_setAssociatedObject(self, __FUNCTION__, self.safeValueForKey(AssociatedKeys.kKeyScrollViewHorizontalIndicator), objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN);
            }
            return objc_getAssociatedObject(self, __FUNCTION__) as! UIView
        }
    }
    
    private func safeValueForKey(key: String) -> AnyObject{
        let instanceVariable: Ivar = class_getInstanceVariable(self.dynamicType, key.cStringUsingEncoding(NSUTF8StringEncoding)!)
        return object_getIvar(self, instanceVariable);
    }
    

     /**
     Sets the content offset to the top.
     
     - parameter animated: animated YES to animate the transition at a constant velocity to the new offset, NO to make the transition immediate.
     */
    public func scrollToTopAnimated(animated: Bool) {
        if !self.isAtTop {
            let bottomOffset = CGPointZero;
            self.setContentOffset(bottomOffset, animated: animated)
        }
    }

    /**
     Sets the content offset to the bottom.
     
     - parameter animated: animated YES to animate the transition at a constant velocity to the new offset, NO to make the transition immediate.
     */
    public func scrollToBottomAnimated(animated: Bool) {
        if self.canScrollToBottom && !self.isAtBottom {
            let bottomOffset = CGPointMake(0.0, self.contentSize.height - self.bounds.size.height)
            self.setContentOffset(bottomOffset, animated: animated)
        }
    }

    /**
      Stops scrolling, if it was scrolling.
     */
    public func stopScrolling() {
        guard self.dragging else {
            return
        }
        var offset = self.contentOffset
        offset.y -= 1.0
        self.setContentOffset(offset, animated: false)

        offset.y += 1.0
        self.setContentOffset(offset, animated: false)
    }
}




// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com