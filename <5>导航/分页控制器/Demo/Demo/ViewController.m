//
//  ViewController.m
//  Demo
//
//  Created by FineexMac on 16/2/22.
//  Copyright © 2016年 iOS_Liu. All rights reserved.
//
//  作者GitHub主页 https://github.com/SwiftLiu
//  作者邮箱 1062014109@qq.com
//  下载链接 https://github.com/SwiftLiu/LPPageViewController.git

#import "ViewController.h"
#import "TestPageViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Demo主页";
}

- (IBAction)goin:(UIButton *)sender {
    TestPageViewController *vc = [TestPageViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com