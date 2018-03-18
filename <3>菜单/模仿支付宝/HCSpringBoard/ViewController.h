//
//  ViewController.h
//  HCSpringBoard
//
//  Created by 刘海川 on 16/3/4.
//  Copyright © 2016年 Haichuan Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HCAssistant.h"
#import "HCFavoriteIconModel.h"
#import "NSObject+YYModel.h"
#import "HCSpringBoardView.h"
@interface ViewController : UIViewController <BankListDelegate,HCSpringBoardDelegate> {
    HCFavoriteIconModel *_favoriteMainMenu;
}

@property (nonatomic, strong) HCFavoriteIconModel *favoriteMainMenu;

- (void)displayMenu;

@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com