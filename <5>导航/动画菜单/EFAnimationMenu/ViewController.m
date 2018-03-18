//
//  ViewController.m
//  aaa
//
//  Created by Jueying on 15/5/17.
//  Copyright (c) 2015年 Jueying. All rights reserved.
//

#import "ViewController.h"
#import "EFAnimationViewController.h"

@interface ViewController ()

@property (nonatomic, strong) EFAnimationViewController *viewController;

@end

@implementation ViewController

- (void)dealloc {
    
    [_viewController.view removeFromSuperview];
    [_viewController removeFromParentViewController];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    self.viewController = ({
        EFAnimationViewController *viewController = [[EFAnimationViewController alloc] init];
        [self.view addSubview:viewController.view];
        [self addChildViewController:viewController];
        [viewController didMoveToParentViewController:self];
        viewController;
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
