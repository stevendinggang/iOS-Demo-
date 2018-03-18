//
//  TSRecordIndicatorView.swift
//  TSWeChat
//
//  Created by Hilen on 12/22/15.
//  Copyright © 2015 Hilen. All rights reserved.
//

import UIKit

class TSChatVoiceIndicatorView: UIView {
    @IBOutlet weak var centerView: UIView!{didSet {  //中央的灰色背景 view
        centerView.layer.cornerRadius = 4.0
        centerView.layer.masksToBounds = true
        }}
    @IBOutlet weak var noteLabel: UILabel! {didSet { //提示的 label
        noteLabel.layer.cornerRadius = 2.0
        noteLabel.layer.masksToBounds = true
        }}
    @IBOutlet weak var cancelImageView: UIImageView!  //取消提示
    @IBOutlet weak var signalValueImageView: UIImageView!   //音量的图片
    @IBOutlet weak var recordingView: UIView!  //录音整体的 view，控制是否隐藏
    @IBOutlet weak var tooShotPromptImageView: UIImageView!  //录音时间太短的提示
    
    override init (frame : CGRect) {
        super.init(frame : frame)
        self.initContent()
    }
    
    convenience init () {
        self.init(frame:CGRect.zero)
        self.initContent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initContent() {
    }

    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
}

//对外交互的 view 控制
// MARK: - @extension TSChatVoiceIndicatorView
extension TSChatVoiceIndicatorView {
    //正在录音
    func recording() {
        self.hidden = false
        self.cancelImageView.hidden = true
        self.tooShotPromptImageView.hidden = true
        self.recordingView.hidden = false
        self.noteLabel.backgroundColor = UIColor.clearColor()
        self.noteLabel.text = "手指上滑，取消发送"
    }
    
    //录音过程中音量的变化
    func signalValueChanged(value: CGFloat) {

    }

    //滑动取消
    func slideToCancelRecord() {
        self.hidden = false
        self.cancelImageView.hidden = false
        self.tooShotPromptImageView.hidden = true
        self.recordingView.hidden = true
        self.noteLabel.backgroundColor = UIColor(rgba: "#9C3638")
        self.noteLabel.text = "松开手指，取消发送"
    }
    
    //录音时间太短的提示
    func messageTooShort() {
        self.hidden = false
        self.cancelImageView.hidden = true
        self.tooShotPromptImageView.hidden = false
        self.recordingView.hidden = true
        self.noteLabel.backgroundColor = UIColor.clearColor()
        self.noteLabel.text = "说话时间太短"
        //0.5秒后消失
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.5 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            self.endRecord()
        }
    }
    
    //录音结束
    func endRecord() {
        self.hidden = true
    }
    
    //更新麦克风的音量大小
    func updateMetersValue(value: Float) {
        var index = Int(round(value))
        index = index > 7 ? 7 : index
        index = index < 0 ? 0 : index
        
        let array = [
            TSAsset.RecordingSignal001.image,
            TSAsset.RecordingSignal002.image,
            TSAsset.RecordingSignal003.image,
            TSAsset.RecordingSignal004.image,
            TSAsset.RecordingSignal005.image,
            TSAsset.RecordingSignal006.image,
            TSAsset.RecordingSignal007.image,
            TSAsset.RecordingSignal008.image,
        ]
        self.signalValueImageView.image = array.get(index)
        
    }
}




// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com