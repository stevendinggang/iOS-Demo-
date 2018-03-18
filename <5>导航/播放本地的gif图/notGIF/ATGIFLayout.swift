//
//  GifViewFlowLayout.swift
//  ATGIF
//
//  Created by Atuooo on 9/24/15.
//  Copyright © 2015 atuooo. All rights reserved.
//

import UIKit

protocol ATGIFLayoutDelegate {
    // Method to ask the delegate for the height of the image
    func collectionView(collectionView:UICollectionView, sizeForPhotoAtIndexPath indexPath: NSIndexPath) -> CGSize
    func collectionView(collectionView:UICollectionView, sizesForPhotosAtSameRow indexPath: NSIndexPath) -> [CGSize]
}

class ATGIFLayout: UICollectionViewLayout {
    
    var delegate: ATGIFLayoutDelegate!
    
    // Configurable properties
    let numberOfColumns = 2
    let cellPadding: CGFloat = 1.0
    
    private var cache = [UICollectionViewLayoutAttributes]()
    
    private var contentHeight: CGFloat = 0
    private var contentWidth: CGFloat {
        let insets = collectionView!.contentInset
        return CGRectGetWidth(collectionView!.bounds) - insets.right - insets.left
    }
    
    override func prepareLayout() {
        super.prepareLayout()
        
        cache = [UICollectionViewLayoutAttributes]()
        contentHeight = 0
        
//        equalWidthLayout()
        equalHeightLayout()
    }
    
    private func equalWidthLayout() {
        let columnWidth = contentWidth / CGFloat(numberOfColumns)
        var xOffset = [CGFloat]()
        for column in 0 ..< numberOfColumns {
            xOffset.append(CGFloat(column) * columnWidth)
        }
        
        var column = 0
        var yOffset = [CGFloat](count: numberOfColumns, repeatedValue: 0)
        
        for item in 0 ..< collectionView!.numberOfItemsInSection(0) {
            
            let indexPath = NSIndexPath(forItem: item, inSection: 0)
            
            let width = columnWidth //- cellPadding * 2
            let size = delegate.collectionView(collectionView!, sizeForPhotoAtIndexPath: indexPath)
            let height = size.height * ( width / size.width)
            
            let frame = CGRectMake(xOffset[column], yOffset[column], width, height)
            let insetFrame = CGRectInset(frame, cellPadding, cellPadding)
            
            let attributes = UICollectionViewLayoutAttributes.init(forCellWithIndexPath: indexPath)
            attributes.frame = insetFrame
            cache.append(attributes)
            
            // Updates the collection view content height
            contentHeight = max(contentHeight, CGRectGetMaxY(frame))
            yOffset[column] = yOffset[column] + height
            
            column = column >= (numberOfColumns - 1) ? 0 : ++column
        }
    }
    
    private func equalHeightLayout() {
        var yOffset: CGFloat = 0
        
        let numberOfItems = collectionView!.numberOfItemsInSection(0)
        for item in 0 ..< (numberOfItems+1) / 2 {
            let indexPath0 = NSIndexPath(forItem: item*2, inSection: 0)
            let sizes = delegate.collectionView(collectionView!, sizesForPhotosAtSameRow: indexPath0)
            
            if (item * 2) == (numberOfItems - 1) {
                let size = sizes.first!
                
                let frame = CGRectMake(0, yOffset, size.width*0.618, size.height*0.618)
                let attributes = UICollectionViewLayoutAttributes.init(forCellWithIndexPath: indexPath0)
                attributes.frame = CGRectInset(frame, cellPadding, cellPadding)
                cache.append(attributes)
                
                contentHeight = max(contentHeight, CGRectGetMaxY(frame))
                
            } else {
                let indexPath1 = NSIndexPath(forItem: item*2+1, inSection: 0)
                let size0 = sizes[0], size1 = sizes[1]
                let rowHeight = contentWidth / ( size0.width/size0.height + size1.width/size1.height)
                
                let width0 = rowHeight / size0.height * size0.width
                let frame0 = CGRectMake(0, yOffset, width0, rowHeight)
                let attributes0 = UICollectionViewLayoutAttributes.init(forCellWithIndexPath: indexPath0)
                attributes0.frame = CGRectInset(frame0, cellPadding, cellPadding)
                cache.append(attributes0)
                
                let width1 = rowHeight / size1.height * size1.width
                let frame1 = CGRectMake(width0, yOffset, width1, rowHeight)
                let attributes1 = UICollectionViewLayoutAttributes.init(forCellWithIndexPath: indexPath1)
                attributes1.frame = CGRectInset(frame1, cellPadding, cellPadding)
                cache.append(attributes1)
                
                yOffset += rowHeight
                contentHeight = max(contentHeight, CGRectGetMaxY(frame0))
            }
        }
    }
    
    override func collectionViewContentSize() -> CGSize {
        return CGSizeMake(contentWidth, contentHeight)
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        
        // Loop through the cache and look for items in the rect
        for attributes  in cache {
            if CGRectIntersectsRect(attributes.frame, rect ) {
                layoutAttributes.append(attributes)
            }
        }
        
        return layoutAttributes
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
}












