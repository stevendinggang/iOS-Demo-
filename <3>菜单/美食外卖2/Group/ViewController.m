//
//  ViewController.m
//  Group
//
//  Created by randy on 16/3/1.
//  Copyright © 2016年 Randy. All rights reserved.
//

#import "ViewController.h"
#import "LeftTableViewCell.h"
#import "RightCollectionViewCell.h"
@interface ViewController ()
@property (nonatomic, strong) UICollectionView *rightCollectionView;
@property (nonatomic ,strong) NSArray *dataArr;
@property (nonatomic ,strong) NSArray *myData;
@property (nonatomic ,assign) NSInteger selectedIndex;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"分类";
    _dataArr = [[NSArray alloc]initWithObjects:@"推荐分类", @"潮流女装",@"品牌男装",@"酒水饮料",@"家用电器",@"手机数码",@"电脑办公",@"图书",@"居家生活",@"运动户外",@"玩具乐器",@"钟表珠宝",@"食品生鲜",@"奢侈礼品",@"汽车用品",@"生活旅行",nil];
    _myData = [[NSArray alloc]initWithObjects:@"笔记本",@"休闲裤",@"牛仔裤",@"手机",@"净化器",@"火锅",@"OPPO",@"面膜",@"漱口水",@"测试",@"测试1", nil];
    [self CreatRightCollectionView];
}
-(void)CreatRightCollectionView
{
    UICollectionViewFlowLayout *flowayout = [[UICollectionViewFlowLayout alloc]init];
    
    flowayout.minimumInteritemSpacing = 0.f;
    flowayout.minimumLineSpacing = 0.5f;
    
    _rightCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(100, 64, self.view.frame.size.width-100, self.view.frame.size.height) collectionViewLayout:flowayout];
    
    [_rightCollectionView registerClass:[RightCollectionViewCell class] forCellWithReuseIdentifier:@"RightCollectionViewCell"];
    
    [_rightCollectionView setBackgroundColor:[UIColor clearColor]];
    
    
    _rightCollectionView.delegate = self;
    _rightCollectionView.dataSource = self;
    
    [self.view addSubview:_rightCollectionView];


}
//实现TableView的代理方法;
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return _dataArr.count;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell)
    {
        NSArray *ArrayCell = [[NSBundle mainBundle]loadNibNamed:@"LeftTableViewCell" owner:self options:nil];
        cell = ArrayCell[0];
    }
    cell.tableview_textLabel.text = _dataArr[indexPath.row];
    
    cell.selectionStyle = 1;//设置Cell选中效果
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 44;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
   [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
    [_rightCollectionView scrollRectToVisible:CGRectMake(0, 0, self.rightCollectionView.frame.size.width, self.rightCollectionView.frame.size.height) animated:YES];
    
    
    _selectedIndex = indexPath.row;
    
    [_rightCollectionView reloadData];

}

#pragma mark------CollectionView的代理方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return _myData.count;

}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    RightCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RightCollectionViewCell" forIndexPath:indexPath];
    //根据左边点击的indepath更新右边内容;
    switch (_selectedIndex)
    {
        case 0:
            cell.collectionView_imageview.image = [UIImage imageNamed:@"3.jpg"];
            break;
        case 1:
            cell.collectionView_imageview.image = [UIImage imageNamed:@"4.jpg"];
            break;
        case 2:
            cell.collectionView_imageview.image = [UIImage imageNamed:@"3.jpg"];
            break;
        case 3:
            cell.collectionView_imageview.image = [UIImage imageNamed:@"4.jpg"];
            break;
        default:
            break;
    }
    
    cell.collectionView_Label.text = _myData[indexPath.row];
    
    return cell;
    

}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{

    return UIEdgeInsetsMake(0, 5, 0, 10);

}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 120);


}
@end
