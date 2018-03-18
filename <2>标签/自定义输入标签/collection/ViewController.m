//
//  ViewController.m
//  collection
//
//  Created by 徐茂怀 on 16/2/22.
//  Copyright © 2016年 徐茂怀. All rights reserved.
//

#import "ViewController.h"
#import "MyCollectionViewCell.h"
#import "SectionHeaderViewCollectionReusableView.h"
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(nonatomic, strong)NSMutableArray *ownHobby;//自定义的兴趣
@property(nonatomic, strong)UICollectionView *collection;
@property(nonatomic, strong)NSMutableArray *dataArr;//公共兴趣

@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumInteritemSpacing = 7 ;
    flowLayout.minimumLineSpacing = 20 ;
    flowLayout.sectionInset = UIEdgeInsetsMake(0 , 5 , 0 , 10 );
    flowLayout.itemSize = CGSizeMake(75 , 30 );
    _collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 400) collectionViewLayout:flowLayout];
    [_collection registerClass:[SectionHeaderViewCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head"];
    _collection.bounces = NO;
    _collection.delegate = self;
    _collection.dataSource = self;
    _collection.backgroundColor = [UIColor whiteColor];
    [_collection registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"identifier"];
    [self.view addSubview:_collection];
        _dataArr = @[@{
                         @"type":@(0),
                         @"text":@"篮球"},
                     @{@"type":@(0),
                       @"text":@"足球"},
                     @{@"type":@(0),
                       @"text":@"冲浪爱好者"},
                     @{@"type":@(0),
                       @"text":@"游戏王"},
                     @{@"type":@(0),
                       @"text":@"学习机器"},
                     @{@"type":@(0),
                       @"text":@"跆拳道",
},
                     @{@"type":@(0),
                       @"text":@"英雄联盟"
                       }
                     ].mutableCopy;
    _ownHobby = [NSMutableArray array];
}

-(void)textfiledShow
{
    if (_ownHobby.count  == 3) {
        UIAlertController *alert1 = [UIAlertController alertControllerWithTitle:@"超过个数限制" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }];
        [alert1 addAction:action];
        [self presentViewController:alert1 animated:YES completion:nil];
    }
    else
    {
    UIAlertController *alert1 = [UIAlertController alertControllerWithTitle:@"请输入您的爱好" message:@"5个字以内" preferredStyle:UIAlertControllerStyleAlert];
    [alert1 addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.keyboardType = 3;
    }];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"%@",[alert1.textFields objectAtIndex:0].text);
        [_ownHobby addObject:[alert1.textFields objectAtIndex:0].text];
        [_collection reloadSections:[ NSIndexSet indexSetWithIndex:1]];
    }];
    [alert1 addAction:action];
    [alert1 addAction:action1];
    [self presentViewController:alert1 animated:YES completion:nil];
    }
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return _dataArr.count;
    }else
    {
        return _ownHobby.count + 1;
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        NSDictionary *item = [NSDictionary dictionaryWithDictionary:_dataArr[indexPath.row]];
        int type = [NSString stringWithFormat:@"%@",item[@"type"]].intValue;
        NSString *title = item[@"text"];
        MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"identifier" forIndexPath:indexPath];
        cell.label.text = title;
        cell.cellStyle = type;
        [cell.imageView removeFromSuperview];
        [cell layoutSubviews];
        return cell;
    }
   else
   {
       if (_ownHobby.count == indexPath.row) {
           MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"identifier" forIndexPath:indexPath];
           UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(textfiledShow)];
           [cell.imageView addGestureRecognizer:tap];
           cell.imageView.userInteractionEnabled = YES;
           cell.cellStyle = cellStyleAdd;
           cell.layer.masksToBounds = NO;
           cell.layer.borderWidth = 0;
           cell.layer.cornerRadius = 0;
           [cell layoutSubviews];

           return cell;
       }
      else
      {
          MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"identifier" forIndexPath:indexPath];
          cell.label.text = _ownHobby[indexPath.row];
          cell.cellStyle = 1;
          [cell layoutSubviews];
          [cell.imageView removeFromSuperview];
          return cell;
      }
   }
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return  2;
}
#pragma mark 头视图size
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
        CGSize size = {self.view.frame.size.width, 80.0};
        return size;
}
#pragma mark 每个Item大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        NSDictionary *item = [_dataArr objectAtIndex:indexPath.row];
        return CGSizeMake([self lengthWithString:item[@"text"]] * 28, 40);
    }
    else
    {
        if (indexPath.row == _ownHobby.count) {
            return CGSizeMake(70, 50);
        }
        else
        {
            return CGSizeMake([self lengthWithString:[_ownHobby objectAtIndex:indexPath.row]] * 28, 40);
        }
    }
}
-(CGFloat)lengthWithString:(NSString *)string
{
    return [string length];
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader) {
        if (indexPath.section == 0) {
            SectionHeaderViewCollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"head" forIndexPath:indexPath];
            headView.titleLabel.text = @"选择你的兴趣特长,最多3个";
            return headView;
        }
       else
       {
           SectionHeaderViewCollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"head" forIndexPath:indexPath];
           headView.titleLabel.text = @"添加自定义标签最多3个";
           return headView;
       }
    }
    return nil;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        NSLog(@"%ld",indexPath.row);
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:_dataArr[indexPath.row]];
        NSInteger time = 0;
        for (NSDictionary *dic in _dataArr) {
            if ([[dic objectForKey:@"type"]intValue] == 1) {
                time++;
            }
        }
        if (time == 3) {
            if ([[dic objectForKey:@"type"]intValue] == 1)
            {
                [dic setValue:@(0) forKey:@"type"];
                _dataArr[indexPath.row] = dic;
                [_collection reloadItemsAtIndexPaths:@[indexPath]];
            }
        }
        else
        {
            if ([[dic objectForKey:@"type"]intValue] == 0) {
                [dic setValue:@(1) forKey:@"type"];
                _dataArr[indexPath.row] = dic;
                 [_collection reloadItemsAtIndexPaths:@[indexPath]];
            }
            else
            {
                [dic setValue:@(0) forKey:@"type"];
                _dataArr[indexPath.row] = dic;
                 [_collection reloadItemsAtIndexPaths:@[indexPath]];
            }
        }
    }
    else
    {
        if (_ownHobby.count) {
            [_ownHobby removeObjectAtIndex:indexPath.row];
            [_collection reloadSections:[NSIndexSet indexSetWithIndex:1]];
        }
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
