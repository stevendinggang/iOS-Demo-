//
//  TSChatEmotionCell.swift
//  TSWeChat
//
//  Created by Hilen on 12/22/15.
//  Copyright © 2015 Hilen. All rights reserved.
//

import UIKit

class TSChatEmotionCell: UICollectionViewCell {
    @IBOutlet weak var emotionImageView: UIImageView!
    internal var isDelete: Bool = false
    var emotionModel: EmotionModel? = nil

    override func prepareForReuse() {
        super.prepareForReuse()
        self.emotionImageView.image = nil
        self.emotionModel = nil
    }
    
    func setCellContnet(model: EmotionModel? = nil) {
        guard let model = model else {
            self.emotionImageView.image = nil
            return
        }
        self.emotionModel = model
        self.isDelete = false
        if let path = TSConfig.ExpressionBundle!.pathForResource(model.imageString, ofType:"png") {
            self.emotionImageView.image = UIImage(contentsOfFile: path)
        }
    }
    
    func setDeleteCellContnet() {
        self.emotionModel = nil
        self.isDelete = true
        self.emotionImageView.image = TSAsset.Emotion_delete.image
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}


/**
 *  表情的 Model
 */
struct EmotionModel {
    var imageString : String!
    var text : String!
    
    init(fromDictionary dictionary: NSDictionary){
        let imageText = dictionary["image"] as! String
        imageString = "\(imageText)@2x"
        text = dictionary["text"] as? String
    }
}



// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com