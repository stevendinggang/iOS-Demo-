//
//  ViewController.m
//  CHDDropDownMenu
//
//  Created by CHD on 15/11/16.
//  Copyright © 2015年 CHD. All rights reserved.
//

#import "ViewController.h"
#import "CHDDropDownMenu.h"
#define CHD_SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //列表展示的模型
    NSMutableArray *arr = [NSMutableArray array];
    for (int i =0; i<3; i++) {
        NSMutableArray *temp = [NSMutableArray array];
        NSInteger row = (i+1)*3;
        for (int j =0; j<row; j++) {
            chdModel *model = [[chdModel alloc] init];
            model.text = [NSString stringWithFormat:@"第%@列---第%@行",@(i),@(j)];
            if (( i == 2 && j >= 2 && j < 4) || ( i == 2 && j == 7)) {
                model.isSub = YES;
            }
            
            [temp addObject:model];
        }
        [arr addObject:temp];
    }
    
    //上边按钮展示的模型,此模型对text赋值即可.
    NSMutableArray *ShowArr = [NSMutableArray array];
    for (int i =0; i<3; i++) {
        NSMutableArray *temp = [NSMutableArray array];
        NSInteger row = (i+1)*3;
        for (int j =0; j<row; j++) {
            chdModel *model = [[chdModel alloc] init];
            model.text = [NSString stringWithFormat:@"%@-%@",@(i),@(j)];
            [temp addObject:model];
        }
        [ShowArr addObject:temp];
    }
    
    //若列表展示内容与按钮展示内容相同则showArr传nil即可。
    [[CHDDropDownMenu alloc] initWithFrame:CGRectMake(0, 40,CHD_SCREEN_WIDTH, 40) showOnView:self.view AllDataArr:arr showArr:ShowArr];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
