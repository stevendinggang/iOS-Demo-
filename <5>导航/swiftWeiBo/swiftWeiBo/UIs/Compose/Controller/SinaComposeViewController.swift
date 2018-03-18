//
//  SinaComposeViewController.swift
//  swiftWeiBo
//
//  Created by yuan on 16/3/3.
//  Copyright © 2016年 yuan. All rights reserved.
//

import UIKit

class SinaComposeViewController: SinaBaseViewController {
    var textView : SinaEmotionTextView?
    var toolBar : SinaComposeToolBar?
    var photoView : SinaPhotoView?
    var isChangingKeyBord : Bool = false
    
    lazy var keyBordView : UIView = {
        let KView = SinaKeyBordView(frame: CGRectMake(0, 0, SCREENW, 200))
//        KView.backgroundColor = UIColor.redColor()
        return KView
        }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()

        let backButton = setNavButton("取消", action: "back")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        let sureButton = setNavButton("发表", action: "sure")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: sureButton)
        
        addTextView()
        
        addPhotoView()
        
        addtoolBar()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyBordChange:", name: UIKeyboardWillChangeFrameNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "emotionUpToTextView:", name: EmotionNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "emotionButtonClick", name: EmotionBackButtonClick, object: nil)
    }
    
    func emotionButtonClick(){
        textView!.deleteBackward()
    }
    
    func emotionUpToTextView(notify : NSNotification){
        let model = notify.userInfo![kIWEmotion] as! SinaEmotionModel
        textView!.insertEmotion(model)
        textViewDidChange(textView!)
    }
    func keyBordChange(notify : NSNotification){
        
        if isChangingKeyBord == false {
            let rectValue : NSValue = notify.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
            
            let rect : CGRect = rectValue.CGRectValue()
            UIView.animateWithDuration(0.25) { () -> Void in
                self.toolBar!.y = rect.origin.y - self.toolBar!.height;
            }
        }
        
    }
    func addtoolBar(){
        let toolBar = SinaComposeToolBar()
        toolBar.delegate = self
        view.addSubview(toolBar)
        self.toolBar = toolBar
    }
    func addPhotoView(){
        let photoView = SinaPhotoView()
        photoView.x = 0
        photoView.y = 100
        photoView.delegate = self
        view.addSubview(photoView)
        self.photoView = photoView
    }
    func addTextView(){
        let textView = SinaEmotionTextView()
        textView.delegate = self
        textView.placeHoldeString = "下雨天，音乐和巧克力更配哦！"
        textView.frame = CGRectMake(0, 0, self.view.width, self.view.height)
        textView.alwaysBounceVertical = true
        self.view.addSubview(textView)
        self.textView = textView
    }
    func setNavButton(title : String, action :Selector)->UIButton {
        let backButton = UIButton(frame: CGRectMake(0, 0, 44, 30))
        backButton.setTitle(title, forState: UIControlState.Normal)
        backButton.addTarget(self, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        return backButton
    }
    func sure(){
        print("123")
        self.textView?.endEditing(true)
                
    }
    func back(){
        self.textView?.endEditing(true)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}

extension SinaComposeViewController : SinaComposeToolBarDelegate{
    func selectPicture(button : UIButton) {
        switch button.tag {
        case SinaComposeViewToolBarType.Camera.rawValue:
            print("Camera")
            break
        case SinaComposeViewToolBarType.Picture.rawValue:
            print("Picture")
            selectPhotos()
            break
        case SinaComposeViewToolBarType.Mention.rawValue:
            print("Mention")
            break
        case SinaComposeViewToolBarType.Trend.rawValue:
            print("Trend")
            break
        case SinaComposeViewToolBarType.Emotion.rawValue:
            print("Emotion")
            changeKeyBord()
            break
            
        default:
            break
        }

        
    }
    
    func changeKeyBord(){
        isChangingKeyBord = true
        textView?.endEditing(true)
        if (textView?.inputView == nil) {
            textView?.inputView = keyBordView
            toolBar?.isSystemKeybord = false
        }else{
            textView?.inputView = nil
            toolBar?.isSystemKeybord = true
        }
        isChangingKeyBord = false
        self.textView?.becomeFirstResponder()
    }
    
    func selectPhotos() {
        let imagePickCtr = UIImagePickerController()
        imagePickCtr.view.backgroundColor = UIColor.whiteColor()
        imagePickCtr.sourceType = .PhotoLibrary
        
        imagePickCtr.delegate = self
        
        self.presentViewController(imagePickCtr, animated: true, completion: nil)
    }
}


extension SinaComposeViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]){
        let image : UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        self.photoView?.addPhotosToView(image)
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

extension SinaComposeViewController : SinaPhotoViewDelegate {
    func pickPhoto() {
        selectPhotos()
    }
}

extension SinaComposeViewController : UITextViewDelegate {
    func textViewDidChange(textView: UITextView){
//        print(textView.contentSize.height)
        if textView.contentSize.height > 50 {
            photoView?.y = textView.contentSize.height + 49
        }else{
            photoView?.y = 100
        }
    }
}
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com