//
//  GifViewController.swift
//  GifViewer
//
//  Created by Atuooo on 9/10/15.
//  Copyright © 2015 atuooo. All rights reserved.

import UIKit
import ImageIO
import Photos
import LTMorphingLabel

private let reuseIdentifier = "Cell"
private let keyOfDidGuide = "didGuide" // NSUserDefault: Check If show Guide
private let themeColor = UIColor.color(withHex: 0x444444, alpha: 0.5)
private let fontColor = UIColor.color(withHex: 0xFBFBFB, alpha: 0.95)
private let buttonColor = UIColor.grayColor()

class ATGIFViewController: UICollectionViewController {
    
    var imagesData = [NSData]()
    var gifLibrary = GIFLibrary()
    
    var refreshControl = UIRefreshControl()
    
    var didRefresh = false
    var didShowNoGIF = false
    var didChange = false // set If GIFLibrary Changed
    var isShowing = false // set If show DetailView
    
    var autoPlay = true {
        didSet {
            for cell in self.collectionView?.visibleCells() as! [PhotoCell] {
                autoPlay ? cell.imageView.startAnimating() : cell.imageView.stopAnimating()
                cell.shouldPlay = self.autoPlay ? true : false
            }
        }
    }
    
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigation()
        collectionView?.backgroundColor = themeColor
        collectionView?.alwaysBounceVertical = true // set to show refreshControl when having little images
        
        // get gifs and set the UI
        gifLibrary.registerChangeObserver(self)
        updateUI()
        
        // add refreshControl
        
        refreshControl.tintColor = UIColor.clearColor()
        self.collectionView?.addSubview(refreshControl)
        
        // set layout
        if let layout = collectionView?.collectionViewLayout as? ATGIFLayout {
            layout.delegate = self
        }
        collectionView!.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    deinit {
        refreshControl.removeFromSuperview()
    }
    
}

// MARK: - UICollectionViewDataSource

extension ATGIFViewController {

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesData.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! PhotoCell
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), { () -> Void in
            let imageData = FLAnimatedImage.init(animatedGIFData: self.imagesData[indexPath.item])
            cell.data = self.imagesData[indexPath.item]
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                cell.imageView.animatedImage = imageData
                self.autoPlay ? cell.imageView.startAnimating() : cell.imageView.stopAnimating()
                cell.shouldPlay = self.autoPlay ? true : false
            })
        })
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension ATGIFViewController {
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! PhotoCell
        let frame = self.collectionView!.convertRect(cell.frame, toView: self.view)
        let popView = PopDetailView.init(frame: frame, inView: self.view, ofView: self.collectionView!, theCell: cell)
        self.view.addSubview(popView)
        popView.showAnimation()
        isShowing = true
        popView.delegate = self
    }
}

// MARK:- ATGIFLayout Delegate

extension ATGIFViewController: ATGIFLayoutDelegate {
    func collectionView(collectionView:UICollectionView, sizeForPhotoAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return FLAnimatedImage.init(animatedGIFData: imagesData[indexPath.item]).size
    }
    
    func collectionView(collectionView: UICollectionView, sizesForPhotosAtSameRow indexPath: NSIndexPath) -> [CGSize] {
        if indexPath.item == imagesData.count - 1 {
            return [FLAnimatedImage.init(animatedGIFData: imagesData[indexPath.item]).size]
        } else {
            let image0 = FLAnimatedImage.init(animatedGIFData: imagesData[indexPath.item]).size
            let image1 = FLAnimatedImage.init(animatedGIFData: imagesData[indexPath.item + 1]).size
            return [image0, image1]
        }
    }
}

// MARK: - PopDetailView Delegate
extension ATGIFViewController: DetailViewDelegate {
    func didDismissDetailView() { // 当在显示 detailView 时 updateUI，UI会混乱
        if didChange {
            updateUI()
            didChange = false
            isShowing = false
        }
    }
}

// MARK: - GIF Library Change Observer

extension ATGIFViewController: GIFLibraryChangeObserver {
    
    func gifLibraryDidChange() {
        if isShowing {
            didChange = true
        } else {
            updateUI()
        }
    }
    
    func updateUI() {
//        let status = PHPhotoLibrary.authorizationStatus()
        PHPhotoLibrary.requestAuthorization { (status) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                if status == .Authorized {
                    
                    if (self.view.viewWithTag(55) != nil) {
                        self.view.viewWithTag(55)!.removeFromSuperview()
                        self.view.viewWithTag(5)!.removeFromSuperview()
                    }
                    
                    let hud = MBProgressHUD(view: self.view)
                    self.view.addSubview(hud)
                    hud.dimBackground = true
                    
                    hud.showAnimated(true, whileExecutingBlock: {
                        self.imagesData = self.gifLibrary.fetchGIFData()
                        self.showIfNoGIF()
                        self.collectionView?.reloadData()
                        self.collectionView?.collectionViewLayout.invalidateLayout()
                        }, onQueue: dispatch_get_main_queue(), completionBlock: {
                            // check if show GIF first time and show guide
                            if !NSUserDefaults.standardUserDefaults().boolForKey(keyOfDidGuide) && !self.imagesData.isEmpty {
                                self.showGuideView()
                            }
                            
                            hud.removeFromSuperview()
                    })
                } else if status == .Denied || status == .Restricted {
                    self.showIfNotAuthorized()
                }
            })
        }
    }
    
    func showIfNoGIF() {
        if imagesData.isEmpty && !didShowNoGIF {
            let imageView = UIImageView(frame: CGRectMake(0, 0, 60, 60))
            let image = UIImage(named: "sad")
            imageView.image = image?.imageWithRenderingMode(.AlwaysTemplate)
            imageView.tintColor = UIColor.grayColor()
            imageView.center = CGPointMake(self.view.center.x, 145)
            imageView.tag = 33  // 方便 remove
            self.view.addSubview(imageView)
            
            let label = UILabel(frame: .zero)
            label.text = "No GIFs Found"
            label.font = UIFont(name: "Shojumaru-Regular", size: 20)
            label.textColor = UIColor.grayColor()
            label.textAlignment = .Center
            label.tag = 3
            
            label.sizeToFit()
            label.backgroundColor = UIColor.clearColor()
            label.center = CGPointMake(self.view.center.x, 200)
            view.addSubview(label)
            didShowNoGIF = true
        } else {
            if didShowNoGIF && !imagesData.isEmpty {
                self.view.viewWithTag(3)?.removeFromSuperview()
                self.view.viewWithTag(33)?.removeFromSuperview()
                didShowNoGIF = false
            }
        }
    }
    
    func showIfNotAuthorized() {
        let imageView = UIImageView(frame: CGRectMake(0, 0, 60, 60))
        let image = UIImage(named: "sad")
        imageView.image = image?.imageWithRenderingMode(.AlwaysTemplate)
        imageView.tintColor = UIColor.grayColor()
        imageView.center = CGPointMake(self.view.center.x, 145)
        imageView.tag = 55  // 方便 remove
        self.view.addSubview(imageView)
        
        let label = UILabel(frame: .zero)
        label.text = "Can't Access To Photo"
        label.font = UIFont(name: "Shojumaru-Regular", size: 17)
        label.textColor = UIColor.grayColor()
        label.textAlignment = .Center
        label.tag = 5
        
        label.sizeToFit()
        label.backgroundColor = UIColor.clearColor()
        label.center = CGPointMake(self.view.center.x, 200)
        view.addSubview(label)
    }
}

// MARK: - Set Guide
extension ATGIFViewController {
    func showGuideView() {
        for view in (navigationController?.navigationBar.subviews)! {
            if view.frame.origin.x > 150 {
                let guideView = GuideView(pointTo: CGPointMake(view.center.x, view.center.y + view.frame.height / 2))
                UIView.animateWithDuration(0.6, animations: {
                    self.navigationController?.navigationBar.addSubview(guideView)
                    self.collectionView?.alpha = 0.5
                })
                break
            }
        }
    }
}

// MARK: - Set Navigation

extension ATGIFViewController {

    func setAutoPlayButton() {
        let autoPlayButton = UIBarButtonItem(barButtonSystemItem: .Pause, target: self, action: "diaTapAutoPlayButton")
        self.navigationItem.setRightBarButtonItem(autoPlayButton, animated: true)
        self.navigationItem.rightBarButtonItem?.tintColor = buttonColor
    }
    
    func diaTapAutoPlayButton() {
        autoPlay = !autoPlay
        if autoPlay {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Pause, target: self, action: "diaTapAutoPlayButton")
        } else {
            if !NSUserDefaults.standardUserDefaults().boolForKey(keyOfDidGuide) {
                for view in navigationController!.navigationBar.subviews {
                    if view.isKindOfClass(GuideView) {
                        dispatch_async(dispatch_get_main_queue(), {
                            view.removeFromSuperview()
                            self.collectionView?.alpha = 1.0
                            
                            NSUserDefaults.standardUserDefaults().setBool(true, forKey: keyOfDidGuide)
                            NSUserDefaults.standardUserDefaults().synchronize()
                        })
                    }
                }
            }
            
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Play, target: self, action: "diaTapAutoPlayButton")
        }
        self.navigationItem.rightBarButtonItem?.tintColor = buttonColor
    }
    
    func setNavigation() {
        
        setAutoPlayButton()
        
        self.navigationItem.title = "/jif/"

        self.navigationController?.navigationBar.titleTextAttributes = [
            NSFontAttributeName: UIFont(name: "Kenia-Regular", size: 26)!, //Bradley Hand
            NSForegroundColorAttributeName: fontColor]
    }
}

// MARK: - Pull To Refresh

extension ATGIFViewController: PullToRefreshLabelViewDelegate {
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
//        super.scrollViewDidScroll(scrollView)  // 为什么会报错
        if refreshControl.refreshing {
            if !didRefresh {     // To sure only show refresh view once
                let refreshView = PullToRefreshLabelView(frame: CGRectMake(0, 0, self.view.frame.width, refreshControl.frame.height))
                refreshView.delegate = self
                refreshControl.addSubview(refreshView)
                didRefresh = true
                collectionView?.scrollEnabled = false 
            }
        } else {
            collectionView?.scrollEnabled = true
            if didRefresh {
                didRefresh = false
            }
        }
    }
    
    // PullToRefreshLabelView Delegate
    
    func refreshLabelViewDidComplete() {
        refreshControl.endRefreshing()
    }
}










