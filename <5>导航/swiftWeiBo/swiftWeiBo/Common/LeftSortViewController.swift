//
//  LeftSortViewController.swift
//  swiftWeiBo
//
//  Created by yuan on 16/3/2.
//  Copyright © 2016年 yuan. All rights reserved.
//

import UIKit

class LeftSortViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var tabbleView : UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()

        let imageV = UIImageView(image: UIImage(named: "leftbackiamge"))
        imageV.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
        view.addSubview(imageV)
        
        self.tabbleView = UITableView(frame: self.view.bounds)
        self.tabbleView?.delegate = self
        self.tabbleView?.dataSource = self
        self.tabbleView?.separatorStyle = UITableViewCellSeparatorStyle.None
        view.addSubview(self.tabbleView!)
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellID : String = "cellID"
        var cell  = tabbleView!.dequeueReusableCellWithIdentifier(cellID)
        if cell == nil{
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellID)
        }
        cell?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell?.selectionStyle = UITableViewCellSelectionStyle.None
        cell?.textLabel?.font = UIFont.systemFontOfSize(20.0)
        cell?.backgroundColor = UIColor.clearColor()
        cell?.textLabel?.textColor = UIColor.whiteColor()
        
        if (indexPath.row == 0) {
            cell!.textLabel!.text = "开通会员"
        } else if (indexPath.row == 1) {
            cell!.textLabel!.text = "QQ钱包"
        } else if (indexPath.row == 2) {
            cell!.textLabel!.text = "网上营业厅"
        } else if (indexPath.row == 3) {
            cell!.textLabel!.text = "个性装扮"
        } else if (indexPath.row == 4) {
            cell!.textLabel!.text = "我的收藏"
        } else if (indexPath.row == 5) {
            cell!.textLabel!.text = "我的相册"
        } else if (indexPath.row == 6) {
            cell!.textLabel!.text = "我的文件"
        }
        
        return cell!

    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 180
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRectMake(0, 0, self.view.frame.size.width, 180))
        view.backgroundColor = UIColor.clearColor()
        return view
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        tabbleView?.deselectRowAtIndexPath(indexPath, animated: true)
        let otherContrller = OtherViewController()
        let tempAppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        tempAppDelegate.leftVC?.closeLeftView()
        let nav = tempAppDelegate.tabBarController?.selectedViewController as! UINavigationController
        nav.pushViewController(otherContrller, animated: true)
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