//
//  SinaComposeView.swift
//  swiftWeiBo
//
//  Created by yuan on 16/3/3.
//  Copyright © 2016年 yuan. All rights reserved.
//

import UIKit
let SCREENW = UIScreen.mainScreen().bounds.size.width
let SCREENH = UIScreen.mainScreen().bounds.size.height
let COMPOSEW = 80
let COMPOSEH = 110
enum IWComposeButtonAnimType{
    case Up
    case Down
}
class SinaComposeView: UIView {
    lazy var buttonArray : NSMutableArray = {
        return NSMutableArray()
        }()
    var target : UIViewController?
    func initWithTarget(target : UIViewController)->SinaComposeView{
        self.target = target
        self.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height)
        self.backgroundColor = UIColor.greenColor()
        
        let image : UIImage = currentImage().applyLightEffect()
        let imageView = UIImageView(image: image)
        imageView.frame = self.bounds
        addSubview(imageView)
        addChildView()
        
        return self
    }

    
    func currentImage()->UIImage{
        let window = UIApplication.sharedApplication().keyWindow
        
        UIGraphicsBeginImageContext((window?.size)!)
        
        let context : CGContextRef = UIGraphicsGetCurrentContext()!
        
        window?.layer.renderInContext(context)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image
        
    }
    func addChildView(){
        
        let array : NSArray = SinaMenuInfo.mj_objectArrayWithFilename("compose.plist")
        
        let colum : NSInteger = 3
        
        let margin : Float = (Float(SCREENW) - Float(COMPOSEW) * Float(colum))/(Float(colum) + 1)
        for i in 0..<array.count{
            
            let model : SinaMenuInfo = array[i] as! SinaMenuInfo
            
            let button = SinaMenuButton()
            
            let col : Int = i % colum
            let row  : Int = i / colum
//            button.x = CGFloat((col + 1)*margin + col * COMPOSEW)
//            button.y = row*(margin + ComposeButtonH)+SCREENH;
            button.x = (CGFloat(col) + 1) * CGFloat(margin) + CGFloat(col) * CGFloat(COMPOSEW)
            button.y = CGFloat(row) * (CGFloat(margin) + CGFloat(COMPOSEH)) + CGFloat(SCREENH)
            
            
            button.setImage(UIImage(named: String(format: "%@",model.icon!)), forState: UIControlState.Normal)
            button.setTitle(String(format: "%@",model.title!), forState: UIControlState.Normal)
            
            button.addTarget(self, action: "buttonClick:", forControlEvents: UIControlEvents.TouchUpInside)
            addSubview(button)
            self.buttonArray.addObject(button)
        }
        
    }
    func buttonClick(button : SinaMenuButton){
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            for i in 0..<self.buttonArray.count{
                let btn : SinaMenuButton = self.buttonArray[i] as! SinaMenuButton
                if btn == button {
                    btn.transform = CGAffineTransformMakeScale(2.0, 2.0)
                    btn.alpha = 0.5
                    
                }else{
                    btn.transform = CGAffineTransformMakeScale(0.5, 0.5)
                    btn.alpha = 0.5
                }
            }
            }) { (finish) -> Void in
                self.target?.presentViewController(UINavigationController(rootViewController: SinaComposeViewController()), animated: true, completion: { () -> Void in
                    self.removeFromSuperview()
                })
        }

        
    }
    func show(){
        
        self.target?.view.addSubview(self)
        startAnimation(IWComposeButtonAnimType.Up)
    
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        startAnimation(IWComposeButtonAnimType.Down)
        let delay = dispatch_time(DISPATCH_TIME_NOW, Int64(0.25 * Double(NSEC_PER_SEC)))
        dispatch_after(delay, dispatch_get_main_queue()) { () -> Void in
            UIView.animateWithDuration(0.25, animations: { () -> Void in
                self.alpha = 0.0
                }, completion: { (finish) -> Void in
                    self.removeFromSuperview()
            })
        }
        
    }
    func startAnimation(type : IWComposeButtonAnimType){
        self.buttonArray.enumerateObjectsUsingBlock { (button, idx, stop) -> Void in
            let button = button as! SinaMenuButton
            
            button.startAnimation(CACurrentMediaTime() + Double(idx) * 0.025, type: type)
        }
    }

}
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com