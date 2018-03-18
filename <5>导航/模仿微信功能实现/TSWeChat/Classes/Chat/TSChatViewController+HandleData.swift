//
//  TSChatViewController+HandleData.swift
//  TSWeChat
//
//  Created by Hilen on 1/29/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import Foundation

// MARK: - @extension TSChatViewController
extension TSChatViewController {
    /**
     发送文字
     */
    func chatSendText() {
        dispatch_async_safely_to_main_queue({[weak self] in
            guard let strongSelf = self else {
                return
            }
            let textView = strongSelf.chatActionBarView.inputTextView
            guard textView.text.length < 1000 else {
                TSProgressHUD.ts_showWarningWithStatus("超出字数限制")
                return
            }
            
            guard textView.text.componentsSeparatedByString(" ").count < textView.text.length else {
                TSProgressHUD.ts_showWarningWithStatus("不能发送空白消息")
                return
            }
            
            let string = strongSelf.chatActionBarView.inputTextView.text
            let model = ChatModel(text: string)
            strongSelf.itemDataSouce.append(model)
            let insertIndexPath = NSIndexPath(forRow: strongSelf.itemDataSouce.count - 1, inSection: 0)
            strongSelf.listTableView.insertRowsAtBottom([insertIndexPath])
            textView.text = "" //发送完毕后清空
        })
    }

    /**
     发送声音
     */
    func chatSendVoice(audioModel: ChatAudioModel) {
        dispatch_async_safely_to_main_queue({[weak self] in
            guard let strongSelf = self else {
                return
            }
            let model = ChatModel(audioModel: audioModel)
            strongSelf.itemDataSouce.append(model)
            let insertIndexPath = NSIndexPath(forRow: strongSelf.itemDataSouce.count - 1, inSection: 0)
            strongSelf.listTableView.insertRowsAtBottom([insertIndexPath])
        })
    }

    /**
     发送图片
     */
    func chatSendImage(imageModel: ChatImageModel) {
        dispatch_async_safely_to_main_queue({[weak self] in
            guard let strongSelf = self else {
                return
            }
            let model = ChatModel(imageModel:imageModel)
            strongSelf.itemDataSouce.append(model)
            let insertIndexPath = NSIndexPath(forRow: strongSelf.itemDataSouce.count - 1, inSection: 0)
            strongSelf.listTableView.insertRowsAtBottom([insertIndexPath])
        })
    }
}







// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com