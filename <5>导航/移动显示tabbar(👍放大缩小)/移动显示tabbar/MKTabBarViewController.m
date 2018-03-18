//
//  MKTabBarViewController.m
//  MengKe
//
//  Created by _鑫宇↘無人懂會 on 15/12/2.
//  Copyright © 2015年 _鑫宇↘無人懂會. All rights reserved.
//

#import "MKTabBarViewController.h"
#import "MKNavigationController.h"

#import "MainViewController.h"
#import "OtherViewController.h"


@interface MKTabBarViewController ()

@end

@implementation MKTabBarViewController

+ (void)initialize {
    
    // 设置UITabBarItem主题
    [self setupTabBarItemTheme];
    
    // 设置UITabBar主题
    [self setupTabBarTheme];
}

+ (void)setupTabBarItemTheme {
    UITabBarItem *tabBarItem = [UITabBarItem appearance];
    
    /**设置文字属性**/
    // 普通状态
    [tabBarItem setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:10], NSForegroundColorAttributeName : [UIColor blackColor]} forState:UIControlStateNormal];
    
    // 选中状态
//    [tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor redColor]} forState:UIControlStateSelected];
    
    // 高亮状态
//    [tabBarItem setTitleTextAttributes:@{} forState:UIControlStateHighlighted];
    
    // 不可用状态(disable)
//    [tabBarItem setTitleTextAttributes:@{} forState:UIControlStateDisabled];
}

+ (void)setupTabBarTheme {
    
    //    UITabBar *tabBar = [UITabBar appearance];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加所有子控制器
    [self addAllViewControllers];
    
    // 创建自定义TabBar
    [self addCustomTabBar];
}

#pragma mark - 添加所有子控制器
- (void)addAllViewControllers {
    

    MainViewController *homeVc = [MainViewController new];
    [self addOneChildVc:homeVc title:@"首页" imageName:@"home_normal" selectedImageName:@"home_highlight"];
    
    OtherViewController *workVc = [OtherViewController new];
    [self addOneChildVc:workVc title:@"工位" imageName:@"mycity_normal" selectedImageName:@"mycity_highlight"];
   
}

#pragma mark - 添加一个子控制器
- (void)addOneChildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)seletedImageName {
    
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:seletedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [self addChildViewController:[[MKNavigationController alloc] initWithRootViewController:childVc]];
}


#pragma mark - 自定义TabBar
- (void)addCustomTabBar {
//    GLTabBar *tabBar = [GLTabBar new];
//    tabBar.tabBarDelegate = self;
//    [self setValue:tabBar forKeyPath:@"tabBar"];
}


@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com