//
//  HttpManager+UploadAudio.swift
//  TSWeChat
//
//  Created by Hilen on 1/5/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import Foundation
import Alamofire

//上传音频 ,multipartFormData 上传。key = audio

extension HttpManager {
    /**
     音频文件
     
     - parameter audioData: 音频 Data
     - parameter success: 成功回调 audio model
     - parameter failure: 失败
     */
    class func uploadAudio(
        audioData: NSData,
        recordTime: String,
        success:(audioModel: UploadAudioModel) ->Void,
        failure:(Void) ->Void)
    {
        let parameters = [
            "access_token": UserInstance.accessToken,
            "record_time": recordTime
        ]
        /*
        这里需要填写上传音频的 API
        */
        let URLRequest = NSMutableURLRequest(URL: NSURL.init(string: "")!)
        Alamofire.upload(.POST, URLRequest, multipartFormData : { multipartFormData in
            multipartFormData.appendBodyPart(data: audioData, name: "audio", fileName: "file", mimeType: "audio/AMR")
            for (key, value) in parameters {
                multipartFormData.appendBodyPart(data: value!.dataUsingEncoding(NSUTF8StringEncoding)!, name: key)
            }
        },encodingCompletion: { result in
            switch result {
            case .Success(let upload, _, _):
                upload.responseFileUploadSwiftyJSON(completionHandler: { response in
                    log.info("response:\(response)")
                    switch response.result {
                    case .Success(let data):
                        /*
                        根据 JSON 返回格式，做好 UploadAudioModel 的 key->value 映射, 这里只是个例子
                        */
                        let model: UploadAudioModel = TSMapper<UploadAudioModel>().map(data.dictionaryObject)!
                        success(audioModel: model)
                    case .Failure( _):
                        failure()
                    }
                })
                
            case .Failure(let encodingError):
                debugPrint(encodingError)
            }
        })
    }
}





// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com