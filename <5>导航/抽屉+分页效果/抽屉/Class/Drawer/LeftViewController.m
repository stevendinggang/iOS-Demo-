//
//  LeftViewController.m
//  vipshop
//
//  Created by Mind is important  on 15/12/15.
//  Copyright (c) 2015年 iovo. All rights reserved.
//

#import "LeftViewController.h"
#import "MYLeftDataSource.h"
 @interface LeftViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tabView;
@property (nonatomic, strong) NSMutableArray *dataSoure;
@end

@implementation LeftViewController
- (NSArray *)dataSoure
{
    if (!_dataSoure) {
        _dataSoure = [NSMutableArray array];
        NSArray *titleArr = @[@"首页",@"服装",@"男式",@"母婴",@"美妆",@"居家",@"海外精选",@"汽车",@"旅游"];
        for (int i= 0; i < titleArr.count; i++) {
            UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"left_title_%d",i]];
            MYLeftDataSource *data = [[MYLeftDataSource alloc]init];
            data.image = img;
            data.title = titleArr[i];
            [_dataSoure addObject:data];
        }
    }
    return _dataSoure;
}
- (UITableView *)tabView
{
    if (!_tabView) {
        _tabView = [[UITableView alloc]initWithFrame:self.view.bounds];
        _tabView.delegate = self;
        _tabView.dataSource = self;
        _tabView.delegate = self;
        _tabView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tabView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tabView];
    [self.tabView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"leftCellIdent"];
}
#pragma mark -
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSoure.count;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"leftCellIdent"];
    cell.backgroundColor = [UIColor colorWithRed:35/255.0 green:45/255.0 blue:52/255.0 alpha:1];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    MYLeftDataSource *data = self.dataSoure[indexPath.row];
    cell.imageView.image = data.image;
    cell.textLabel.text = data.title;
    return cell;
}
#pragma mark - UITableViewDelegate
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 400)];
    imgView.backgroundColor = [UIColor redColor];
    imgView.contentMode = UIViewContentModeScaleAspectFill;
    imgView.image = [UIImage imageNamed:@"left_head"];
    return imgView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 53;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
{
    return 134;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 60;
}
- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0,10, 100, 40);
    rightButton.frame = CGRectMake(100, 10, 100, 40);
    CGRect rect = CGRectMake(0, 0, 40, 40);
    leftButton.imageView.frame = rect;
    rightButton.imageView.frame = rect;
    leftButton.imageView.image = [UIImage imageNamed:@"left_title_1"];
    rightButton.imageView.image = [UIImage imageNamed:@"left_title_2"];
    [leftButton setTitle:@"个人中心" forState:UIControlStateNormal];
    [rightButton setTitle:@"品牌中心" forState:UIControlStateNormal];
    UIView *backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
    backgroundView.backgroundColor = [UIColor colorWithRed:35/255.0 green:45/255.0 blue:52/255.0 alpha:1];
    [backgroundView addSubview:leftButton];
    [backgroundView addSubview:rightButton];
    return backgroundView;
}
@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com