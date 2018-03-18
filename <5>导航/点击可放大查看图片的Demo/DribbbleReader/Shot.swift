//
//  Shot.swift
//  DribbbleReader
//
//  Created by naoyashiga on 2015/05/17.
//  Copyright (c) 2015年 naoyashiga. All rights reserved.
//

import Foundation

class Shot: DribbbleBase {
    var imageUrl:String!
    var htmlUrl:String!
    var imageData: NSData?
    
    var shotName = ""
    var designerName = ""
    var avatarUrl = ""
    var shotCount = 0
    
    override init(data: NSDictionary) {
        super.init(data: data)
        
        let images = data["images"] as! NSDictionary
        self.imageUrl = Utils.getStringFromJSON(images, key: "normal")
        self.htmlUrl = data["html_url"] as! String
        
        shotName = data["title"] as! String
        let user = data["user"] as! NSDictionary
        designerName = Utils.getStringFromJSON(user, key: "name")
        avatarUrl = Utils.getStringFromJSON(user, key: "avatar_url")
        shotCount = data["views_count"] as! Int
    }
}
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com