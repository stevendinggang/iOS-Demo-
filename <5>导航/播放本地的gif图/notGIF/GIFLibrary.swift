//
//  GIFLibrary.swift
//  ATGIF
//
//  Created by Atuooo on 11/5/15.
//  Copyright © 2015 atuooo. All rights reserved.
//

import Foundation
import Photos
/// 用来判断 GIF 是否被处理过
//import ImageIO
import MobileCoreServices

class GIFLibrary: NSObject, PHPhotoLibraryChangeObserver {

// MARK: - init & deinit 
    
    var fetchResults = PHFetchResult()
    weak var changeObserver: GIFLibraryChangeObserver!
    private var shouldChange = Bool()
    
    override init() {
        super.init()
        
        let fetchOptions: PHFetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        fetchResults = PHAsset.fetchAssetsWithMediaType(.Image, options: fetchOptions)
        
        PHPhotoLibrary.sharedPhotoLibrary().registerChangeObserver(self)
    }
    
    deinit {
        PHPhotoLibrary.sharedPhotoLibrary().unregisterChangeObserver(self)
    }
    
    func registerChangeObserver(observer: GIFLibraryChangeObserver) {
        changeObserver = observer
    }

// MARK: - fetch method
    
    func fetchGIFData() -> [NSData] {
        var imagesData = [NSData]()
        
        let requestOption = PHImageRequestOptions()
        requestOption.synchronous = true
        requestOption.version = .Original // 直接读取 原始数据，防止GIF被编辑后格式变化，也可以之后再判断 UTType
        let imageManager = PHImageManager.defaultManager()
        
        fetchResults.enumerateObjectsUsingBlock {
            (asset: AnyObject,
            index: Int,
            bool: UnsafeMutablePointer<ObjCBool>) -> Void in
            let assetResource = PHAssetResource.assetResourcesForAsset(asset as! PHAsset).first!
            if assetResource.originalFilename.hasSuffix("GIF") {
                imageManager.requestImageDataForAsset(
                    asset as! PHAsset,
                    options: requestOption,
                    resultHandler:
                    { (imageData, uti, orientation, info) -> Void in
                        imagesData.append(imageData!)
                })
            }
        }
        
        return imagesData
    }
    
// MARK: - Photo Library Change Observer
    
    func photoLibraryDidChange(changeInstance: PHChange) {
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            let photoChanges = changeInstance.changeDetailsForFetchResult(self.fetchResults)
            if ((photoChanges) != nil) {
                self.fetchResults = (photoChanges?.fetchResultAfterChanges)!
                if (photoChanges!.hasIncrementalChanges && !photoChanges!.hasMoves){
                    
                    if self.hasGIF(within: photoChanges?.insertedObjects) {
                        self.changeObserver.gifLibraryDidChange()
                    } else if self.hasGIF(within: photoChanges?.removedObjects) {
                        self.changeObserver.gifLibraryDidChange()
                    }
                    
                    /// insert a png also will get in ! why?
//                    else if self.hasGIF(within: photoChanges?.changedObjects) {
//                        self.changeObserver.gifLibraryDidChange()
//                    }
                } else { // first open app (authorized)
                    self.changeObserver.gifLibraryDidChange()
                }
            }
        }
    }
    
    private func hasGIF(within objects: [PHObject]?) -> Bool {
        guard let _ = objects else {
            return false
        }
        
        for object in objects! {
            let assetResource = PHAssetResource.assetResourcesForAsset(object as! PHAsset).first!
            if assetResource.originalFilename.hasSuffix("GIF") {
                return true
            }
        }
        
        return false
    }
}

// MARK: - GIF Library Change Observer
protocol GIFLibraryChangeObserver: NSObjectProtocol {
    func gifLibraryDidChange()
}



