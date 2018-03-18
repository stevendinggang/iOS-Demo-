//
//  ViewController.m
//  KFScrollViewDemo
//
//  Created by apple on 16/4/11.
//  Copyright © 2016年 吴凯锋 QQ:24272779. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+MLPFlatColors.h"
#import "PushViewController.h"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *pushBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 60, 40)];
    [pushBtn setTitle:@"跳转" forState:UIControlStateNormal];
    [pushBtn setBackgroundColor:[UIColor flatDarkOrangeColor]];
    [pushBtn addTarget:self action:@selector(pushViewcontroller:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn];
    
}
-(void)pushViewcontroller:(id)sender
{
    PushViewController *push = [[PushViewController alloc]init];
    [self presentViewController:push animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
