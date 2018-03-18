//
//  SinaPhotoView.swift
//  swiftWeiBo
//
//  Created by yuan on 16/3/4.
//  Copyright © 2016年 yuan. All rights reserved.
//

import UIKit
protocol SinaPhotoViewDelegate : NSObjectProtocol {
    func pickPhoto()
}
class SinaPhotoView: UIView {
    var isRemovew : Bool?
    lazy var addImageView : UIImageView = {
        let temImgView = UIImageView(image: UIImage(named: "compose_pic_add"), highlightedImage: UIImage(named: "compose_pic_add_highlighted"))
        temImgView.userInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: "addImage")
        temImgView.addGestureRecognizer(tapGesture)
        return temImgView
        }()

    weak var delegate : SinaPhotoViewDelegate?
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.width = SCREENW
        self.height = SCREENW

        addSubview(addImageView)
        isRemovew = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addImage(){
        self.delegate?.pickPhoto()
    }
    
    func addPhotosToView(image : UIImage){
        let imgView = SinaImageView(image: image)
        imgView.delegate = self
        if (subviews.count == 9){
            if isRemovew == false {
                addImageView.removeFromSuperview()
                self.isRemovew = true
                addSubview(imgView)
            }else{
                return
            }
            
        }else if (subviews.count > 9){
            return
        }else{
            insertSubview(imgView, belowSubview: subviews.last!)
            layoutIfNeeded()
        }
//        imagesArray.addObject(imgView)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        self.x = 0
//        self.y = 150
        
        let margin = 10
        let colum = 3
        let width = (SCREENW - CGFloat(margin) * CGFloat(colum + 1)) / CGFloat(3)
        
        for var i = 0; i < self.subviews.count; i++ {
            let col : Int = i % colum
            let row : Int = i / colum
            
            let imgView : UIImageView = self.subviews[i] as! UIImageView
            UIView.animateWithDuration(0.25, animations: { () -> Void in
                imgView.x = CGFloat(margin) + CGFloat(col) * (width + CGFloat(margin))
                imgView.y = CGFloat(margin) + CGFloat(row) * (width + CGFloat(margin))
            })
            
            imgView.width = width
            imgView.height = width
//            addSubview(imgView)
        }

        
    }

}
extension SinaPhotoView : SinaImageViewDelegate {
    func addImageViewOrNot(){
        addSubview(addImageView)
        isRemovew = false
        layoutIfNeeded()
    }
}
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com