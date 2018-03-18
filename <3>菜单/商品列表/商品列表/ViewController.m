//
//  ViewController.m
//  商品列表
//
//  Created by mac on 16/1/19.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"
#import "NetWorking.h"
#import "SMVerticalSegmentedControl.h"
#import "ShopModel.h"
#import "OneModel.h"
#import "ShopCollectionViewCell.h"

@interface ViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UIScrollViewDelegate>{

    //数据源数组
    NSMutableArray *dataArr;
    
    //数组字典
    NSMutableDictionary *dataDic;
    NSMutableArray *allkeys;
    
    UICollectionView *_collectionView;
}

@property (nonatomic,retain) SMVerticalSegmentedControl *segmentedControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //获取数据
    [self loadDatas];
    
}

//创建segment
//创建垂直的segment
-(void)loadSegment{
    
    //实例化segment
    self.segmentedControl = [[SMVerticalSegmentedControl alloc] initWithSectionTitles:allkeys];
    
    //设置背景颜色
    self.segmentedControl.backgroundColor = [UIColor whiteColor];
    
    //设置类型
    self.segmentedControl.selectionStyle = SMVerticalSegmentedControlSelectionStyleBox;
    
    
    self.segmentedControl.selectionIndicatorThickness = 4;
    
    //设置frame
    [self.segmentedControl setFrame:CGRectMake(0, 20, 85, kScreenH-20)];
    
    //添加segment
    [self.view addSubview:self.segmentedControl];
    
    //调用block
    [self.segmentedControl indexChangeBlock:^(NSInteger index) {
        
        [self indexChangeBlock:index];
    }];
    
    //设置默认的选中按钮
    self.segmentedControl.selectedSegmentIndex = 0;
}

//按钮改变时调用
-(void)indexChangeBlock:(NSInteger)index{

    //
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:index];
    
    //使得collectionView跳转到指定的按钮上
    [_collectionView selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionCenteredVertically];
    
//    [_collectionView scrollToItemAtIndexPath:<#(nonnull NSIndexPath *)#> atScrollPosition:<#(UICollectionViewScrollPosition)#> animated:<#(BOOL)#>]
}

//创建UICollectionView
-(void)createCollectionView{

    //创建布局类
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    //设置单元格的大小
    layout.itemSize = CGSizeMake(((kScreenW-_segmentedControl.width-50)/2), 120);
    
    //设置滚动方向
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    //创建UICollectionView
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(_segmentedControl.width, 20, kScreenW-_segmentedControl.width, kScreenH-20) collectionViewLayout:layout];
    
    //设置代理和数据源协议
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
    _collectionView.backgroundColor = [UIColor clearColor];
    
    //添加到视图控制器上
    [self.view addSubview:_collectionView];
    
    //注册单元格
    [_collectionView registerClass:[ShopCollectionViewCell class] forCellWithReuseIdentifier:@"cell1"];
    
    //注册组头视图
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
}

//设置头视图的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{

    return CGSizeMake(kScreenW, 36);
}

//设置组头图
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{

    //创建头视图
    UICollectionReusableView *headerCell = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
    
    //添加label
    UILabel *label = [[UILabel alloc]initWithFrame:headerCell.bounds];
    
    label.text = allkeys[indexPath.section];
    
    label.textAlignment = NSTextAlignmentCenter;
    
    label.backgroundColor = [UIColor whiteColor];
    
    //添加到头视图上
    [headerCell addSubview:label];
    
    return headerCell;
}

//单元格结束移动时调用
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{

    NSArray *indexArr = [_collectionView indexPathsForVisibleItems];
    
    NSIndexPath *lastIndexPath = [indexArr lastObject];
    
    self.segmentedControl.selectedSegmentIndex = lastIndexPath.section;
}

//当单元格减速时调用
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    NSArray *indexArr = [_collectionView indexPathsForVisibleItems];
    
    NSIndexPath *lastIndexPath = [indexArr lastObject];
    
    self.segmentedControl.selectedSegmentIndex = lastIndexPath.section;
}


//单元格消失时调用
-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{

//    self.segmentedControl.selectedSegmentIndex = indexPath.section;
}

//实现数据源协议中的方法
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return allkeys.count;
}

//返回每个组中的元素个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    NSArray *arr = [dataDic objectForKey:allkeys[section]];
    
    return arr.count;
}

//创建单元格
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    ShopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
    
//    cell.backgroundColor = [UIColor cyanColor];
    
    NSArray *arr = [dataDic objectForKey:allkeys[indexPath.section]];
    
    cell.oneModel = arr[indexPath.row];
    
    return cell;
}

//距离四周的距离
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{

    return UIEdgeInsetsMake(10, 10, 10, 10);
}

//获取数据
-(void)loadDatas{
    
    //初始化数据源数组
    dataArr = [NSMutableArray array];
    dataDic = [NSMutableDictionary dictionary];
    allkeys = [NSMutableArray array];
    
    [NetWorking getHomeTimeLineWithURLString:@"http://api.liwushuo.com/v2/item_categories/tree" success:^(id result) {
                
        NSDictionary *data = [result objectForKey:@"data"];
        
        NSArray *categories = [data objectForKey:@"categories"];
        
        //for in 遍历 获取数据源
        for (NSDictionary *dic in categories) {
            
            NSString *key = [dic objectForKey:@"name"];
            
            [allkeys addObject:key];
            
            //获取数据源
            NSArray *subcategories = [dic objectForKey:@"subcategories"];
            
            NSMutableArray *arr = [NSMutableArray array];
            
            for (NSDictionary *dic1 in subcategories) {
                
                //初始化oneModel
                OneModel *oneModel = [[OneModel alloc]initWithDic:dic1];
                
                [arr addObject:oneModel];
            }
            
            [dataDic setObject:arr forKey:key];
            
            //初始化 shopModel
            ShopModel *shopModel = [[ShopModel alloc]initWithDic:dic];
            
            [dataArr addObject:shopModel];
        }
        
//        allkeys = [dataDic allKeys];
        
        //创建segment
        [self loadSegment];
        
        //创建UICollectionView
        [self createCollectionView];
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
