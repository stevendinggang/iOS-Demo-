//
//  ViewController.m
//  Demo
//
//  Created by Mrss on 16/1/27.
//  Copyright © 2016年 expai. All rights reserved.
//

#import "ViewController.h"
#import "UITableView+Popover.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *data;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.data = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i<3; i++) {
        NSMutableArray *array = [NSMutableArray array];
        for (NSInteger j = 0; j<5; j++) {
            [array addObject:[NSString stringWithFormat:@"section:%ld index:%ld",i,j]];
        }
        [self.data addObject:array];
    }
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-20) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *array = self.data[section];
    return array.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSArray *array = self.data[indexPath.section];
    cell.textLabel.text = array[indexPath.row];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 70;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 70;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *header = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30)];
    header.textColor = [UIColor whiteColor];
    header.backgroundColor = [UIColor colorWithRed:18/255.0 green:53/255.0 blue:85/255.0 alpha:1];
    header.textAlignment = NSTextAlignmentCenter;
    header.text = [NSString stringWithFormat:@"Header:%ld",section];
    return header;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UILabel *footer = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30)];
    footer.backgroundColor = [UIColor colorWithRed:209/255.0 green:73/255.0 blue:78/255.0 alpha:1];
    footer.textColor = [UIColor whiteColor];
    footer.textAlignment = NSTextAlignmentCenter;
    footer.text = [NSString stringWithFormat:@"Footer:%ld",section];
    return footer;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *names = @[@"Reply",@"Share",@"Copy",@"Report"];
    NSArray *images = @[@"popover_reply",@"popover_share",@"popover_copy",@"popover_report"];
    NSMutableArray *items = [NSMutableArray array];
    for (NSInteger i = 0; i<names.count; i++) {
        PopoverItem *item = [PopoverItem itemWithName:names[i] image:[UIImage imageNamed:images[i]] selectedHandler:^(PopoverItem *popoverItem) {
            NSLog(@"%@===%@",popoverItem.name,indexPath);
        }];
        [items addObject:item];
    }
    [tableView showPopoverWithItems:items forIndexPath:indexPath];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com