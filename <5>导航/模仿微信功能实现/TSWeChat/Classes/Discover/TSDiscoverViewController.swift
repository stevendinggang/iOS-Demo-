//
//  TSDiscoverViewController.swift
//  TSWeChat
//
//  Created by Hilen on 1/8/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import UIKit

class TSDiscoverViewController: UIViewController {
    @IBOutlet weak var listTableView: UITableView!
    private let itemDataSouce: [[(name: String, iconImage: UIImage)]] = [
        [
            ("朋友圈", TSAsset.Ff_IconShowAlbum.image),
        ],
        [
            ("扫一扫", TSAsset.Ff_IconQRCode.image),
            ("摇一摇", TSAsset.Ff_IconShake.image),
        ],
        [
            ("附近的人", TSAsset.Ff_IconLocationService.image),
            ("漂流瓶", TSAsset.Ff_IconBottle.image),
        ],
        [
//            ("购物", TSAsset.Icon_bustime.image),
            ("游戏", TSAsset.MoreGame.image),
        ],
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "发现"
        self.view.backgroundColor = UIColor(colorNamed: TSColor.viewBackgroundColor)
        
        self.listTableView.registerNib(TSImageTextTableViewCell.NibObject(), forCellReuseIdentifier: TSImageTextTableViewCell.identifier)
        self.listTableView.estimatedRowHeight = 44
        self.listTableView.tableFooterView = UIView()

        // Do any additional setup after loading the view.
    }

    deinit {
        log.verbose("deinit")
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

// MARK: @protocol - UITableViewDelegate
extension TSDiscoverViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 15
        } else {
            return 20
        }
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

// MARK: @protocol - UITableViewDataSource
extension TSDiscoverViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.itemDataSouce.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rows = self.itemDataSouce[section]
        return rows.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.listTableView.estimatedRowHeight
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TSImageTextTableViewCell.identifier, forIndexPath: indexPath) as! TSImageTextTableViewCell
        let item = self.itemDataSouce[indexPath.section][indexPath.row]
        cell.iconImageView.image = item.iconImage
        cell.titleLabel.text = item.name
        return cell
    }
}



// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com