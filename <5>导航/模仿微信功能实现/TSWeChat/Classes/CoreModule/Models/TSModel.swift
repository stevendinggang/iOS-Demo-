//
//  TSModel.swift
//  TSWeChat
//
//  Created by Hilen on 2/22/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import Foundation
import ObjectMapper

typealias TSModelProtocol = ObjectMapper.Mappable
typealias TSMapper = ObjectMapper.Mapper


enum GenderType: Int {
    case Female = 0, Male
}


/* 消息内容类型:
0 - 文本
1 - 图片
2 - 语音
3 - 群组提示信息，例如:高必梵邀请白琳,彭莹加入群聊
4 - 文件
110 - 时间（客户端生成数据）
*/
enum MessageContentType: String {
    case Text = "0"
    case Image = "1"
    case Voice = "2"
    case System = "3"
    case File = "4"
    case Time = "110"
}


//服务器返回的是字符串
enum MessageFromType: String {
    //消息来源类型
    case System = "0"   // 0是系统
    case Personal = "1"   // 1是个人
    case Group  = "2" // 2是群组
    case PublicServer = "3"  // 服务号
    case PublicSubscribe = "4"   //订阅号
    
    //消息类型对应的占位图
    var placeHolderImage: UIImage {
        switch (self) {
        case .Personal:
            return TSAsset.Icon_avatar.image
        case .System, .Group, .PublicServer, PublicSubscribe:
            return TSAsset.Icon_avatar.image
        }
    }
}

//发送消息的状态
enum MessageSendSuccessType: Int {
    case Success = 0    //消息发送成功
    case Failed     //消息发送失败
    case Sending    //消息正在发送
}



// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com