//
//  SinaEmotionTool.swift
//  swiftWeiBo
//
//  Created by yuan on 16/3/10.
//  Copyright © 2016年 yuan. All rights reserved.
//

import UIKit
/*
1、应用程序包：包含了所有的资源文件和可执行文件

2、Documents：保存应用运行时生成的需要持久化的数据，iTunes同步设备时会备份该目录

3、tmp：保存应用运行时所需要的临时数据，使用完毕后再将相应的文件从该目录删除。应用没有运行，系统也可能会清除该目录下的文件，iTunes不会同步备份该目录

4、Library/Cache：保存应用运行时生成的需要持久化的数据，iTunes同步设备时不备份该目录。一般存放体积大、不需要备份的非重要数据

5、Library/Preference：保存应用的所有偏好设置，IOS的Settings应用会在该目录中查找应用的设置信息。iTunes同步设备时会备份该目录
*/
class SinaEmotionTool: NSObject {
    
    
//    class func saveRecenEmotion(model :SinaEmotionModel){
////        let recentArray = NSUserDefaults.standardUserDefaults().objectForKey("emotionArray") as! NSMutableArray
//        let recentArray = NSMutableArray()
//        recentArray.addObject(model)
//        let array = recentArray as NSArray
//        if model.code == nil {
//            model.code = ""
//        }
//
//        NSUserDefaults.standardUserDefaults().setObject(array, forKey: "emotionArray")
//    }
//    class func recentEmotions()->NSArray{
//        return NSUserDefaults.standardUserDefaults().objectForKey("emotionArray") as! NSArray
//    }
//    
    
    
    
    class func saveRecenEmotion(model :SinaEmotionModel){
        
        let pathstr = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last
        
        let url = NSURL(string: pathstr!)
        
        let path = url?.URLByAppendingPathComponent("recentemotions.archive")
        
//        let array = NSKeyedUnarchiver.unarchiveObjectWithFile((path?.absoluteString)!) as! NSArray
        
        let recentArray = NSMutableArray()
        recentArray.addObject(model)
        
        NSKeyedArchiver.archiveRootObject(recentArray.copy(), toFile: path!.absoluteString)
    }
    
    class func recentEmotions()->NSArray {
        let pathstr = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last
        
        let url = NSURL(string: pathstr!)
        
        let path = url?.URLByAppendingPathComponent("recentemotions.archive")
        
        return NSKeyedUnarchiver.unarchiveObjectWithFile(path!.absoluteString) as! NSArray
        
    }
}
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com