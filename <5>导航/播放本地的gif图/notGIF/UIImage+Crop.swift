//
//  File.swift
//  notGIF
//
//  Created by Atuooo on 12/31/15.
//  Copyright © 2015 HBGHZ85ABK. All rights reserved.
//

import Foundation

extension UIImage {
    public class func aspectFill(image image: UIImage, toSize: CGSize) -> UIImage {
        var cropArea = CGRectZero
        var scale = CGFloat()
        if image.size.height > image.size.width {
            cropArea = CGRectMake(0, (image.size.height-image.size.width) / 2, image.size.width, image.size.width)
            scale = image.size.width / toSize.width
        } else {
            cropArea = CGRectMake((image.size.width - image.size.height)/2, 0, image.size.height, image.size.height)
            scale = image.size.height / toSize.width
        }
        
        let cropImageRef = CGImageCreateWithImageInRect(image.CGImage, cropArea)
        let finalImage = UIImage(CGImage: cropImageRef!, scale: scale, orientation: .Up)
        
        return finalImage
    }
}