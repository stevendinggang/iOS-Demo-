//
//  SectionedViewDataSourceType.swift
//  Rx
//
//  Created by Krunoslav Zaher on 1/10/16.
//  Copyright © 2016 Krunoslav Zaher. All rights reserved.
//

import Foundation

/**
Data source with access to underlying sectioned model.
*/
public protocol SectionedViewDataSourceType {
    /**
     Returns model at index path.
     
     In case data source doesn't contain any sections when this method is being called, `RxCocoaError.ItemsNotYetBound(object: self)` is thrown.

     - parameter indexPath: Model index path 
     - returns: Model at index path.
    */
    func modelAtIndexPath(indexPath: NSIndexPath) throws -> Any
}// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com