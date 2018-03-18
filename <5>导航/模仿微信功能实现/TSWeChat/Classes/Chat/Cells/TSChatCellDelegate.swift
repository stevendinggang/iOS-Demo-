//
//  TSChatCellDelegate.swift
//  TSWeChat
//
//  Created by Hilen on 1/29/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import Foundation

@objc protocol TSChatCellDelegate: class {
    /**
     点击了 cell 本身
     */
    optional func cellDidTaped(cell: TSChatBaseCell)

    /**
     点击了 cell 的头像
     */
    func cellDidTapedAvatarImage(cell: TSChatBaseCell)

    /**
     点击了 cell 的图片
     */
    func cellDidTapedImageView(cell: TSChatBaseCell)
    
    /**
     点击了 cell 中文字的 URL
     */
    func cellDidTapedLink(cell: TSChatBaseCell, linkString: String)

    /**
     点击了 cell 中文字的 电话
     */
    func cellDidTapedPhone(cell: TSChatBaseCell, phoneString: String)
    
    /**
     点击了声音 cell 的播放 button
     */
    func cellDidTapedVoiceButton(cell: TSChatVoiceCell, isPlayingVoice: Bool)
}
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com