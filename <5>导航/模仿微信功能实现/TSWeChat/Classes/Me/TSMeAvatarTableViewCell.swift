//
//  TSMeAvatarTableViewCell.swift
//  TSWeChat
//
//  Created by Hilen on 2/22/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import UIKit

class TSMeAvatarTableViewCell: UITableViewCell {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var wechatIDLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.accessoryType = .DisclosureIndicator
        
        self.avatarImageView.layer.masksToBounds = true
        self.avatarImageView.layer.cornerRadius = self.avatarImageView.width / 2 / 180 * 30
        self.avatarImageView.layer.borderWidth = 0.5
        self.avatarImageView.layer.borderColor = UIColor.lightGrayColor().CGColor
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com