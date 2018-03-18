//
//  RootViewController.h
//  vipshop
//
//  Created by Mind is important  on 15/12/12.
//  Copyright © 2015年 iovo. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CenterViewControllerCheckleftBarButtonItemDelegate <NSObject>
@optional
- (void)checkleftBarButtonItemRootViewController:(UIViewController*)viewController;
@end
@interface CenterViewController : UIViewController
@property (nonatomic, weak) id<CenterViewControllerCheckleftBarButtonItemDelegate>delegate;
@property (nonatomic, strong) UIScrollView *mainScrollView;;
@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com