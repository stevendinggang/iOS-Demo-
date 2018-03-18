//
//  TSVoiceConverter.swift
//  TSWeChat
//
//  Created by Hilen on 1/5/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import Foundation

class TSVoiceConverter {
    /**
     将 amr 文件转换成 wav 文件
     
     - parameter amrFilePath: amr 文件路径
     - parameter wavSavePath: wav 的保存文件路径
     
     - returns: 是否转换成功
     */
    static func convertAmrToWav(amrFilePath: String, wavSavePath: String) -> Bool {
        let amrCString = amrFilePath.cStringUsingEncoding(NSUTF8StringEncoding)
        let wavCString = wavSavePath.cStringUsingEncoding(NSUTF8StringEncoding)
        let decode = DecodeAMRFileToWAVEFile(amrCString!, wavCString!)
        return Bool(decode)
    }
    
    
    /**
     将 wav 文件转换成 amr 文件
     
     - parameter wavFilePath: wav 文件路径
     - parameter amrSavePath: amr 的保存文件路径
     
     - returns: 是否转换成功
     */
    static func convertWavToAmr(wavFilePath: String, amrSavePath: String) -> Bool {
        let wavCString = wavFilePath.cStringUsingEncoding(NSUTF8StringEncoding)
        let amrCString = amrSavePath.cStringUsingEncoding(NSUTF8StringEncoding)
        let encode = EncodeWAVEFileToAMRFile(wavCString!, amrCString!, 1, 16)
        return Bool(encode)
    }
    
    
    /**
     是否是 amr 文件
     
     - parameter filePath: amr 文件路径

     - returns: Bool
     */
    static func isAMRFile(filePath: String) -> Bool {
        let result = String.fromCString(filePath)!
        return isAMRFile(result)
    }
}


private extension Bool {
    init<T : IntegerType>(_ integer: T){
        self.init(integer != 0)
    }
}


// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com