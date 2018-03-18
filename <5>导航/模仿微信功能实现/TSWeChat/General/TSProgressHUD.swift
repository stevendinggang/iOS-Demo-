//
//  TSProgressHUD.swift
//  TSWeChat
//
//  Created by Hilen on 11/11/15.
//  Copyright © 2015 Hilen. All rights reserved.
//

/// 对 HUD 层进行一次封装

import Foundation
import SVProgressHUD

class TSProgressHUD: NSObject {
    class func ts_initHUD() {
        SVProgressHUD.setBackgroundColor(UIColor ( red: 0.0, green: 0.0, blue: 0.0, alpha: 0.7 ))
        SVProgressHUD.setForegroundColor(UIColor.whiteColor())
        SVProgressHUD.setFont(UIFont.systemFontOfSize(14))
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.None)
    }
    
    //成功
    class func ts_showSuccessWithStatus(string: String) {
        self.TSProgressHUDShow(.Success, status: string)
    }
    
    //失败 ，NSError
    class func ts_showErrorWithObject(error: NSError) {
        self.TSProgressHUDShow(.ErrorObject, status: nil, error: error)
    }
    
    //失败，String
    class func ts_showErrorWithStatus(string: String) {
        self.TSProgressHUDShow(.ErrorString, status: string)
    }
    
    //转菊花
    class func ts_showWithStatus(string: String) {
        self.TSProgressHUDShow(.Loading, status: string)
    }
    
    //警告
    class func ts_showWarningWithStatus(string: String) {
        self.TSProgressHUDShow(.Info, status: string)
    }
    
    //dismiss消失
    class func ts_dismiss() {
        SVProgressHUD.dismiss()
    }
    
    //私有方法
    private class func TSProgressHUDShow(type: HUDType, status: String? = nil, error: NSError? = nil) {
        switch type {
        case .Success:
            SVProgressHUD.showSuccessWithStatus(status)
            break
        case .ErrorObject:
            guard let newError = error else {
                SVProgressHUD.showErrorWithStatus("Error:出错拉")
                return
            }
            
            if newError.localizedFailureReason == nil {
                SVProgressHUD.showErrorWithStatus("Error:出错拉")
            } else {
                SVProgressHUD.showErrorWithStatus(error!.localizedFailureReason)
            }
            break
        case .ErrorString:
            SVProgressHUD.showErrorWithStatus(status)
            break
        case .Info:
            SVProgressHUD.showInfoWithStatus(status)
            break
        case .Loading:
            SVProgressHUD.showWithStatus(status)
            break
        }
    }
    
    private enum HUDType: Int {
        case Success, ErrorObject, ErrorString, Info, Loading
    }
}
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com