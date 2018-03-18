//
//  RootViewController.m
//  vipshop
//
//  Created by Mind is important  on 15/12/12.
//  Copyright © 2015年 iovo. All rights reserved.
//

#import "CenterViewController.h"
#import "UIBarButtonItem+BarButton.h"
#import "MYButton.h"
#define screenH [UIScreen mainScreen].bounds.size.height
#define screenW [UIScreen mainScreen].bounds.size.width
#define ios4 screenW == 320
const CGFloat kButtonWidthArr [5] = {93,73,36,73,73};

@interface CenterViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,UIGestureRecognizerDelegate>

@property (nonatomic,strong) UITableView *crazedTableView;
@property (nonatomic,strong) UITableView *overseasTableView;
@property (nonatomic,strong) UITableView *babayTableView;
@property (nonatomic,strong) UITableView *lastCrazedTableView;
@property (nonatomic,strong) UITableView *willComeLineTableView;
@end

@implementation CenterViewController
{
    UIScrollView *ktitleScrollView;
    NSMutableArray *kTitleButtonFrame;
    UIView *ktitleTagView;
    MYButton *kcurrentButton;
}
#pragma mark -
#pragma mark - setUpTableView
- (UITableView *)crazedTableView
{
    return [self tableView:_crazedTableView MultipleForScreen:0];
}
- (UITableView *)overseasTableView
{
    return [self tableView:_overseasTableView MultipleForScreen:1];
}
- (UITableView *)babayTableView
{
    return [self tableView:_babayTableView MultipleForScreen:2];
}
- (UITableView *)lastCrazedTableView
{
    return [self tableView:_lastCrazedTableView MultipleForScreen:3];
}
- (UITableView *)willComeLineTableView
{
    return [self tableView:_willComeLineTableView MultipleForScreen:4];
}
- (UITableView*)tableView:(UITableView*)tableView MultipleForScreen:(int)n
{
    if (!tableView) {
        tableView = [[UITableView alloc]initWithFrame:CGRectMake(screenW * n, 0, screenW, screenH-64)];
        tableView.dataSource = self;
        tableView.delegate = self;
    }
    return tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigation];
    [self setupscrollView];
    [self titleScrollViewAddButton];
    self.crazedTableView.delegate = self;
    [self.mainScrollView addSubview:self.crazedTableView];
    [self.mainScrollView addSubview:self.overseasTableView];
    [self.mainScrollView addSubview:self.babayTableView];
    [self.mainScrollView addSubview:self.lastCrazedTableView];
    [self.mainScrollView addSubview:self.willComeLineTableView];

}

#pragma mark -
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if ([[scrollView class]isSubclassOfClass:[UITableView class]]) return;
        int page = scrollView.contentOffset.x / screenW;
        [self didSelectPage:page];
}

- (void)didSelectPage:(int)page
{
    switch (page) {
        case 0: ktitleTagView.frame = [self titleTagViewFrameTag:0]; break;
        case 1: ktitleTagView.frame = [self titleTagViewFrameTag:1]; break;
        case 2: ktitleTagView.frame = [self titleTagViewFrameTag:2]; break;
        case 3: ktitleTagView.frame = [self titleTagViewFrameTag:3]; break;
        case 4: ktitleTagView.frame = [self titleTagViewFrameTag:4]; break;
        default:
            break;
    }
}
- (CGRect)titleTagViewFrameTag:(int)tag
{
    kcurrentButton.selected = NO;
    MYButton *button = kTitleButtonFrame[tag];
    button.selected = YES;
    if (tag == 0) {
        ktitleScrollView.contentOffset = CGPointMake(0, 0);
        return CGRectMake(5, 40, 100, 4);
    }
    ktitleScrollView.contentOffset = CGPointMake(ios4? 60: 30, 0);
    kcurrentButton = button;
    CGRect rect = button.frame;
    return CGRectMake(rect.origin.x, 40, button.bounds.size.width, 4);
}
#pragma mark -
#pragma mark - TitleScrollViewAddButton
- (void)titleScrollViewAddButton
{
    kTitleButtonFrame = [NSMutableArray array];
    NSArray *titleArr = @[@"海外精选",@"母婴",@"最后疯抢",@"即将上线"];
    CGFloat space = ios4? 5: 10;
    CGFloat titleButtonH = 44;
    CGFloat titleButtonX = 0;
    for (int i = 0; i < 5; i++) {
        MYButton *button = [MYButton buttonWithType:UIButtonTypeCustom];
        if (i == 0) {
            button.frame = CGRectMake(5, 0, kButtonWidthArr[i], 44);
            titleButtonX += 5;
            [button setImage:[UIImage imageNamed:@"root_title_scrollview"] forState:UIControlStateNormal];
        }else
        {
            button.frame = CGRectMake(titleButtonX, 0 , kButtonWidthArr[i], titleButtonH);
            [button setTitle:titleArr[i-1] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        }
        
        titleButtonX += kButtonWidthArr[i] + space;
        [ktitleScrollView addSubview:button];
        [kTitleButtonFrame addObject:button];
        button.tag = i;
        [button addTarget:self action:@selector(checkTitleButtonSelectorScrollPage:) forControlEvents:UIControlEventTouchDown];
        if (ios4) {
            button.titleLabel.font = [UIFont fontWithName:nil size:16
                                      ];
        }
    }
}
- (void)checkTitleButtonSelectorScrollPage:(MYButton*)button
{
    int page = (int)button.tag;
    [self didSelectPage:page];
    self.mainScrollView.contentOffset = CGPointMake(screenW * page, 0);
}
#pragma mark -
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"crazedTableView";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithFrame:CGRectMake(0, 0, 1, 30)];
        cell.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = @"hehe";
    return cell;
}
#pragma mark -
#pragma mark - setupScrollView
- (void)setupscrollView
{
    ktitleScrollView = [self setupScrollViewFrame:CGRectMake(0, 0,screenW + 90, 44) contentSize:CGSizeMake(screenW + 30, 0) pagingEnabled:NO backgroundColol:[UIColor colorWithRed:35/255.0 green:45/255.0 blue:52/255.0 alpha:1]];
    self.mainScrollView = [self setupScrollViewFrame:CGRectMake(0, 44, screenW, screenH-44) contentSize:CGSizeMake(screenW * 5, 0) pagingEnabled:YES backgroundColol:[UIColor colorWithRed:35/255.0 green:45/255.0 blue:52/255.0 alpha:1]];
    [self addTitleScrollViewTagView];
    self.mainScrollView.delegate = self;
    ktitleScrollView.delegate = self;
    self.mainScrollView.bounces = NO;
    ktitleScrollView.bounces =NO;
    
    [self.view addSubview:ktitleScrollView];
    [self.view addSubview:self.mainScrollView];
    [ktitleScrollView addSubview:ktitleTagView];
}
- (void)addTitleScrollViewTagView
{
    ktitleTagView = [[UIView alloc]initWithFrame:CGRectMake(5, 40, 100, 4)];
    ktitleTagView.backgroundColor = [UIColor redColor];
}
- (UIScrollView*)setupScrollViewFrame:(CGRect)frame contentSize:(CGSize)contentSize pagingEnabled:(BOOL)pagingEnabled backgroundColol:(UIColor*)color
{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:frame];
    scrollView.pagingEnabled = pagingEnabled;
    scrollView.backgroundColor = color;
    scrollView.contentSize = contentSize;
    return scrollView;
}
- (void)setNavigation
{
    MYButton *titleButton = [MYButton buttonWithType:UIButtonTypeCustom];
    [titleButton setImage:[UIImage imageNamed:@"nav_titleview"] forState:UIControlStateNormal];
    titleButton.frame = CGRectMake(0, 0, 50, 30);
    self.navigationItem.titleView = titleButton;
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithIcon:@"nav_left" Target:self Action:@selector(left)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithIcon:@"nav_right" Target:self Action:@selector(right)];
}
- (void)right
{
    
    NSLog(@"right");
}
- (void)left
{
    if ([_delegate respondsToSelector:@selector(checkleftBarButtonItemRootViewController:)]) {
        [_delegate checkleftBarButtonItemRootViewController:self];
    }
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com