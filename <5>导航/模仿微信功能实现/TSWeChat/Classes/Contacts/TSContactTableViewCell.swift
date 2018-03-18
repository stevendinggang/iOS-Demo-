//
//  TSContactTableViewCell.swift
//  TSWeChat
//
//  Created by Hilen on 11/26/15.
//  Copyright © 2015 Hilen. All rights reserved.
//

import UIKit

class TSContactTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setCellContnet(model: ContactModel) {
        self.avatarImageView.ts_setImageWithURLString(model.avatarSmallURL, placeholderImage: TSAsset.Icon_avatar.image)
        self.usernameLabel.text = model.chineseName
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com