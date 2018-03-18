//
//  PopAnimationView.swift
//  ATGIF
//
//  Created by Atuooo on 11/18/15.
//  Copyright © 2015 atuooo. All rights reserved.
//

import UIKit

protocol DetailViewDelegate {
    // 当在显示 detailView 时 updateUI，UI会混乱
    func didDismissDetailView()
}

class PopDetailView: UIView {
    
    var delegate : DetailViewDelegate!
   
    private var cellFrame = CGRect()
    private var finalFrame = CGRect()
    private var initialFrame = CGRect()
    private var scaleFactor = CGFloat()
    
    private var cell = PhotoCell()
    private var superView: UIView!
    private var collectionView : UICollectionView

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(frame: CGRect, inView: UIView, ofView: UICollectionView, theCell: PhotoCell) {
        self.superView = inView
        self.cell = theCell
        self.collectionView = ofView
        self.cellFrame = theCell.frame
        initialFrame = frame
        scaleFactor = inView.frame.width / theCell.frame.width
        
        super.init(frame: inView.frame)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "goBack")
        self.addGestureRecognizer(tapGesture)
    }
    
    //MARK:- Show
    
    func showAnimation() {
        if !cell.shouldPlay {
            cell.imageView.startAnimating()
        }
        
        cell.frame = initialFrame
        self.superView.addSubview(cell)
        
        
        if (cell.frame.height * scaleFactor > self.frame.height * 0.5) {
            scaleFactor = self.frame.height * 0.5 / cell.frame.height
        }
        
        func centerOf(frame: CGRect) -> CGPoint {
            return CGPointMake(frame.origin.x + 0.5 * frame.size.width, frame.origin.y + 0.5 * frame.size.height) }
        
        let centerDiff = CGPointMake(self.center.x - centerOf(initialFrame).x, self.center.y - centerOf(initialFrame).y) // 位移差
        let transform = CGAffineTransformScale(CGAffineTransformMakeTranslation(centerDiff.x, centerDiff.y), scaleFactor, scaleFactor)

        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1.0, options: [.BeginFromCurrentState, .AllowUserInteraction], animations: {
                self.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.75)
                self.cell.transform = transform
        }, completion: nil)
    }

    //MARK:- Back
    
    func goBack() {
        if !cell.shouldPlay {
            cell.imageView.stopAnimating()
        }
        
        UIView.animateWithDuration(0.5,
            delay: 0.0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0.0,
            options: [.BeginFromCurrentState, .AllowUserInteraction],
            animations: {
                self.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0)
                self.cell.transform = CGAffineTransformIdentity
            }) { (finished: Bool) -> Void in
                self.cell.frame = self.cellFrame
                self.collectionView.addSubview(self.cell)
                self.removeFromSuperview()
                
                // 如果 GIFLibrary 有变化，等显示完再updateUI
                self.delegate.didDismissDetailView()
        }
    }
}
