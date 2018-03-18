//
//  SinaEmotionListview.swift
//  swiftWeiBo
//
//  Created by yuan on 16/3/8.
//  Copyright © 2016年 yuan. All rights reserved.
//

import UIKit

class SinaEmotionListview: UIView {
    var scrollSubViews = NSMutableArray()
    var emotionsArray : NSArray? {
        didSet{
            let page = NSInteger((emotionsArray!.count + 19) / 20)
            self.pageControl?.numberOfPages = page
            
            for var i = 0; i < page; i++ {
                let pageView = SinaEmotionPageView()
//                pageView.backgroundColor = UIColor.orangeColor()
                
                var range = NSRange(location: i * 20, length: 20)
                
                let lastPageCount = (emotionsArray?.count)! - range.location
                if (lastPageCount < 20){
                    range.length = lastPageCount
                }
                
                let emotions = emotionsArray?.subarrayWithRange(range)
                pageView.emotionsArray = emotions
                emotionScrollView?.addSubview(pageView)
                
                scrollSubViews.addObject(pageView)
            }
            
        }
    }
    var pageControl : UIPageControl?
    var emotionScrollView : UIScrollView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        emotionScrollView = UIScrollView()
        emotionScrollView?.pagingEnabled = true
        emotionScrollView?.showsHorizontalScrollIndicator = false
//        emotionScrollView?.backgroundColor = UIColor.purpleColor()
        emotionScrollView?.delegate = self
        addSubview(emotionScrollView!)
        
        pageControl = UIPageControl()
        pageControl?.setValue(UIImage(named: "compose_keyboard_dot_selected"), forKey: "_currentPageImage")
        pageControl?.setValue(UIImage(named: "compose_keyboard_dot_normal"), forKey: "_pageImage")
        addSubview(pageControl!)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        pageControl?.width = self.width
        pageControl?.height = 30
        pageControl?.y = self.height - pageControl!.height
        
        emotionScrollView?.width = self.width
        emotionScrollView?.height = self.height - pageControl!.height
        
        for var i = 0; i < scrollSubViews.count; i++ {
            let pView = scrollSubViews[i] as! SinaEmotionPageView
            pView.size = emotionScrollView!.size
            pView.x = CGFloat(i) * pView.width
            
        }
        emotionScrollView?.contentSize = CGSizeMake(self.width * CGFloat(scrollSubViews.count), emotionScrollView!.height)
    }
}

extension SinaEmotionListview : UIScrollViewDelegate {
    func scrollViewDidScroll(scrollView: UIScrollView){
        let page : CGFloat = scrollView.contentOffset.x / scrollView.width
        pageControl?.currentPage = Int(page + 0.5)
    }
}
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com