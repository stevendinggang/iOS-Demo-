//
//  PhotoLibraryProposer.swift
//  ATGIF
//
//  Created by Atuooo on 10/19/15.
//  Copyright © 2015 atuooo. All rights reserved.
//

import Foundation
import Photos

public typealias Propose = () -> Void

public typealias ProposerAction = () -> Void

public func proposeToAccessPhotos(agreed successAction: ProposerAction, rejected failureAction: ProposerAction) {
    PHPhotoLibrary.requestAuthorization { status in
        dispatch_async(dispatch_get_main_queue()) {
            switch status {
            case .Authorized:
                successAction()
            default:
                failureAction()
            }
        }
    }
}
