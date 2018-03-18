//
//  CSNavigationBarMenu.m
//  test
//
//  Created by sangcixiang on 16/2/20.
//  Copyright © 2016年 sangcixiang. All rights reserved.
//

#import "CSNavigationBarMenu.h"
#import "CSNavigationBarMenuTableViewCell.h"
#import "UIView+CSFrame.h"
#import "CSModel.h"
#define BACKCOLOR [UIColor colorWithRed:255/255.0 green:228/255.0 blue:185/255.0 alpha:1]



@interface CSNavigationBarMenu()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,assign)CGPoint origin;
@property(nonatomic,assign)CGFloat width;

//@property(nonatomic,strong)UIView * maskView;
/** 显示tableview */
@property(nonatomic,strong)UIView * contentView;
/** 显示小三角 */
@property(nonatomic,strong)UIView * triangleView;
@property(nonatomic,strong)UITableView * tableView;

@property (nonatomic,strong) NSArray *allRecipes;
@property (nonatomic,strong) NSArray *allResult;
@end
@implementation CSNavigationBarMenu

-(instancetype)initWithOrigin:(CGPoint)origin width:(CGFloat)width
{
    self = [super init];
    if (self) {
        self.items = [NSArray array];
        self.separatroColor = [UIColor colorWithRed:226/255.0 green:226/255.0 blue:226/255.0 alpha:1];
        self.rowHeight = 30;
        self.triangleFrame = CGRectMake(width-25, 0, 16, 12);
        self.origin = origin;
        self.width = width;
        self.contentView = [[UIView alloc]initWithFrame:CGRectMake(origin.x, origin.y, width,300)];
        //self.contentView.backgroundColor = [UIColor redColor];
        [self applytriangleView];
        self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.triangleFrame)+5, width,300) style:UITableViewStylePlain];
        [self.tableView registerClass:[CSNavigationBarMenuTableViewCell class] forCellReuseIdentifier:NSStringFromClass([CSNavigationBarMenuTableViewCell class])];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.separatorColor = self.separatroColor;
        self.tableView.layer.cornerRadius = 5;
        self.tableView.backgroundColor = BACKCOLOR;
        [self.contentView addSubview:self.tableView];
        
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"plist" ofType:@"plist"];
        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
        NSArray *array = dict[@"result"];
        self.allRecipes = [CSModel getAllModelData:array];
    }
    return self;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.allRecipes.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    CSModel *model = self.allRecipes[section];
    return model.isShow?model.list.count:0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CSNavigationBarMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[CSNavigationBarMenuTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    CSModel *model = self.allRecipes[indexPath.section];
    self.allResult = [CSModel getAllModelInfo:model.list];
    model = self.allResult[indexPath.row];
    cell.backgroundColor = BACKCOLOR;
    [cell getMenuItemInfo:model];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return  cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.rowHeight;
}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    CSModel *model = self.allRecipes[section];
    return model.name;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    CSModel *model = self.allResult[indexPath.row];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"Type" object:self userInfo:@{@"MenuType":model.subName}];
    [self dismiss];
    if (self.didSelectMenuItem) {
        self.didSelectMenuItem(self,self.items[indexPath.row]);
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CSModel *m = self.allRecipes[section];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
    [button setBackgroundImage:[UIImage imageNamed:@"dealcell"] forState:UIControlStateNormal];
    [button setTitle:m.name forState:UIControlStateNormal];
    button.tag = section;
    [button setTitleColor:[UIColor colorWithRed:200/255.0 green:100/255.0 blue:0/255.0 alpha:1] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = BACKCOLOR;
    
    return button;
}
-(void)click:(UIButton*)button
{
    CSModel *m = [self.allRecipes objectAtIndex:button.tag];
    if (m.isShow) {
        m.isShow = NO;
    }else {
        m.isShow = YES;
    }
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:button.tag] withRowAnimation:UITableViewRowAnimationFade];
}
-(void)show
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self.contentView];
    self.contentView.alpha = 0.0f;
    [UIView animateWithDuration:.35 animations:^{
        self.contentView.alpha = 1.0f;
    }];
}
-(void)dismiss
{
    [UIView animateWithDuration:.15 animations:^{
        self.contentView.alpha = 0.0f;
    }completion:^(BOOL finished) {
        if (finished) {
            [self.contentView removeFromSuperview];
        }
    }];
}
- (void)setItems:(NSArray *)items {
    _items = items;
    [self.tableView reloadData];
}

- (void)settriangleFrame:(CGRect)triangleFrame {
    _triangleFrame = triangleFrame;
    [self applytriangleView];
}

- (void)setSeparatorColor:(UIColor *)separatorColor {
    _separatroColor= separatorColor;
    self.tableView.separatorColor = separatorColor;
}

- (void)setRowHeight:(CGFloat)rowHeight {
    _rowHeight = rowHeight;
    [self.tableView reloadData];
}
/**  画三角 */
-(void)applytriangleView
{
    if (self.triangleView == nil) {
        self.triangleView = [[UIView alloc]init];
        self.triangleView.backgroundColor = BACKCOLOR;
        [self.contentView addSubview:self.triangleView];
    }
    /** 设置小三角的位置大小 
        设置在contentView上
     */
    self.triangleFrame = CGRectMake(11, 5, 15, 15);
    self.triangleView.frame = self.triangleFrame;
    CAShapeLayer *shaperLayer = [CAShapeLayer layer];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, &CGAffineTransformIdentity, CGRectGetWidth(self.triangleFrame)/2.0, 0);
    CGPathAddLineToPoint(path, &CGAffineTransformIdentity, 0, CGRectGetHeight(self.triangleFrame));
    CGPathAddLineToPoint(path, &CGAffineTransformIdentity, CGRectGetWidth(self.triangleFrame), CGRectGetHeight(self.triangleFrame));
    shaperLayer.path = path;
    self.triangleView.layer.mask = shaperLayer;
}






























@end