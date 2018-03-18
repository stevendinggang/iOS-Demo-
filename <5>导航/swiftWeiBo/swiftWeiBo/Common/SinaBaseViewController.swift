//
//  SinaBaseViewController.swift
//  swiftWeiBo
//
//  Created by yuan on 16/3/1.
//  Copyright © 2016年 yuan. All rights reserved.
//

import UIKit

class SinaBaseViewController: UIViewController {
    var isTabBarHiden : Bool?{
        didSet{
            let tempAppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let leftVC = tempAppDelegate.window?.rootViewController as! LeftSlideViewController
            let tabBarVC = leftVC.mainVC as! SinaTabBarViewController
            
            tabBarVC.tabBar.hidden = isTabBarHiden!
        }
    }
    var isPanEnabled : Bool?{
        didSet{
            let tempAppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let leftVC = tempAppDelegate.window?.rootViewController as! LeftSlideViewController
            leftVC.setPanEnabled(isPanEnabled!)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com