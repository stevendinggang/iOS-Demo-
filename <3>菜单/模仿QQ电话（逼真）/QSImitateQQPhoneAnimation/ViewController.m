//
//  ViewController.m
//  QSImitateQQPhoneAnimation
//
//  Created by JosQiao on 16/5/19.
//  Copyright © 2016年 QiaoShi. All rights reserved.
//

#import "ViewController.h"
#import "QQPhoneViewController.h"
#import "QQPhoneOnLineViewController.h"

#import "QQPhoneView.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

/** 表格 */
@property(nonatomic,strong)UITableView *tableView;

/** 数据 */
@property(nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    
}

- (BOOL)prefersStatusBarHidden
{
    return NO;
}

#pragma mark - 小电话的手势 事件

- (void)pan:(UIPanGestureRecognizer *)pan
{
    CGPoint point = [pan locationInView:[UIApplication sharedApplication].keyWindow];
    QQPhoneView *view = (QQPhoneView *)pan.view;
    
    CGFloat distance = 50;  // 离四周的最小边距
    
    if (pan.state == UIGestureRecognizerStateEnded) {
        
        
        if (point.y <= distance) {
            
            point.y = distance;
            
        }else if (point.y >= [UIScreen mainScreen].bounds.size.height - distance){
            
            point.y = [UIScreen mainScreen].bounds.size.height - distance;
        }else if (point.x <= [UIScreen mainScreen].bounds.size.width/2.0) {
            
            point.x = distance;
        
        }else {
        
            point.x = [UIScreen mainScreen].bounds.size.width - distance;
        }
        
        [UIView animateWithDuration:0.5 animations:^{
            view.center = point;
        }];
    
    }else {
    
        view.center = point;
    }
    
}

- (void)tap:(UITapGestureRecognizer *)tap
{
    QQPhoneOnLineViewController *qqOnlineVC = [[QQPhoneOnLineViewController alloc] init];
    
    qqOnlineVC.pressentType = QQPhoneTransitionPressentTypeMask;
    
    UINavigationController *nav =(UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    
    [nav presentViewController:qqOnlineVC animated:YES completion:nil];
    
}




#pragma mark - UITableViewDataSorce
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return  cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            QQPhoneViewController *qqPhoneVC = [[QQPhoneViewController alloc] init];
            [self.navigationController pushViewController:qqPhoneVC animated:YES];
            
        }
            break;
            
        default:
            break;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

#pragma mark - Getter
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        
        _tableView.frame = self.view.bounds;
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
        
        [_dataArray addObject:@"仿QQ电话"];
    }
    return _dataArray;
}

@end
