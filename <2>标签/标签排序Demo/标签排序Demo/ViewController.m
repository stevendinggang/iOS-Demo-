//
//  ViewController.m
//  标签排序Demo
//
//  Created by 冯学杰 on 16/4/5.
//  Copyright © 2016年 冯学杰. All rights reserved.
//

#import "ViewController.h"
#import "ChildViewController.h"
#import "SlideHeadView.h"
#import "SortViewController.h"

@interface ViewController (){
    NSArray *titleArr;
}

@property (nonatomic , strong) UIButton *slectListButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createHeadView];
    [self createNextBtn];
}

-(void)createHeadView{
    //初始化SlideHeadView，并加进view
    SlideHeadView *slideVC = [[SlideHeadView alloc]init];
    [self.view addSubview:slideVC];
    
    titleArr = @[@"美食",@"旅游",@"电影",@"招聘",@"娱乐",@"肯德基",@"网吧",@"逛街",@"探险",@"流浪",@"LOL",@"图书馆"];
    slideVC.titlesArr = titleArr;
    
    for (int i = 0; i<titleArr.count; i++) {
        ChildViewController *childVC = [[ChildViewController alloc]init];
        [slideVC addChildViewController:childVC title:titleArr[i]];
    }
    
    //最后再调用setSlideHeadView  完成
    [slideVC setSlideHeadView];

}

-(void)createNextBtn{
    self.slectListButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.slectListButton.frame = CGRectMake(ScreenW-40, 74, 20, 20);
    [self.slectListButton setBackgroundImage:[UIImage imageNamed:@"selectBtn"] forState:UIControlStateNormal];
    [self.slectListButton addTarget:self action:@selector(addBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.slectListButton];
    
}

-(void)addBtn:(id)sender{
    SortViewController *sortVC = [[SortViewController alloc]init];
    sortVC.titleArr = [NSMutableArray arrayWithArray:titleArr];
    [self presentViewController:sortVC animated: YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
