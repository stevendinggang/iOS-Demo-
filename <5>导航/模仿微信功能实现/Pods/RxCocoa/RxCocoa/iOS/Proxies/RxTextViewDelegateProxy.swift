//
//  RxTextViewDelegateProxy.swift
//  RxCocoa
//
//  Created by Yuta ToKoRo on 7/19/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

#if os(iOS) || os(tvOS)

import Foundation
import UIKit
#if !RX_NO_MODULE
import RxSwift
#endif

/**
     For more information take a look at `DelegateProxyType`.
*/
public class RxTextViewDelegateProxy
    : RxScrollViewDelegateProxy
    , UITextViewDelegate {

    /**
     Typed parent object.
     */
    public weak private(set) var textView: UITextView?

    /**
     Initializes `RxTextViewDelegateProxy`

     - parameter parentObject: Parent object for delegate proxy.
     */
    public required init(parentObject: AnyObject) {
        self.textView = (parentObject as! UITextView)
        super.init(parentObject: parentObject)
    }

    // MARK: delegate methods

    /**
    For more information take a look at `DelegateProxyType`.
    */
    @objc public func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        /**
         We've had some issues with observing text changes. This is here just in case we need the same hack in future and that 
         we wouldn't need to change the public interface.
        */
        let forwardToDelegate = self.forwardToDelegate() as? UITextViewDelegate
        return forwardToDelegate?.textView?(textView,
            shouldChangeTextInRange: range,
            replacementText: text) ?? true
    }
}

#endif
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com