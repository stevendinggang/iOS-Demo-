//
//  ViewController.m
//  ButtonAnimation
//
//  Created by Baojia on 14/11/19.
//  Copyright (c) 2014年 Baojia. All rights reserved.
//

#import "ViewController.h"
#import "ButtonAnimations.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    ButtonAnimations *btView = [[ButtonAnimations alloc] initWithFrame:CGRectMake(10, 150, self.view.bounds.size.width, 80)];
    
    [self.view addSubview:btView];
    
    [btView setNeedsDisplay:@[@"50",@"100",@"200"]];
    
    
    [btView sendCar:^(NSString *sendType, NSString *sendPrice) {
        NSLog(@"sendType:%@ sendPrice:%@",sendType, sendPrice);
    }];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com 
