//
//  PullToRefreshLabelView.swift
//  ATGIF
//
//  Created by Atuooo on 12/15/15.
//  Copyright © 2015 atuooo. All rights reserved.
//

import UIKit
import LTMorphingLabel

public let labelFont = "Shojumaru-Regular"

protocol PullToRefreshLabelViewDelegate {
    func refreshLabelViewDidComplete()
}

class PullToRefreshLabelView: UIView, LTMorphingLabelDelegate {
    let stringSizes: [CGFloat] = [12, 15, 12, 15, 12]
    let labelEffects: [LTMorphingEffect] = [.Fall, .Anvil, .Scale, .Pixelate, .Fall]
    let labelStrings = ["It pronounced ", "\" JIF \", ", "not ", "\" GIF \"", "—— Steve Wilhite "]
    
    var refreshLabels = [LTMorphingLabel]()
    var attributedStrings = [NSAttributedString]()
    var labelFrames = [CGRect]()
    var delegate : PullToRefreshLabelViewDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
        setRefreshLabels()
        
        for label in refreshLabels {
            self.addSubview(label)
        }
    }
    
    override func didMoveToSuperview() {
        refreshLabels.first?.text = labelStrings.first
    }
    
    override func removeFromSuperview() {
        for label in refreshLabels {
            label.removeFromSuperview()
        }
    }

// MARK: - LTMorphingLabel Delegate
    
    func morphingDidComplete(label: LTMorphingLabel) {
        dispatch_async(dispatch_get_main_queue(), {
            if label.text == self.labelStrings.last {
                self.removeFromSuperview()
                self.delegate.refreshLabelViewDidComplete()
            } else {
                self.refreshLabels[label.tag+1].text = self.labelStrings[label.tag+1]
            }
        })
    }
    
// MARK: - Help Methods
    
    private func setRefreshLabels() {
        getFramesOfLabels()
        
        if refreshLabels.isEmpty {
            for i in 0 ..< labelStrings.count {
                let label = MorphingLabel(labelStrings[i], fontSize: stringSizes[i], frame: labelFrames[i], effect: labelEffects[i])
                label.tag = i
                refreshLabels.append(label)
            }
        }
    }
    
    private func getFramesOfLabels() {
        var firstRowWidth = CGFloat(0)
        if attributedStrings.isEmpty {
            for i in 0 ..< labelStrings.count {
                let attString = NSAttributedString(string: labelStrings[i], attributes: [NSFontAttributeName: UIFont(name: labelFont, size: stringSizes[i])!])
                if i <= 3 {
                    firstRowWidth += attString.size().width
                }
                attributedStrings.append(attString)
            }
        }
        
        if labelFrames.isEmpty {
            var originX = (self.frame.width - firstRowWidth) / 2
            let originY = (self.frame.height - attributedStrings[1].size().height - attributedStrings[4].size().height - 4) / 2
            var frame = CGRect()
            for i in 0 ..< labelStrings.count {
                if i <= 3 {
                    frame = CGRectMake(originX, originY, attributedStrings[i].size().width, attributedStrings[i].size().height)
                    originX += attributedStrings[i].size().width
                } else {
                    frame = CGRectMake(self.center.x, originY + 4.0 + attributedStrings[1].size().height, attributedStrings[i].size().width, attributedStrings[i].size().height)
                }
                
                labelFrames.append(frame)
            }
        }
    }
    
    private func MorphingLabel(text: String, fontSize: CGFloat, frame: CGRect, effect: LTMorphingEffect) -> LTMorphingLabel{
        let label = LTMorphingLabel(frame: frame)
        label.text = ""
        label.font = UIFont(name: "Shojumaru-Regular", size: fontSize)
        label.textAlignment = .Center
        label.tag = Int(frame.width)
        label.morphingEffect = effect
        label.textColor = UIColor.grayColor()
        label.morphingDuration = 0.5
        label.delegate = self
        
        return label
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
