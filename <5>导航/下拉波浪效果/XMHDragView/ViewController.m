//
//  ViewController.m
//  XMHDragView
//
//  Created by 徐茂怀 on 15/12/31.
//  Copyright © 2015年 徐茂怀. All rights reserved.
//

#import "ViewController.h"
#import "XMHView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    XMHView *view = [[XMHView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
