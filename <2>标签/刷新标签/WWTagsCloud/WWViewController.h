//
//  WWViewController.h
//  WWTagsCloud
//
//  Created by mac on 14-7-25.
//  Copyright (c) 2014年 WangWei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WWTagsCloudView.h"
@interface WWViewController : UIViewController<WWTagsCloudViewDelegate>
- (IBAction)refreshBtnClick:(id)sender;

@end
