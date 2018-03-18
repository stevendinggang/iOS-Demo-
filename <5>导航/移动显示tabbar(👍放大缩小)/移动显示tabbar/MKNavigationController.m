//
//  MKNavigationController.m
//  MengKe
//
//  Created by _鑫宇↘無人懂會 on 15/12/2.
//  Copyright © 2015年 _鑫宇↘無人懂會. All rights reserved.
//

#import "MKNavigationController.h"

@interface MKNavigationController ()

@end

@implementation MKNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
}


/**
 *  当第一次用到这个类的时候就会掉用
 */
+ (void)initialize {
    // 设置导航items数据主题
    [self setupNavigationItemsTheme];
    
    // 设置导航栏主题
    [self setupNavigationBarTheme];
}

#pragma mark -  设置导航items数据主题
+ (void)setupNavigationItemsTheme {
    UIBarButtonItem *barButtonItem = [UIBarButtonItem appearance];
    // 设置字体颜色
    [barButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor], NSFontAttributeName : [UIFont systemFontOfSize:14]} forState:UIControlStateNormal];
    [barButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor redColor]} forState:UIControlStateHighlighted];
    [barButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor lightGrayColor]} forState:UIControlStateDisabled];
    
}


#pragma mark -  设置导航栏主题
+ (void)setupNavigationBarTheme {
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    // 设置导航栏title属性
    [navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];
    // 设置导航栏颜色
        [navigationBar setBarTintColor:[UIColor cyanColor]];
    
    // 设置导航栏图片
    //    [navigationBar setBackgroundImage:<#(nullable UIImage *)#> forBarMetrics:<#(UIBarMetrics)#>]
}

#pragma mark -  拦截所有push方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count > 0) {
        // 如果navigationController的字控制器个数大于两个就隐藏
        viewController.hidesBottomBarWhenPushed = YES;
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    }
    [super pushViewController:viewController animated:YES];
}

#pragma mark -  拦截所有pop方法
- (void)back {
    [super popViewControllerAnimated:YES];
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com