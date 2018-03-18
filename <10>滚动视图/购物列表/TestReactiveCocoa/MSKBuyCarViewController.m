//
//  MSKBuyCarViewController.m
//  TestReactiveCocoa
//
//  Created by 马士奎 on 16/1/27.
//  Copyright (c) 2016年 LD. All rights reserved.
//

#import "MSKBuyCarViewController.h"
#import "MSKBuyCarCell.h"
#import "MSKCarViewModel.h"
#import "MSKCarTableviewHeaderView.h"
#import "MSKBottomView.h"
#import "MSKCarHeaderViewModel.h"
#import <ReactiveCocoa.h>
#import "IQKeyboardManager.h"
#import "MSKCarCellSubModel.h"
#define APPScreenHeight [[UIScreen mainScreen] bounds].size.height
#define APPScreenWidth [[UIScreen mainScreen] bounds].size.width
static NSString *BuyCarCellIndentify = @"MSKBuyCarCell";
static NSString *MskCarHeaderView = @"MSKCarTableviewHeaderView";
static NSString *MSKBottomViewIndentify = @"MSKBottomView";

@interface MSKBuyCarViewController()<UITableViewDataSource,UITableViewDelegate>{
    MSKBottomView *bottomView;
    __weak IBOutlet UIButton *editBtn;
}
@property (nonatomic,strong)  IBOutlet UITableView *carTableview;
@property(nonatomic,strong)UIToolbar *toolbar;
@property (nonatomic , strong) UIBarButtonItem *previousBarButton;
@property (nonatomic,strong) NSMutableArray *dataSource;
@property (nonatomic,strong) NSMutableArray *headerViewModels;
@property (nonatomic,strong) MSKCarViewModel *viewModel;
@end
@implementation MSKBuyCarViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [_carTableview setKeyboardDismissMode:UIScrollViewKeyboardDismissModeOnDrag];
    [_carTableview registerNib:[UINib nibWithNibName:BuyCarCellIndentify bundle:nil] forCellReuseIdentifier:BuyCarCellIndentify];
    bottomView = [[[NSBundle mainBundle] loadNibNamed:MSKBottomViewIndentify owner:self options:nil] firstObject];
    __weak MSKBuyCarViewController *main = self;
    bottomView.reloadAll= ^(){
        [main.carTableview reloadData];
    };
    
    @weakify(self)
    [[editBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        editBtn.selected = !editBtn.selected;
        @strongify(self)
        [self.viewModel resetAllCanDelete:editBtn.selected];
        [self.carTableview reloadData];
    }];
    
    bottomView.frame = CGRectMake(0,self.view.bounds.size.height - 45, self.view.bounds.size.width, 44);
    [self.view addSubview:bottomView];
    [[IQKeyboardManager sharedManager] setToolbarDoneBarButtonItemText:@"隐藏"];
    [[IQKeyboardManager sharedManager] setShouldToolbarUsesTextFieldTintColor:IQAutoToolbarByPosition];
}

//数据源
-(NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] initWithArray:self.viewModel.receiveDataSource];
        bottomView.dataSource = _dataSource;
        [bottomView  addOrMinusMoney];
    }
    return _dataSource;
}

-(MSKCarViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [MSKCarViewModel alloc];
    }
    return _viewModel;
}

//headerview model
-(NSMutableArray *)headerViewModels{
    if (!_headerViewModels) {
        _headerViewModels = [[NSMutableArray alloc] initWithArray:self.viewModel.receiveHeaderViewSource];
    }
    return _headerViewModels;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
   
    return  (self.dataSource == nil ? 0:[self.dataSource[section] count]);
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MSKBuyCarCell *cell = [tableView dequeueReusableCellWithIdentifier:BuyCarCellIndentify forIndexPath:indexPath];
    [self configureCell:cell forRowAtIndexPath:indexPath];
    return cell;
}

-(MSKCarTableviewHeaderView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    MSKCarTableviewHeaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:MskCarHeaderView owner:self options:nil] firstObject];
    headerView.carHeaderViewModel = self.headerViewModels[section];
    headerView.selectedOrCancel = ^(){
        [tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationNone];
        [bottomView addOrMinusMoney];
    };
    
    return headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44.0f;
}

- (void)configureCell:(MSKBuyCarCell *)cell
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.carViewModel = nil;
    cell.carViewModel = [self.dataSource[indexPath.section] objectAtIndex:indexPath.row];
    cell.calculationBlock = ^(int number){
        [bottomView addOrMinusMoney];
        MSKCarTableviewHeaderView *headerView = (MSKCarTableviewHeaderView *)[self.carTableview headerViewForSection:indexPath.section];
        [headerView restAllSelectedState];
    };
    cell.deleteCarGood = ^(){
        [self deleteCellModel:indexPath];
    };
    
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return !editBtn.selected;
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //删除
        [self deleteCellModel:indexPath];
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}
/**
 *  删除
 *
 *  @param indexPath 位置
 */
-(void)deleteCellModel:(NSIndexPath *)indexPath{
    NSMutableArray *sectionDataSource = self.dataSource[indexPath.section];
    [sectionDataSource removeObjectAtIndex:indexPath.row];
    [_carTableview deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
    if (sectionDataSource.count == 0) {
        [self.dataSource removeObjectAtIndex:indexPath.section];
        [self.headerViewModels removeObjectAtIndex:indexPath.section];
        [_carTableview deleteSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationTop];
    }else{
        [_carTableview reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationNone];
    }
    [bottomView addOrMinusMoney];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 148.0f;
}


@end
