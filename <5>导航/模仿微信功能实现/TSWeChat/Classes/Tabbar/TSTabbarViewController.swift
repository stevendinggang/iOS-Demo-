//
//  TSTabbarViewController.swift
//  TSWeChat
//
//  Created by Hilen on 11/5/15.
//  Copyright © 2015 Hilen. All rights reserved.
//

import UIKit

class TSTabbarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewController()
    }
    
    func setupViewController() {
        let titleArray = ["微信", "通讯录", "发现", "我"]
        
        let normalImagesArray = [
            TSAsset.Tabbar_mainframe.image,
            TSAsset.Tabbar_contacts.image,
            TSAsset.Tabbar_discover.image,
            TSAsset.Tabbar_me.image,
        ]
        
        let selectedImagesArray = [
            TSAsset.Tabbar_mainframeHL.image,
            TSAsset.Tabbar_contactsHL.image,
            TSAsset.Tabbar_discoverHL.image,
            TSAsset.Tabbar_meHL.image,
        ]
        
        let viewControllerArray = [
            TSMessageViewController.initFromNib(),  //消息
            TSContactsViewController.initFromNib(), //联系人
            TSDiscoverViewController.initFromNib(), //发现
            TSMeViewController.initFromNib()   //我
        ]
        
        let navigationVCArray = NSMutableArray()
        for (index, controller) in viewControllerArray.enumerate() {
            controller.tabBarItem!.title = titleArray.get(index)
            controller.tabBarItem!.image = normalImagesArray.get(index).imageWithRenderingMode(.AlwaysOriginal)
            controller.tabBarItem!.selectedImage = selectedImagesArray.get(index).imageWithRenderingMode(.AlwaysOriginal)
            controller.tabBarItem!.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.lightGrayColor()], forState: .Normal)
            controller.tabBarItem!.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor(colorNamed: TSColor.tabbarSelectedTextColor)], forState: .Selected)
            let navigationController = UINavigationController(rootViewController: controller)
            navigationVCArray.addObject(navigationController)
        }
        self.viewControllers = navigationVCArray.mutableCopy() as! [UINavigationController]
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