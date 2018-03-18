//
//  PhotoCell.swift
//  GifViewer
//
//  Created by Atuooo on 9/10/15.
//  Copyright © 2015 atuooo. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell, NSCopying {
    
    @IBOutlet weak var imageView: FLAnimatedImageView!
    var shouldPlay = true
    var data = NSData()

    func copyWithZone(zone: NSZone) -> AnyObject {
        let copy = PhotoCell()
        return copy
    }
}
