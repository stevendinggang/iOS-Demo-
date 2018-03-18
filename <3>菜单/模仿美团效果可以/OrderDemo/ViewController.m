//
//  ViewController.m
//  OrderDemo
//
//  Created by king on 16/2/25.
//  Copyright © 2016年 king. All rights reserved.
//

#import "ViewController.h"
#define WIDTH  self.view.bounds.size.width
#define HEIGHT   self.view.bounds.size.height
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dataArray = @[@"火锅",@"烧烤",@"排挡",@"川菜"];

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    layout.itemSize = CGSizeMake(70, 40);
    UICollectionView *collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 80,HEIGHT-64) collectionViewLayout:layout];
    collection.delegate = self;
    collection.dataSource = self;
    collection.backgroundColor = [UIColor whiteColor];
    [collection registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:collection];
    
    _table = [[UITableView alloc]initWithFrame:CGRectMake(80, 64, WIDTH-80, HEIGHT-64)];
    _table.dataSource = self;
    _table.delegate = self;
    _table.rowHeight = 90;
    [self.view addSubview:_table];
    
    //底部view
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT-44, WIDTH, 44)];
    bottomView.backgroundColor = [UIColor whiteColor];
    bottomView.layer.borderWidth = .4;
    bottomView.layer.borderColor = [UIColor grayColor].CGColor;
    bottomView.userInteractionEnabled = YES;
    bottomView.clipsToBounds = NO;
    [self.view addSubview:bottomView];
    [self.view bringSubviewToFront:bottomView];
    
    UIImageView *shopCar = [[UIImageView alloc]initWithFrame:CGRectMake(10, -10, 50, 50)];
    shopCar.image = [UIImage imageNamed:@"shopcar"];
    shopCar.userInteractionEnabled = YES;
    [bottomView addSubview:shopCar];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(orderTableView:)];
    [shopCar addGestureRecognizer:tap];
    
    UILabel *infoLab = [[UILabel alloc]initWithFrame:CGRectMake(70, 0,WIDTH-180, 44)];
    infoLab.text = @"购物车是空的";
    infoLab.textColor = [UIColor grayColor];
    [bottomView addSubview:infoLab];
    
    
    UIButton *priceBut = [[UIButton alloc]initWithFrame:CGRectMake(WIDTH-100, 0, 100, 44)];
    priceBut.backgroundColor = [UIColor grayColor];
    [priceBut setTitle:@"还差30元" forState:UIControlStateNormal];
    [bottomView addSubview:priceBut];
    
    
    _shopNumber = [[UILabel alloc]initWithFrame:CGRectMake(shopCar.bounds.size.width-20, -2, 22, 22)];
    _shopNumber.layer.cornerRadius = 11;
    _shopNumber.layer.masksToBounds = YES;
    _shopNumber.backgroundColor = [UIColor redColor];
    _shopNumber.textColor = [UIColor whiteColor];
    _shopNumber.text = @"0";
    _shopNumber.textAlignment = NSTextAlignmentCenter;
    _shopNumber.font = [UIFont boldSystemFontOfSize:14];
    [shopCar addSubview:_shopNumber];

    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return dataArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.titleLab.text = dataArray[indexPath.row];
    cell.layer.borderWidth = 0.5;
    cell.titleLab.textColor = [UIColor blackColor];
    if (indexPath.row == _selectIndex) {
        cell.titleLab.textColor = [UIColor redColor];
    }
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    _selectIndex = (int)indexPath.row;
    [collectionView reloadData];
    
    NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:indexPath.row];
    [_table scrollToRowAtIndexPath:index atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

#pragma ----- tableSoure
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"cell%zd%zd",indexPath.section,indexPath.row]];
    if (!cell) {
        cell = [[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[NSString stringWithFormat:@"cell%zd%zd",indexPath.section,indexPath.row]];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.goodsImg.image = [UIImage imageNamed:@"110.jpg"];
    cell.delegate = self;
    NSString *price = [NSString stringWithFormat:@"¥%d",arc4random()%100];
    NSString *suffix = @"/份";
    cell.priceLab.text = [NSString stringWithFormat:@"%@%@",price,suffix];
    NSMutableAttributedString *mat = [cell.priceLab.attributedText mutableCopy];
    [mat addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:[cell.priceLab.text rangeOfString:suffix]];
    cell.priceLab.attributedText = mat;
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return dataArray[section];
}
- (void)customCell:(TableViewCell *)cell buttom:(UIButton *)but numberLab:(UILabel *)lab{
    if (but.tag == 10086) {
        lab.text = [NSString stringWithFormat:@"%d",lab.text.intValue+1];
        _shopNumber.text = [NSString stringWithFormat:@"%d",_shopNumber.text.intValue+1];
        [self animationToShopNumber];
    }
    if(but.tag == 10010 && lab.text.intValue != 0){
        lab.text =[NSString stringWithFormat:@"%d",lab.text.intValue-1];
        _shopNumber.text = [NSString stringWithFormat:@"%d",_shopNumber.text.intValue-1];
    }
    if (lab.text.intValue == 0) {
        lab.hidden = YES;
        but.hidden = YES;
    }
    
}
//购物车角标动画
- (void)animationToShopNumber{
    CAKeyframeAnimation *key = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    key.values =  @[@(0.1),@(1.0),@(1.5)];
    key.keyTimes = @[@(0.0),@(0.5),@(0.8),@(1.0)];
    key.calculationMode = kCAAnimationLinear;
    [_shopNumber.layer addAnimation:key forKey:@"scale"];
}
- (void)orderTableView:(UITapGestureRecognizer *)tap{
    static int seclectNumber = 0;
    seclectNumber ++;
    if (seclectNumber%2 == 1) {
        UILabel *backgroundVC = [[UILabel alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-108)];
        backgroundVC.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:.5];
        backgroundVC.text = @"不想写了,haha,,,,接下去就是创建一个tableview，将参数传入显示。";
        backgroundVC.numberOfLines = 0;
        backgroundVC.textAlignment = NSTextAlignmentCenter;
        backgroundVC.font = [UIFont systemFontOfSize:30];
        backgroundVC.textColor = [UIColor blackColor];
        [self.view addSubview:backgroundVC];
        
    }else{
        [self.view.subviews.lastObject removeFromSuperview];
    }
    
}


@end
