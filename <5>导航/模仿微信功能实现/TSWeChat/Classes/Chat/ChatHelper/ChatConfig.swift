//
//  ChatConfig.swift
//  TSWeChat
//
//  Created by Hilen on 2/25/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import Foundation

public class ChatConfig {
    /**
     获取缩略图的尺寸
     
     - parameter originalSize: 原始图的尺寸 size
     
     - returns: 返回的缩略图尺寸
     */
    class func getThumbImageSize(originalSize: CGSize) -> CGSize {
        
        let imageRealHeight = originalSize.height
        let imageRealWidth = originalSize.width
        
        var resizeThumbWidth: CGFloat
        var resizeThumbHeight: CGFloat
        /**
        *  1）如果图片的高度 >= 图片的宽度 , 高度就是最大的高度，宽度等比
        *  2）如果图片的高度 < 图片的宽度 , 以宽度来做等比，算出高度
        */
        if imageRealHeight >= imageRealWidth {
            let scaleWidth = imageRealWidth * kChatImageMaxHeight / imageRealHeight
            resizeThumbWidth = (scaleWidth > kChatImageMinWidth) ? scaleWidth : kChatImageMinWidth
            resizeThumbHeight = kChatImageMaxHeight
        } else {
            let scaleHeight = imageRealHeight * kChatImageMaxWidth / imageRealWidth
            resizeThumbHeight = (scaleHeight > kChatImageMinHeight) ? scaleHeight : kChatImageMinHeight
            resizeThumbWidth = kChatImageMaxWidth
        }
        
        return CGSizeMake(resizeThumbWidth, resizeThumbHeight)
    }
}



// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com