//
//  GuideView.swift
//  ATGIF
//
//  Created by Atuooo on 12/19/15.
//  Copyright © 2015 atuooo. All rights reserved.
//

import UIKit

class GuideView: UIView {

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.

    init(pointTo point: CGPoint) {
        super.init(frame: CGRectMake(point.x-200, point.y, 200, 100))
        self.backgroundColor = UIColor.clearColor()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) { // -> PaintCode
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()
        
        //// Color Declarations
        let color = UIColor.whiteColor()//UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 0.485)
        
        //// Group
        //// Text Drawing
        let textRect = CGRectMake(19, 40, 148, 42)
        let textTextContent = NSString(string: "You can click it to stop Auto Play")
        let textStyle = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        textStyle.alignment = NSTextAlignment.Center
        
        let textFontAttributes = [NSFontAttributeName: UIFont(name: "Shojumaru-Regular", size: 12)!, NSForegroundColorAttributeName: color, NSParagraphStyleAttributeName: textStyle]
        
        let textTextHeight: CGFloat = textTextContent.boundingRectWithSize(CGSizeMake(textRect.width, CGFloat.infinity), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: textFontAttributes, context: nil).size.height
        CGContextSaveGState(context)
        CGContextClipToRect(context, textRect);
        textTextContent.drawInRect(CGRectMake(textRect.minX, textRect.minY + (textRect.height - textTextHeight) / 2, textRect.width, textTextHeight), withAttributes: textFontAttributes)
        CGContextRestoreGState(context)
        
        
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(151.31, 33.3))
        bezierPath.addCurveToPoint(CGPointMake(162.56, 22.86), controlPoint1: CGPointMake(151.31, 33.3), controlPoint2: CGPointMake(152.92, 34.46))
        bezierPath.addCurveToPoint(CGPointMake(181.83, 11.26), controlPoint1: CGPointMake(172.2, 11.26), controlPoint2: CGPointMake(170.59, 19.38))
        bezierPath.addCurveToPoint(CGPointMake(193.08, 0.82), controlPoint1: CGPointMake(193.08, 3.14), controlPoint2: CGPointMake(193.08, 0.82))
        color.setStroke()
        bezierPath.lineWidth = 2.5
        CGContextSaveGState(context)
        CGContextSetLineDash(context, 0, [2, 2], 2)
        bezierPath.stroke()
        CGContextRestoreGState(context)
        
        
        //// Bezier 2 Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 183.99, 3.09)
        CGContextRotateCTM(context, -15.96 * CGFloat(M_PI) / 180)
        
        let bezier2Path = UIBezierPath()
        bezier2Path.moveToPoint(CGPointMake(-0, -0))
        bezier2Path.addLineToPoint(CGPointMake(10.94, -0))
        bezier2Path.addLineToPoint(CGPointMake(10.94, 10.44))
        color.setStroke()
        bezier2Path.lineWidth = 3
        CGContextSaveGState(context)
        CGContextSetLineDash(context, 1, [1, 0], 2)
        bezier2Path.stroke()
        CGContextRestoreGState(context)
        
        CGContextRestoreGState(context)
        
        
        //// Bezier 3 Drawing
        let bezier3Path = UIBezierPath()
        bezier3Path.moveToPoint(CGPointMake(10.84, 53.1))
        bezier3Path.addCurveToPoint(CGPointMake(20.98, 77.23), controlPoint1: CGPointMake(10.84, 53.1), controlPoint2: CGPointMake(-7.97, 67.58))
        bezier3Path.addCurveToPoint(CGPointMake(53.5, 82.5), controlPoint1: CGPointMake(43.98, 84.89), controlPoint2: CGPointMake(37.61, 82.18))
        bezier3Path.addCurveToPoint(CGPointMake(71.49, 86.88), controlPoint1: CGPointMake(57.62, 82.58), controlPoint2: CGPointMake(63.55, 86.88))
        bezier3Path.addCurveToPoint(CGPointMake(111.5, 82.5), controlPoint1: CGPointMake(88.31, 86.88), controlPoint2: CGPointMake(100.43, 81.31))
        bezier3Path.addCurveToPoint(CGPointMake(155.5, 82.5), controlPoint1: CGPointMake(125.82, 84.04), controlPoint2: CGPointMake(139.17, 87.94))
        bezier3Path.addCurveToPoint(CGPointMake(167.56, 45.06), controlPoint1: CGPointMake(184.45, 72.85), controlPoint2: CGPointMake(196.51, 61.14))
        bezier3Path.addCurveToPoint(CGPointMake(125.5, 39.5), controlPoint1: CGPointMake(147.05, 33.66), controlPoint2: CGPointMake(141.73, 39.06))
        bezier3Path.addCurveToPoint(CGPointMake(98.18, 33.8), controlPoint1: CGPointMake(118.81, 39.68), controlPoint2: CGPointMake(110.57, 33.8))
        bezier3Path.addCurveToPoint(CGPointMake(65.5, 39.5), controlPoint1: CGPointMake(84.34, 33.8), controlPoint2: CGPointMake(73.97, 39.85))
        bezier3Path.addCurveToPoint(CGPointMake(34.5, 39.5), controlPoint1: CGPointMake(59.97, 39.27), controlPoint2: CGPointMake(40.1, 37.46))
        bezier3Path.addCurveToPoint(CGPointMake(20.5, 40.5), controlPoint1: CGPointMake(28.49, 41.69), controlPoint2: CGPointMake(26.26, 36.26))
        bezier3Path.addCurveToPoint(CGPointMake(10.84, 53.1), controlPoint1: CGPointMake(14.63, 44.82), controlPoint2: CGPointMake(10.84, 53.1))
        color.setStroke()
        bezier3Path.lineWidth = 2.5
        CGContextSaveGState(context)
        CGContextSetLineDash(context, 2, [4, 3], 2)
        bezier3Path.stroke()
        CGContextRestoreGState(context)
    }
}
 