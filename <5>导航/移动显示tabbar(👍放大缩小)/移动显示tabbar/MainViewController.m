//
//  MainViewController.m
//  移动显示tabbar
//
//  Created by _鑫宇↘無人懂會 on 15/12/11.
//  Copyright © 2015年 _鑫宇↘無人懂會. All rights reserved.
//

#import "MainViewController.h"
#import "MainTableViewCell.h"

@interface MainViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong , nonatomic) UITableView * tableView;

@end

@implementation MainViewController
static NSString *const ID = @"MainCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableView];
    self.view.backgroundColor = [UIColor lightGrayColor];
}

-(void)setTableView{
    UITableView * tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    [tableView registerNib:[UINib nibWithNibName:@"MainTableViewCell" bundle:nil] forCellReuseIdentifier:ID];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"测试数据-%ld", (long)indexPath.row];
    return cell;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [UIView animateWithDuration:1 animations:^{
        self.tabBarController.tabBar.transform = CGAffineTransformMakeTranslation(0, 49);
        [UIView animateWithDuration:5 animations:^{
            self.navigationController.navigationBar.alpha = 0;
        }];
    }];

}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [UIView animateWithDuration:1 animations:^{
        self.tabBarController.tabBar.transform = CGAffineTransformIdentity;
        self.navigationController.navigationBar.alpha = 1;
    }];
}


@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com