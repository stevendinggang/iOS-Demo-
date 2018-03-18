//
//  ViewController.m
//  Menu
//
//  Created by sangcixiang on 16/2/27.
//  Copyright © 2016年 sangcixiang. All rights reserved.
//

#import "ViewController.h"
#import "CSNavigationBarMenu.h"
@interface ViewController ()
- (IBAction)search:(UIBarButtonItem *)sender;

@property(nonatomic,strong)CSNavigationBarMenu * menu;
@property(nonatomic,assign)BOOL isShow;
@end

@implementation ViewController
-(CSNavigationBarMenu *)menu
{
    if (!_menu)
    {                                                       /** 设置菜单的位置及大小  */
        _menu = [[CSNavigationBarMenu alloc]initWithOrigin:CGPointMake(5,50) width:150];
    }
    return _menu;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (IBAction)search:(UIBarButtonItem *)sender {
    if (self.isShow) {
        [self.menu dismiss];
        self.isShow = NO;
    }else if(!self.isShow){
        [self.menu show];
        self.isShow = YES;
    }
}











@end
