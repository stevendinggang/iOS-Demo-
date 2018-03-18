//
//  SinaHomeViewController.swift
//  swiftWeiBo
//
//  Created by yuan on 16/3/1.
//  Copyright © 2016年 yuan. All rights reserved.
//

import UIKit

class SinaHomeViewController: SinaBaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(type: UIButtonType.Custom)
        
        button.setBackgroundImage(UIImage(named: "menu"), forState: UIControlState.Normal)
        button.frame = CGRectMake(0, 0, 20, 18)
        button.addTarget(self, action: "isCloseLeftVC", forControlEvents: UIControlEvents.TouchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        
        
    }
    func isCloseLeftVC(){
        let temAppdelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        if (temAppdelegate.leftVC?.closed != nil){
            temAppdelegate.leftVC?.openLeftView()
        }else{
            temAppdelegate.leftVC?.closeLeftView()
        }
    }
    override func viewWillAppear(animated: Bool) {
        
        self.isTabBarHiden = false
        self.isPanEnabled = true
       
        
    }
//    override func viewDidAppear(animated: Bool) {
//        self.isTabBarHiden = false
//    }
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