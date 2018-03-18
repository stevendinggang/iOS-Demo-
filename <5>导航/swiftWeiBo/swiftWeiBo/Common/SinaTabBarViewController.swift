//
//  SinaTabBarViewController.swift
//  swiftWeiBo
//
//  Created by yuan on 16/3/1.
//  Copyright © 2016年 yuan. All rights reserved.
//

import UIKit

class SinaTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViewController(SinaHomeViewController(), title: "首页", imageName: "tabbar_home")
        addChildViewController(SinaMessageViewController(), title: "消息", imageName: "tabbar_message_center")
        addChildViewController(SinaFindViewController(), title: "发现", imageName: "tabbar_discover")
        addChildViewController(SinaSettingViewController(), title: "我", imageName: "tabbar_profile")
        
        
        let bar = SinaTabBar()
        
        setValue(bar, forKey: "tabBar")
        bar.tintColor = UIColor.orangeColor()
        bar.composeButton.addTarget(self, action: "showLogin", forControlEvents: UIControlEvents.TouchUpInside)
//        bar.Tabdelegate = self
//        readJSON()
        
    }
    func readJSON(){
        let path = NSBundle.mainBundle().pathForResource("VCSettings.json", ofType: "")
        let data = NSData(contentsOfFile: path!)
        
        let json = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions(rawValue: 0))
        print(json)
    }
    func showLogin(){
        let composeView = SinaComposeView().initWithTarget(self)
//        composeView.initWithTarget(self)
//        let window = UIApplication.sharedApplication().keyWindow
//        window?.addSubview(composeView)
        composeView.show()
    }
    func addChildViewController(childController: UIViewController,title: String,imageName: String) {
        childController.title = title
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        
        let NaviControll = UINavigationController(rootViewController: childController)
        UINavigationBar.appearance().barTintColor = UIColor.purpleColor()
        addChildViewController(NaviControll)
        
        
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