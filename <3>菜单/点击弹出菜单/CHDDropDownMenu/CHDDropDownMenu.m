//
//  CHDDropDownMenu.m
//  CHDDropDownMenu
//
//  Created by CHD on 15/11/16.
//  Copyright © 2015年 CHD. All rights reserved.
//
#import "UIView+MJExtension.h"
#import "CHDDropDownMenu.h"
#define CHD_SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define CHD_SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

static const CGFloat cellHeight = 40.0f;

@implementation chdButton

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(CGRectGetWidth(contentRect) - 20,(CGRectGetHeight(contentRect) - 7)/2, 12, 7);
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 0, CGRectGetWidth(contentRect) - 15, CGRectGetHeight(contentRect));
}
@end

@implementation chdModel

@end


@implementation chdMenuCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CHD_SCREEN_WIDTH, cellHeight)];
        [self.contentView addSubview:_bgView];
        
        self.point = [[UIView alloc] initWithFrame:CGRectMake(10, (cellHeight - 3)/2.0, 3, 3)];
        self.point.layer.masksToBounds = YES;
        self.point.layer.cornerRadius = 1.5;
        [self.bgView addSubview:_point];
        
        self.textL = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_point.frame)+5, 0,300, cellHeight)];
        self.textL.font = [UIFont systemFontOfSize:12.0f];
        [self.bgView addSubview:_textL];
        
    }
    return self;
}

@end

@implementation CHDDropDownMenu
{
    UITableView *ChdTable;
    NSInteger currentSelect;
    CGRect orginalFrame;
    BOOL isShow;
    UIView *bgView;
}

- (void)initWithFrame:(CGRect)frame showOnView:(UIView*)view AllDataArr:(NSMutableArray*)arr showArr:(NSMutableArray *)showArr
{
    if ([super initWithFrame:frame]) {
        self.AllDataArr = arr;
        self.showArr = showArr;
        if (!showArr) {
            self.showArr = arr;
        }
        
        for (int i=0; i<arr.count; i++) {
            chdButton *button = [[chdButton alloc] initWithFrame:CGRectMake(i*(CGRectGetWidth(frame)/arr.count), 0, CGRectGetWidth(frame)/arr.count, CGRectGetHeight(frame))];
            button.tag = 100 + i;
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            NSArray *temp = self.showArr[i];
            chdModel *model = [temp firstObject];
            [button setTitle:model.text forState:UIControlStateNormal];
            button.titleLabel.textAlignment = NSTextAlignmentCenter;
            button.backgroundColor = [UIColor whiteColor];
            button.layer.borderColor = [UIColor grayColor].CGColor;
            button.layer.borderWidth = 0.4;
            [button setImage:[UIImage imageNamed:@"up1"] forState:UIControlStateNormal];
            button.imageView.transform = CGAffineTransformMakeRotation(M_PI);
            [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            [self addSubview:button];
            [view addSubview:self];
            
            //
            currentSelect = 0;
            [self selectClum:i Row:0];
            
        }
        
        ChdTable = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame), CHD_SCREEN_WIDTH, CHD_SCREEN_HEIGHT - CGRectGetMaxY(self.frame))];
        orginalFrame = CGRectMake(0, CGRectGetMaxY(frame), CHD_SCREEN_WIDTH, 0);
        ChdTable.delegate = self;
        ChdTable.dataSource = self;
        ChdTable.hidden = YES;
        //ChdTable.backgroundColor = [UIColor redColor];
        
        bgView = [[UIView alloc] initWithFrame:orginalFrame];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
        [tap addTarget:self action:@selector(bgViewClick:)];
        [bgView addGestureRecognizer:tap];
        bgView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        [view addSubview:bgView];
        
        if ([ ChdTable respondsToSelector:@selector(setSeparatorInset:)]) {
            
            [ChdTable   setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
            
        }
        if ([ChdTable respondsToSelector:@selector(setLayoutMargins:)]) {
            
            [ChdTable setLayoutMargins:UIEdgeInsetsMake(0, 0, 0, 0)];
            
        }
        
        [view addSubview:ChdTable];
        self.backgroundColor = [UIColor orangeColor];
    }
    
}
- (void)bgViewClick:(UITapGestureRecognizer*)tap
{
    [self hideCurrent];
    bgView.frame = orginalFrame;
}
- (void)selectClum:(NSInteger)colum Row:(NSInteger)row
{
    //默认选中第一个
    NSArray *temp = self.AllDataArr[colum];
    for (int i=0; i<temp.count; i++) {
        chdModel *model = temp[i];
        if (i == row) {
            model.isSelect = YES;
        }else{
            model.isSelect = NO;
        }
    }
    //[ChdTable reloadData];
    
    NSArray *arr = self.subviews;
    chdButton *btn = (chdButton*)arr[colum];
    chdModel *model = self.showArr[colum][row];
    [btn setTitle:model.text forState:UIControlStateNormal];
}

- (void)buttonClick:(chdButton*)button
{
    if (button.tag - 100 == currentSelect) {
        if (isShow) {
            [self hideCurrent];
        }else{
            [self showIndex:button.tag - 100];
        }
        isShow = !isShow;
    }else{
        [self showIndex:button.tag - 100];
        isShow = YES;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_AllDataArr[currentSelect] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *chdResuseID = @"CHD_RESUSE";
    
    chdMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:chdResuseID];
    
    if (cell == nil) {
        cell = [[chdMenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:chdResuseID];
    }
    
    chdModel * model = [_AllDataArr[currentSelect] objectAtIndex:indexPath.row];
    cell.textL.text = model.text;
    if (model.isSub) {
        cell.bgView.mj_x = 25;
    }else{
        cell.bgView.mj_x = 0;
    }
    if (model.isSelect) {
        cell.textL.textColor = [UIColor blueColor];
    }else{
        cell.textL.textColor = [UIColor blackColor];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        
        [cell setSeparatorInset:UIEdgeInsetsZero];
        
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        
        [cell setLayoutMargins:UIEdgeInsetsZero];
        
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return cellHeight;
}
- (void)showIndex:(NSInteger)index
{
    
    if (currentSelect != index) {
        chdButton *btn = self.subviews[currentSelect];
        [UIView animateWithDuration:0.2 animations:^{
            btn.imageView.transform = CGAffineTransformMakeRotation(M_PI);
        }];
    }
    
    currentSelect = index;
    [self realShow];
    
}
- (void)realShow
{
    
    
    ChdTable.hidden = YES;
    ChdTable.mj_h = cellHeight * [_AllDataArr[currentSelect] count];
    [ChdTable reloadData];
    
    bgView.mj_h = CHD_SCREEN_HEIGHT - CGRectGetMaxY(self.frame);
    
    ChdTable.frame = orginalFrame;
    ChdTable.hidden = NO;
    
    chdButton *btn = self.subviews[currentSelect];
    
    [UIView animateWithDuration:0.2 animations:^{
        if (cellHeight * [_AllDataArr[currentSelect] count]>CHD_SCREEN_HEIGHT-CGRectGetMaxY(self.frame)) {
            ChdTable.mj_h = CHD_SCREEN_HEIGHT - CGRectGetMaxY(self.frame);
        }else{
        ChdTable.mj_h = cellHeight * [_AllDataArr[currentSelect] count];
        }
        btn.imageView.transform = CGAffineTransformMakeRotation(0);
    }];
}
- (void)hideCurrent
{
    chdButton *btn = self.subviews[currentSelect];
    [UIView animateWithDuration:0.2 animations:^{
        ChdTable.frame = orginalFrame;
        btn.imageView.transform = CGAffineTransformMakeRotation(M_PI);
    }];
    bgView.frame = orginalFrame;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    //*************  本段代码用于选择相同选项时不在回调，不需要可注掉  ****************
    chdModel *modelLast = self.AllDataArr[currentSelect][indexPath.row];
    if (modelLast.isSelect) {
        [self hideCurrent];
        isShow = NO;
        
        return;
    }
    //*************  本段代码用于选择相同选项时不在回调，不需要可注掉  ****************
    
    
    
    [self selectClum:currentSelect Row:indexPath.row];
    [self hideCurrent];
    isShow = NO;
    chdModel *model = self.AllDataArr[currentSelect][indexPath.row];
    if ([self.delegate respondsToSelector:@selector(selectClum:Row:)]) {
        [self.delegate selectColum:currentSelect Row:indexPath.row Model:model];
    }
    NSLog(@"%@",model.text);
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
