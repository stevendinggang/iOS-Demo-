//
//  ViewController.m
//  ContextMenu
//
//  Created by 邓梓暄 on 15/9/24.
//  Copyright © 2015年 Dzx. All rights reserved.
//

#import "ViewController.h"
#import <YALContextMenuTableView.h>
#import "customTableViewCell.h"

static NSString *const cellIdentifier = @"CellIdentifier";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, YALContextMenuTableViewDelegate>

@property (strong, nonatomic) NSArray *arrayLabel;

@property (strong, nonatomic) NSArray *arrayImage;

@property (strong, nonatomic) YALContextMenuTableView *contextMenuTableView;

@end

@implementation ViewController

#pragma mark
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initContentArray];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - initContentArray
- (void)initContentArray{
    self.arrayLabel = @[@"",
                        @"QQ",
                        @"微信",
                        @"朋友圈",
                        @"新浪微博"];
    
    self.arrayImage = @[[UIImage imageNamed:@"iconClose.png"],
                        [UIImage imageNamed:@"iconQQ.png"],
                        [UIImage imageNamed:@"iconWechat.png"],
                        [UIImage imageNamed:@"iconFriend.png"],
                        [UIImage imageNamed:@"iconWeibo.png"]];
}

#pragma mark - buttonAdd
- (IBAction)buttonAdd:(id)sender {
    if (!self.contextMenuTableView) {
        self.contextMenuTableView = [[YALContextMenuTableView alloc]initWithTableViewDelegateDataSource:self];
        self.contextMenuTableView.animationDuration = 0.15;
        //optional - implement custom YALContextMenuTableView custom protocol
        self.contextMenuTableView.yalDelegate = self;
        self.contextMenuTableView.scrollEnabled = NO;
        
        //register nib
        UINib *cellNib = [UINib nibWithNibName:@"customTableViewCell" bundle:nil];
        [self.contextMenuTableView registerNib:cellNib
                        forCellReuseIdentifier:cellIdentifier];
    }
    
    // it is better to use this method only for proper animation
    [self.contextMenuTableView showInView:self.navigationController.view withEdgeInsets:UIEdgeInsetsZero animated:YES];
}

#pragma mark - TableView method
- (void)tableView:(YALContextMenuTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView dismisWithIndexPath:indexPath];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayLabel.count;
}

- (UITableViewCell *)tableView:(YALContextMenuTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    customTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if (cell) {
        cell.backgroundColor = [UIColor clearColor];
        cell.labelContent.text = [self.arrayLabel objectAtIndex:indexPath.row];
        cell.imageContent.image = [self.arrayImage objectAtIndex:indexPath.row];
    }
    
    return cell;
}

@end
