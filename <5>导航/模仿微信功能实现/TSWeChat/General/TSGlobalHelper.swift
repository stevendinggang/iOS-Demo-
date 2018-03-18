//
//  TSGlobalHelper.swift
//  TSWeChat
//
//  Created by Hilen on 3/2/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import Foundation


// stolen from Kingfisher: https://github.com/onevcat/Kingfisher/blob/master/Sources/ThreadHelper.swift

func dispatch_async_safely_to_main_queue(block: ()->()) {
    dispatch_async_safely_to_queue(dispatch_get_main_queue(), block)
}

// This methd will dispatch the `block` to a specified `queue`.
// If the `queue` is the main queue, and current thread is main thread, the block
// will be invoked immediately instead of being dispatched.
func dispatch_async_safely_to_queue(queue: dispatch_queue_t, _ block: ()->()) {
    if queue === dispatch_get_main_queue() && NSThread.isMainThread() {
        block()
    } else {
        dispatch_async(queue) {
            block()
        }
    }
}

func TSAlertView_show(title: String, message: String? = nil) {
    var theMessage = ""
    if message != nil {
        theMessage = message!
    }
    
    let alertView = UIAlertView(title: title , message: theMessage, delegate: nil, cancelButtonTitle: "取消", otherButtonTitles: "好的")
    alertView.show()
}// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com