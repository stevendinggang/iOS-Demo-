//
//  SortViewController.m
//  标签排序Demo
//
//  Created by 冯学杰 on 16/4/5.
//  Copyright © 2016年 冯学杰. All rights reserved.
//




#import "SortViewController.h"
#import "FXJSortView.h"
#import "UIView+SDAutoLayout.h"


@interface SortViewController ()

@property (nonatomic, strong) UIView *contentView;

@end

@implementation SortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    FXJSortView *sortView = [[FXJSortView alloc]init];
    NSArray *weixuanzhongArr = @[@"对三",@"呵呵",@"要不起"];
    
    [sortView firstTitleBtns:self.titleArr];
    [sortView secondTitleBtns:weixuanzhongArr];
    [self.view addSubview:sortView];
    sortView.sd_layout.spaceToSuperView(UIEdgeInsetsMake(70, 0,0 , 0));
    
    [self createNavBar];
}

-(void)createNavBar{
    UIView *navBar = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    navBar.backgroundColor = [UIColor colorWithRed:255/255 green:155/255 blue:72/255 alpha:1];
    [self.view addSubview:navBar];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-50, 30, 100, 20)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"标签选择";
    titleLabel.textColor = [UIColor whiteColor];
    [navBar addSubview:titleLabel];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    backBtn.frame = CGRectMake(10, 20, 80, 44);
    [backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backBtn setTitle:@"back" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:backBtn];
}

-(void)back:(id)sender{
    [ self dismissViewControllerAnimated: YES completion: nil ];
}
@end
