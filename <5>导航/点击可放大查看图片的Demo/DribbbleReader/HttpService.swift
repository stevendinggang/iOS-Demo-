//
//  HttpService.swift
//  DribbbleReader
//
//  Created by naoyashiga on 2015/05/17.
//  Copyright (c) 2015年 naoyashiga. All rights reserved.
//

import Foundation
import UIKit

class HttpService {
    class func getJSON(url: String, callback:((NSArray) -> Void)) {
        let nsURL = NSURL(string: url)!
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(nsURL, completionHandler: { data, response, error -> Void in
            
            if error != nil{
                print("error")
            }
            
            if data != nil {
                let jsonData = (try! NSJSONSerialization.JSONObjectWithData( data!, options: NSJSONReadingOptions.MutableContainers)) as! NSArray
                callback(jsonData)
            }
            
            session.invalidateAndCancel()
            
        })
        task.resume()
    }
}
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com