//
//  TSChatSystemCell.swift
//  TSWeChat
//
//  Created by Hilen on 1/11/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import UIKit

private let kChatInfoFont: UIFont = UIFont.systemFontOfSize(13)
private let kChatInfoLabelMaxWdith : CGFloat = UIScreen.width - 40*2
private let kChatInfoLabelPaddingLeft: CGFloat = 8   //左右分别留出 8 像素的留白
private let kChatInfoLabelPaddingTop: CGFloat = 4   //上下分别留出 4 像素的留白
private let kChatInfoLabelMarginTop: CGFloat = 3  //距离顶部
private let kChatInfoLabelMarginBottom: CGFloat = 10 //距离底部

class TSChatSystemCell: UITableViewCell {
    @IBOutlet weak var infomationLabel: TSChatEdgeLabel!{didSet {
        infomationLabel.font = kChatInfoFont
        infomationLabel.labelEdge = UIEdgeInsets(
            top: 0,
            left: kChatInfoLabelPaddingLeft,
            bottom: 0,
            right: kChatInfoLabelPaddingLeft
        )
        infomationLabel.layer.cornerRadius = 4
        infomationLabel.layer.masksToBounds = true
        infomationLabel.font = kChatInfoFont
        infomationLabel.textColor = UIColor.whiteColor()
        infomationLabel.backgroundColor = UIColor (red: 190/255, green: 190/255, blue: 190/255, alpha: 0.6 )
        }}
    var model: ChatModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .None
    }
    
    func setCellContent(model: ChatModel) {
        self.model = model
        self.infomationLabel.text = model.messageContent
    }
    
    override func layoutSubviews() {
        guard let model = self.model else {
            return
        }
        self.infomationLabel.setFrameWithString(model.messageContent!, width: kChatInfoLabelMaxWdith)
        self.infomationLabel.width = self.infomationLabel.width + kChatInfoLabelPaddingLeft*2  //左右的留白
        self.infomationLabel.height = self.infomationLabel.height + kChatInfoLabelPaddingTop*2   //上下的留白
        self.infomationLabel.left = (UIScreen.width - self.infomationLabel.width) / 2
        self.infomationLabel.top = kChatInfoLabelMarginTop
    }
    
    class func layoutHeight(model: ChatModel) -> CGFloat {
        if model.cellHeight != 0 {
            return model.cellHeight
        }
        var height: CGFloat = 0
        height += kChatInfoLabelMarginTop + kChatInfoLabelMarginTop
        let stringHeight: CGFloat = model.messageContent!.stringHeightWithMaxWidth(kChatInfoLabelMaxWdith, font: kChatInfoFont)
        height += stringHeight + kChatInfoLabelPaddingTop*2
        model.cellHeight = height
        return model.cellHeight
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}



// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com