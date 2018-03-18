//
//  CircleLayer.swift
//  MCCircleView
//
//  Created by 马超 on 16/5/16.
//  Copyright © 2016年 qq 714080794. All rights reserved.
//

import UIKit

enum MovingPoint {
    case POINT_D
    case POINT_B
}

class CircleLayer: CALayer {

    private let outsideW: CGFloat = 90
    private var progress: CGFloat = 0
    private var outsideRect: CGRect = CGRectZero
    private var lastProgress: CGFloat = 0
    private var movePoint: MovingPoint!
    
    override init() {
        
        super.init()
        self.progress = 0.5
        
        updataWithProgress(self.progress)
       
    }
    
    override init(layer: AnyObject) {
        
        super.init(layer: layer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updataWithProgress(progress: CGFloat) {
        
        self.progress = progress
        
        if progress <= 0.5 {
            
            self.movePoint = MovingPoint.POINT_B
        }
        else {
            
            self.movePoint = MovingPoint.POINT_D
        }
        
        self.lastProgress = progress
       
        
        let origin_x = self.position.x - outsideW / 2 + (progress - 0.5) * (self.frame.size.width - outsideW)
        let origin_y = self.position.y - outsideW / 2
        self.outsideRect = CGRectMake(origin_x, origin_y, outsideW, outsideW)
     
        self.setNeedsDisplay()
    }
    
    
    override func drawInContext(ctx: CGContext) {
        
        let offset: CGFloat = self.outsideRect.size.width / 3.6
        let moveDistance: CGFloat = self.outsideRect.size.width / 6 * fabs(progress - 0.5) * 2
       
        let rectCenter: CGPoint = CGPointMake(self.outsideRect.origin.x + outsideW * 0.5, self.outsideRect.origin.y + outsideW * 0.5)
        
        let isPoint_D = self.movePoint == MovingPoint.POINT_D
        
        // compute point
        let pointA: CGPoint = CGPointMake(rectCenter.x, self.outsideRect.origin.y + moveDistance)
        let pointB: CGPoint = CGPointMake(isPoint_D ? self.outsideRect.origin.x + self.outsideRect.size.width : rectCenter.x + self.outsideRect.size.width / 2 + moveDistance * 2,rectCenter.y)
        let pointC: CGPoint = CGPointMake(rectCenter.x, rectCenter.y + self.outsideRect.size.height / 2 - moveDistance)
        let pointD: CGPoint = CGPointMake(isPoint_D ? self.outsideRect.origin.x - moveDistance * 2 : self.outsideRect.origin.x, rectCenter.y)
        
        let c1 = CGPointMake(pointA.x + offset, pointA.y)
        let c2 = CGPointMake(pointB.x, isPoint_D ? pointB.y - offset : pointB.y - offset + moveDistance)
        
        let c3 = CGPointMake(pointB.x, isPoint_D ? pointB.y + offset : pointB.y + offset - moveDistance)
        let c4 = CGPointMake(pointC.x + offset, pointC.y)
        
        let c5 = CGPointMake(pointC.x - offset, pointC.y)
        let c6 = CGPointMake(pointD.x, isPoint_D ? pointD.y + offset - moveDistance : pointD.y + offset)
        
        let c7 = CGPointMake(pointD.x, isPoint_D ? pointD.y - offset + moveDistance : pointD.y - offset)
        let c8 = CGPointMake(pointA.x - offset, pointA.y)
        
        // circlePath
        let circlePath = UIBezierPath()
        circlePath.moveToPoint(pointA)
        circlePath.addCurveToPoint(pointB, controlPoint1: c1, controlPoint2: c2)
        circlePath.addCurveToPoint(pointC, controlPoint1: c3, controlPoint2: c4)
        circlePath.addCurveToPoint(pointD, controlPoint1: c5, controlPoint2: c6)
        circlePath.addCurveToPoint(pointA, controlPoint1: c7, controlPoint2: c8)
        circlePath.closePath()
        
        CGContextAddPath(ctx, circlePath.CGPath)
        CGContextSetStrokeColorWithColor(ctx, UIColor.blackColor().CGColor)
        CGContextSetFillColorWithColor(ctx, UIColor.redColor().CGColor)
        CGContextSetLineDash(ctx, 0, nil, 0)
        CGContextDrawPath(ctx, CGPathDrawingMode.Fill)
        
        
        // set out dash side
        let rectPath: UIBezierPath = UIBezierPath(rect: self.outsideRect)
        CGContextAddPath(ctx, rectPath.CGPath)
        CGContextSetStrokeColorWithColor(ctx, UIColor.blackColor().CGColor)
        CGContextSetLineWidth(ctx, 1.0)
        let dash = [CGFloat(5.0),CGFloat(5.0)]
        CGContextSetLineDash(ctx, 0, dash, 2)
        CGContextStrokePath(ctx)
        
        CGContextSetFillColorWithColor(ctx, UIColor.blueColor().CGColor)
        CGContextSetStrokeColorWithColor(ctx, UIColor.blackColor().CGColor)
        let points = [NSValue(CGPoint: pointA),NSValue(CGPoint: c1),NSValue(CGPoint: c2),
                      NSValue(CGPoint: pointB),NSValue(CGPoint: c3),NSValue(CGPoint: c4),
                      NSValue(CGPoint: pointC),NSValue(CGPoint: c5),NSValue(CGPoint: c6),
                      NSValue(CGPoint: pointD),NSValue(CGPoint: c7),NSValue(CGPoint: c8)]
        drawPoints(points, context: ctx)
        
        let helpLinePath = UIBezierPath()
        helpLinePath.moveToPoint(pointA)
        helpLinePath.addLineToPoint(c1)
        helpLinePath.addLineToPoint(c2)
        helpLinePath.addLineToPoint(pointB)
        helpLinePath.addLineToPoint(c3)
        helpLinePath.addLineToPoint(c4)
        helpLinePath.addLineToPoint(pointC)
        helpLinePath.addLineToPoint(c5)
        helpLinePath.addLineToPoint(c6)
        helpLinePath.addLineToPoint(pointD)
        helpLinePath.addLineToPoint(c7)
        helpLinePath.addLineToPoint(c8)
        helpLinePath.addLineToPoint(pointA)
        
        CGContextAddPath(ctx, helpLinePath.CGPath)
        
        let dash2 = [CGFloat(2.0),CGFloat(2.0)]
        CGContextSetLineDash(ctx, 0, dash2, 2)
        CGContextStrokePath(ctx)
    }
    
    private func drawPoints(points: Array<NSValue> , context: CGContext) {
        
        for point in points {
            
            let p : CGPoint = point.CGPointValue()
            CGContextFillRect(context, CGRectMake(p.x - 2, p.y - 2, 4, 4))
        }
    }
    
}
