//
//  ImageWebview.h
//  AddShoppingCart
//
//  Created by 主用户 on 16/4/14.
//  Copyright © 2016年 江萧. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"

@interface ImageWebview : UIView<UIWebViewDelegate>
{
    int selectindex;
    NSArray *webarr;
}

@property(nonatomic ,strong) MJRefreshHeaderView *_header;
@property(nonatomic, retain)UIWebView  *webview;

-(instancetype)initWithFrame:(CGRect)frame andwebArr:(NSArray *)webArr;
@end
