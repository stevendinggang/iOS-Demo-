//
//  ZWYViewController.m
//  ZWYPopKeyWords
//
//  Created by 赵纬宇 on 14-6-16.
//  Copyright (c) 2014年 ZWY. All rights reserved.
//

#import "ZWYViewController.h"
#import "ZWYPopKeyWordsView.h"
@interface ZWYViewController ()

@end

@implementation ZWYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	ZWYPopKeyWordsView *popKeyWordsView = [[ZWYPopKeyWordsView alloc] initWithFrame:self.view.bounds];
    popKeyWordsView.keyWordArray = [NSMutableArray arrayWithObjects:@"赵纬宇",@"文明",@"数据库",@"一次", @"调n遍",@"热词", @"数组",@"文明", @"NSArray",@"遍历", @"on_Status",@"Hot_Taglib ", @"正确的",@"ON_STATUS_ADD", @"协议",@"命名", @"动词",@"接收者", @"获取",@"选举",  nil];
    [self.view addSubview:popKeyWordsView];
    [popKeyWordsView changeSearchKeyWord];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)searchHotTaglibWithKeyWord:(NSString *)keyWords
{
    NSLog(@"%@",keyWords);
}
@end
