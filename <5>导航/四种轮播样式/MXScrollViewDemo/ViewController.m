//
//  ViewController.m
//  CMCyclicScrollDemo
//
//  Created by apple on 16/2/19.
//  Copyright © 2016年 desn. All rights reserved.
//

#import "ViewController.h"
#import "EasyUseViewController.h"
#import "TableUseViewController.h"
#import "VerticalUseViewController.h"
#import "AnimationViewController.h"

static NSString *const tableIdentifier = @"TableViewCell";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initBaseData];
}

- (void)initBaseData {
    self.title = @"MXScrollView";
    [self.navigationController.navigationBar setTitleTextAttributes:@{
                                                                      NSForegroundColorAttributeName:[UIColor lightGrayColor]}];
    self.navigationController.navigationBar.tintColor = [UIColor lightGrayColor];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:tableIdentifier];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
}

#pragma mark - tabelView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier forIndexPath:indexPath];
    switch (indexPath.row) {
        case 0: {
            cell.textLabel.text = @"EasyUseViewController";
        }
            break;
        case 1: {
            cell.textLabel.text = @"TableUseViewController";
        }
            break;
        case 2: {
            cell.textLabel.text = @"VerticalUseViewController";
        }
            break;
        case 3: {
            cell.textLabel.text = @"AnimationViewController";
        }
            break;
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0: {
            [self.navigationController pushViewController:[[EasyUseViewController alloc] init] animated:YES];
        }
            break;
        case 1: {
            [self.navigationController pushViewController:[[TableUseViewController alloc] init] animated:YES];
        }
            break;
        case 2: {
            [self.navigationController pushViewController:[[VerticalUseViewController alloc] init] animated:YES];
        }
            break;
        case 3: {
            [self.navigationController pushViewController:[[AnimationViewController alloc] init] animated:YES];
        }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
